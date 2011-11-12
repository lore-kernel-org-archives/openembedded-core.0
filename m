Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RPCUO-0001rd-UU
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 13:15:17 +0100
Received: by bkbzs2 with SMTP id zs2so4272436bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 04:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ki4xfGhMHU6/Ay4xpO9sFoPN20xCz4RDGBa3CLzMDLI=;
	b=GimAINrR3keBqdHy9sXlA/l5TnZPYsJUOXgt5ynpSPBLf5SoQ7x1JrXLLig2xEcuyc
	cqbem52luO4t1AJH6Lqx7Dh6KGUqg09t/rEag3Kxijx7ARxTsURmfg63Gc/elLwZZSTA
	fURyYi8aLTwwzc6x8dXDSF1n4MokJJIJ1Qhfk=
Received: by 10.205.83.78 with SMTP id af14mr11851916bkc.69.1321099734014;
	Sat, 12 Nov 2011 04:08:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu17sm17621329bkc.9.2011.11.12.04.08.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Nov 2011 04:08:53 -0800 (PST)
Date: Sat, 12 Nov 2011 13:08:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111112120841.GB30296@jama.jama.net>
References: <20111112111425.GA30296@jama.jama.net>
	<1321096894-23997-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1321096894-23997-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] opkg: Ensure we use the uname/gname fields when extracting tarballs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Nov 2011 12:15:17 -0000
X-Groupsio-MsgNum: 12397
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline

--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 12, 2011 at 12:21:34PM +0100, Martin Jansa wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>

Seems to work fine, thanks a lot!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

SHR root@gjama / $ opkg remove -force-depends -force-remove dbus-1
Removing package dbus-1 from root...
Stopping system message bus:  Removing any system startup links for dbus-1 =
=2E..
  /etc/rc0.d/K20dbus-1
  /etc/rc1.d/K20dbus-1
  /etc/rc2.d/S02dbus-1
  /etc/rc3.d/S02dbus-1
  /etc/rc5.d/S02dbus-1
  /etc/rc6.d/K20dbus-1
Collected errors:
 * pkg_run_script: package "dbus-1" prerm script returned status 1.
SHR root@gjama / $ grep message /etc/passwd
messagebus:x:42:101:Linux User,,,:/var/run/dbus:/bin/sh
SHR root@gjama / $ grep message /etc/group
messagebus:x:101:
SHR root@gjama / $ opkg install dbus-1
Installing dbus-1 (1.4.12-r7) to root...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/d=
bus-1_1.4.12-r7_armv4t.ipk.
Running groupadd commands...
Note: group netdev already exists, not re-creating it
Running useradd commands...
Note: username messagebus already exists, not re-creating it
Configuring dbus-1.
 Adding system startup for /etc/init.d/dbus-1.
SHR root@gjama / $ ll /usr/libexec/dbus-daemon-launch-helper
-rwsr-xr-- 1 root 998 142748 Nov 12 12:26 /usr/libexec/dbus-daemon-launch-h=
elper

SHR root@gjama / $ opkg remove -force-depends -force-remove dbus-1
Removing package dbus-1 from root...
Stopping system message bus:  Removing any system startup links for dbus-1 =
=2E..
  /etc/rc0.d/K20dbus-1
  /etc/rc1.d/K20dbus-1
  /etc/rc2.d/S02dbus-1
  /etc/rc3.d/S02dbus-1
  /etc/rc5.d/S02dbus-1
  /etc/rc6.d/K20dbus-1
Collected errors:
 * pkg_run_script: package "dbus-1" prerm script returned status 1.
SHR root@gjama / $ opkg update; opkg upgrade opkg; opkg install dbus-1
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//all/Pack=
ages.gz.
Inflating http://jama.dyndns-home.com/org.openembedded.shr-core//all/Packag=
es.gz.
Updated list of available packages in /var/lib/opkg/lists/jama-all.
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/P=
ackages.gz.
Inflating http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/Pac=
kages.gz.
Updated list of available packages in /var/lib/opkg/lists/jama-armv4t.
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//om_gta02=
/Packages.gz.
Inflating http://jama.dyndns-home.com/org.openembedded.shr-core//om_gta02/P=
ackages.gz.
Updated list of available packages in /var/lib/opkg/lists/jama-om_gta02.
Installing opkg (1:0.1.8+svnr625-r3) to root...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/o=
pkg_0.1.8+svnr625-r3_armv4t.ipk.
Installing opkg-config-base (1.0-r0) to root...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//om_gta02=
/opkg-config-base_1.0-r0_om_gta02.ipk.
Installing update-alternatives-cworth (1:0.1.8+svnr625-r3) to root...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//all/upda=
te-alternatives-cworth_0.1.8+svnr625-r3_all.ipk.
Installing libopkg1 (1:0.1.8+svnr625-r3) to root...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/l=
ibopkg1_0.1.8+svnr625-r3_armv4t.ipk.
Configuring opkg-config-base.
Configuring update-alternatives-cworth.
Configuring libopkg1.
Configuring opkg.
update-alternatives: Linking //usr/bin/opkg to /usr/bin/opkg-cl
Installing dbus-1 (1.4.12-r7) to root...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/d=
bus-1_1.4.12-r7_armv4t.ipk.
Running groupadd commands...
Note: group netdev already exists, not re-creating it
Running useradd commands...
Note: username messagebus already exists, not re-creating it
Configuring dbus-1.
 Adding system startup for /etc/init.d/dbus-1.
SHR root@gjama / $ ll /usr/libexec/dbus-daemon-launch-helper
-rwsr-xr-- 1 root messagebus 142748 Nov 12 12:26 /usr/libexec/dbus-daemon-l=
aunch-helper

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6+YcgACgkQN1Ujt2V2gBzVuwCeI8mWu9FYQu5+meG2fZeWqUMC
SMgAoIhnDS3X3F7GgfdLqZEYbzWvH+r5
=Q/31
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
