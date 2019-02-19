Return-Path: <adam.trhon@tbs-biometrics.com>
X-Greylist: delayed 46794 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Feb 2019 15:44:24 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10066.outbound.protection.outlook.com [40.107.1.66])
	by mail.openembedded.org (Postfix) with ESMTP id 29BCE7CA84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tbsportal.onmicrosoft.com; s=selector1-tbsbiometrics-com0i;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=a2/O5Aq4O7dDWnjUFBgoDrosQsJAKp7edJL7xNduQ0g=;
	b=EnkgABroQ46NiELM/8Be9+NVOvZ2wR9kjDH2KHCeXmdJd5R/yhaCr5hN3YfiK6MeggNbgIwgnGpqOeUfgzPPGthGGOyrbR8iRhRoGa6xGeyJJesVKaRm//rVo9DfkvOo5xsrsoTZR0uF/0qxfx0jzesnABuNbl2IYidrPTPL+oA=
Received: from VI1PR06MB3103.eurprd06.prod.outlook.com (10.170.230.18) by
	VI1PR06MB3133.eurprd06.prod.outlook.com (10.170.230.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.18; Tue, 19 Feb 2019 09:12:22 +0000
Received: from VI1PR06MB3103.eurprd06.prod.outlook.com
	([fe80::8e9:94de:e544:83d6]) by VI1PR06MB3103.eurprd06.prod.outlook.com
	([fe80::8e9:94de:e544:83d6%3]) with mapi id 15.20.1622.018;
	Tue, 19 Feb 2019 09:12:22 +0000
From: Adam Trhon <adam.trhon@tbs-biometrics.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [thud][PATCH] icecc-env: don't raise error when icecc not
	installed
Thread-Index: AQHUyDM4sskhASCq7UmhpJ2bsCCfSw==
Date: Tue, 19 Feb 2019 09:12:22 +0000
Message-ID: <20190219091155.7666-1-adam.trhon@tbs-biometrics.com>
Accept-Language: en-GB, cs-CZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0226.eurprd07.prod.outlook.com
	(2603:10a6:802:58::29) To VI1PR06MB3103.eurprd06.prod.outlook.com
	(2603:10a6:802:c::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=adam.trhon@tbs-biometrics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [176.74.132.138]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9106fe2b-fa0b-4504-df8b-08d6964a5b2e
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR06MB3133; 
x-ms-traffictypediagnostic: VI1PR06MB3133:
x-microsoft-antispam-prvs: <VI1PR06MB3133ED125B2C2C52396C1EE9A67C0@VI1PR06MB3133.eurprd06.prod.outlook.com>
x-forefront-prvs: 09538D3531
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39830400003)(366004)(396003)(376002)(136003)(189003)(199004)(2616005)(2351001)(102836004)(486006)(4744005)(54906003)(105586002)(2501003)(106356001)(14454004)(508600001)(86362001)(6116002)(3846002)(99286004)(6506007)(476003)(5640700003)(6436002)(2906002)(386003)(53936002)(8936002)(6512007)(4326008)(26005)(25786009)(186003)(50226002)(5660300002)(97736004)(8676002)(81166006)(14444005)(256004)(81156014)(6486002)(66066001)(52116002)(36756003)(7736002)(316002)(71190400001)(44832011)(6916009)(1076003)(71200400001)(305945005)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR06MB3133;
	H:VI1PR06MB3103.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: tbs-biometrics.com does not
	designate permitted sender hosts)
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; VI1PR06MB3133;
	23:PKjXBdn2r1/Nc9PMw7GgZ6o1GGFg3RVmVuwR3Fa?=
	=?iso-8859-1?Q?y4OizwFYjIsYPuP92ZuxBs40hsSwKO+Fiy4YpCdzYjyok5HMMOXJvLieuY?=
	=?iso-8859-1?Q?cquLd3eTRiL1qpfqH7kU5F9iVIIKrFtKLi4+XSu/CmNxf8LfwuFTToZGAM?=
	=?iso-8859-1?Q?jhbIp6eubypsablh5yEqbDABmIEptATqF/lnu/TuKUXJ6hRs7lfRQC+FZS?=
	=?iso-8859-1?Q?h95y4Umx0OWUWUIfoA08j3JPcEmOoHVQXkKSP1DquEaSn1tYd99He0/cuq?=
	=?iso-8859-1?Q?5gludho/NAnqGu57pRdD9ZCEpaGXX1IjokPTAOuOeUx/5MagCKvhsR6UIT?=
	=?iso-8859-1?Q?uaFlCc2jLpBL2QKMERRnd+x8DKRYhEl0jpITHwpCqd2DNu7OvHTS/sKJ2Q?=
	=?iso-8859-1?Q?fm3goYIlkCP+gSIJ7Mu5MBAqwlN6yUKQ91HdfbViuSL+RrSNaDU0Y0QWua?=
	=?iso-8859-1?Q?NQIaYrqhD1FR6yQ4wa+iUP9ZEpFlCmBIQ+V4R4At3fJ/Ni8gGqGHSoVyEA?=
	=?iso-8859-1?Q?zArnkuJ/J8TZchAmZD3LU8gNWED3JwgekZF97LrIht1EboxhLAob+FKS74?=
	=?iso-8859-1?Q?UvA2MurXWSAeR443qBogISzTWVjq5qubmZFbWb6fKn6Gvwshzgof+a9cYa?=
	=?iso-8859-1?Q?U7Xb7ENEeG7a86apndbVg4bmZQMYZmO45Lznmed/8yxkxn0ArkH4BqhUnY?=
	=?iso-8859-1?Q?m8N1uqjqUfUavBzY4cTqxZ2+/fG/kLhmKUPL9IvnHLiLW/9iDRB4Oo8fpc?=
	=?iso-8859-1?Q?MejYPe2eMGYOrDsjxq0+caSBYeVbSbIWD4VM8Z7dXjzbkHS6tOhGCj1Kko?=
	=?iso-8859-1?Q?Gj5BXyikJMQBlJgdvge7ufIaKUT7iUaFMqlzWrE9zPgp0GPaooe3FkX736?=
	=?iso-8859-1?Q?eA/Lhr1/q6X/IphhAlB9zf+YySE2jFzwy1TCFnFKeN39xoo3lEmTHRUhEV?=
	=?iso-8859-1?Q?4+xbgMYVW1E6kbiJ3lBoz3o47UNqKWJ8E8kzYzbFms5jNZ6+GIjdbTidO/?=
	=?iso-8859-1?Q?F8Q0D7tHSYWo8B+LZ5nxsvG7EBKuT7NXO7U6SMs3vx4hnxIWQZj3bbXrwD?=
	=?iso-8859-1?Q?QbM1ws1jzqyisilDwyeEP8KcwP4BEPjSmEizogNgUyUm7gCPGdvdvv6ZE9?=
	=?iso-8859-1?Q?9cb1zQ366Cha+wI3LfaU52CAZUYdSMeVMNoTAPduRYEitnzGHpjF7kp8/m?=
	=?iso-8859-1?Q?r2zk4SuvwqqSsq2Vr0YSruYBnlnUj8SyPPNzuyDbGC5il1oja3fjhrsP7l?=
	=?iso-8859-1?Q?0ACnzH3O7P3r6sEBNY8LYgy9sp6qswZd9tiJ3YdSS41LwuI+V2T1CKPCPn?=
	=?iso-8859-1?Q?eppUhXkk82+Tz2Bg8RkaW9j?=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Wol19d55axXPKfgMQhVlluro1kWKB3bZfj4j1AaBMNzMDnggXH27ZkIbPFZIo+t+PMTS6MjzGf/bO9FxduKYs6toG21UozbQFvVtKpmnLvA6PIrjjJu9nUDrztCkHfwtTQCW4SD+U7inHT4h63FjQn5IgqKHlMsHDunR0mS4+NC54hc+Nw1zId0sZG0G3aKsdbWHv2vPaq1xT/LCK+oKUMqu2k7JxhpIEpny+4rBAgED9FxvOD3ZCFsnWeCpQkYcBrqnIHZfAG4X2Ft1MCZt/U7J25C2j7Bakcu2gKnluFKpZffE6rvZrJ5d1gh+2ojF0uQhmaiCHIvr8Ju78VnodunFh0xNTKlLzaohdURaP1cYXEkwlXrXT9RlmsopKFr9hc06jmK15u9Fnl05ScNa5xuqnK7WUCo81nb+DCCICyY=
MIME-Version: 1.0
X-OriginatorOrg: tbs-biometrics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9106fe2b-fa0b-4504-df8b-08d6964a5b2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2019 09:12:22.0468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 03c5283b-bdcc-41a6-b827-b66aa8b838e3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB3133
Subject: [thud][PATCH] icecc-env: don't raise error when icecc not installed
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
X-List-Received-Date: Wed, 20 Feb 2019 15:44:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When icecc is not installed, the `which icecc` command in icecc-env.sh
returns nonzero. This happens when environment is being sourced. When
the terminal has `set -e`, the whole script fails and terminal is
closed.

Fix this by ignoring errors from the which command.

Signed-off-by: Adam Trhon <adam.trhon@tbs-biometrics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


