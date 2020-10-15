Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.41])
 by mx.groups.io with SMTP id smtpd.web12.6596.1602743383626567798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 23:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Oad/fUGS;
 spf=pass (domain: windriver.com, ip: 40.107.76.41, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGRbsuRbZPsMmokuaNBTHc/g91WOotZhhhfOsByKWwN4aH81vpetA+z+ZyLTLmClx7rtCD/PoTr7B4GHyHvG4wWOVi2W60UABVqzlrt1x9F3zXYJQuM6hpJfB+NMqml2tV9PU2yokn4xmr3c324A8wxZKf15f4UzIIo81hs+LS55FUr+cTvywrDpLMmrfrHyTc2cd9YBXQ6e7wOGKVrOjf9x03eYqe6cr7Cf5g/tPNwPGJwoLCpvQwIiYC/TcsXDCmCKt//HOFmYfyfrUE0KtRZ9avLua+rkvTOxsglO7/61SDliTiVebvLU5kziZ898RdUtzNxFd+h7cvTfC7A4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xRQDum9CQjdxscRk3ii7wI8b/zzrvrUuuUQ4rlAuik=;
 b=ilpzZttc1lsIENIHjeknTGw64ytme0/3/6r1qY5basLoOJOjZTeahGBRH7AZ2PUl2uWMCpj1yGLa0j2kWkzwWsp5+jmS2BuZ6z8x6LrVZbB0RbsoJR23wIOqfn0gy1Dh8IodX6moPxwWQmhix1WI93oq7q9Vx1yx/Ba0z/2PjXD1+2Z/lvtFA8o/N348i84fSd/gI2zjzRWY8o4SI7w18YhirvdOgpmNQCsC/UtzNLzqIY9/vFHLxy2Be6KOqmLqWWseeYh2aC9169MIXn17qXrZ+W231REMOt8X/i7kIk1YvJgC6eXs3zKoJqsCtvRJyWDCYgDr79TwQ6TGwr9hiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xRQDum9CQjdxscRk3ii7wI8b/zzrvrUuuUQ4rlAuik=;
 b=Oad/fUGS0BxXpEsS3WYZ9AgpUVRB0IQLvaUqUuJyhyLKtlrh55DVPL0nwp+PMgH7umHC+/N+7IujAaz1OYs4DWxNwgv39eF2CyzMGVVZqgsFRI31C/5u/OR4Q57g4VgkZCzGrVvq6Zm9PnhGQ0eN/YDRrnIf9bJjmLqhNTQouEQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB2029.namprd11.prod.outlook.com (2603:10b6:300:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 06:29:42 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3455.030; Thu, 15 Oct 2020
 06:29:42 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dhcpcd: add PACKAGECONFIG for ntp/chrony/ypbind hooks
Date: Thu, 15 Oct 2020 14:29:29 +0800
Message-Id: <20201015062929.4318-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BYAPR06CA0058.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BYAPR06CA0058.namprd06.prod.outlook.com (2603:10b6:a03:14b::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend Transport; Thu, 15 Oct 2020 06:29:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3367f77-618d-4167-bb33-08d870d3b31a
X-MS-TrafficTypeDiagnostic: MWHPR11MB2029:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2029998796B51B3116845DFDF9020@MWHPR11MB2029.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9aeMN5Rt5b7ML/IkY+AxPnABe7G0vhuck8J04/+W5sxyDLj/6i26+IPka9oli1882qu9Ncu+7lVfL1RkvL6QoP6HND0Q7KhR3hKwldokkGViXtcOOonIiLxx3rWUKSu6wvdmcl48e4HTJEjpGVVDH3fNdHkuPU+Lfa76sNAWR0DVx1grEQGfDbkD9MtDCrJJCndG/ShMHOqyOqMZ32pdcI0A2iZozaUwZryqz3dixF7Fvb0izR9RALF/YET1urBdqv9MeAugcOORp+0j/5IKcov/iUbRDAMyYBdM22UmvkYhMJW98CrAhbhgm45LzaPmSE/qLTAPAuDWO404s/aJfXx8bcCDd0CBSLZO6+Y9yCRxcKgp2hqTYOl+8UWQNpsQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(5660300002)(1076003)(52116002)(6666004)(8936002)(44832011)(6486002)(8676002)(6512007)(36756003)(316002)(478600001)(2906002)(2616005)(956004)(26005)(186003)(6506007)(16526019)(66556008)(86362001)(66946007)(66476007)(34490700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CqVY0/hcAluOruDpiQ6ftiznBQ391qO1rxWR3HPpEpqG8iewYVV9lUg1EqnkYx9s7jCC1PxjVpzyHckP9S14ToBTxb6FWGTgtf6oNpg+bf+iTEEwwvfMckc0VUXZZCRHq29bgzYzScbr+Tx/e+2iVRSoOB70xGqsDvdmxN/rbe8hXnJ7/Cq4iOaizSsyoJ39lxCvUe+f30shIxzKZyfU7FrEeBAqH08tEP3AQcgsAPwlyC8nLXuVTyHpVq9welD/cBBZDdGBRg/4MEHr3gMbr3D9HxZ7ZGtVN8ekEKaQRmJ6kN4nS655X60aVXOvvo5ULqLe4Hf5L1vJQHqvV5sSw8HsvKO/OVKrza4sZD3nFmTtjnwIoGBuIHV5fktVTSbHMWZDIjSF2KPoiMczyn65B/0GhPTxwkDKDVHumO34KvTukuXXdqNuDUUYtTuCRHLw8IXjYli6AgM7QqAGI0+ZWSqqdhTD/8Xr8toUt2xiO0irKafSIjizl2VQLC9+xAtOdMB30q0UIQjsi1k3DfSWbcu1GW42RWLJWZMbNfUT3KxDJhb+ncLCwqIiV3dqGxVHqtlOQ1S67R+SwXMQ1BV83TFsnSC6aMmnpccqNFH9u0DbfrZLhPIi9csv/5ZFPIZw9P9lvfAJQLgdgawjTbHfww==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3367f77-618d-4167-bb33-08d870d3b31a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 06:29:42.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8+G3WdSTVy09WjTZRaWsZhHkZpP4OF9acLiaidwAQyG8tFkrFxazi9kXXlap8OuOeIT9RfNxZ1+VXcspqdnqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2029
Content-Type: text/plain

By default, the dhcpcd will search ntp/chrony/ypbind in host path when
configuring and install the hooks once it find them. Add PACKAGECONFIG
for these hooks to avoid the host contamination.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
index 4344841b54..13467189b4 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
@@ -27,10 +27,18 @@ PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
+# ntp conflicts with chrony
+PACKAGECONFIG[ntp] = "--with-hook=ntp, , ,ntp"
+PACKAGECONFIG[chrony] = "--with-hook=ntp, , ,chrony"
+PACKAGECONFIG[ypbind] = "--with-eghook=yp, , ,ypbind-mt"
 
 EXTRA_OECONF = "--enable-ipv4 \
                 --dbdir=${localstatedir}/lib/${BPN} \
                 --runstatedir=/run \
+                --enable-privsep \
+                --privsepuser=dhcpcd \
+                --with-hooks \
+                --with-eghooks \
                "
 
 USERADD_PACKAGES = "${PN}"
-- 
2.17.1

