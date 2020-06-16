Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.104])
 by mx.groups.io with SMTP id smtpd.web12.12259.1592318803281548807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 07:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@qt.io header.s=selector2 header.b=MPjIGL+i;
 spf=pass (domain: qt.io, ip: 40.107.4.104, mailfrom: samuli.piippo@qt.io)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHq2WMVFd8jIm524TeGgPMiBWXbbhirWs1JOGeFk+hLVGcYovPwdKcmy8/6Iaq5W2xPf3vvK0ud0WjNnj8cKbNb+iQxO/u9u1wkzIemWl//hKAAyxPHf9myv4vuVdXmwalQl1pvhggJISfekh6UY828MDjWQ+AGqjWvJlZhSREJEGoT2mP6HNHvxaUoTc+Fq2cUzkjHW25CzD393G68jF1kl6JZS/NhzF4VyQGPeqaXjGLIohj6u5aye9984ohUHtEBMcez/2I5UJgAFiwYUAu7E3VGTD7ofKYmY0ryrJiricFi/N5u5KG046qHWoBYZAk5Dbn12oTIu5toyG9JqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0FuFphhPZpPGYzBFL8L39pzIKsQfjaX62VPcuhMMB8=;
 b=K6pWdrz/+HKw50fshZdnXRdGUm9jNfez+9UundJEgK0v70Uk3+MIGAvstdB4DcCONSbXGGFNEvw+r65/q8aHykHmlK8hgtgY5kVGH9YLnKYb15Hn4xrWx9Tv8u3wQXmeMO3U/Rumk8jt9ZXM6WUDI5bie503Mfdri6DgTWE9a8nFzpIDrjN87g4z3k1j3m/vlnK7pGdIAJUsHTw2uZZN0sSKZwTEi4FpKOOkWJPwSJSNgjMqADmkMeWBXPZr3nFPgPZGmUJw0EFKcgPcb2pRNwd1BN9IKTHW4L+HWxshSqM5aRujSzIFl5XwqFrQlG00ncPQjME3ri/QhMI2YSyloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qt.io; dmarc=pass action=none header.from=qt.io; dkim=pass
 header.d=qt.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qt.io; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0FuFphhPZpPGYzBFL8L39pzIKsQfjaX62VPcuhMMB8=;
 b=MPjIGL+i650EiV8fUrpPxBHUH5mtzW8Op2i5yT0bnRBKDDRD+n4hHTTIac1CMenA7eCeEQPxwCif5Crh7WZ9IyTlghU8/Ff2a5TDUtDq35r+VvBJgMXWxjHd8yCd42TFnKiqWdGBkgSIJd2GjnltfG2jcqSDCjxTmweGBGkLTtM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=qt.io;
