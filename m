Return-Path: <alban.bedel@aerq.com>
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20124.outbound.protection.outlook.com [40.107.2.124])
	by mail.openembedded.org (Postfix) with ESMTP id DA9757F45C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 13:53:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZFhDhH3C7gXFkCyvTLT1bwXEmSaG8F5nTq57Ue81abO9swMR/EcNro7SL1wLBCjNh8KcyYRsHX0L5d28OHKJRO0L9TzhjjNPETIniDCb5z1onvP9LBG/RK/WMkzxcUtbG96yz491CbeeNW4nqjnwFPKgcsfvjG2tf434dpjr3Irr+Q1unAca3DTQDudUrZoVMnLGjI2Ktg8t11CNeASjCadoa03XYFqfBdhuISupLKG/Cbk0Q5WXEt3bBR2433ZTct1i6KtmJxM38N7w5Hbz7SUkLTfFFSxAfv5aqSFd9zP2PJrvPiAOebnYIEaF8QRDSE8ee3K65d7CEXFgDBUzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6Z9qCo430aROPeCAi96CChu7eDJ0MGNHMeDeB4JEnH8=;
	b=FVzFZe+veBL72MssHFhUl58jGkkv3rK9mTz6IbfoOXV12o/QXv7BADHBk3qgZmPkIaveZsQmVp0SCy4BCHB+ELaaiKjE3771KqptepD+dDrkFFuReI/9aGth7hqQBtDk5A5MTg4GxZU9SfQWUKsR3KptKbrW4KkDo7nozMgfk0edsiuLkXC7RHhges/mcpVBPglwAFWoA9OALW59BqWy0wO/dWus/UdyC4MQAAMfioj9+2i24TLMctzAKsu6ESTU++gav9VGqTd8TDOI6RkLCULzxJtFoYyxANj/HOi33ifoqYcPbRrtZPzUALccWCoF3/Eh3s1A2UaLML2lkQs0Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6Z9qCo430aROPeCAi96CChu7eDJ0MGNHMeDeB4JEnH8=;
	b=dAaxS1bLDEYWL1WMbTbhaMQB1aeSXhIqSbfVKADS01IIa3Wqldozp72zVLP8pROiZSjHBXJZdHcrHXJ4uQfDUBIpWkdJ5m6D5xM4iZep2ribnqJy8Nj5l83nU9UDygTMqQ9HJT0kczGoHiapeW3S7GVL2PqbcktM8nUtEcHLFzQ=
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM (52.134.115.151) by
	AM6PR10MB2005.EURPRD10.PROD.OUTLOOK.COM (52.134.114.25) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.14; Wed, 31 Jul 2019 13:53:45 +0000
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::7115:a2ae:b3b5:2fd4]) by
	AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::7115:a2ae:b3b5:2fd4%6]) with mapi id 15.20.2115.005;
	Wed, 31 Jul 2019 13:53:45 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [warrior][PATCH] kernel-uboot: compress arm64 kernels
Thread-Index: AQHVR6defzhnBU0AEUmRfvXMV9SCuA==
Date: Wed, 31 Jul 2019 13:53:45 +0000
Message-ID: <20190731135317.20174-1-alban.bedel@aerq.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0127.eurprd01.prod.exchangelabs.com
	(2603:10a6:208:168::32) To AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:209:31::23)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edc6c4a2-7039-4cf4-7136-08d715be8101
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM6PR10MB2005; 
x-ms-traffictypediagnostic: AM6PR10MB2005:
x-microsoft-antispam-prvs: <AM6PR10MB2005FA909697274DD55E223696DF0@AM6PR10MB2005.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:94;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(136003)(366004)(396003)(376002)(346002)(34096005)(189003)(199004)(6916009)(508600001)(14454004)(66476007)(66446008)(64756008)(66556008)(68736007)(36756003)(6512007)(2501003)(316002)(99286004)(6506007)(256004)(386003)(186003)(2906002)(52116002)(4326008)(107886003)(66946007)(102836004)(55236004)(25786009)(86362001)(6116002)(53936002)(2616005)(8936002)(50226002)(8676002)(26005)(3846002)(476003)(81156014)(81166006)(66066001)(71190400001)(71200400001)(5660300002)(486006)(7736002)(2351001)(6486002)(305945005)(6436002)(5640700003)(1076003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR10MB2005;
	H:AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ws4j9wBJ7f3cbYhcotoWsaCd0zlUyOApFT4LgFWqVewu22bA/Xj6SIUpUgZDrFi75STA8+MEs/mHZplftOMnlxdosfzRRV21tkoIK7hxGGlh8SFT+Ky789ENpnxV3UmwzxF3TtX1YV7gXyXB3N2Oa8qf/yS0jGiHnCaQBA/U7T/hfLBu50sZkSYOdsuMg5bKm4J01V8sKHDS7moEdJngLvMZYZ0yjql0Kfgw7lrl10+2bH2vICXeX79V9c0X3G8ueBz2GJavYhGsaJRElkJaoBa5KnWvO2CvP8iYKaV7EhH7uSj8/+RzWvN8n3Zu3WSs6jYcIVExU1jqPetc/OJar9EQH0TJKoCR0Z+zdr064t+tOvwdUY3nddmUbPGS/uSnSA0y6ZfrXCQWJpmRdDpc9p/MMtfCk6PBmp0DLRtvMKU=
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc6c4a2-7039-4cf4-7136-08d715be8101
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:53:45.0178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alban.bedel@aerq.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2005
Cc: "Bedel, Alban" <alban.bedel@aerq.com>
Subject: [warrior][PATCH] kernel-uboot: compress arm64 kernels
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jul 2019 13:53:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

AArch64 images are not self-decompressing, thus usually much larger.
Boot times can be reduced by compressing them in FIT and uImages.

This commit is a backport of commit a725d188b5 (kernel-uboot: compress
arm64 kernels) and commit 60bc7e180e (kernel-uboot: remove useless
special casing of arm64 Image) from master. Both commit were melted
into one to avoid some useless churn.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/classes/kernel-uboot.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.=
bbclass
index 2364053f31..87f02654fa 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -3,10 +3,6 @@ uboot_prep_kimage() {
 		vmlinux_path=3D"arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=3D""
 		linux_comp=3D"none"
-	elif [ -e arch/${ARCH}/boot/Image ] ; then
-		vmlinux_path=3D"vmlinux"
-		linux_suffix=3D""
-		linux_comp=3D"none"
 	elif [ -e arch/${ARCH}/boot/vmlinuz.bin ]; then
 		rm -f linux.bin
 		cp -l arch/${ARCH}/boot/vmlinuz.bin linux.bin
--=20
2.20.1


