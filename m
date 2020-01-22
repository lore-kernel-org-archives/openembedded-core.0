Return-Path: <prvs=283796655=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Jan 2020 09:35:47 UTC
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id 668657FF37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1579685749; x=1611221749;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=/vvlLfiwTyiE3pASZvFFaPl3LeOe3kvf+oFdf+Gi5u4=;
	b=o71coTEsAEU+ihE9rkcbkXYrfxeiTzVgpSMbOaJaMPbTejqH6KQhaofy
	qQxvYuEKN4HHcFkXQH4nY892HUQnUjYYXWwmi2Q0mKKIVNe3lIBFHmlDh
	K1Qg8moHiBnsLoa6gsTUKfLWfV/zLUY2ByhUmxWVeXVkC05pIf1GFSFiT Q=;
IronPort-SDR: X01ui54bh+aEcf+uIGHHHIzzx6sfPj2ClGgTmfXRTkp3LQA3hnnWQ1EB6PuwcVTjduyXrQnxBW
	JF2LoIsCZBLbD3IXx1oxRu4k1zR12l7C1rthCJD1V029x7RvogTg3WkOqES6kEV/bJv4hePbjL
	I2Qa1kcaPPK4ivJXlNvuBuhJYFTZSKXbt98gvlQATXb8gxZz2ox06Yd6SEt+zI8rCRJNsviwKw
	AUm1k0i7/mAow5c00N2Yis4oZY2/S2J/rKLtiVVniHw0RLpPy/Eu5AV5pUcR1r03EuMbtsUmYJ
	riM=
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 22 Jan 2020 10:28:37 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw2.muc with ESMTP/TLS;
	22 Jan 2020 10:28:38 +0100
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb5.muc with ESMTP/TLS; 22 Jan 2020 10:28:37 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Wed, 22 Jan 2020 10:28:37 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 22 Jan 2020 10:28:37 +0100
IronPort-SDR: a0u4Zdg0so+2HWul/2+ffvdMj9CgvVXF5wJ0HJ+cLMq4HdK9KOeb5RnwUr9yYEj729EDUXAh4o
	4DAgL7yKO4wsqPhDx3XyyvB5bjlgfrU3g=
From: <Mikko.Rapeli@bmw.de>
To: <pjtexier@koncepto.io>
Thread-Topic: [OE-core] [PATCH] util-linux: upgrade 2.34 -> 2.35
Thread-Index: AQHV0Ii/bjlrKWC76UuRS49VvcU5Jqf2WtCA
Date: Wed, 22 Jan 2020 09:28:37 +0000
Message-ID: <20200122092837.GH34396@korppu>
References: <1579631324-16775-1-git-send-email-pjtexier@koncepto.io>
In-Reply-To: <1579631324-16775-1-git-send-email-pjtexier@koncepto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: upgrade 2.34 -> 2.35
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
X-List-Received-Date: Wed, 22 Jan 2020 09:35:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <347CB2EC31F1114DB551345B2AB94111@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 07:28:44PM +0100, Pierre-Jean Texier via Openembedd=
ed-core wrote:
> License-Update: add GPLv3 text

Which parts of util-linux are now licensed with GPLv3?

-Mikko

