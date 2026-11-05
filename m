Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33253.1793881491094167127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 04:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=d4myFn2w;
 spf=pass (domain: est.tech, ip: 52.101.83.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neWvwTyQ53ZqB2agqxc5WyS67m2IgqFRWQDLTxCyoAtaZovbI/Zxmdtj8EXUDsJFd6QZWp9l4aygjIABNASFcWkteyyu0J1iBoGIOyVYq9ehCbn1HYi4MZ1uCyu/Mk+s7GPYbNllBwXXrdLbtxtiYDrnhNCKhewNN3yVmRhqyLzkWJ+h4dvxdHqhjy5T/S545PWPMJpFto/6Z32lCfMAoCRRPYt4kfZLx40eongKmonNmNkaJp/j+nCxw9kpvn/fOOQ/HOKcnWikqEQtCX1IJGHZZKeXpwTRzKYoscIbLVSUJ+qS6ps5+3ygp3bOLAKHQtc2/SS2NJR1QK5y24umNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1iXrOH1jHIHJSvxMh6sTNLBUess9CNMvuRDWhSGFik=;
 b=hh7jixvCHCbAZW581lV9R2ecXyHQ3NjYZL212lpxlPr8Z+Vb1d8AEjeIWSdaMzDouj8CdcW9OF/InxN0NdDz98F+aX28Pv3Si7lLd/eGaRr0YH34w7Ty7DKAdzgKUO20Wx9c4eec/Fkeh9Md8Sr1w+ph00b9B75ot1Z41Ih1fOyKgb4vlC7WDdqCEyutZVqN4w6Rz6mkg1AqsX5Oy/7mNg9mnTSun4lrRBNVKF97IVc1ej+uXtbQhLv+IPBYrwmStiEREOQruvLfZ++nQHy3QRnJp/c8uogNGs8K28VNDpAWsE3DU3FhzFe+NAsirP0fbyBRSHRHZWv5sN+tXHhH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1iXrOH1jHIHJSvxMh6sTNLBUess9CNMvuRDWhSGFik=;
 b=d4myFn2wpNVi4IlVK0j240VNgW9eY5ututiSUAYKlULrgim4Wi6Qo2NytQkzadUdlct1524x0/HJvOoiUQuyZvBONLxDI+3CifuZwLCa45Xh1rLorZH6ulTClRos5ezkq+SutNmnCAYRi7fAmWd3GX29uvRtRORx8c0+vXyY6I12gctFWFaO7Qq4jOd5munT22HS5xFDRA3skB2ddlNYqkAqAXpiS8BRq65C3etgcmBMxg9jA7kxMe2o/wDdmOWr6NvXDwWL1TURLBAgIVItoUJIsjoFij/yQ/WVTY2dqAV+E/9EFU+L5jCiJUnaOtKsKNk7CZTgyVpPUOpnFU6v6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB2662.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:461::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 12:24:50 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:24:50 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 3/4] python3-setuptools: Upgrade 84.0.0 -> 84.2.1
