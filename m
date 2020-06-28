Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.88])
 by mx.groups.io with SMTP id smtpd.web11.131.1593362209703217455
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 09:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=dafbO/3A;
 spf=pass (domain: outlook.com, ip: 40.92.75.88, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5H562k99fhIBIVMhUTe/t0ys56KL0/ODCjfs10Q+UmWq/X/bMgTirDQyornosaO9hkiNI17deAI7csT9C/nhi9RYLjhawxvxNnMit9N2F1F8PR83Hvtv6YI4gWTBO2YjNzcbDbIHC4VpJsC3s/Few9e6TWmlIm4GT6y4vm18oUJbY2mo399/Y+ZYi4O6wpIpx0Uf259Tpt3NCHDwi6zdpokbmr11tH4lZFvCG1uifAtMJQV4ivDd1wzT420zlLGl+Mi8oiEZvW8WxLfmTtG0TK/bPNvnhjUmuqbYuKfVQel23fK9bGhOq42wezpfTMuXBeSKGO//mqsDOggg3bIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjhxp0T9kDYZoisRvVKxU5yT95Vdoq/9ogRZzDQ3LEw=;
 b=GEHT3MF0rYr7OoesOfmvmGeaUmfvpfzABdQoD/6sxXpFlt0vUeQDEfyomvvlNpwSSneyh9ZwcrahKLWB1YpYh92bg73KWxJJ8Skz7KxTDmYj6LFq7Qoo7CZKAwA7VPOGdPoimTyDVOJbUP5mmcpfpdLoSGSzPV5jjYSxa0U8RfZI2WHFdLnv02UTBslUaLFVMpe4tv6L7MLYkBcrZBgkqWlJohJKOIIMyj4xWHMVs/g8H2YCUWLor0fudfZSECuzA3CjIMhzSlQO54bWRLgZMgL9tkxvChkEqtHMmrcfxmi7Qerel4D5QgMQPFeiev8yw2BcVu3N/NRHJ/cbgSlR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjhxp0T9kDYZoisRvVKxU5yT95Vdoq/9ogRZzDQ3LEw=;
 b=dafbO/3ATelt8zwHZTZ8gu5vrqKCqrPkwLK+x2Mxy7UAj82NUqN59a/LOROD/f2eaEnpCw1lWibo2RrFiUye77DlxLhgv5FPhkp3E24iEGyvB4ZDOHB1Jof19b1WmJJTwNIEOjK68jM82os7rG2QUaBwhHDy5nNdS72/ixqvGG6X4iPeLpAFE/5KeQxg4zHmxdTwa0SnBTX0hQ5wb8pml5zmTQeqLPunWz71bG0kNY46ZfDhNuBdZ2jlQ2Yz9GCnGpZ2YLfE5iqxytzBuI+E1l90PmIXPFKZR1qky36qqr+x93rX6Mc7Dhz+nefQGwuJZ8xvkg1mSYgQrRxmFZ6ntA==
Received: from VI1EUR04FT057.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::4b) by
 VI1EUR04HT219.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::376)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Sun, 28 Jun
 2020 16:36:47 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::4e) by VI1EUR04FT057.mail.protection.outlook.com
 (2a01:111:e400:7e0e::274) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Sun, 28 Jun 2020 16:36:47 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:76593D145F281C5629462DCCA8147C8C02C06F0D897F43704877211E54A7F9CF;UpperCasedChecksum:2E5607CC43BC819E2991C4732086775B8BE36B62034294B6A03F67F14A0D23F8;SizeAsReceived:8718;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3131.026; Sun, 28 Jun 2020
 16:36:47 +0000
