Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.81])
 by mx.groups.io with SMTP id smtpd.web12.573.1605056834921384820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 17:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=D8nYHEsi;
 spf=pass (domain: windriver.com, ip: 40.107.236.81, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNs7YsGDfYIlvAP0wcAc+etHaoHCV0h9IvTM+ZhZJ7P+dbrPLDSsEb9bIKOLqfNgL7+PkcZrFIY59qdX4FDjiudQaB3ZZsp/T63KN3SgLVDMIHfnajiHw2xaqtvGcYvSWf3MddaSfsMDId4EJEnn8hfyhHGmr6Aw39gS3xhi/cs1cnVcfJO59dFGJ5pSbtG2Yki8qkjuQBcAxQhaWq3fNU0aFaBuxF3PjjfItcEzLqa6j+HzLobLCCQ4U+iLg7E9mBLKvjuCZxqxWVZU3cSBvBnUhO3JOYWbt6CPY7vWKxp3y7x1fnnA8/QA6gy8KiUDMkd/cXc5nloawAQH7zGRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srgyAWSWxmNLhoNEQklKxF0l+zXoLB7wzzr8TkwSf/Q=;
 b=JT5nnNJ0KNcWFJ9OC+dia+WqelPBgn53SkOA7gMkY46VRFrinIs3z6f+tyUJ5eE9xCXI9Xh24PQf+lLHMABu7zjowHHRBWHeoHcE2sskZje+lY0M08mjbq6uOcqfy2/uxbYqfBEEEDJ8iznq4YMGGZiSrqjC4fXxfCgP+4zFaOpJBi3pRJfndzpE8tXBBoWyIFqrXJyDFtAL0Z/bMq+stTfTGocPLtmiRplu9GhvbvEn/szEbil3MfN2i1fqIySnWb61D0wtPzyxJ4oNV0Et8ESqAgkfyU+VOAEEaPOEb1XnSpuSsoWoHQiFKWHmacRgcYnQ7YK+qExpar2C+0QVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srgyAWSWxmNLhoNEQklKxF0l+zXoLB7wzzr8TkwSf/Q=;
 b=D8nYHEsiyq12s8eoRPZRxTrK1fhNsWd9TxGW8OdLTvWPJNPz2xhabG3rdKYaqarRFPMicWKnv9LkP7TJWyiMSHtrSX5LGSAQ99ozocwn3apapeauDIj69/qfp2kVV5FBwFxOK5gWwxU2fGfPrrEw6gawgluFJZYPVUVnEu/AIbM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR1101MB2276.namprd11.prod.outlook.com
 (2603:10b6:405:4e::18) by BN8PR11MB3570.namprd11.prod.outlook.com
 (2603:10b6:408:90::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 01:07:12 +0000
Received: from BN6PR1101MB2276.namprd11.prod.outlook.com
 ([fe80::1105:8ad7:b702:a12f]) by BN6PR1101MB2276.namprd11.prod.outlook.com
 ([fe80::1105:8ad7:b702:a12f%11]) with mapi id 15.20.3541.025; Wed, 11 Nov
 2020 01:07:12 +0000
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsdl2: Disable video-rpi
Date: Tue, 10 Nov 2020 20:06:52 -0500
Message-ID: <20201111010652.934186-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To BN6PR1101MB2276.namprd11.prod.outlook.com
 (2603:10b6:405:4e::18)
Return-Path: Randy.MacLeod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vme.wrs.com (198.48.226.187) by SJ0PR13CA0089.namprd13.prod.outlook.com (2603:10b6:a03:2c4::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.21 via Frontend Transport; Wed, 11 Nov 2020 01:07:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf5c3928-3e38-4330-7af0-08d885de1ee0
X-MS-TrafficTypeDiagnostic: BN8PR11MB3570:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB357018C45AFB1854C25393C0F8E80@BN8PR11MB3570.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nfQ971/zhqQ1hXVtx/CQDoMWzJ+hnnf1KR5KVLK47NizCU0FyB6BbRLSOKQ0XTkz7k8bMAIE3/0EjhRZ1LQmy7ST/v22kmv8za200Ta4b8RCpyL6+9rquYCA4aO564xqlDx8S1+qZVWf5OyeMiO5B/kFqrNmrKyxAjfaIOjyjbxeZQyK8I0Cv2HxHoHo85xbZQEM359orm+7VLUg1HMeiAQgxs/M1qAmc7gIAgnvQe6Sxoc4SZYsAcmjjLosi8AZ7gw/2xf1RyndPV9KoWUMfmoSjHWAiJFLCi4KcXU6mBoKI7p6s+NLDa2Tx1idYJzn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1101MB2276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(346002)(366004)(396003)(6916009)(1076003)(6512007)(6506007)(66476007)(86362001)(5660300002)(186003)(26005)(8676002)(6486002)(2906002)(8936002)(16526019)(66946007)(6666004)(956004)(316002)(2616005)(52116002)(66556008)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	uD7M3QGvDNATS3WXuzinYprvUF/itMLR8Ur1rMQd+FdrzANG3FXDLAQZ6TOwo7qGXsXJz8xCc7N7zbGj7xtKMDJWB7Xuk5i/x6Xj5e/YK+sDJ6/HTlXrdWLvYA8OidOUcCoC2akzPV/SwUZLDh3ZVfnT5wYk0oma+9YojFoE5m7Ks5NRzD46kZumaSZagNj4+KbbUn1YriBnO/+IJD6oeiDYwGxAh2fBk6BUcMj4nUR23JGXayy+iR45RoQ8XVIQB1yMwsbnlmBEC4Saqu/NN7sNKoZIXt5dfZ2ytNglhvVqXpgtqYmODtfZJ125yG9udF4qg6+ZDnByPj63ob25EgmHzxVOIn0oHleuPlH0NWNpIZpjYyeaqkv875I+I6xkVH15saiFRQSn8kFkUT8koPC4GbDW3cnFbOq5JR1h0l/vKx1EPeqf+CSnpDCY+NJgb9xBWg4uwrhDoXzTtIzHeKwBAmIrLhagcxo75c2i/Nu1+6UJJYN/ZNBZ3IHwbO9Wuj+YfLnNPAEaUbXWufWSAVWCFm7aETiyM8KyFLXwZMUS0Ksokr19sFVbGNWFEjpXWA8yx+qBd0K4i+qykwIcNxsgXtWme2W4T3WtTtxk3Gz1RL+rg4K7g1dGDmzN7n2ECnPfa3tVlQPDVEAjVPr8kQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5c3928-3e38-4330-7af0-08d885de1ee0
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1101MB2276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 01:07:12.4485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXY4lMDxMTU21VveVFdJ8uJcsPaDVasfP+/QbeyEipeQM6EBWuoohzO6/dy5XheOOdogM80Q16V7PmohjAjKIKjc10y3sjnRsty/t28+KOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3570
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

When building on Raspbery Pi OS/64-bit, libsdl2 fails with
the error:
   .../tmp/work/aarch64-linux/libsdl2-native/2.9.12-r0/SDL2-2.0.12/src/vide=
o/raspberry/SDL.rpivideo.h:47:5:
     error: unknown type name 'EGL_DISPMANX_WINDOW_T'
     EGL_DISPMANX_WINDOW_T dispman_window;

Disable video-rpi to avoid the problem since video suppport is
not needed for rpi and this configuration option is harmless when
building on x86-64 hosts.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes=
-graphics/libsdl2/libsdl2_2.0.12.bb
index 0b75eb0c1d..2ef7d2e5ef 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -36,6 +36,7 @@ CVE_PRODUCT =3D "simple_directmedia_layer sdl"
 EXTRA_OECONF =3D "--disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --d=
isable-esdtest \
                 --disable-video-dummy \
+                --disable-video-rpi \
                 --enable-pthreads \
                 --enable-sdl-dlopen \
                 --disable-rpath \
--=20
2.25.1

