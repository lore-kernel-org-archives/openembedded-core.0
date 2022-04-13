Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2277C4707F
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.27])
 by mx.groups.io with SMTP id smtpd.web12.1367.1649871153469759688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=tedXrpCn;
 spf=pass (domain: outlook.com, ip: 40.92.74.27,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFc6Lr/9Th/nQ1Gg2Uo9i0E8vU10kPzYCxgrXYmUr1UMhhcErskhWkOWlrGWjSEgJKAuzPswXst5IRFsFGkA1gPyLLDmkjL4uxz7blYJ/MLfvluMkZsKwAp42YQOUtkDOFI28rXfEkBTZk3ctHap3GrmZKTxGPVgvz3JOO7MB+DLtty2qT4e41I7zVkeF5wuNfx9nkpAj28vlAgAMf91K85uefZk8J+HLtWjkEdVbN+byoW2k+EMFwQC1J4qGN6GuzmG6UnIzq0WBMOERxsSnHIRBu5Yp/sG6p4u+1lKHJA7GmzQoBOIDWbqejp3G2BuCL123FvkYULjHCy8bOA5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOnqbBvW4JyavAKuS2rGr5IAqEIyggUdaMdhe4d/aj8=;
 b=TP931F/1AwF/UWQaAs7vKaV5D6jr+ezRjk62KXjQxHdWG5mQRPICsgT5xN/cOijGeNxLagzDg2kwhxZLvcl/vpwGT8VibYJph/h+tNe/NN/N/RSp9NyjB+Z5oRRuciBHfH2A6WFeEKBa9ksZB2nm6AFOKSMh83WJ/D8IKgEzTws7NCq/w/sbxT13O40ixXx+B3ahY4q/YlTHTJevsmyyOXNlxdS0XaVwG0w7H1tKOjqe+dHF84DT4/92hH32nWc/809d5qhcaYiBb5pA9WKWCDveqVSb+blBl/Jx5H6XEkxQSHW6Eril+RFfYwjCLNr28TazUJSNzbj0MR7kSGdNww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOnqbBvW4JyavAKuS2rGr5IAqEIyggUdaMdhe4d/aj8=;
 b=tedXrpCnx6fg3hu/yUNQGsGk3p8hvrVtUFapI1WREeVnpDBVvGIfkWR6rGxavzWYOgUMWtAuGymLJAnNAFJmxwGmzv6/9tN7NouC8fsBJ/1yWAIz+KVp9YkG1tfVR/rqRdPkNVBhApry30ms1wDchBslh+FsFaqM4P6ee6m50Ews5SMj1K7lUStKldne/qrAUh7/zrgGbJ0gx9AxPnTM8N40IXpVuqFhk+50kTbUVVG8tO5idz8OvmXnCLp28Q6whRnUXHBsL8iAn99nEFcLS/90SbyXUm2Jr+nMjKdF8hAfzQivwA5grnoYpyz5JPedIHv9ZlNSA6fNVQjKHCqmFA==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by AM6PR09MB3027.eurprd09.prod.outlook.com (2603:10a6:20b:c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 17:32:30 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Wed, 13 Apr
 2022 17:32:30 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] cmake: add missing licenses
Date: Wed, 13 Apr 2022 19:32:20 +0200
Message-ID: 
 <HE1PR0902MB18010FCEB50D44AB16AEFF1BA8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [wpVHnYXqgyp93K4T1Spf9vERX2PxyZrUbraWcqyxTR2CRYc+7hNR9Ka81dYUQvpR]
X-ClientProxiedBy: AM6PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::30) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220413173220.2023684-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b5bc06e-ba40-448c-c744-08da1d739638
X-MS-Exchange-SLBlob-MailProps: 
	DJLbvgWm8MaFHSt9slKpSUX5K7i3YHSGgpunIIJ4Nf7z+suyPfxZjIrrls8j8b3vmWDza/v8/t1wGc8e4g18rcHDGlulG8QdKagI5+Oz+/MvFpltaTQeE4dwmVjaKA5NHkOgUXxZgTRHP+XsDaIkgdmyWUUnfXIQa69z4d+3aCWMq0BmGBZuQjsEcdc3370ykE7TvtMbaFJevkGQ1x81a8dKwt/rNouuFDsNGWYIkY0ntQN9ZrSDlu4JHct7YZ1ck4C+aaXwVZJCHFiRaMwesYtwEDBcyp9nGAA5+LQae7T++spDFrkP1ILptiAkDSKuOP8bMbmH8AC5MRGlBf/kxoYjKk6G3b+aJv9VJ0f+eKh2BanSrvOqiFeHOLyP3vMMIlJTY5HG/K2VnXLevnfShrmf+6aqWe3TpD2vaN+3EGgIrRLFyHJ26j6mYQ5eTNqZP5OiJYSUKd6XSgFrVJoDL63KtNSj3YQyoyqT8ChEhXhnh4H450T8FjCQS27WUcXM4ixWDKmB6FUE884U236EO2sIk5vjkh8g+aOlD0pTrJQe4wKr1EJ6+BNkV8H0tziefbVXoqE4Sc6hN+EwOOIZGi15bCq881yGRAL95GMWruL6Raz2HxN1fpJUbBFZR6VVm+NApzLj3kc1l/60Nl1CZPBXSUHi7YmJ7xSL7BTt4kqEcqMkH1fMpCCg6Fovyd4orSdNYTZ5LKUwAzrFgewsuQ==
