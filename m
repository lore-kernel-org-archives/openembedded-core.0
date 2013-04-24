Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UUuGo-0000Lj-S5
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 09:37:39 +0200
Received: by mail-pb0-f51.google.com with SMTP id rr4so374351pbb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=V+SFXPA3MXg8nBS+BTcuaQkUTgteSk34X1e7nuCn7Lc=;
	b=nuutUgqYww8hXkSc2rlhotyCf/9pzu6R7ssB4tuYGvpniplRojUrtbs0bSzCPuViX+
	QZXr6o0gqIp/LRvvkhVIa+iC7rtDLNxYqyLNi70mkmrObNvkp5njCSDTY52KIrjS5k3k
	j9plgClG+1pmnJi1pDI/3baSKA+9tU2OgfZ9wMJFyCn/Yv+xkcRDgZ0Dariq/VGFonyV
	3+wtKM8MeyiPm/SVKN1nVF8tjduDelRs/epKweK+pADLVqExXbrupFODwe9cA6ZioILF
	hnYo2EIMQovV3QgyVf9z1c1NG9MvU8ZYIO0SVEx21wgUqak23n4MQovMcftlXydElWq6
	APbA==
X-Received: by 10.67.3.35 with SMTP id bt3mr17572174pad.157.1366787996487;
	Wed, 24 Apr 2013 00:19:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	mt13sm1936432pbc.15.2013.04.24.00.19.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 00:19:55 -0700 (PDT)
Date: Wed, 24 Apr 2013 09:20:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130424072004.GE3217@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: debugedit: canonicalization unexpectedly shrank by one character
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 07:37:40 -0000
X-Groupsio-MsgNum: 38278
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Content-Disposition: inline

--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

with debugedit errors now catched and shown after:
commit 262a69ffd33e9d001a7a15fc73671a015e3b5dd1
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Mon Mar 25 16:52:07 2013 +0000

    package.bbclass: Handle subprocess errors correctly

    If an error occurs in subprocess.call() we currently don't catch it. In=
 particular
    we have issues where debugedit is segfaulting unnoticed. This fixes up
    various code paths to catch the errors.

I get couple of recipes failing with errors like:

NOTE: Running task 4179 of 4962 (ID: 2136, /OE/webos/owpb/openwebos-ports/m=
eta-smartphone/meta-android/recipes-multimedia/android-audiosystem/android-=
audiosystem_bzr.bb, do_package)
NOTE: recipe android-audiosystem-1.8+bzr43-r0: task do_package: Started
ERROR: debugedit failed with exit code 1 (cmd was '/OE/webos/owpb/openwebos=
-ports/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit' -b '/OE/=
webos/owpb/openwebos-ports/tmp-eglibc/work/armv7a-vfp-neon-webos-linux-gnue=
abi' -d '/usr/src/debug' -i -l '/OE/webos/owpb/openwebos-ports/tmp-eglibc/w=
ork/armv7a-vfp-neon-webos-linux-gnueabi/android-audiosystem/1.8+bzr43-r0/de=
bugsources.list' '/OE/webos/owpb/openwebos-ports/tmp-eglibc/work/armv7a-vfp=
-neon-webos-linux-gnueabi/android-audiosystem/1.8+bzr43-r0/package/usr/lib/=
libwaudio.so.1.0')
ERROR: Function failed: split_and_strip_files
ERROR: Logfile of failure stored in: /OE/webos/owpb/openwebos-ports/tmp-egl=
ibc/work/armv7a-vfp-neon-webos-linux-gnueabi/android-audiosystem/1.8+bzr43-=
r0/temp/log.do_package.3450
NOTE: recipe android-audiosystem-1.8+bzr43-r0: task do_package: Failed
ERROR: Task 2136 (/OE/webos/owpb/openwebos-ports/meta-smartphone/meta-andro=
id/recipes-multimedia/android-audiosystem/android-audiosystem_bzr.bb, do_pa=
ckage) failed with exit code '1'

Unfortunately this error does not show stdout/stderr from debugedit, but ru=
nning it manually:
'/OE/webos/owpb/openwebos-ports/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rp=
m/bin/debugedit' -b '/OE/webos/owpb/openwebos-ports/tmp-eglibc/work/armv7a-=
vfp-neon-webos-linux-gnueabi' -d '/usr/src/debug' -i -l '/OE/webos/owpb/ope=
nwebos-ports/tmp-eglibc/work/armv7a-vfp-neon-webos-linux-gnueabi/android-au=
diosystem/1.8+bzr43-r0/debugsources.list' '/OE/webos/owpb/openwebos-ports/t=
mp-eglibc/work/armv7a-vfp-neon-webos-linux-gnueabi/android-audiosystem/1.8+=
bzr43-r0/package/usr/lib/libwaudio.so.1.0'
/OE/webos/owpb/openwebos-ports/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm=
/bin/debugedit: canonicalization unexpectedly shrank by one character

This leads to=20
https://bugzilla.redhat.com/show_bug.cgi?id=3D304121
https://bugs.launchpad.net/rpm/+bug/638633
https://qa.mandriva.com/show_bug.cgi?id=3D62391

but no clear solution (it would be nice to show which path triggered that m=
essage=20
as suggested in redhat bugzilla)

I can INHIBIT_PACKAGE_DEBUG_SPLIT in failing recipes or adding slash=20
to -d '/usr/src/debug/' works in this case too..

Other ideas?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF3h6QACgkQN1Ujt2V2gBzeowCdEGa2QQvJ0t/iOnl+jHHDV6dD
DH0An0Lo0aXANF2X8cjt3CNJdbBfUiQF
=UFMb
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--
