Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.87])
 by mx.groups.io with SMTP id smtpd.web12.566.1610088188304976670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 22:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=JHwQ1Yk6;
 spf=pass (domain: siemens.com, ip: 40.107.8.87, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0kCOWNMOLu18YQBpp9Pw2wEeDn4cfYrAijD9pvbEFrDtlLhTfjKXD860F5vbhhbHEKkJyUNLLr8xxBAtolavJ1vj/tyTPnuLgmZdG9sA740fpuJodY14/RlsthHP91Mxyq41t1i/hLzEvPeLcFWLlPqJ0H2YdzauJ6mDUAqI5pNLOef25k7XUY8xySJEKJDNMUiZRshW4N54P3eg1KDYHUvK0i59DG+UE79BrK1gYtZhdaW0Wjd6ftrkux8kp9uZek8XngKEzqj5RxJyJKySxQHS8oy9t7lUgtJDZyDdRP1iHAnhOHc3TJR6NSXwF+OgwDwPpyRwPcWkeQL06tqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiXc0oDzk9JjbcKRG4WUopf69/95XvwQ8h3z8R9Knfk=;
 b=N41IA77xtZsBCYLGSnj72hNmUqbglWel7Mnh9uLg28YL+trbvjhQ/nr/MwQ7AZnuya+Fl656+8i+nmijgHBRCF7yLhgwezlZxBmzL6VWsgHD7B1koqoIIYdeoD30h0T07jCHWYntrwRVKwwDSU362Zv6WqYUd6z37MP4Fxz0CnTZcOI13Sd3HF1bNf+ZKVSKhiCX1s4rHU8F2dFV4ejHVmn8suA3Y3dSeDLEFdRuqkkNKVRSzauG6ubCjPLtfTJomxJZtuXx6JBgODIFb/4Fz6/13r+DTd2BpdVmlxe5yfs34oAYu8Alx8S6d/O5qO50PXO6N8rZ70TncyZl2UW+Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiXc0oDzk9JjbcKRG4WUopf69/95XvwQ8h3z8R9Knfk=;
 b=JHwQ1Yk6KARZX8s+p/D+XR9cYExuLCG/2rl26C3DkVG+i1myk473LhC6vl+CG0g7qtVFYqE2c0HvaS1dU1gvWk1hnGh18g9Q1CiYGxYEFN8ID1c9/EQP+NZu3Fzb1D2p6BoXQ2PJhF+Abb/RtAohmW+/UNDY1ytaHoAaw0JKD3I=
Received: from AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:144::20)
 by AM0PR10MB2034.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Fri, 8 Jan
 2021 06:43:05 +0000
Received: from AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8989:dad3:9b2b:f7bf]) by AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8989:dad3:9b2b:f7bf%5]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 06:43:05 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] busybox: upgrade 1.32.0 ->1.33.0
Thread-Topic: [OE-core] [PATCH] busybox: upgrade 1.32.0 ->1.33.0
Thread-Index: AQHW5WYXIEVUZDeF+06W/eRo3FGt0aodRptQ
Date: Fri, 8 Jan 2021 06:43:05 +0000
Message-ID: 
 <AM0PR10MB39713697D8C50860BAD4745892AE0@AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM>
References: <1610072945-7114-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1610072945-7114-1-git-send-email-wangmy@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-01-08T06:43:03Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=7816fd62-60ea-43d4-983e-6e7fae201762;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: cn.fujitsu.com; dkim=none (message not signed)
 header.d=none;cn.fujitsu.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 25281f3f-03bd-4329-13f0-08d8b3a0a768
