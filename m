Return-Path: <alban.bedel@aerq.com>
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20090.outbound.protection.outlook.com [40.107.2.90])
	by mail.openembedded.org (Postfix) with ESMTP id 8242C7F45C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 14:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=j4Fp6IrDW82uevhYqWCTrIT1tHPN3aNlaJCS1XYuNvV+kFpQOLNf21oUpkNDwfIunhTjJYkoMyjeISQw8FRe3dfIt8noU+lrD4fMZFGkI+oyJjOFxfVJI2SDbhD8+xCsf6zoTNqvascEQ6mBmx5oJrXUpHBhjkPbnNU2HLtli9bUS39JsxW9uq+ojjC4KvMsxfU+YLWwaPhb31QsqYIT9ophiCYIdXaDKdpP+T+FrWZ3sGR/i3xHvzbK7Y4mBLaUlgVddPip12C7K+IjYInATWg0UVSCQM7q1yP19HK+2/ltvM1BQG2rMJNISSShdZ2q4/xlTNnyNXbDy//n+sBBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ttL3WAeyumNV5TvdnJe4JYcGC2n7D4aozx4x/IHQ6Sc=;
	b=NSmT0yW1KaOdJEtGQgyDkXFUhYH0kDJvRcxusQYNO7YMCXGlsrXnsXcU4+UaQFMyPiyqv+0OndI9T5Sv0MBR5W1FHwmO4RkxFtLyRDhDUTLHuXD5WZLKEMvkhYBTP//E1QRclHnNF8FVgw70ew5cC802asFXkS0znS+l6YzK9DQ7ZofsN0/h4qcNp+mu4EYphjnFM0RboBo9vHORifkC3K0UaTxS6hcBXXu6IzLX0bshQsAqS+HZyUAUtPIvymb4BbKc49u4wyTcoSta0+k/ucjd6bYv0Uow01d4LFRqKn50dTl+l5zYFr7DGUdDhJszpRUIJ9uSepkj5zCjzOeuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ttL3WAeyumNV5TvdnJe4JYcGC2n7D4aozx4x/IHQ6Sc=;
	b=pqsTf3UnkTwp0iRRVwzVTPGTtxhvjav5fNmic7dpi3IpsH2fVJ4feaaReAbevc8l/Yy8sjLlXaCv+QF2D3nNkXXZoJE/DPuFg//6Y0nK18Lzn3qhiWThLnu9K3vaneFddonXwshn3RHDNV2YR9yRYnoCIKYchyQX5tMXgdrfZLE=
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM (52.134.115.151) by
	AM6PR10MB2487.EURPRD10.PROD.OUTLOOK.COM (20.177.116.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.12; Wed, 31 Jul 2019 14:01:59 +0000
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::7115:a2ae:b3b5:2fd4]) by
	AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::7115:a2ae:b3b5:2fd4%6]) with mapi id 15.20.2115.005;
	Wed, 31 Jul 2019 14:01:59 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [warrior][PATCH] rng-tools: fix very long shutdown delay with
	systemd
Thread-Index: AQHVR6iFSeC7o/UB1Ea8GYZBbdqAwQ==
Date: Wed, 31 Jul 2019 14:01:58 +0000
Message-ID: <20190731140144.20541-1-alban.bedel@aerq.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR07CA0011.eurprd07.prod.outlook.com
	(2603:10a6:208:ac::24) To AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:209:31::23)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52ae36e3-a388-41d6-c5f3-08d715bfa76e
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);
	SRVR:AM6PR10MB2487; 
x-ms-traffictypediagnostic: AM6PR10MB2487:
x-microsoft-antispam-prvs: <AM6PR10MB2487A5CFAECD03B5592A323796DF0@AM6PR10MB2487.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39830400003)(34096005)(346002)(366004)(376002)(136003)(199004)(189003)(2616005)(2501003)(486006)(1076003)(476003)(256004)(14444005)(316002)(2351001)(6506007)(386003)(26005)(102836004)(55236004)(99286004)(52116002)(186003)(2906002)(6486002)(66066001)(6116002)(3846002)(4326008)(68736007)(107886003)(25786009)(64756008)(66446008)(66946007)(71190400001)(71200400001)(66556008)(66476007)(53936002)(6436002)(5640700003)(6512007)(5660300002)(14454004)(50226002)(36756003)(8936002)(508600001)(86362001)(81166006)(81156014)(7736002)(8676002)(6916009)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR10MB2487;
	H:AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oxF7D/TZJgAoJJoo8DpG3wxNckDV5stlL9ykPcFUFYtg/YHQ8U2vPEwtIpgJGrOB0/rhX81bLF//BMzS95X4zHzSn4rzkW4N5RMi1pG0drrAsQbyqaA4xwDYCxVqG8j0jdQ1ujE8IvbeobveyBOa5Z+msBMibBdYE+v8YSyl9ebT0RTdfu88RImVMZQDe5C8iKwAtF8jy4gqK4WqtXyNZQ6BWFMpkgWMZLDNf/llJ9GuS5XwTAWuM6bquQjf6BJuFShP6aLOy98eZc1Eud5MqOUdRXZV1Z5JrAdNUK2s3flT5mOZX04wy0j8Ok9f4W2GvCTqFFgcOFJjKp0kDUYgNYBV2ydEX5I7k6TvMXOLSxTw2NNC9Xz1NcAgLTKMPOkIgza4+P+09p+sjf5YML7dEf5Pe6ZK9GMiz8rfgbaTz8o=
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ae36e3-a388-41d6-c5f3-08d715bfa76e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 14:01:59.0434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alban.bedel@aerq.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2487
Cc: "Bedel, Alban" <alban.bedel@aerq.com>
Subject: [warrior][PATCH] rng-tools: fix very long shutdown delay with systemd
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
X-List-Received-Date: Wed, 31 Jul 2019 14:02:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The systemd service file has DefaultDependencies=3Dno but is not
properly configured to also stop the unit. Because of this the unit
keep running after shutdown but systemd still waits for it to finish to
then later resort to a hard kill. All this take 1m30s with the default
configuration.

To fix this problem add the missing Before=3Dshutdown.target and
Conflicts=3Dshutdown.target to have systemd stop the unit on shutdown.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/r=
ecipes-support/rng-tools/rng-tools/rngd.service
index f0355db14f..5c8253b5fb 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -2,7 +2,8 @@
 Description=3DHardware RNG Entropy Gatherer Daemon
 DefaultDependencies=3Dno
 After=3Dsystemd-udev-settle.service
-Before=3Dsysinit.target
+Before=3Dsysinit.target shutdown.target
+Conflicts=3Dshutdown.target
=20
 [Service]
 ExecStart=3D@SBINDIR@/rngd -f -r /dev/hwrng
--=20
2.20.1


