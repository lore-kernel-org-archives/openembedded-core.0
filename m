Return-Path: <alban.bedel@aerq.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130118.outbound.protection.outlook.com [40.107.13.118])
	by mail.openembedded.org (Postfix) with ESMTP id 88A3D6D561
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 14:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=W99Ko8r9dNLWWOxI12GYNLsUWj9Ogx9bmrBjYUD9Ygxe5xymNw1ZuVsT/0/tu+tzIxSO+eIKPKtpxgBCt+MLpfOTCs4YJ8OyPCGQzaL4mubj2d6OHf1KwYqPObMllkN/ErVESifzRl99s0GpXjeFYJ4d1V4SRQd2QkVVei1NQDCCv3yP/tjvjsX3u37/c7skEQXCNtLVb0rwvkpn51O2P3AsgE/nHbyMBSwId/+o6BKVlhecV434faVZkRcMFrGiGBcIISMyW5LDErT3Xjdya9umV0D113+c5JsH+vxoa7MECi6zq5wDOLXjg6ocGM/fKcGoSG3AmelpgtAIPNZLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HSf2gMGMKrfefhga5Nhu2gKsKJAcCoiVbABEk4s8WYI=;
	b=gx26w9qdbQZemIub0UFDwnFTZ1EBS04xbRpYvrDAu5Ki2aU1gw5uBRdvDS23EixNWXMOwUlL2yzse3hlKcPHVCTuq2QSBaA/u7VuxZlbdr+SRCmQyT+DP8NKOwrKZivAM4zCl5j9ufJLh+VH1T8VMsx7h7nmqYu/391FW/fnGD6i/3mJOAU0IS1Iib9scJaIL/LqrE7vE6dyRVq1wDLY1M/ZiTAsO6REMMx4KsKODCRWm8T/zuvWcJC6wRANiFBO7n5uIJn7HyMe9CGNpwJamuyOxyTvRw5MvXa5U5lVWPynHJEGBpGYmJHRroTExKeG8uEklxUiNEI3nT4/PSLPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HSf2gMGMKrfefhga5Nhu2gKsKJAcCoiVbABEk4s8WYI=;
	b=fGyAiVJIzvtLaGiVipuK05i2CIP5jC/wrRg4QLUKFRsZgyZYJ8yQunmqi4SFQoIz8JhY4i9xIzb0o4DojZFeDzTLZ6vHMx5dCWO1pAgreofM7gqEjtEK4Aj+TDdFXXVOMfVUbNQfpPApWvlY0gmfXjSmKL8gAk8uov000XBItdw=
Received: from VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM (52.134.28.150) by
	VI1PR10MB2830.EURPRD10.PROD.OUTLOOK.COM (20.178.204.204) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2094.16; Tue, 23 Jul 2019 14:11:46 +0000
Received: from VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d5:b8e:3ccc:cd06]) by VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d5:b8e:3ccc:cd06%4]) with mapi id 15.20.2094.013;
	Tue, 23 Jul 2019 14:11:46 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] rng-tools: start rngd early in the boot process again
Thread-Index: AQHVQWCPXPqpHgcyZUmv/EXI/j32nw==
Date: Tue, 23 Jul 2019 14:11:46 +0000
Message-ID: <20190723141127.19315-1-alban.bedel@aerq.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0240.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:1e::36) To VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:39::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fc2746b-7636-426f-8630-08d70f77b25c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:VI1PR10MB2830; 
x-ms-traffictypediagnostic: VI1PR10MB2830:
x-microsoft-antispam-prvs: <VI1PR10MB283028BE256E5733027645A796C70@VI1PR10MB2830.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(376002)(366004)(34096005)(136003)(39830400003)(189003)(199004)(71200400001)(386003)(102836004)(71190400001)(52116002)(186003)(26005)(36756003)(6506007)(508600001)(55236004)(53936002)(107886003)(486006)(2351001)(3846002)(6116002)(6486002)(8676002)(5640700003)(68736007)(6436002)(66066001)(305945005)(2616005)(476003)(7736002)(6512007)(14454004)(50226002)(66946007)(256004)(14444005)(66476007)(66556008)(8936002)(25786009)(81166006)(5660300002)(81156014)(66446008)(64756008)(86362001)(2906002)(316002)(2501003)(99286004)(1076003)(6916009)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2830;
	H:VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ShtTAcZtbqwcqkSINEC4C4QnCgj0mImJL9vnsPnr5IAMWNxWetpSzdaqGOFHBBaggoMqmc/6ouvIj4MVWrHAB5gTaGHhDw7p5kT90E9BD9eRePAsuXBusc5GT0Egt9Q1biVBpzsxqIzcwjRtFdGAtvARVrEeuGBp6TRM/OyyAWBgV7n8hrZNypo6sfy8EEplvoJe3HFoDMOVl2TiRfGIQgv/4NCj15MEcNArrQqA15rtSC44rreyJpOS2KhBrU9lLwBnEFab/jrt8H5NfOqgT3RYD9fcO7tNR0KwbgoypeRqV7ShuIjnWpyyu5bZL+gUpzj2zAJsnpX2dgRa4W51LdGH4I2qj8BhrRCW/w8UBX0Lf6UCaMMSsSD0F1gndK30KbVcyBDEch62kbXPSE8rCCVqN/bR7Nd5fwetnUIwLJU=
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc2746b-7636-426f-8630-08d70f77b25c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:11:46.6626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alban.bedel@aerq.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2830
Cc: "Bedel, Alban" <alban.bedel@aerq.com>
Subject: [PATCH] rng-tools: start rngd early in the boot process again
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
X-List-Received-Date: Tue, 23 Jul 2019 14:11:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It do make sense to start rngd early in the boot process because
otherwise we would need to track every service that might need entropy
and explicitly configure it to start after rngd.

When used with systemd rngd blocked the shutdown process because it
simply missed the proper unit configuration. As the systemd
documentation explains, when using DefaultDependencies=3Dno one also
have to explicitly configure the unit to properly stop at some point.
This is normaly achieved by having Before=3Dshutdown.target and
Conflicts=3Dshutdown.target set for the unit.

To have rngd started early again we reverte the changes done to
rngd.service in commit edf7606822 (rng-tools: fix rngd blocks system
shutdown). To have it properly stopped on shutdown we also add
Before=3Dshutdown.target and Conflicts=3Dshutdown.target.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/r=
ecipes-support/rng-tools/rng-tools/rngd.service
index 49d5de294f..aaaaa29074 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -1,5 +1,9 @@
 [Unit]
 Description=3DHardware RNG Entropy Gatherer Daemon
+DefaultDependencies=3Dno
+After=3Dsystemd-udev-settle.service
+Before=3Dsysinit.target shutdown.target
+Conflicts=3Dshutdown.target
=20
 [Service]
 EnvironmentFile=3D-@SYSCONFDIR@/default/rng-tools
--=20
2.20.1


