Return-Path: <adam.trhon@tbs-biometrics.com>
X-Greylist: delayed 3583 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Feb 2019 23:43:32 UTC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70082.outbound.protection.outlook.com [40.107.7.82])
	by mail.openembedded.org (Postfix) with ESMTP id 816596B436
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 23:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tbsportal.onmicrosoft.com; s=selector1-tbsbiometrics-com0i;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0A6uE0nqreJ0GrRAqV4bpSMkYUdDYxbNH1GtYHdsKwo=;
	b=EOgjKrEehmKmjNz7+J6lpaCC2DAdhPhteTvHrrRAUhJNQq6kVGbM9hA71KmUhJXnxJQm3nZTzOWYr/MwJJAPBMwD2mtKQNpUf8/wNw94xXiXsFkFjwuVGxKFdX9MM5YwfQbu39vBySBAREwb+6tjcs++41mR0rKoPRCIABiyXmA=
Received: from VI1PR06MB3103.eurprd06.prod.outlook.com (10.170.230.18) by
	VI1PR06MB4399.eurprd06.prod.outlook.com (20.177.52.92) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.19; Tue, 12 Feb 2019 12:14:58 +0000
Received: from VI1PR06MB3103.eurprd06.prod.outlook.com
	([fe80::6008:873d:da91:1166]) by
	VI1PR06MB3103.eurprd06.prod.outlook.com
	([fe80::6008:873d:da91:1166%6]) with mapi id 15.20.1601.023;
	Tue, 12 Feb 2019 12:14:58 +0000