X-MS-TrafficTypeDiagnostic: AM6PR09MB3027:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ICt3keLwRikYSUxVPdEvgVh3WboeWRrSf7U3RbbNol4GPE1qnxz5nqhYTN3UdBAKaasY9CUuPTIcJBV60NLhtbrmGYl/DbW/lzo1sxZlnVlBOm+L1oLVn5E0WmodCs+iMiDvC52ZC+T3J+MLvR7ZnKJNVK2NUf1zeovLIOFGlIHdVLkDdDsJs0jhWmcc3xj/u5Y7GU11LvNlcDpxTcOtvkDExLuUpzSDiQv50OkyqL5QWO9ZIVE/47VEpDzQTEci3Pyitxv3wqGJSJRPu2PjhcqjriTMRSS/mkcwQq6QuiOg/1OaBRShNwXt7fmZF+af4YSK9CwQ/X8/Bu20tw2z7gPfHZvmk97scECrbqkAesLBvEZ5WLN2oGMfV4V2c4UlMtiElB/He4qjJO6u9+4UVsFvDT+GF571Arr1EIFXfpfHfty7cyVMxYYMYzexTz3IWk/f1YlZxUwVYDBHIa2/AYVD5W/grzfjQJVchUBv1jlLJVudhGSfoCbNgBjtV7ktcLxuwlMuh2A1FhDr/ttuIihQZUIj5pFQv0JcUogaSaAFZq3VGpTZUnX/x96NY0ghIST2vOz8xVHc7GPnJHreOA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oVBkSbkup5jXJYwAeylGySpaSxfC8CEu8E5ysgREf6OtFVjcF2DRU92QQaDK?=
 =?us-ascii?Q?0j7pPz0nfwcg4Ux5CRueG92kO3Jc9L2jopBGa7NcV1XTpUQ5QUo3DCIfcKoS?=
 =?us-ascii?Q?DHj0eF4gsx7L+HTdN5VWHXq8QGdhpyDCkQLUJGQNnkRxexbO7G25xV5B9Xv1?=
 =?us-ascii?Q?n6xPQNM7v8lOtRDKBFkI1HBzOtxidyo2eabMqkQ8TGosLiXLYNlTASKLgoC5?=
 =?us-ascii?Q?wLELx4Rv+Zx8+vUu1nSWMjI0TDDbk8pZn1kaHrYVQ5bd5S2yGwYZTQLjeCRz?=
 =?us-ascii?Q?qd1hGqNxRkaSyN90IXUPOMxPKNok7J8pJxUYYEBz6+sv4h3wGILTcGJZnj4v?=
 =?us-ascii?Q?TgsxA0ys7ipLBALecjNKjsDXeD2aZoDM4qA88ii6ftEfFptU6ZiYqBxWABOd?=
 =?us-ascii?Q?yPtgzCvO/eYGTt0JNZ7+j9c8fJZSrIGosu7nvkB3XYTxT6cKzWDgNVHuUTif?=
 =?us-ascii?Q?JxOV1XX6X0kkRtGymzGPT+BpjWqSzmldulv3UlYU50P/Lu/Uqp7BMXvn1wUF?=
 =?us-ascii?Q?sw1x6YYcHInNZDNl9UTQJKXf2d9Adyz1HrBEhr2CS+leKKh0F4kUBsRC3w9r?=
 =?us-ascii?Q?Exb0QefEx2d7vyNooRS8jXsXFDJsz22oUA8dL6pXj5o4FZVGZKd9uAeo/bt6?=
 =?us-ascii?Q?TflFa5RCRQw3JK74hak8cFxd7uzLxIWnGZDiQYuMOfw7dYas8RExpiPFSba0?=
 =?us-ascii?Q?LGls/73oU3u75oH7cs8Zr+U/oiQUXg677q2VgWILxfaVx6X5pbK/tqwPwedo?=
 =?us-ascii?Q?LKEhmv/qKk0kTuZ/xIPv2DSAGrfcnsvSDutorQlhQ5EivtYqJnQWZ9Xk7fN/?=
 =?us-ascii?Q?MnTl3jka8Yoo0H0FqhPcuxM3bT/SJtCNCyqIkZeR5iBs4YmH94CTf2MjQqQk?=
 =?us-ascii?Q?WLTZFexkPKImn9v2nLq3nslqlMLWTYdDFXIwMgEXpFAvr0c4lhTLHipn49hq?=
 =?us-ascii?Q?s9AebMaBF7AI/9yen0ADKSkQ6paeRfhmS6l0+1MvNKqmNKptW8QiW1Um2SXb?=
 =?us-ascii?Q?9QFIHhcOURVJKveAPGrR0QRiUlmZ5G2pv1BUQrewoVYv0LQnUTYaxwGMGxlM?=
 =?us-ascii?Q?v6VrHrfaxDWuoFWmUJlNj/x/zp24JOrSwECLrUGCB6V7i8sMutAZTuGoWkvP?=
 =?us-ascii?Q?QTczQdh9wWbg1AiQ7VJ/N7FiiATxne91yRbO8haJ4pvmvXtveuKFvgWApaIa?=
 =?us-ascii?Q?gLMfgBZP6H3wV6s5fBtJZ5lC7lJO4pK7GQKUmcEWXTQuS33E1u1UYz9qLLYL?=
 =?us-ascii?Q?exKH7KSzD6+XO+UTv10uwUEykE4rWqTpyG0CfCbyzN3UPIt7C8fkgRh6dOyR?=
 =?us-ascii?Q?cZwJun+piyEO4hmxORVR4SnQYLMF4EwqpbMcscjX4xhirWBioHlwGaSoK6pD?=
 =?us-ascii?Q?c/yniYLmW405cqTjrT1upmn+fhbfayOZMCuWbf9GN1i0kcs4DDkgPW+jQjJx?=
 =?us-ascii?Q?Ac4EJX7pTJZZk3ybhrBykeIjHTOUNN8S3o95UnW114Ij1FYBp0eMdXwoxoyG?=
 =?us-ascii?Q?Dhf3HnX7poepDKU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3b5bc06e-ba40-448c-c744-08da1d739638
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 17:32:30.8219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB3027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164348