x-ms-traffictypediagnostic: AM0PR10MB2034:
x-microsoft-antispam-prvs: 
 <AM0PR10MB2034733CA86211B3EE53D23592AE0@AM0PR10MB2034.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TG/FOElxrUsRFarhvmglxrfnQ1YpHhEyoKPz7zhXWapX6AGM/ABDBcAHBRarZtaBQ881tehG4bo2KxY7GeTyM/t6rDWV9pFidir0LtjTF2L8gq/qRc4FZcH4ydz0c/M2XHZP/bacYIdIlWq8mkSaoiixjrCFyucQRDQDQh1fc3kh4fKCvbp8kZpf1d3RDOocaQckFlZ1HBDR5FlGRG/p6sFwXqAqwaciwz+bpdwuat1Eab1taP3bq4Nl5OmmlHg5lzufb8Q/JXI+ZwcHtpA/z2BgoOcwKgYQBZSwmjuvOMeSoYGSffcYlbpi7FJT+KFCYQxE+q1QC1yZx5cG4PykviMXBqCAroo23Q7R+qQoPe+QoActt12YPnsTxnMx9SJvuXLSs/axQnQ44w9pmB8ZRrriZkV9J+bZ1Y0P+DXEUfYqa5OCfGfk2is+P5i4bOHvfm8gzeYrW0Prwa7lpXyB8g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(26005)(6506007)(55236004)(7696005)(71200400001)(2906002)(66556008)(6916009)(8936002)(9686003)(33656002)(55016002)(316002)(4326008)(186003)(5660300002)(8676002)(66946007)(478600001)(86362001)(64756008)(66446008)(76116006)(66476007)(52536014)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?5q0VZ/v/zs2CSQEyF30SIOre72pjOpFgh9dwB2Bt3Mbt6PQdiBj05hfYHgmA?=
 =?us-ascii?Q?eWW/xaG60NrLPbQ2wFt5xwVc4kF9XnGPOBuBfCG+juIHFHgCUns+7JVkgqY9?=
 =?us-ascii?Q?Hk7bRYaSzKNbe7/Pa/y8YHGD0SWv3T0q/0Q4EMwXKvSnQJo1IFJKJOF329m+?=
 =?us-ascii?Q?S99nVtBnNh2/x7HOTcQLKtxihRGVpBfLt1oEnV/XoNdwBEVdGNgw1O5VwjmR?=
 =?us-ascii?Q?qjaC0Ih3FtiU0ve53V/oi0MCkhXDf/tMfCTUN1L4N5j+xOUxdakOUtqIudFA?=
 =?us-ascii?Q?tY6j/nzI+Qpoiw4d0HJ4G3osNotFkJOzn7y/YLDjQdbwH79aCI0HrHdB2HIr?=
 =?us-ascii?Q?W94qFdOVyCmCmmDmMadKPwvdWfwgZd9vV6Ul4Rg4sri5qCp7LHa2rgvdqO8X?=
 =?us-ascii?Q?E/sxNlvaOxiQ/q5egVJYlfPb1DbTwdQ6Wj335HwIr/eh0IJTwK7Q0p3BSRIm?=
 =?us-ascii?Q?r3+FVQENQikx8RVDqtebe82zwPr/aPKSDNUQqkWAmUONsDolmOB/0DUx21/q?=
 =?us-ascii?Q?d7Ofv9kO/5m03GFwdFIdsFFEs88KIEwT517oOxH+bQGHpvuCfmKLelwpHCh6?=
 =?us-ascii?Q?I3xaTYhEACTj/BpNtxKrT3ruOF7aX/FxcgkwnqxbsPbqF7+Y8emgayujysTJ?=
 =?us-ascii?Q?c4hSHkGO44i/BH45n6OoPfjcPnthVAKYvHjFf2Bde+UFZtD9xicSxrNZA3/E?=
 =?us-ascii?Q?uNW6FIxhvxUiE/CgcG4HpajtxSfwq/Q9vXJIgyb36LwgD1A4518vvB69tw2E?=
 =?us-ascii?Q?6i8GnHyoaEWjZ0ODCzzCPV2WkxGsd1DgE+wYFOIYvFIyXZYqAPmus1skLIvt?=
 =?us-ascii?Q?KtgtiOoZGsTn14b3oJM1PkXNhKO8dAeDyHV/GLvEvKS4PJmqF3okwAFP+EAG?=
 =?us-ascii?Q?iurYLWnjNsumhqDOmv2Drjhx6PnCn3IRThiwy2p9rBHufUZrFS1Q7oDk1plB?=
 =?us-ascii?Q?xY0pVsatDCCfciXqwc96JiTT1OeXw2kgtwTZUf2U4eM=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 25281f3f-03bd-4329-13f0-08d8b3a0a768
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 06:43:05.6868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g3wK/BNQkhzxRuED0QbKgTUlbbhN8yrTJHABVuF+FLDS/KNJdgfU2bWF0nyk8EuO8BYKc6GZw2kQR6/tuTHFL+MbmHJpH+TVNtVmlDV3URg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2034
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
Do we have to continue with unstable version? Isn't the stable version (1.3=
2.1) a better choice?

Cheers,
Andrej

