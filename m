Received: from mail-ww0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1Qr25B-0004po-Tu; Wed, 10 Aug 2011 08:16:01 +0200
Received: by wwf27 with SMTP id 27so750260wwf.3
	for <multiple recipients>; Tue, 09 Aug 2011 23:11:32 -0700 (PDT)
Received: by 10.216.237.144 with SMTP id y16mr6036010weq.114.1312956691921;
	Tue, 09 Aug 2011 23:11:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g48sm360233wee.37.2011.08.09.23.11.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 23:11:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAD=GYpbJkU2wcOCjuJTdEHD6kakhbfO_GYgw3ztBiz0iPmAMzQ@mail.gmail.com>
Date: Wed, 10 Aug 2011 08:11:28 +0200
Message-Id: <3979FABA-BB9A-4EEA-9C0C-8A80874936F6@dominion.thruhere.net>
References: <CAD=GYpbJkU2wcOCjuJTdEHD6kakhbfO_GYgw3ztBiz0iPmAMzQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Jason Kridner <jdk@ti.com>
Subject: Re: Help with setting up feeds
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
X-List-Received-Date: Wed, 10 Aug 2011 06:16:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 aug. 2011, om 03:44 heeft Joel A Fernandes het volgende =
geschreven:

> Hi,
>=20
> I'm trying to setup my own feeds. For this purpose, I have rsync'ed
> the deploy/ipk directory from my OE core tmp directory to my
> webserver, and I edited /etc/opkg/base-feed.conf on my board's root
> filesystem with:
> src/gz base http://www.hackerbliss.org/joel/feeds/ipk/armv7a/


Try =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/c=
ontrib/personal-feed.sh

>=20
> Now I created and built the systemd recipe, with the PR bumped. The
> file is named systemd_v33-r1_armv7a.ipk.
>=20
> I rebuilt the index with, bitbake -b package-index.bb and did an =
rsysnc again.
>=20
> Now I did,
>=20
> root@joel-laptop:~/repository/beagle/nfs/oe-core# opkg-cl -o . -t .
> --offline-root . update
>=20
> root@joel-laptop:~/repository/beagle/nfs/oe-core# opkg-cl -o . -t .
> --offline-root . install systemd

Why not install it on the beagle instead of NFS?

>=20
> The install and configure seems to work, however towards the end I
> get something like this:
>=20
> Configuring kernel-3.0.1+.
> Configuring update-modules.
> Configuring kernel-module-ipv6.
> Configuring systemd.
> Collected errors:
> * rm_r: Failed to remove dir ./opkg-23q3XI/opkg-intercept-0Dgf2b: No
> such file or directory.
> * opkg_conf_write_status_files: Can't open status file
> .//usr/lib/opkg/status: No such file or directory.
> * rm_r: Failed to open dir ./opkg-23q3XI: No such file or directory.
>=20
> Also the 'info' command works
>=20
> root@joel-laptop:~/repository/beagle/nfs/oe-core# opkg-cl -o . -t .
> --offline-root . info systemd
> Package: systemd
> Version: v33-r1
> Depends: dbus-systemd, libcap2 (>=3D 2.22), libdbus-1-3 (>=3D 1.4.12),
> libudev0 (>=3D 173), libwrap0 (>=3D 7.6), udev-systemd, libacl1 (>=3D
> 2.2.51),
> [..]
>=20
>=20
> but, the 'status' and 'list_installed' opkg commands don't return =
anything.
>=20
> Any ideas on what I could be doing wrong?
>=20
> Thanks,
> Joel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



