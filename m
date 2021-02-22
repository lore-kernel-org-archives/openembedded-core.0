Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.88])
 by mx.groups.io with SMTP id smtpd.web12.31682.1613975815562988915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=LSAn88Lq;
 spf=pass (domain: siemens.com, ip: 40.107.13.88, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxEZQQim07HI/riJtKgsCHHpnKWsJOEYwzd4knc57qq3U+0le7EEZDKSPx49e4VsjNsyRa6lXJr1ajWjwbS7Nan1Hn12cc+vjgVGLxLXD8HyyfIGWlGr3GoDu+gShFKxwxJxaNdj4KZpXrAS9xUHjnwjOnYp9YANcMIoSopIcl6nSj6GcM9ZHCBVr5KQ0Ku+jV1QvwjOE/VBMmXHYfJhfiNosXaMMXNUPbhFYnhUafXJNaV68bW1xiGQrz4AitdO0ptgxr32CAEuoVrjOINo3CM/DVX9VkWZYkxVBZwVBilWqjLtMCxlDzknIaguXAes5JDzxa7o8GsHapSr2NQLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odOIWAOH7tlIkQMJIDbDPnNI2ZQvEw8MMFbvJ6AD6XA=;
 b=Lh7v/is50mpjm9Zxw2jcypmw0H5DOvzT8sDJN9Qr3dVhOuccUaNEFw5TBTiNyIkl0+mNrjYRS+JFRKGUzztmzZ1lpqI4i/S+SaTNHRt3gzILsw4fQ5MLkQAJ3SC2FdsKDQLiBLl+1SuY8pHGvZBi5qMk7xZyw/Jo5aMuXn02m5viQs+sL/fU6Sm7XbggVa21uvMcljbH0kqe41p/Hvz2H4b16k8CKOom9xFWWvoqrq9qZkfOlzUohXo4gVoZJPuA8aZVvMuVyEwpCJXIEaaZKvJrQTFHi8OoJ2d3jM3D0c/Z8DqzYH2y9J8S6fHcLmkwnsFL43Ngjx5sUBUx3Fuoyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odOIWAOH7tlIkQMJIDbDPnNI2ZQvEw8MMFbvJ6AD6XA=;
 b=LSAn88LqKpdd5jDvPaAL3nj24FMLAno7ya8v0YQmYCDfipDrD0uG0KeHubQm9dLVAHMmzaQ4KIgGL7XFG2OGrStbM/JcRD17kKLPxXjBkJ6d2/kMz1QfeP80JxQyxBnFaLkQdKhmoADu6MmCnupBFdMidYa5H0rrhJN75o7eclU=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB8PR10MB3896.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:16d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Mon, 22 Feb
 2021 06:36:52 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::954a:7239:f088:8c80]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::954a:7239:f088:8c80%8]) with mapi id 15.20.3868.029; Mon, 22 Feb 2021
 06:36:52 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] busybox: update 1.33.0
Thread-Topic: [OE-core] [PATCH] busybox: update 1.33.0
Thread-Index: AQHXBwq4wQQNsCEHqESEO0L9yglDOKpju6bw
Date: Mon, 22 Feb 2021 06:36:52 +0000
Message-ID: 
 <DB8PR10MB3977A450622E50F79787E7FE92819@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20210219220042.2384431-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20210219220042.2384431-1-open.source@oleksandr-kravchuk.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-02-22T06:36:49Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=2142a99d-a391-4226-a95e-3fc5521974ad;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: oleksandr-kravchuk.com; dkim=none (message not signed)
 header.d=none;oleksandr-kravchuk.com; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c0074d02-935a-4667-c552-08d8d6fc3da2