> 0001-hwclock-make-glibc-2.31-compatible.patch
> removed sincie it is not available in 1.33.0
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...1-hwclock-make-glibc-2.31-compatible.patch | 83 -------------------  =
.../{busybox_1.32.0.bb =3D> busybox_1.33.0.bb}  |  5 +-
>  2 files changed, 2 insertions(+), 86 deletions(-)  delete mode 100644 me=
ta/recipes-core/busybox/busybox/0001-hwclock-> make-glibc-2.31-compatible.p=
atch
>  rename meta/recipes-core/busybox/{busybox_1.32.0.bb =3D> busybox_1.33.0.=
bb} (90%)
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.=
31-compatible.patch b/meta/recipes-core/busybox/busybox/0001-hwclock-make-g=
libc-2.31-compatible.patch
> deleted file mode 100644
> index 8d1f272120..0000000000
> --- a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-comp=
atible.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 2001
> -From: Sakib Sajal <sakib.sajal@windriver.com>
> -Date: Fri, 17 Jul 2020 17:27:21 +0000
> -Subject: [PATCH] hwclock: make glibc 2.31 compatible
> -
> -NEWS for glibc version 2.31
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> -
> -Deprecated and removed features, and other changes affecting compatibili=
ty:
> -
> -* The settimeofday function can still be used to set a system-wide
> -  time zone when the operating system supports it.  This is because
> -  the Linux kernel reused the API, on some architectures, to describe
> -  a system-wide time-zone-like offset between the software clock
> -  maintained by the kernel, and the "RTC" clock that keeps time when
> -  the system is shut down.
> -
> -  However, to reduce the odds of this offset being set by accident,
> -  settimeofday can no longer be used to set the time and the offset
> -  simultaneously.  If both of its two arguments are non-null, the call
> -  will fail (setting errno to EINVAL).
> -
> -  Callers attempting to set this offset should also be prepared for
> -  the call to fail and set errno to ENOSYS; this already happens on
> -  the Hurd and on some Linux architectures.  The Linux kernel
> -  maintainers are discussing a more principled replacement for the
> -  reused API.  After a replacement becomes available, we will change
> -  settimeofday to fail with ENOSYS on all platforms when its 'tzp'
> -  argument is not a null pointer.
> -
> -  settimeofday itself is obsolescent according to POSIX.  Programs
> -  that set the system time should use clock_settime and/or the adjtime
> -  family of functions instead.  We may cease to make settimeofday
> -  available to newly linked binaries after there is a replacement for
> -  Linux's time-zone-like offset API.
> -
> -hwclock had two calls to settimeofday, in functions to_sys_clock and -se=
t_system_clock_timezone, where both the arguments to settimeofday -were val=
id (non-null).
> -Therefore, split the call, once for timezone and once for timeval.
> -
> -Fixes #12756
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - util-linux/hwclock.c | 12 ++++++++----
> - 1 file changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c -index dc97d8f.=
.cf346e8 100644
> ---- a/util-linux/hwclock.c
> -+++ b/util-linux/hwclock.c
> -@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname, i=
nt utc)
> -=20
> - 	tv.tv_sec =3D read_rtc(pp_rtcname, NULL, utc);
> - 	tv.tv_usec =3D 0;
> --	if (settimeofday(&tv, &tz))
> --		bb_simple_perror_msg_and_die("settimeofday");
> -+	if (settimeofday(NULL, &tz))
> -+		bb_simple_perror_msg_and_die("settimeofday: timezone");
> -+	if (settimeofday(&tv, NULL))
> -+		bb_simple_perror_msg_and_die("settimeofday: timeval");
> - }
> -
> - static void from_sys_clock(const char **pp_rtcname, int utc) -@@ -283,8=
 +285,10 @@ static void set_system_clock_timezone(int utc)
> - 	gettimeofday(&tv, NULL);
> - 	if (!utc)
> - 		tv.tv_sec +=3D tz.tz_minuteswest * 60;
> --	if (settimeofday(&tv, &tz))
> --		bb_simple_perror_msg_and_die("settimeofday");
> -+	if (settimeofday(NULL, &tz))
> -+		bb_simple_perror_msg_and_die("settimeofday: timezone");
> -+	if (settimeofday(&tv, NULL))
> -+		bb_simple_perror_msg_and_die("settimeofday: timeval");
> - }
> -
> - //usage:#define hwclock_trivial_usage
> ---
> -2.24.1
> -
> diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb b/meta/recipes-c=
ore/busybox/busybox_1.33.0.bb
> similarity index 90%
> rename from meta/recipes-core/busybox/busybox_1.32.0.bb
> rename to meta/recipes-core/busybox/busybox_1.33.0.bb
> index 3a669444dd..ec8f350955 100644
> --- a/meta/recipes-core/busybox/busybox_1.32.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
> @@ -44,11 +44,10 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${=
PV}.tar.bz2;name=3Dtarball \
>             file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
>             file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys=
-ne.patch \
> -           file://0001-hwclock-make-glibc-2.31-compatible.patch \
>             file://rev.cfg \
>             file://pgrep.cfg \
>  "
>  SRC_URI_append_libc-musl =3D " file://musl.cfg "
> =20
> -SRC_URI[tarball.md5sum] =3D "9576986f1a960da471d03b72a62f13c7"
> -SRC_URI[tarball.sha256sum] =3D "c35d87f1d04b2b153d33c275c2632e40d388a88f=
19a9e71727e0bbbff51fe689"
> +SRC_URI[tarball.md5sum] =3D "eb0e85d59015ddcd8d2219f42c8844ac"
> +SRC_URI[tarball.sha256sum] =3D "d568681c91a85edc6710770cebc1e80e042ad74d=
305b5c2e6d57a5f3de3b8fbd"
> --
> 2.25.1



