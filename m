Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.12])
 by mx.groups.io with SMTP id smtpd.web11.32742.1605036047163050004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 11:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=RluQzK8V;
 spf=pass (domain: outlook.com, ip: 40.92.89.12, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DP4GeThMNWFoMP+Rmwm525R/oK25Z5HMR8ZWfPt7f9/ZElE6GKsVUX+6l7azM/ZRILaN0zF7LiGJWanWfLF3vMopxnrckf2VImGPkUtFlaJ2R45zh63j2n17lGXOxUDVzlMvg3Lg0pk8+E9uWQ/mfxd+i3cPsFm153zIeVVgCCAKQP++85Lg6jbCY01TeWocw3Vsj9WuJof06U610jx3Ytb7AbeeK6mG3aZnHgjBhnGy5TNp6CKCYHjCWKaY6eW9zdR3+Lz1j45ddRdLytnVwmh5HNv0oDVjAvSRUnWrw6yyxGrjav+bWrMeaKtlbqflCeEUaYAjiVDFXCO7l2Olzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAtGrOJHuUTwaFkU5v++8BeZaa6XUIPo/n5x8LrsqYE=;
 b=hci0A7v6mDTPJrb0b7Kw7Bk+A5wKdbpXxWoHanc+t/6AjAaJjOhArrnVLAXjeSyfHfb0DujJdEq0YUPAugzUcKS8F91g5Ii1p5Ra2/TuPOsdMexM8koIxbO74hDxRDe0/BrPQCgfTEWINHbFHgCrM4xGE/p+/uE+dGy9ME6RSMKbGZT0MXMzPBLVc/3Swd/J+7PyLRrV9MxRZKkz5rYnTdGCnPVLe4UMtL1Sp3G++h84njsV/TBuRTJ55w2iSyeJskPOGJxAT4KzX5q9CcjEJ01yrb9u49nx9ZUUAePicjy5/taKgOSSohLbrL+1B5CyEy9851U9Az1irVREv+dMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAtGrOJHuUTwaFkU5v++8BeZaa6XUIPo/n5x8LrsqYE=;
 b=RluQzK8VVZc+qoYdsaNf8G3UeF8gofkc3qtlXeQEqjYlB3qk/PZJVIMib+j0GnGtwdwzTVr2mqnvTKeA50/Agmh+K/kqlheBzdNVybUHZ9okWFNcrW+YgCoHLDd7FlmDzJf2pX6h7/lf4Wfnt3m6jVGqLPVlTwDqDV53mYGWvL5vPy+WEnRUoHtvS3guqoUfFbPXqynSpkd1G+ooEf/+7ZfhfSkhiVybHq8JhRqkdKrwp/nGawGa/35ZZvpvXawxsRHtMdYiKMCaxPsW9Qf3ymRIwk7BvIzyB7KBHVl/mkRYyzGLa9PBYEiPg+lnK3rolE9Ardov8o0kE8vtI4gkLw==
Received: from AM6EUR05FT030.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::4b) by
 AM6EUR05HT216.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::200)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.17; Tue, 10 Nov
 2020 19:20:45 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:fc11::52) by AM6EUR05FT030.mail.protection.outlook.com
 (2a01:111:e400:fc11::61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.17 via Frontend
 Transport; Tue, 10 Nov 2020 19:20:45 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:7F6814FCE239ABCA1863D2BB3A535DE87B2D81029EC4FC40B19507C58DCE1FD5;UpperCasedChecksum:C207D3372863CE14C4F1A916C67DB0A5BA636DCAA1FDC01EFAA8AFBF9AFF750D;SizeAsReceived:7464;Count:47
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3%6]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 19:20:45 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 2/3] oeqa/core/context: initialize _run_end_time
Date: Tue, 10 Nov 2020 20:20:15 +0100
Message-ID: <VI1PR01MB6462CF9C25584D0E3AF2D840A8E90@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110192016.2458528-1-kweihmann@outlook.com>
References: <20201110192016.2458528-1-kweihmann@outlook.com>
X-TMN: [34/FTSo0NayRUfiGGm6+AIBlvCXi0rYs]
X-ClientProxiedBy: AM0PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:208:be::24) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20201110192016.2458528-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.92.139) by AM0PR04CA0083.eurprd04.prod.outlook.com (2603:10a6:208:be::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 19:20:44 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1d227402-d6ac-4e81-97bf-08d885adb8c1
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj3YwmJACMyfymIZI54ViH9ORC8Z+8gudDg1ys/oaAAChug0FkjM2+TO+ShY9rOocTkyMHVy+O84ImE0AfyWY4Vl8WGd1Nnu4XbBI/e7dRwV/g5Dh5Kce124ZvinshA3N6ME4mOfbnnGvyXzu6mLyGy5Eg92DKU30zqGLKTSbyxgck5+hG8d/8M5N98cKM5PFcJQWMNFSaDkwJGyRu4Kwr9HIzk+KKrTuFOEM0z47UhtNKB84VppiF5nz30Z+Qn14Jka4rtnw0mfG035VCa7UJs5gfu76NLDfpb/+iY2uRJexyuiV6QpohpDsz/OHGqopUiYuL10jDDHFEOi3/lteyFGLg8ndv5FUzFwkzpRArzofcH961M81z95FmNGzPDsnelAZnjxacHa/r/HO5fYeOZO7ZpogOE0/k6YNbTtqmZSAe0ip/kue2gyWs1H5wlh3bu0MNlPrZgrn8yTrdC8KQSMLO1Reyrmlghkfi8cTY03eKHYcelGXF+/5RmuPN2IVzcqkUFRxOTW8viFi6RO2/kst30+tSQruSZ+66zKTiF1DoQRaSrWVnIh7RFMgU0/4rLdLhKbXegmT2a6ceIDxuSJXl8eUKAx5QbzpzxKDE4u4gtgebvpqVtnCkrUY3day37dKnDmvAgA9PZJ8j9wV8+EqMy95pof7SB+txUYXjEW7M+KNgtnmD/6JpcGs59HKO6lN98bUj0jnw==
X-MS-TrafficTypeDiagnostic: AM6EUR05HT216:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VF+viZg5Ig7KQ/ET/EYWq9yc0BO5l6Jh07A7/cm96c+UKP7i5vQvRJeR7mdDKoxCRScc7cul+vssfHoxBC9tYQT56VNfsqaCWTgrho+ZgKNzzJ7j7JSF1xACbbPHmg0oQmdQyrHQwthNIamwjDjevM0tXFWntk0G/svh6yne4OUXWs26ARoJ81K4HnDD4ZccsTZJ4uNFZSZPpfpuJAojLQ==
X-MS-Exchange-AntiSpam-MessageData: 
	gCCpFhUbc3W7j6mCKyInqKEcMdDISboU/zAvw63mnr9ZchatZAlhkzr8trHcvLD4KXidSkbMXjz0DIn6EhI1MP4LnTndA3XWrNRStiZk3TOAmTGo6zzifSwtUtrTNXBwbgfBFHR97KN87QRSLyWDDQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d227402-d6ac-4e81-97bf-08d885adb8c1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 19:20:45.2329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM6EUR05FT030.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT216
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

with _run_start_time as value. For partial results of interrupted runs,
this info might be otherwise missing for at least one testcase

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oeqa/core/context.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 84b43a93e1..2abe353d27 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -85,6 +85,7 @@ class OETestContext(object):
         self.skipTests(skips)
=20
         self._run_start_time =3D time.time()
+        self._run_end_time =3D self._run_start_time
         if not processes:
             self.runner.buffer =3D True
         result =3D self.runner.run(self.prepareSuite(self.suites, processe=
s))
--=20
2.25.1