in target and native variant a different set of vendored libraries
is pulled from the cmake sources.
Add those licenses and there texts

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.22.3.bb | 8 ++++++++
 meta/recipes-devtools/cmake/cmake_3.22.3.bb        | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb b/meta/reci=
pes-devtools/cmake/cmake-native_3.22.3.bb
index 8293fe5e56..ee1f7761c4 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
@@ -9,6 +9,14 @@ SRC_URI +=3D "file://OEToolchainConfig.cmake \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-interna=
l-.patch \
             "
=20
+LICENSE:append =3D " & BSD-1-Clause & MIT & BSD-2-Clause"
+LIC_FILES_CHKSUM:append =3D " \
+    file://Utilities/cmjsoncpp/LICENSE;md5=3Dfa2a23dd1dc6c139f35105379d76d=
f2b \
+    file://Utilities/cmlibarchive/COPYING;md5=3Dd499814247adaee08d88080841=
cb5665 \
+    file://Utilities/cmexpat/COPYING;md5=3D9e2ce3b3c4c0f2670883a23bbd7c37a=
9 \
+    file://Utilities/cmlibrhash/COPYING;md5=3Da8c2a557a5c53b1c12cddbee98c0=
99af \
+    file://Utilities/cmlibuv/LICENSE;md5=3Da68902a430e32200263d182d44924d4=
7 \
+"
=20
 B =3D "${WORKDIR}/build"
 do_configure[cleandirs] =3D "${B}"
diff --git a/meta/recipes-devtools/cmake/cmake_3.22.3.bb b/meta/recipes-dev=
tools/cmake/cmake_3.22.3.bb
index e111dd3c5a..752c37ba7d 100644
--- a/meta/recipes-devtools/cmake/cmake_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.22.3.bb
@@ -12,6 +12,13 @@ SRC_URI:append:class-nativesdk =3D " \
     file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch=
 \
 "
=20
+LICENSE:append =3D " & BSD-1-Clause & MIT"
+LIC_FILES_CHKSUM:append =3D " \
+    file://Utilities/cmjsoncpp/LICENSE;md5=3Dfa2a23dd1dc6c139f35105379d76d=
f2b \
+    file://Utilities/cmlibrhash/COPYING;md5=3Da8c2a557a5c53b1c12cddbee98c0=
99af \
+    file://Utilities/cmlibuv/LICENSE;md5=3Da68902a430e32200263d182d44924d4=
7 \
+"
+
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
     prefix=3Dd.getVar("prefix")
--=20
2.25.1


