Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25270.1794827826394116264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=em/v2S4n;
 spf=pass (domain: est.tech, ip: 52.101.83.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4NdgZ8EL/LP87F0D8qu9gnJ9RN9nuTxQKlNraWux18BaqMkkLSN48dwCT0t/fCx9HA361aLClnJ+C2oogFHsj4DUcu+Mwl1WaQDciy0HL5uQZwvkKJEpJ63mJU7ug7LXi43li8ZzQUZKBi0Xc/keo+t+O0iRnI3UeN4Yg+LRe1jyh82GA1MjaIB9mc8mz/aKYkuIIFc3hcZFOErwcaiHz1DjjeK7YQC/6Ilmveqs359dQdbTpExb3NilWNjB0QBn7vNKN7ji1cMH68A8uRmtKhinQKhpT9y9VK3s4xcfT8hRKG7imvhfyggECAP7oUwglI7jGdcaaPzqrovEr13Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/GLDYl6CLwqff4LRHHGwF49pDwhZ42BFq8JgjPUmME=;
 b=p1sc3QeZp8RrFzn7OX0SPT3kMpagmuhSw1ljRiTVYuiavQHxUkaMJrnEwtUSOXhV5MLaHHvfO6tO/USkc94zrkD5FtE3E6SecncEHgv5Aq8KscKDbNwK6HNohRqarjBOdbppK9bym94cxgM7u3PQ1ZULUnxMMSXCelcsAYVva5P/p60o7HCuAfzs8Maup6xNejEWk35WMqijkggdEQQ6amLEzsA5FKhbBfxvcGbRy9DxeSKmd+NxlOLTA5qs2CDPntPNkpzyu+Rm0tbWLBxkYPaiGvaeX3DMBTXgC5IjEPjieZqFwvN156+1Eo0xTZH662RLhf24VgVniisQmQU/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/GLDYl6CLwqff4LRHHGwF49pDwhZ42BFq8JgjPUmME=;
 b=em/v2S4n5tTHkVLKUTQO7jt1E3SrFGK5W/hqygkLYr2qpS4RRMVbQG2YArh+uryWaNh62etYwFkUcK7uJmqVRN7zUKOqsgfNn0Vz4RxbTb6H5lxQtyAO9D7kMwPKp66und13Sg1llGJ7Pdhe/qIXr8ny26I/if3t0gGcFdTBCX/MUtDL5iLl3ycYL/hUWlkC2w8EDnlwHL79fPqKqb+D7SIsP3pPTELZVRfgEgtRaIncUZtQ/qcD7nWCC+tLld7ax++gDub1cxv6t5H6ab2Zh+tX9UQZv+KfRVy8SJwBbyxX2djE296zsvDlI27LVuXBuReUbqKmD7MeL5uoJaeGsw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB9P189MB1980.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:17:02 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] libffi: upgrade 3.8.0 -> 3.8.1