From: Adam Trhon <adam.trhon@tbs-biometrics.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] icecc-env: don't raise error when icecc not installed
Thread-Index: AQHUwsySeRCnwYY0kEWK0H0sTWmVxQ==
Date: Tue, 12 Feb 2019 12:14:58 +0000
Message-ID: <20190212121447.6974-1-adam.trhon@tbs-biometrics.com>
Accept-Language: en-GB, cs-CZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0045.eurprd09.prod.outlook.com
	(2603:10a6:802:28::13) To VI1PR06MB3103.eurprd06.prod.outlook.com
	(2603:10a6:802:c::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=adam.trhon@tbs-biometrics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [176.74.132.138]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR06MB4399;
	6:tJ9Rsyqmg5LL8zpdP9eIp4Lip/WbmVIewkyFiTd3z2vp/bauWqPTVu0j0D0P9yPO6AUZCcr6wCRwSNYEzw8dhrCReW+VtPfL4kTU5eOjGAzR55P5o/wTAmvccwS60D8HTTtDP9Q42qi/ePhGSB7v8O1b1ewyiAl4khaqEvbKq/lGabfXbiiCwn96cEWUaVlS7lCvBvZzBdTBeEiORFFNa2jIHyOOQvUh13h24nRAEAtkelg1ojVRXSBYjlTU+uflYtOk+Szr1+OMEiRWtDOI7k9W7fZrVpLCoLIJ/OwnhPLsU7G+HFVe4kNIccXyhYGFzseDXzn1cE6DDfaYIB0QfNy4V1h51ZQQM2zV0MR9wcuURCQCxB/hz2rcCfByj9UUYWCs5Wc/ITYUC7RHm59FH9DOx0FdniInLNC/vI3yEem0JvxdwTahv+DYm2yKf5QvaT6lWm9KJcJLTSfwuUwe4A==;
	5:vy8cFw4ky6h7YzN43kGfEFg1sF5oK7+SM4iuJnAN/DodUSUTbQhiasLxm8aN1fC5XOBobZynEjCZyf4wDVmwtE4YoXlxvECJWGPnDhBRczkIo0kJhsRcxtEBQqP/OR1FtMOo+0hhnT2BFVt23uB7ylWtw5nW2c4TdQEKZ8JF4o7Ui82bAdgHpN6wlRhZPSW6lwrTY4NJuqjyMSNuO7X7zg==;
	7:X08PBEzvMvEbweTgR0gynjESookWHJ7jZGzgSFZ58T14R6uued0BLxAxqSFDcy/u6s9FiIaRuEwoWvD6sJ9PzaqlYk6XFAmuDsC807jcO/dD+VyRpDuFqovnEXZjBOTOuJqS6s0e/KaDu24RMQmpqQ==
x-ms-office365-filtering-correlation-id: 478b9f1d-be54-4903-0c28-08d690e3b41f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR06MB4399; 
x-ms-traffictypediagnostic: VI1PR06MB4399:
x-microsoft-antispam-prvs: <VI1PR06MB4399E344AA3A3EFA7191DDF1A6650@VI1PR06MB4399.eurprd06.prod.outlook.com>
x-forefront-prvs: 0946DC87A1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(39840400004)(376002)(346002)(366004)(136003)(189003)(199004)(68736007)(14454004)(99286004)(53936002)(5640700003)(106356001)(14444005)(71190400001)(105586002)(256004)(6436002)(52116002)(107886003)(2351001)(71200400001)(508600001)(316002)(486006)(4744005)(50226002)(1076003)(6506007)(386003)(44832011)(97736004)(8676002)(6916009)(305945005)(7736002)(81156014)(86362001)(36756003)(8936002)(6512007)(81166006)(2616005)(102836004)(26005)(25786009)(4326008)(2501003)(476003)(3846002)(6486002)(66066001)(2906002)(186003)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR06MB4399;
	H:VI1PR06MB3103.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: tbs-biometrics.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mQxmupYr0EPU6wz+KmGBbXJ6I0GQIJ6An3xti8BZsamZ4PMlwJxvqMYCyt7KC39T6TBAQNPeeb2acq3RZFBsl7f3LKuJlZ3Ptr+H0uLMl8QwPGZ+yBHNvDPwJUyNvpIFeSYIIrF4UWxV1jpoYljYKB4bXhfYXln/o9RYRmsCfe/DSwxl+I+C6/6tt33YupMtW240TytusyShNGAZIv67Y6fH4YpOQCHGZ8f1nojVMA7lqV21Nyw/A8lrVXVELcX2HfllgTOoVEKI84M8nimm9Ei61dVleuzQCxyBaSQdJJ2mJRP7lFiYIecfVstCuO4m6fHf+nYg/IlMqfFuMGRWV/L+uvCQ1CY9WS25mzPRFIm8Jh2qBinfnoacjZUSW1eTXooBTXEHojizlkrwWse0zo8CouGGg5O9MSlwsULIqLE=
MIME-Version: 1.0
X-OriginatorOrg: tbs-biometrics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478b9f1d-be54-4903-0c28-08d690e3b41f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2019 12:14:57.2953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 03c5283b-bdcc-41a6-b827-b66aa8b838e3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4399
Subject: [PATCH] icecc-env: don't raise error when icecc not installed
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
X-List-Received-Date: Wed, 13 Feb 2019 23:43:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When icecc is not installed, the `which icecc` command in icecc-env.sh
returns nonzero. This happens when environment is being sourced. When
the terminal has `set -e`, the whole script fails and terminal is
closed.

Fix this by ignoring errors from the which command.

Signed-off-by: Adam Trhon <adam.trhon@tbs-biometrics.com>
---
 .../icecc-toolchain/icecc-toolchain/icecc-env.sh                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-en=
v.sh b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
index 81b3018bb6..0dccc41c8a 100644
--- a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
+++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
@@ -21,7 +21,7 @@
 #
=20
 if [ -z "$ICECC_PATH" ]; then
-    ICECC_PATH=3D$(which icecc 2> /dev/null)
+    ICECC_PATH=3D$(which icecc 2> /dev/null || true)
 fi
=20
 if [ -n "$ICECC_PATH" ]; then
--=20
2.20.1