Date: Thu,  5 Nov 2026 13:24:42 +0100
Message-ID: <20261105122443.53245-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105122443.53245-1-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261105122443.53245-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P189CA0011.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB2662:EE_
X-MS-Office365-Filtering-Correlation-Id: 423dd357-7000-458d-74fe-08df3b37c9c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|260925021911599003|260925022911599003|260925021311599003|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261009221227099003|261102123227099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: IO6g3mvLWF5Bs/zX+jqbBIGJZgPgvkux3VLBa15kFZj2XmZrajGKQGzlkMEsl+Dg5TWf0gF3LEd4ptCwR0aZN9HuODLwlErTkgeo9p3mQc3oKbLe5ptMkScyXKC1npARv2muSXNUItV2LWfD6bbLlY8drfwb3mn/AOa+KYdGyNyEaxdGcELNbnze92Uw6+Ystq+mPEnkqugMf77vZhnHPI1Oc4/Uh5TXoiKzd6Fkji8H5saGliHLDrch5f/f49lid0ilXXSo04pE18c4vH5idQY/Der6JX+V63HK1sgro1vKAwzE4R2CoqPyA9CLhx5C9lSFMumEux9k+cmHXtVrZQh+d4RRXWQiy2wk6eDnoDGiniO2g1haj1dAPGIFJHFCvZ8vXMlz21juqjiVHwl0y4A6dpRiiP+14etVJND3K1SMs8FXNpDilcrg10ReBjZP6QdRqhIFkCew2pbxKmh2fAjf95eV/oIWnqTWQFTJ+xpFbZO1VsGrH+ASV95ycRvEQk7esNyXHesNnXZs3RQvKXMV/3M50D/NwHi9THmGjv8AFdpIAuUKSnT0wfiI3FTzrEfPNv7P+8SoMftgBcSVPxq3jFxso4vVcAjX+RNII4V6Vp20HrH1sgFy/f0b+nnf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261009221227099003)(261102123227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5S7uQmj5G9MCz4afffUpx0Y1s21o1glByeJHHspxJPnErVWJ2tYYmc5e2lWr?=
 =?us-ascii?Q?9zO0xRhZWQwrXIrY2LE6PDR8nce/Abk03tReh+s842g4I2vuBtLgJhBgUTHT?=
 =?us-ascii?Q?u1/PznRqud2hASbw696n0A1OWGSRLP8o0j4VGhaSPvnNjRkD+jzLmt2++Qsr?=
 =?us-ascii?Q?vOeZImELiskyx803Spgqaao7SRlm/7ZopQrViqoyx2wFScKa/RERJId0lrvC?=
 =?us-ascii?Q?rMuxXjlxNPkdxKmLR8d2pQAuBlBnsuUD5c/4XAUvpnwMYD5XNOCIAUCH99ec?=
 =?us-ascii?Q?xvwm6Yurhbk2Is2lCaaBvUeAQ3TGJENtnGabroLVslZ65LCL+44LH5QTAw6E?=
 =?us-ascii?Q?Y6S/o4fE9SfTUUKFo93Bji+13hs3L3WniPVrC5BQ5bNOqzFX3hWnUo3bNBUw?=
 =?us-ascii?Q?K46GCRJhJtBx+u9F9X9rf9k3pqa+JA4WctTmsszk5wo2txFd8URvNEN8/QwP?=
 =?us-ascii?Q?gMbUY/++sYbWmIr4Xw4fb4+MXRmY2KVJEmJqTFsWOI2S2uAFU498WRWLPFNI?=
 =?us-ascii?Q?tuuaz8HdZKwAzr2CWomKegXPwwN3IFpkIDsw5kRv+P6EF6jBmbtc8JH6BsC5?=
 =?us-ascii?Q?USHiI09A1c8ce9YXJ499KtGPm49RN+OuUV136k06luyQj2nGY6zTC5m1evP1?=
 =?us-ascii?Q?1GOwlIijEc1e8iCuxv2eC9QiGvV+LFNANrqdrYAx/mF98D9LBi78LiFVphuG?=
 =?us-ascii?Q?wWg7qIvwfdoNnZM+yScT26oFByaEFHrPuI1nG+z0h2jpXib6nX3op9OyenpQ?=
 =?us-ascii?Q?iImwlmgmUjML2SpbO/vy30uvN2ZtpzKgUCozSmTHvyXHQzoGF3nSzWTCAt/5?=
 =?us-ascii?Q?b1egzYaKsjNkt10AYKLCWXafCrsNF4C/hIdrLlq7/8QKGR3MIprOhBp1UiYA?=
 =?us-ascii?Q?fqY8XQAUFF7Y3dFJ/9xs+pbBuy5dTA8T76i5CjecAHneI+OYKZzzJ42hZLGz?=
 =?us-ascii?Q?BB3ibTPUBT3UwCbE2zt/MSunyAp4EmUCVYFnCYTItt2wxxLe5i09XNzcE2zU?=
 =?us-ascii?Q?8shobrRpWU277u2HcOrtrSIWT0B0jybnf9lCRt9SAaoGhecRq2iZ7ZLCF3O4?=
 =?us-ascii?Q?/31/YBaJrEe33P7hOblosQx5mi/J+4kZmXg+DkltJMTFZV1EYsl8fjYiWVxo?=
 =?us-ascii?Q?3tG7vRe/6+tuZ6O+Z2tM7THSXvfqKtEDRZixW+4v9B20smKTHwB5aNLsCLta?=
 =?us-ascii?Q?vmYLvtgzGAlGRmwYKdzR9ZwMSltpHWMrZ6RzY5zwWYD2Em+N0JQJapDnlW4t?=
 =?us-ascii?Q?8EPkC2ivY7/mkWW6LDqLiQKkW4WPSOQ399q/k9zIAzJdT+kHNu6FZWajN4r1?=
 =?us-ascii?Q?eUXtVKZQxom53/+gQPz1Eqe/NMlCWmi5TqvrpvBVwef+RPNcslOAU/TMsKfX?=
 =?us-ascii?Q?Rrd6eyCXK260OzNFVJAN3XJwKfF9kcjAV2zusrNvZFdJoDj3kg+CXPuzFia7?=
 =?us-ascii?Q?0TpLd0soSyj/EOOQ0O37eOWRdumNF9kDsJnj4MzjSGXUr//wsnTJENHpSdqY?=
 =?us-ascii?Q?VdrYQiuK1faZ5ZPlwwGKh3px9sYTNmhQBcAtl+yMLnKIbHYcm3XWVKPh9lTh?=
 =?us-ascii?Q?p8Tdm97d95kzQ8EoYm15GGKRKUvhTx0azfukBVfPTEynsSqzBWcpp98SYzmR?=
 =?us-ascii?Q?gCccwrWV0grZPEOSw5/AB5n+Xx6h+uabu8Y2fsd2pvgrWfoKLbxTE0D49HrC?=
 =?us-ascii?Q?NWZW7EeOjL81407MgZjncPs8K+ptlQ+Krabxxf+yB52KqXnhbcU+jXsq9k/k?=
 =?us-ascii?Q?nE9M+6lt9g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 423dd357-7000-458d-74fe-08df3b37c9c3
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:24:50.5549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YNpZSa5gC/fsHg7qP/CjuWed5zby76lDsGGLEKVDKQRVd1B/jjjrq1nbik5o09DsqQWxuZlHXncehdRIBKTHwDMs6EyAhsXqXg+Lv43ZHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 12:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249547
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://setuptools.pypa.io/en/stable/history.html#v84-2-1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ils-sysconfig.py-make-it-possible-to-substite.patch | 10 +++++-----
 ...tuptools_84.0.0.bb =3D> python3-setuptools_84.2.1.bb} |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_84.0.0.bb =3D> pyt=