Date: Mon, 16 Nov 2026 12:16:49 +0100
Message-ID: <20261116111658.7745-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
References: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0329.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB9P189MB1980:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ac98ef-b617-4123-4167-08df43d323ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|261009223027099003|11063799006|260925022911599003|260925021911599003|260925021311599003|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: vLUbifSkk/v46htJNpYFIthd5w8UvSpUhqXWm6QEZ+JV3oKjg4r9en3OkCxwhgEvY8FQfK7Ql2UimaF6vjFMKV0H9N3YkygRSRvHalbZMOQm0RkjijyUMpaYR9G/z6QnPnxsZtsMW1sfsjV0WIHKqA6M0+vrXao9oq3w5s/sMN8xqfV12wifozxlgSY3JcI0puPsoItGIMKi80krJZRH31887zm7uu0MCRCDtiEvvmq61Djiqr3D78ogJdHdr/xEZYczQqVylRkO8WEySwIFJeJeTLOdXuOVhh/Gr03CHf3hjm9i1ssHcMdxNMXqbbUYApKtcR3tXHyfd7Mtfx8fy8S+aGM6mDaBZttKU/9Ao3+Vum5tcVSfExJk4hOeNpSGckcOW0VsTdV5TR9IwT2EocmCI6jPOtRD+K9cTc4XMBwiemY5FLSPDR5RNAmqjgCIE0C7ZJc0fnthz9dusvmaHpMP18gpqVCzvO3C1/zaSgxa/nehh0xPEtfu7bIvzdXDVuaOtIrJwyEzZ8nxfQ2WpVQcf5IpeN1MN0+IH7dZWu1i7TUtGj8PIo7z+EIzDDJOU5qKvzfIQlHyJfozUEfPps7ENXjQD2l4CQpp5pOGIFiyihxVpts5sTQf+p7WZsKI9wjpMVuh3o5yN26YqaERIicJazc+edUsw3sZxxUcFCg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5yHEw3ngJFgl2XIs2MQxebK4ORNwpNRRIAHUfPJJ36djTyzvVmr2b/GBg8Qs?=
 =?us-ascii?Q?gufaZkE/9zXEVmVxyw8FUBIbsRdVZH+IT+s07DJGPC9j+qEFW5Heq7L2y2eP?=
 =?us-ascii?Q?4V+uiI49p0kBELLisXqFix0NCk0ZY4lCyT/zlzL77Qg+Idd/P9Rzu1h3PgK6?=
 =?us-ascii?Q?MyNdZxZLSESgCCGsYzBF94YsBFVMumdBa1TVEgUxvcoHzr/hMKNWmV6UncCs?=
 =?us-ascii?Q?3GsrMTyQ8xkGHWrng0Ix267tJ/js9QKOD1f1NweQGFfk6tDJZYMlBXbVdF9v?=
 =?us-ascii?Q?4TaXTl8pQDHSQGmjvg8e7ia42AbyLpMoGVXWIa6o6BEeXKK98XrsrfWH3FFe?=
 =?us-ascii?Q?NFvsqqQigpoyFEekZX9YYolnmRvB6zFMlRYO/ub9qW0yefdfEf6sJGS1+zWN?=
 =?us-ascii?Q?fibEQWFS8ygIN7eEvvDprHvJa27m/nkbR2c5R38y4qiCfJn7e4WIpky9cjxU?=
 =?us-ascii?Q?lDJJp0XpQgV6HA9sTHCNLoLAMxSGSft6JzthphKWShExkoblIao78YSsBmu8?=
 =?us-ascii?Q?OioxvcIshSUHintMhjQndA61/D6ItlwPRt6rn0EPQ/neSqxxLv0jTRABV7af?=
 =?us-ascii?Q?sdSC+bIOUBNV+1dqTqQhUWckpRjuEQvG7zzEbGXdQ0x2efel0LmX+T+qBhDi?=
 =?us-ascii?Q?ojiXtJORt/Xl+BKE3Wt1GDNDnXEpcDR1cC0jQvLhOUTQtZu6o0zcmQbQrxAO?=
 =?us-ascii?Q?EAt1Wh5VFu8cMbq56HjOZrArrSDj3H3mHm+qgzEK0iK1fPSuboUg198yuUaC?=
 =?us-ascii?Q?X3p1uPoYy1Eoc+zGvCMfFdOfX+0q+mURsOUwoE54nNwH5EEIPYDaKrmJVnAu?=
 =?us-ascii?Q?zkJsLepCgaWN7Gj6R/dHdfhOrRJ3INNUqFZyvB6Q9xExZ4c5MHq96s/cjN/T?=
 =?us-ascii?Q?Di4XBepzf/ELxh8vvaFGQPXGmKGLfZVFVJVXFw14JfP4rgPtrdE8R4oW2Qc/?=
 =?us-ascii?Q?k8TPGT2J4JKV/YDnyHTZx+HyeGA/Ug5FotU16YL5DbBQER33dSdazIBtFDj2?=
 =?us-ascii?Q?pPqCACDKNcvsQAHt0FhFdux93FSHQZJDoM50SKfSPNjmYBL4g4QcPEYTMSZ9?=
 =?us-ascii?Q?xeVlpSjmbqSL4Yp5Dh684jzfn73LmTZQ4K3yJfFSDdnGqBwdX2Rk/BbF0xfI?=
 =?us-ascii?Q?FWwKUtFi/lAO63+u/MMnHZyHhP4XwSd8nGVT0WgTHZjifmBBrmNFmQxg7tCi?=
 =?us-ascii?Q?Igmd1qrFYVTTwktZ4YCKB4oRZuQ8sCl7h1IFW7AqjzLXza2ZYTasv59oKagx?=
 =?us-ascii?Q?wdhsE9toMHrlYa2BDmbP+U/jC+bFdv2HmVCWPJNeZRNycNnp1aYp0hMknMD9?=
 =?us-ascii?Q?uTgjhNRmEsroM7WnTJFfzDI3TIcihAG4wVrT1Rg1mIVPQdOHGIoF00JjJabM?=
 =?us-ascii?Q?AN9H0xscjaLleYmUg2Rh8ghkN0P8p0ltqe8Gw9y+nev0ocFksqxglYsuWqqd?=
 =?us-ascii?Q?xhdG2fD6UoccwW31Zr6hv79CfEFG+WEsa7jVEq9HUTDX45nAr1Dyelc8yiLR?=
 =?us-ascii?Q?/i3ViW/ckEYHjAa3AXGrJD0TRLnJGkZ0HaKesNn3hWSYIhUF1sUClsDo/GvF?=
 =?us-ascii?Q?kZTovfL6RTPlhIPolIpnKhxJGP16JlX4xoDSQQaPSxABbsvsvEexD3OjMS90?=
 =?us-ascii?Q?iy+JMA9ikQnnvZUnzpTqMwtei4bt5GTZuTOfu34+sEgq4nyFezyk6Rxj1Mwx?=
 =?us-ascii?Q?tMX7lAdLqIasUWVhku6UvvrhEGOKEWy4LlilxuHcYTu8HUwsofM5+sit6j8U?=
 =?us-ascii?Q?x3bChDlXvg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ac98ef-b617-4123-4167-08df43d323ab
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:02.7643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V75DtzpWZ6wdor2bFRT/qQUmbfig9WeI0/APFehmiIR4rNKG6NvHcWTZmpjBNsOK32ne6Tws3EtPykgPLNVxNkYG0vPT23MCjbbXcW0dN3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250329
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://github.com/libffi/libffi/releases/tag/v3.8.1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-support/libffi/libffi/not-win32.patch          | 6 +++---
 .../libffi/{libffi_3.8.0.bb =3D> libffi_3.8.1.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.8.0.bb =3D> libffi_3.8.1.bb} =
(94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/reci=
pes-support/libffi/libffi/not-win32.patch
index 8808f502fb..e1a6b187f5 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 4f0da02754f86ec1aa38b2207872386b19605ec1 Mon Sep 17 00:00:00 2001
+From 948a108c78f9030d1f1ea87af62ccd257da4b82b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,10 +20,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 826b453..54a41d8 100644
+index 63731dd..cd78322 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -429,7 +429,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -449,7 +449,7 @@ done
 =20
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.8.0.bb b/meta/recipes-sup=
port/libffi/libffi_3.8.1.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.8.0.bb
rename to meta/recipes-support/libffi/libffi_3.8.1.bb
index 583b143157..318cc7ef46 100644
--- a/meta/recipes-support/libffi/libffi_3.8.0.bb
+++ b/meta/recipes-support/libffi/libffi_3.8.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5e9a8df556846b=
b3d1edec0d968a2311"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] =3D "7da3e2d9a171eb0a038f592ecad3ff2bb2550f3496d87b3b29=
ad0cf4430c0db4"
+SRC_URI[sha256sum] =3D "81e879c094cc5ec3186c48510c6385ac6b3e866192e8bc71a3=
5245703757ee40"
=20
 EXTRA_OECONF =3D "--disable-builddir"
 EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