Subject: Re: [OE-core] [PATCH 1/3] nfs-utils: upgrade 2.4.3 -> 2.5.1
To: openembedded-core@lists.openembedded.org
References: <20200628133414.3246339-1-schnitzeltony@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM7PR05MB68817E6C60D5241312FCFC74A8910@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sun, 28 Jun 2020 18:36:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200628133414.3246339-1-schnitzeltony@gmail.com>
X-ClientProxiedBy: AM6P194CA0011.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::24) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <d5fc402e-4172-aaf7-d410-fb6367161398@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.141.91.61) by AM6P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Sun, 28 Jun 2020 16:36:46 +0000
X-Microsoft-Original-Message-ID: <d5fc402e-4172-aaf7-d410-fb6367161398@outlook.com>
X-TMN: [fC7k51PwHOyZ/gFNpJ/xalSR6Wf6DqWL]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1eb26aac-c207-4861-ab72-08d81b817324
X-MS-TrafficTypeDiagnostic: VI1EUR04HT219:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	seGYxNVpp7m7YfafMvRQ7/y9fbr8cvSlMYVS/RS4F7mL7qP4BucRf96BJHH8wuEmxdrDwDtvzVdJg48EXqBoartk5tGjZHciXjxCHoWGMqczoIWONXCneTWFPKLHgI7joCur0Bml7mBXTwZxMl7SH4HYWJI86qn9u8rmXyfngiU9bl2WG3ns70oUCWIkKpKN8bnvrNnfkS4eJCZmfVm+NwPWlZxvaD2X1D9mClBxPineLDcX3wZLgHf3pojbMsW1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	1Njyl+uu4HnKxnG5vwn0AXIfeaA05+Kjz+sy/QOYliQx4jO0iktluLQXgXuJp5yzPpad81mOr3TC8W01dITgg4bKQ7itbsSFEIktSmXNNo7mzwn85S6VCiwBpBWLWgorEqdvT+p5fyETwsJvwt9bzA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb26aac-c207-4861-ab72-08d81b817324
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2020 16:36:47.3177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT057.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT219
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 28.06.20 15:34, Andreas M=C3=BCller wrote:
> * cacheio was fixed upstream slightly different
> * nfsdclnts is a python3 script for printing various nfs client informat=
ion
>    pack it in ${PN}-stats
> * replace leading spaces by tabs in shell tasks

Is there a technical reason for this?
AFAIK http://www.openembedded.org/wiki/Styleguide is still valid.
If not the document should be reworked I guess