Received: from DB3PR0202MB3449.eurprd02.prod.outlook.com (2603:10a6:8:d::29)
 by DB3PR0202MB3531.eurprd02.prod.outlook.com (2603:10a6:8:9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Tue, 16 Jun
 2020 14:46:41 +0000
Received: from DB3PR0202MB3449.eurprd02.prod.outlook.com
 ([fe80::39bb:b87c:c0db:568a]) by DB3PR0202MB3449.eurprd02.prod.outlook.com
 ([fe80::39bb:b87c:c0db:568a%6]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 14:46:41 +0000
From: "Samuli Piippo" <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: use relative paths in the perl wrapper
Date: Tue, 16 Jun 2020 17:46:32 +0300
Message-ID: <20200616144632.172676-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HE1PR0701CA0085.eurprd07.prod.outlook.com
 (2603:10a6:3:64::29) To DB3PR0202MB3449.eurprd02.prod.outlook.com
 (2603:10a6:8:d::29)
Return-Path: samuli.piippo@qt.io
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from munCarbon.lan (84.250.25.20) by HE1PR0701CA0085.eurprd07.prod.outlook.com (2603:10a6:3:64::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.7 via Frontend Transport; Tue, 16 Jun 2020 14:46:40 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [84.250.25.20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eb75ad4-27e5-4db2-0d20-08d81204148a
X-MS-TrafficTypeDiagnostic: DB3PR0202MB3531:
X-Microsoft-Antispam-PRVS: 
	<DB3PR0202MB353192BB831E04DE766D1A13E99D0@DB3PR0202MB3531.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 04362AC73B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YF8DHqaMX25qTd5G+ufdSf8iluzQqjckGqiHnBIGgRzoot2Mjs6yTfjH9RYNDx0cVXYo/HQmgkxdU7GbkHZChDQwmOqZLOShojUI85dXEpeWTs13ZYUoYAqsCVF28/QVQjmNFCVjteSYlUkbJEepKuy0PANLwgbYdKvT164HIvMXpWBaZulUrXo3iu/ZWD61BRPks2/FS2qKd9QO4k0mPOsv49SboAA51esYGOeSEW2ppeVnpiKPJPXnd4Kya5NLiqFncP/7QP3AWnr8HjuSdRNlPzuFmltGSBHIxaduMS1PKiVQ1q2dSDPJDQRnnWNwyNMhPfb02UsQf3ryq7O3bw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0202MB3449.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39850400004)(366004)(346002)(136003)(376002)(6506007)(52116002)(8886007)(956004)(26005)(316002)(16526019)(186003)(8936002)(2906002)(2616005)(83380400001)(8676002)(478600001)(6666004)(6916009)(6512007)(6486002)(36756003)(86362001)(44832011)(66946007)(66476007)(5660300002)(1076003)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	WX0neI7rl1Qi/DWoQvWbxn2JypBAmri0yFM6yX26s9Pxj4ewpTqiNwk1+nxQwkSzntX/brIfLGSG9ARG+7I5k4m8xpqNeJh4suuXmA+qVL9GKGauJMPgMqAiEJvV971pPA0VlJ4j9HTUrNeFTzrNx9WRnDaxCEdaS2vryWmyG6aALm4WhWq4xgwXdxkjVtR7tEl9DMiAzpGCp8osJzEdyPRVFrbSYLTSm/1YRMv2tRzwAaL1/8tqLZCG9NeZ1klRtxs5Gd6tXvBzA2tTVBpn+k/W2C429/u9gOEFXCwngCcmZddNJEkms9OkCTiSh62+cGiGorWhu2VduUc1Gar9VmusiqUNA47KUDP425fvxZEZkJwJ5k5ALxQZK/CrA+NXju9zvNu/ABYIJMfXkwHyd+9ZdcFi6uwK4jsqpfgYllvW9dl5dlUpsno2rlXDHiSMYHlNnuIl61QGpRBoHYYplK84/3B3f/QQXpTNenWrNBU=
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb75ad4-27e5-4db2-0d20-08d81204148a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2020 14:46:40.8924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1ht0jf6/zHDzJSSK2XjtmwLuPU/RgR57TM127PX07pufzjCvhbHOwlANHQw2XSIev+Xa+lTY6ukoHqXZNRibg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3531
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use SDKPATHNATIVE so that the perl wrapper for the nativesdk can be created
using relative paths and without dependency to the environment variables.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/perl/perl_5.30.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.2.bb b/meta/recipes-devto=
ols/perl/perl_5.30.2.bb
index 26138ea9e5..7158102ca7 100644
--- a/meta/recipes-devtools/perl/perl_5.30.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.2.bb
@@ -156,7 +156,7 @@ do_install_append_class-nativesdk() {
     ln -s Config_heavy.pl ${D}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/C=
onfig_heavy-target.pl
=20
     create_wrapper ${D}${bindir}/perl \
-        PERL5LIB=3D'$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/p=
erl5/site_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl5/vendo=
r_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl5/${PV}'
+        PERL5LIB=3D'$PERL5LIB:${SDKPATHNATIVE}/${libdir_nativesdk}/perl5/s=
ite_perl/${PV}:${SDKPATHNATIVE}/${libdir_nativesdk}/perl5/vendor_perl/${PV}=
:${SDKPATHNATIVE}/${libdir_nativesdk}/perl5/${PV}'
 }
=20
 do_install_append_class-native () {
--=20
2.25.1