x-ms-traffictypediagnostic: DB8PR10MB3896:
x-microsoft-antispam-prvs: 
 <DB8PR10MB3896181FA297290FCB00B25592819@DB8PR10MB3896.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 F4upLtQI9hZug1v4RPc2v7oEzUa0gRlofBR8wu2psi+MZPKwwyyYNxlXuzcXJg4XRUL+26XBOZF3OC2MIOQ7/kksHRnXRE/HjkJ0Tr1vHFT6fG+NTHyw6e5yl/esGI/c1hdaZ2SEQ51OW7t+ko4pALIqK/fewKRdk5YGY4ibNONJ+mdCd66doM7YoHfveTUDG647iCYomLPj4UAMnf/t6x9iDlmTv/sBy5ddXYKv4xgoHbuyGdJmUEH91vJNm97HzxRA1Mjg1CiAgQ8FfF6v1EP4lXCxvpZO/bEwxOXvJQuj7p0w/8KXbZESO/mjHPMJNPaYNqktt+xGch8jkApU0zIR2wnaSDEyFccX9GbwtuuPrt/+JAt5UN8YFBf7fdvanpRzWF+SyDAzu5fpV84leeLpCcAule/AzzIvi/Lt6OjXSKJUGwz7OonxL/KDOEo6Khnr5Lzv4U99O29yYlFrh06kveGGRLn/6pKZ+mu7fD5b6yLQZB/cpHoIo3Nu5O4xIvT+y7RyHZ6I7uZ+1M5DJXiq1ycKO5CY+b+vxr5itcqp/UPvRrqQVvft/4aSs4YnCSEQNn7ktge+cs6uPAryZA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(5660300002)(52536014)(316002)(2906002)(9686003)(55016002)(66556008)(66446008)(64756008)(66476007)(71200400001)(8676002)(76116006)(6506007)(110136005)(53546011)(8936002)(86362001)(15650500001)(186003)(7696005)(55236004)(26005)(33656002)(83380400001)(478600001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?y+b5uvYJqDf73kgVSfnRa7kB8OKk8KJ+w5Ti68rI8+P0M2+vY6TWZfSkQv9l?=
 =?us-ascii?Q?1qbnH5LqTSU/YzU2P0CTsypnz5bKGUdw0kgCeS+jC66Rm37mNzLGT/HBcBZm?=
 =?us-ascii?Q?BqjVpvqJV3yONcM1MIaQL8ewCURjfJesXiZuB6ySPFBRdAaZ9z5v0Y2AehWL?=
 =?us-ascii?Q?kjSJblIbOBkwQhqN5VRdhK7wyDvTi4abAZCY7Xq2Nk8Z+xAmx4Mgm34waa66?=
 =?us-ascii?Q?AjyGHYqitoaVPPW+cf8rJFvBawMu0bDc1jh9uubijRM21gqt8ZYzOGpTZtdd?=
 =?us-ascii?Q?9O7edUTIxak9NTJO+tldQ1jvegR53dHRiY55qnb7wvJnfx83ech5gCV7RyJy?=
 =?us-ascii?Q?9X3BWl4idkiv/B/UvgmhdCf4pa8j7wL9yoYQBxPnAoLAqfrX12+GdRRwe8q0?=
 =?us-ascii?Q?/Zg9ISMJifZleJV8KZ2yP8MnSQrn9hL8TaWavuhzyQncgvWIJj9A47OIWhKJ?=
 =?us-ascii?Q?jZZQfObqpo1iyuzzkHcE56EsyVdCcche8vPd7KUFwuqjbPtVVE4kPsZN6QzX?=
 =?us-ascii?Q?IdHU5bQXeyXymLEWf2/G3l8JunkmnV9sD8hWGuMFegzpbNcwWX9HQkcclD5A?=
 =?us-ascii?Q?MhC7EIm7loXUvwBoOM+8ro3amigNcI4s7sr+SS1lf6r7znz3nXQMv5WwMATn?=
 =?us-ascii?Q?EY0iWtzJpM9XQJJ54Ctdwvp5AvOrMIQbgIEXcwJQc98IhWfcqepYMccpP/4P?=
 =?us-ascii?Q?GGaag+oDwJRxR0ewL4C2eq/ITBFlzP9ZfSDFI2+GiBE35ucGuDdzFCC4nuv+?=
 =?us-ascii?Q?txw6d4PI51nInwLXO+WQ+HiU4PtQhPpVLMeC5U2SDlFTpLhhQHpbUL9KWOeP?=
 =?us-ascii?Q?0mvazE3FD7vu74v3XiJ0V1xkF4yPvVvwGnvtDsHMspiNULOsYwacIgeGMgRi?=
 =?us-ascii?Q?bWTOLGM9ERIIR0A6kuz4pvNKUs5KNYrV3tGmH43TjxNqLsx66bCWvj8cK53W?=
 =?us-ascii?Q?WG1ozt03xqw/t5Om+2/wbSFAuCSUJYKQlm6ZGFXr5IHW1Mzj/ObFNnA+WudC?=
 =?us-ascii?Q?otJBPgsgzzoscjKYaUo3iZw8xLFn6oWo7nq4ZXA0V+ThQMszGi8TpNYU23r+?=
 =?us-ascii?Q?V2MjwSzyjBQPbsNymfXh7mPSzqhTDKnwtAzlXbqRATG8R2j/B2xhKdXyFfZD?=
 =?us-ascii?Q?xa0C/duGMPwS9O/rbUvtQ2KQsgsJSbNPcoNalfKYYYQSG5a8veHCHDOKsnQf?=
 =?us-ascii?Q?0/HaB7xCcrM0lZh8c+IBVGkr4KeWMJZUTd559fVaOdVjKpUYbVafO5zcgpRj?=
 =?us-ascii?Q?qkBzT87kIPTD7C5hH1ATbnPmbe7Pq304z9U86XDTXLMVOMVBEGNNstcqBqPh?=
 =?us-ascii?Q?FnS5EUF9J4wJmpqBNIJzOIpL?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c0074d02-935a-4667-c552-08d8d6fc3da2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2021 06:36:52.4725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: coojmnMoYGbqUMbvqCHWZi3C2uU4j1BYVuQYZHpChhkNZie967uq4PMS6oVDLyxeguHo7rOHJnhILEUQswcX+eEygM8HpStaHoYpGwEZT6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3896
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Oleksandr,

Why are you upgrading to unstable version?

Cheers,
Andrej

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Oleksandr Kravchuk
Sent: Friday, February 19, 2021 11:01 PM
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [OE-core] [PATCH] busybox: update 1.33.0

Removed upstreamed patch.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...1-hwclock-make-glibc-2.31-compatible.patch | 83 -------------------  ..=
./{busybox_1.32.0.bb =3D> busybox_1.33.0.bb}  |  4 +-
 2 files changed, 1 insertion(+), 86 deletions(-)  delete mode 100644 meta/=
recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
 rename meta/recipes-core/busybox/{busybox_1.32.0.bb =3D> busybox_1.33.0.bb=
} (90%)

diff --git a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31=
-compatible.patch b/meta/recipes-core/busybox/busybox/0001-hwclock-make-gli=
bc-2.31-compatible.patch
deleted file mode 100644
index 8d1f272120..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compat=
ible.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 2001
-From: Sakib Sajal <sakib.sajal@windriver.com>
-Date: Fri, 17 Jul 2020 17:27:21 +0000
-Subject: [PATCH] hwclock: make glibc 2.31 compatible
-
-NEWS for glibc version 2.31
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-
-Deprecated and removed features, and other changes affecting compatibility=
:
-
-* The settimeofday function can still be used to set a system-wide
-  time zone when the operating system supports it.  This is because
-  the Linux kernel reused the API, on some architectures, to describe
-  a system-wide time-zone-like offset between the software clock
-  maintained by the kernel, and the "RTC" clock that keeps time when
-  the system is shut down.
-
-  However, to reduce the odds of this offset being set by accident,
-  settimeofday can no longer be used to set the time and the offset
-  simultaneously.  If both of its two arguments are non-null, the call
-  will fail (setting errno to EINVAL).
-
-  Callers attempting to set this offset should also be prepared for
-  the call to fail and set errno to ENOSYS; this already happens on
-  the Hurd and on some Linux architectures.  The Linux kernel
-  maintainers are discussing a more principled replacement for the
-  reused API.  After a replacement becomes available, we will change
-  settimeofday to fail with ENOSYS on all platforms when its 'tzp'
-  argument is not a null pointer.
-
-  settimeofday itself is obsolescent according to POSIX.  Programs
-  that set the system time should use clock_settime and/or the adjtime
-  family of functions instead.  We may cease to make settimeofday
-  available to newly linked binaries after there is a replacement for
-  Linux's time-zone-like offset API.
-
-hwclock had two calls to settimeofday, in functions to_sys_clock and -set_=
system_clock_timezone, where both the arguments to settimeofday -were valid=
 (non-null).
-Therefore, split the call, once for timezone and once for timeval.
-
-Fixes #12756
-
-Upstream-Status: Pending
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- util-linux/hwclock.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c -index dc97d8f..c=
f346e8 100644
---- a/util-linux/hwclock.c
-+++ b/util-linux/hwclock.c
-@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname, int=
 utc)