> * remove SRC_URI[md5sum]
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>   ...acheio-use-intmax_t-for-formatted-IO.patch | 38 -------------------
>   ...{nfs-utils_2.4.3.bb =3D> nfs-utils_2.5.1.bb} | 21 +++++-----
>   2 files changed, 9 insertions(+), 50 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-=
cacheio-use-intmax_t-for-formatted-IO.patch
>   rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.4.3.bb =3D> nf=
s-utils_2.5.1.bb} (86%)
>=20
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-cacheio-=
use-intmax_t-for-formatted-IO.patch b/meta/recipes-connectivity/nfs-utils/n=
fs-utils/0001-cacheio-use-intmax_t-for-formatted-IO.patch
> deleted file mode 100644
> index bafff5b9c0..0000000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-cacheio-use-int=
max_t-for-formatted-IO.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From ac32b813f5d6f9a2de944015cf9bb98d68e0203a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 1 Dec 2018 10:02:12 -0800
> -Subject: [PATCH] cacheio: use intmax_t for formatted IO
> -
> -time_t is not same size on x32 ABI (ILP32)
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - support/nfs/cacheio.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/support/nfs/cacheio.c b/support/nfs/cacheio.c
> -index 9dc4cf1..2086a95 100644
> ---- a/support/nfs/cacheio.c
> -+++ b/support/nfs/cacheio.c
> -@@ -17,6 +17,7 @@
> -
> - #include <nfslib.h>
> - #include <stdio.h>
> -+#include <inttypes.h>
> - #include <stdio_ext.h>
> - #include <string.h>
> - #include <ctype.h>
> -@@ -234,7 +235,7 @@ cache_flush(int force)
> - =09    stb.st_mtime > now)
> - =09	stb.st_mtime =3D time(0);
> - =09
> --	sprintf(stime, "%ld\n", stb.st_mtime);
> -+	sprintf(stime, "%jd\n", (intmax_t)stb.st_mtime);
> - =09for (c=3D0; cachelist[c]; c++) {
> - =09	int fd;
> - =09	sprintf(path, "/proc/net/rpc/%s/flush", cachelist[c]);
> ---
> -2.19.2
> -
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb b/me=
ta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
> similarity index 86%
> rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
> rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
> index 9bdb6f4ae4..188a8893b4 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
> @@ -28,12 +28,10 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-uti=
ls/${PV}/nfs-utils-${PV}.tar.x
>              file://proc-fs-nfsd.mount \
>              file://nfs-utils-debianize-start-statd.patch \
>              file://bugfix-adjust-statd-service-name.patch \
> -           file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
>              file://0001-Makefile.am-fix-undefined-function-for-libnsm.a=
.patch \
>              file://clang-warnings.patch \
>              "
> -SRC_URI[md5sum] =3D "06020c76f531ed97f3145514901e0e7c"
> -SRC_URI[sha256sum] =3D "af65fce5dd8370cff9ead67baac5a6cd69c376dcadfef26=
4dc2c78c904f26599"
> +SRC_URI[sha256sum] =3D "0f1c8170e16a07d9836bbf0836d48d0c842b6f0e0e8b187=
48f099751851d30c4"
>  =20
>   # Only kernel-module-nfsd is required here (but can be built-in)  - th=
e nfsd module will
>   # pull in the remainder of the dependencies.
> @@ -91,7 +89,7 @@ RDEPENDS_${PN}-client =3D "${PN}-mount rpcbind"
>  =20
>   FILES_${PN}-mount =3D "${base_sbindir}/*mount.nfs*"
>  =20
> -FILES_${PN}-stats =3D "${sbindir}/mountstats ${sbindir}/nfsiostat"
> +FILES_${PN}-stats =3D "${sbindir}/mountstats ${sbindir}/nfsiostat ${sbi=
ndir}/nfsdclnts"
>   RDEPENDS_${PN}-stats =3D "python3-core"
>  =20
>   FILES_${PN}-staticdev +=3D "${libdir}/libnfsidmap/*.a"
> @@ -99,8 +97,8 @@ FILES_${PN}-staticdev +=3D "${libdir}/libnfsidmap/*.a"
>   FILES_${PN} +=3D "${systemd_unitdir} ${libdir}/libnfsidmap/"
>  =20
>   do_configure_prepend() {
> -        sed -i -e 's,sbindir =3D /sbin,sbindir =3D ${base_sbindir},g' \
> -            ${S}/utils/mount/Makefile.am
> +	sed -i -e 's,sbindir =3D /sbin,sbindir =3D ${base_sbindir},g' \
> +	=09${S}/utils/mount/Makefile.am
>   }
>  =20
>   # Make clean needed because the package comes with
> @@ -129,9 +127,9 @@ do_install_append () {
>   =09	-e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
>   =09	${D}${systemd_unitdir}/system/*.service
>   =09if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',=
d)}; then
> -	    install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_unitdi=
r}/system/
> -	    install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
> -	    ln -sf ../proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/sysinit=
.target.wants/proc-fs-nfsd.mount
> +	=09install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_unitdir=
}/system/
> +	=09install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
> +	=09ln -sf ../proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/sysinit.=
target.wants/proc-fs-nfsd.mount
>   =09fi
>  =20
>   =09# kernel code as of 3.8 hard-codes this path as a default
> @@ -141,7 +139,6 @@ do_install_append () {
>   =09chown -R rpcuser:rpcuser ${D}${localstatedir}/lib/nfs/statd
>   =09chmod 0644 ${D}${localstatedir}/lib/nfs/statd/state
>  =20
> -        # Make python tools use python 3
> -        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${sbindir}=
/mountstats ${D}${sbindir}/nfsiostat
> -
> +	# Make python tools use python 3
> +	sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${sbindir}/mounts=
tats ${D}${sbindir}/nfsiostat
>   }
>=20
>=20
>=20
>=20