hon3-setuptools_84.2.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutil=
s-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/p=
ython/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-s=
ubstite.patch
index f6313fb1a9..df9d5f77c3 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysco=
nfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysco=
nfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From fe651521b9d970a84432b37d2731932a4862deb2 Mon Sep 17 00:00:00 2001
+From dfebab446e3148e3ec170e06aa57b703a655f772 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,10 +20,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
=20
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sy=
sconfig.py
-index 7ddc869..01a06af 100644
+index 4792b58..cf1fbc5 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
-@@ -134,6 +134,8 @@ def get_python_inc(plat_specific: bool =3D False, pref=
ix: str | None =3D None) -> st
+@@ -133,6 +133,8 @@ def get_python_inc(plat_specific: bool =3D False, pref=
ix: str | None =3D None) -> st
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
      default_prefix =3D BASE_EXEC_PREFIX if plat_specific else BASE_PREFIX
@@ -32,7 +32,7 @@ index 7ddc869..01a06af 100644
      resolved_prefix =3D prefix if prefix is not None else default_prefix
      # MinGW imitates posix like layout, but os.name !=3D posix
      os_name =3D "posix" if is_mingw() else os.name
-@@ -246,7 +248,13 @@ def get_python_lib(
+@@ -245,7 +247,13 @@ def get_python_lib(
 =20
      early_prefix =3D prefix
 =20
@@ -47,7 +47,7 @@ index 7ddc869..01a06af 100644
          if standard_lib:
              prefix =3D plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -261,7 +269,7 @@ def get_python_lib(
+@@ -260,7 +268,7 @@ def get_python_lib(
              # Pure Python
              libdir =3D "lib"
          implementation =3D 'pypy' if IS_PYPY else 'python'
diff --git a/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb b/me=
ta/recipes-devtools/python/python3-setuptools_84.2.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_84.2.1.bb
index 648b084a27..f2dd481835 100644
--- a/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT =3D "python3-setuptools python:setuptools"
 SRC_URI +=3D " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substi=
te.patch"
=20
-SRC_URI[sha256sum] =3D "f4695c21257f0d9b537ec2692c941d02ee143b7cc127694134=
9a546573b2ef73"
+SRC_URI[sha256sum] =3D "3ff8b3b5492a0aa66960f4419365a86b84e013070d4313e4d4=
a6894f5d64d6bc"
=20
 do_install:append() {
 	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).