-=20
- 	tv.tv_sec =3D read_rtc(pp_rtcname, NULL, utc);
- 	tv.tv_usec =3D 0;
--	if (settimeofday(&tv, &tz))
--		bb_simple_perror_msg_and_die("settimeofday");
-+	if (settimeofday(NULL, &tz))
-+		bb_simple_perror_msg_and_die("settimeofday: timezone");
-+	if (settimeofday(&tv, NULL))
-+		bb_simple_perror_msg_and_die("settimeofday: timeval");
- }
-
- static void from_sys_clock(const char **pp_rtcname, int utc) -@@ -283,8 +=
285,10 @@ static void set_system_clock_timezone(int utc)
- 	gettimeofday(&tv, NULL);
- 	if (!utc)
- 		tv.tv_sec +=3D tz.tz_minuteswest * 60;
--	if (settimeofday(&tv, &tz))
--		bb_simple_perror_msg_and_die("settimeofday");
-+	if (settimeofday(NULL, &tz))
-+		bb_simple_perror_msg_and_die("settimeofday: timezone");
-+	if (settimeofday(&tv, NULL))
-+		bb_simple_perror_msg_and_die("settimeofday: timeval");
- }
-
- //usage:#define hwclock_trivial_usage
---
-2.24.1
-
diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb b/meta/recipes-cor=
e/busybox/busybox_1.33.0.bb
similarity index 90%
rename from meta/recipes-core/busybox/busybox_1.32.0.bb
rename to meta/recipes-core/busybox/busybox_1.33.0.bb
index 3a669444dd..1a3f218bca 100644
--- a/meta/recipes-core/busybox/busybox_1.32.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
@@ -44,11 +44,9 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}=
.tar.bz2;name=3Dtarball \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.p=
atch \=20
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-n=
e.patch \
-           file://0001-hwclock-make-glibc-2.31-compatible.patch \
            file://rev.cfg \
            file://pgrep.cfg \
 "
 SRC_URI_append_libc-musl =3D " file://musl.cfg "
=20
-SRC_URI[tarball.md5sum] =3D "9576986f1a960da471d03b72a62f13c7"
-SRC_URI[tarball.sha256sum] =3D "c35d87f1d04b2b153d33c275c2632e40d388a88f19=
a9e71727e0bbbff51fe689"
+SRC_URI[tarball.sha256sum] =3D "d568681c91a85edc6710770cebc1e80e042ad74d30=
5b5c2e6d57a5f3de3b8fbd"
--
2.25.1