> Drop upstreamed patch
>=20
> See full changelog https://lore.kernel.org/util-linux/20200121105711.zzee=
olydlivqnik7@ws.net.home/T/#u
>=20
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  meta/recipes-core/util-linux/util-linux.inc        |  5 +--
>  ...lsblk-force-to-print-PKNAME-for-partition.patch | 36 ----------------=
------
>  .../{util-linux_2.34.bb =3D> util-linux_2.35.bb}     |  5 ++-
>  3 files changed, 5 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsblk-fo=
rce-to-print-PKNAME-for-partition.patch
>  rename meta/recipes-core/util-linux/{util-linux_2.34.bb =3D> util-linux_=
2.35.bb} (58%)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 179cb3d..0f8a6c2 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -6,11 +6,12 @@ disk partitioning, kernel message management, filesyste=
m creation, and system lo
> =20
>  SECTION =3D "base"
> =20
> -LICENSE =3D "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> +LICENSE =3D "GPLv2+ & GPLv3+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> =20
> -LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D972a134f1e14b2b060e3=
65df2fab0099 \
> +LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D0fd5c050c6187d2bf0a4=
492b7f4e33da \
>                      file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 \
>                      file://Documentation/licenses/COPYING.GPL-2.0-or-lat=
er;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://Documentation/licenses/COPYING.GPL-3.0-or-lat=
er;md5=3D1ebbd3e34237af26da5dc08a4e440464 \
>                      file://Documentation/licenses/COPYING.LGPL-2.1-or-la=
ter;md5=3D4fbd65380cdd255951079008b364516c \
>                      file://Documentation/licenses/COPYING.BSD-3-Clause;m=
d5=3D58dcd8452651fc8b07d1f65ce07ca8af \
>                      file://Documentation/licenses/COPYING.BSD-4-Clause-U=
C;md5=3D263860f8968d8bafa5392cab74285262 \
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-=
print-PKNAME-for-partition.patch b/meta/recipes-core/util-linux/util-linux/=
0001-lsblk-force-to-print-PKNAME-for-partition.patch
> deleted file mode 100644
> index 5d4c148..0000000
> --- a/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-P=
KNAME-for-partition.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From e3bb9bfb76c17b1d05814436ced62c05c4011f48 Mon Sep 17 00:00:00 2001
> -From: Karel Zak <kzak@redhat.com>
> -Date: Thu, 27 Jun 2019 09:22:18 +0200
> -Subject: [PATCH] lsblk: force to print PKNAME for partition
> -
> -PKNAME (parent kernel device name) is based on printed tree according
> -to parent -> child relationship. The tree is optional and not printed
> -if partition specified (.e.g "lsblk -o+PKNAME /dev/sda1"), but old
> -versions print the PKNAME also in this case.
> -
> -Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit=
/e3bb9bfb76c17b1d05814436ced62c05c4011f48]
> -
> -Addresses: https://github.com/karelzak/util-linux/issues/813
> -Signed-off-by: Karel Zak <kzak@redhat.com>
> -Signed-off-by: Liwei Song <liwei.song@windriver.com>
> ----
> - misc-utils/lsblk.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/misc-utils/lsblk.c b/misc-utils/lsblk.c
> -index e95af7af0256..3ce6da730264 100644
> ---- a/misc-utils/lsblk.c
> -+++ b/misc-utils/lsblk.c
> -@@ -1019,6 +1019,9 @@ static void device_to_scols(
> - 	DBG(DEV, ul_debugobj(dev, "add '%s' to scols", dev->name));
> - 	ON_DBG(DEV, if (ul_path_isopen_dirfd(dev->sysfs)) ul_debugobj(dev, " %=
s ---> is open!", dev->name));
> -=20
> -+	if (!parent && dev->wholedisk)
> -+		parent =3D dev->wholedisk;
> -+
> - 	/* Do not print device more than one in --list mode */
> - 	if (!(lsblk->flags & LSBLK_TREE) && dev->is_printed)
> - 		return;
> ---=20
> -2.17.1
> -
> diff --git a/meta/recipes-core/util-linux/util-linux_2.34.bb b/meta/recip=
es-core/util-linux/util-linux_2.35.bb
> similarity index 58%
> rename from meta/recipes-core/util-linux/util-linux_2.34.bb
> rename to meta/recipes-core/util-linux/util-linux_2.35.bb
> index e9c2d80..71f7cd1 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.34.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.35.bb
> @@ -7,7 +7,6 @@ SRC_URI +=3D "file://configure-sbindir.patch \
>              file://run-ptest \
>              file://display_testname_for_subtest.patch \
>              file://avoid_parallel_tests.patch \
> -            file://0001-lsblk-force-to-print-PKNAME-for-partition.patch =
\
>  "
> -SRC_URI[md5sum] =3D "a78cbeaed9c39094b96a48ba8f891d50"
> -SRC_URI[sha256sum] =3D "743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa42=
7bbb4a3e9b9f62b5"
> +SRC_URI[md5sum] =3D "479488469f057ddeed0d3ca7d6ab5f16"
> +SRC_URI[sha256sum] =3D "b3081b560268c1ec3367e035234e91616fa7923a0afc2b1c=
80a2a6d8b9dfe2c9"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=

