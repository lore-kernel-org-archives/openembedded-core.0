Return-Path: <alban.bedel@aerq.com>
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20098.outbound.protection.outlook.com [40.107.2.98])
	by mail.openembedded.org (Postfix) with ESMTP id 5E2326D561
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 14:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=nZL0b/M3HLX48M2OVp6gzKVllYsdRlByYOLo0PwkBcUdPw/OOGaUSfTw9V5AcIiFrk2VSWA6/YJ/rmHPM70JyD+oxQb7dI5vwB2ezrKF0o90L+XlaZYs9uTDDsShafQ0yD1etMiXF31nRRNuhRkxdX0Xd7jcsAd/4n17xlB28upIOgb77QPkwGw0yk/7OM3/ErzWddD1xVCPyn3N1uVoEI3qYPSGHlqGGyOZ1dBfvPrarbaluBYfxV7+E5c3umYAVWMxRDz5j/wzFMLC9/J4bi71choKkrKPLrFbN77CAiy/PXY33CtHRU3YqIaHEuK+lKeQIFiOHNXDqZfP8O15jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=l574pWkAmV5lXgFj0PMfkSMs+Oi5bBVpJB6cdAFkxc4=;
	b=PnAKq0dtaXBqcAW9rJImSqlkTOPqRTM9QpL9QeKxnLpjWgLd8U+vsEWWulpqW6v3Rm0XgIsMN3srFy/q90bjUJo3ABs0BjBxx4yJWYP6W/90jQUkyWhwUKLI5nNK59IgooCK9pNH7oqq7J+/k50k9dFzQUnnKau2OOZdgQBkxZpLCJ+RbnBsSYaQLiuBw/Q5QEIx0iVcdPaKfcRxdCSdoo9FmpUjqDWCEvzI9w2dg7cDaoj5+S5+5AwwdCgGo/PhCvw7ddpGR52/GkwUU5SBxi5N5sJjH4qaNFZRkaXUpNP9utzORx88CTooQLWDH56Tz5bfHDag/4Gr3V1sIHxGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=l574pWkAmV5lXgFj0PMfkSMs+Oi5bBVpJB6cdAFkxc4=;
	b=p+TBslDF2/7e5VN4eVIKkpT9g3fNMsagXBsj2AaI5qAmBy1WLYvOLkSdGzFDWOWuU4j6nXqcvwl+3xU/V144/cefPrvhlngOX9p1GNHOWsBYWLg/zyTAYvmoib09YEuHmGNAp7ngXEWpWc1omUa5mN0I5M8z+Dx0RYrLEOcx/6s=
Received: from VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM (52.134.28.150) by
	VI1PR10MB1886.EURPRD10.PROD.OUTLOOK.COM (52.134.26.28) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.14; Tue, 23 Jul 2019 14:13:36 +0000
Received: from VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d5:b8e:3ccc:cd06]) by VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d5:b8e:3ccc:cd06%4]) with mapi id 15.20.2094.013;
	Tue, 23 Jul 2019 14:13:36 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] kernel-uboot: remove useless special casing of arm64
	Image
Thread-Index: AQHVQWDRDbYSSSv3fEaAkvRzhzWUmg==
Date: Tue, 23 Jul 2019 14:13:36 +0000
Message-ID: <20190723141324.19525-1-alban.bedel@aerq.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0219.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:1e::15) To VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:39::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 906ea42f-8c8c-46f5-5dd9-08d70f77f3ca
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:VI1PR10MB1886; 
x-ms-traffictypediagnostic: VI1PR10MB1886:
x-microsoft-antispam-prvs: <VI1PR10MB1886E4542C92B097DFCB94DD96C70@VI1PR10MB1886.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:348;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(376002)(34096005)(39830400003)(346002)(136003)(366004)(199004)(189003)(66946007)(55236004)(66476007)(66446008)(476003)(26005)(50226002)(1076003)(71190400001)(66556008)(316002)(71200400001)(8936002)(81166006)(6506007)(2616005)(2501003)(386003)(86362001)(256004)(186003)(2351001)(4326008)(64756008)(5660300002)(81156014)(102836004)(66066001)(6916009)(25786009)(99286004)(2906002)(6486002)(5640700003)(4744005)(305945005)(14454004)(3846002)(7736002)(6512007)(8676002)(107886003)(6116002)(53936002)(486006)(36756003)(52116002)(6436002)(508600001)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1886;
	H:VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y6S84K4hCEW26phvY1Kd7xtvtvPmOP5JUuSV6tji6AXjBejFV1rRUokZVIep/qbTaj3BIdV43UF7Q4cGKcE/gLX4Pk5bYqGhIJtUmaLeIQoCtTyZFtr8H84zzshD8KEKypcj2Gt3rftzGw+VyoFi7CvFtE/ElLSPGp2OGEQCSutPS1+cNIhS8uDphObgl69xS9uG4QDtAaAKVn4b4uR1/76csH473Cj8QcXl0+/LtOpVQgQZiiUlsahKBL4gW/fkH4BAd1WJynfqtKqVPyG/HCHtqQGDDwjxQYodCbUElDWYwRAo6t2FPPmSalYLgeXYZi0zt0zDwAPTpYWN8MJTz1dJEN2uPR5OBLfYrzaiYnsIliC+9/SX61Z/tDvYgOF4yf1otStsenybEtYa9dF5JEnzdqxTiAz6Uyl9HTFxluM=
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906ea42f-8c8c-46f5-5dd9-08d70f77f3ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:13:36.3704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alban.bedel@aerq.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1886
Cc: "Bedel, Alban" <alban.bedel@aerq.com>
Subject: [PATCH] kernel-uboot: remove useless special casing of arm64 Image
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
X-List-Received-Date: Tue, 23 Jul 2019 14:13:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Since commit a725d188b5 (kernel-uboot: compress arm64 kernels)
arm64 Image files are handled exactly like in the default case, making
this special case pointless. Remove it to make the code simpler.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/classes/kernel-uboot.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.=
bbclass
index 0457c5d1d1..87f02654fa 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -3,10 +3,6 @@ uboot_prep_kimage() {
 		vmlinux_path=3D"arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=3D""
 		linux_comp=3D"none"
-	elif [ -e arch/${ARCH}/boot/Image ] ; then
-		vmlinux_path=3D"vmlinux"
-		linux_suffix=3D".gz"
-		linux_comp=3D"gzip"
 	elif [ -e arch/${ARCH}/boot/vmlinuz.bin ]; then
 		rm -f linux.bin
 		cp -l arch/${ARCH}/boot/vmlinuz.bin linux.bin
--=20
2.17.1


