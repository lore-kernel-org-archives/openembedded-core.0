Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F234D7841E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 08:28:05 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7E8S08N016291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 Aug 2017 09:28:01 +0100
Message-ID: <1502699280.13978.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 09:28:00 +0100
In-Reply-To: <cover.1502466036.git.markus.lehtonen@linux.intel.com>
References: <cover.1502466036.git.markus.lehtonen@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 14 Aug 2017 09:28:02 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v3 0/7] Support signed RPM package feeds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Aug 2017 08:28:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-08-11 at 18:43 +0300, Markus Lehtonen wrote:
> Changes since v2:
> - bug id in the commit message of the last patch corrected
>=20
> The following changes since commit
> df7f5221a56118da7654476f072c37ae1e75dc50:
>=20
> =C2=A0 libinput: Upgrade 1.7.3 -> 1.8.1 (2017-08-09 09:25:47 +0100)
>=20
> are available in the git repository at:
>=20
> =C2=A0 git://git.openembedded.org/openembedded-core-contrib marquiz/fixes=
-
> 11209
> =C2=A0 http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dma=
rqu
> iz/fixes-11209
>=20
> Markus Lehtonen (7):
> =C2=A0 lib/oe/package_manager: re-implement rpm feed signing
> =C2=A0 dnf: rrecommend gnupg
> =C2=A0 sign_package_feed.bbclass: install signing key into rootfs
> =C2=A0 package_manager.py: enable dnf's repo_gpgcheck if feed signing is
> =C2=A0=C2=A0=C2=A0=C2=A0enabled
> =C2=A0 oeqa: fix dnf tests
> =C2=A0 oeqa: fix temp file handling in dnf package feed test
> =C2=A0 dnf: expand dnf selftest to test signed package feeds

This seemed to cause a failure in oe-selftest:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/446/steps/=
Running%20oe-selftest/logs/stdio

NOTE: recipe core-image-full-cmdline-1.0-r0: task do_rootfs: Started
ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Could not invoke dnf. Comm=
and '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/bui=
ld/build/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0-r0/reci=
pe-sysroot-native/usr/bin/dnf -y -c /home/pokybuild/yocto-autobuilder/yocto=
-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/core=
-image-full-cmdline/1.0-r0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/h=
ome/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/buil=
d/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0-r0/rootfs/etc/=
yum.repos.d --repofrompath=3Doe-repo,/home/pokybuild/yocto-autobuilder/yoct=
o-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/cor=
e-image-full-cmdline/1.0-r0/oe-rootfs-repo --installroot=3D/home/pokybuild/=
yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qem=
ux86_64-poky-linux/core-image-full-cmdline/1.0-r0/rootfs --setopt=3Dlogdir=
=3D/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build=
/build/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0-r0/temp -=
-nogpgcheck install packagegroup-core-ssh-openssh signing-keys-packagefeed =
packagegroup-core-boot packagegroup-core-full-cmdline psplash rpm run-posti=
nsts dnf locale-base-en-us locale-base-en-gb' returned 1:
Unable to detect release version (use '--releasever' to specify release ver=
sion)
Added oe-repo repo from /home/pokybuild/yocto-autobuilder/yocto-worker/nigh=
tly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/core-image-full-=
cmdline/1.0-r0/oe-rootfs-repo
Last metadata expiration check: 0:00:01 ago on Mon 14 Aug 2017 01:38:25 AM =
UTC.
No package signing-keys-packagefeed available.
Error: Unable to find a match

ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Function failed: do_rootfs

Cheers,

Richard

