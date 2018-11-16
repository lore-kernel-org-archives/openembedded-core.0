Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 50322 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Nov 2018 04:11:48 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140073.outbound.protection.outlook.com [40.107.14.73])
	by mail.openembedded.org (Postfix) with ESMTP id 970B16C12E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 04:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1e+s6bfv5fs4ZLoae1J8nHaANeFu3IV6uQYWVSfckNA=;
	b=gcD+quBU/7YB/ZHPca9r+pUeYawlWrBYigETmN+4eLskqTkzFrJS+1mwOnoUOgzpPdEDdSq7fpNWchxEdftKaHHiCgjO7O+/mmnDgqqengfZ6VmNSHRgtWciaRadJZPV5beFdlIAc9rKwMywR0wH64gFjeLXzsmIomSU/P9YwwU=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4090.eurprd04.prod.outlook.com (52.135.130.31) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Fri, 16 Nov 2018 03:40:00 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::891a:cab2:b71c:5651]) by
	DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::891a:cab2:b71c:5651%2]) with mapi id 15.20.1339.021;
	Fri, 16 Nov 2018 03:40:00 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [thud][PATCH] ppce500v2: remove spe *The PowerPC SPE support is
	split off to a separate powerpcspe port
Thread-Index: AQHUfV4NJ1zisrMUUUOsQ7S5buwl+A==
Date: Fri, 16 Nov 2018 03:40:00 +0000
Message-ID: <1542339582-13778-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0020.APCP153.PROD.OUTLOOK.COM
	(2603:1096:203:18::32) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR04MB4090;
	6:tWN/K3ZYoxdVFB6f/qph7kCT4PgqIgdNtEY4sG+VR7fxfBjeX8nRyHd8UGgD/dvdzz+Uaq1CncLDyWWj6GSsCsA20FAGFkR3yrnbiY+i4LvdxzKC5bycolvr2Psi46xJuC+kuGe/C2g9cFtiHRIn3Zy8mAlGkRnVQDhRokhT+IZIOFYfJW81LYs4xFR7j7AKD9cZzpKCW5aRlh3g7y47pHB6A/uYqk7L/5OSP+iG1EcLjLmBZR5yNJkPfHmosykilP8NkYiew/kLCdHDJjKGFLONEcziX0AMUZoU8fOM58q55TgFQtP1J+9ILz+UbSXWvE/TvcOCFX600K2a/QGn+KJWL6pVlEafZkbnYHZs5yLFiSjzJJgSR10vzNDhWfHNnMMcsHHrwx/7JEtqRKqNNQgVJ5XKn8TOls9ZxfnNZjzXB+UThPLidCtFAiCvG73fTQNNR+XckLnX1w1DqpNytw==;
	5:0O0mH2c0GjcLM/72YxAWoWe1CDDRKRyPKPpsXGGK9BqEC31R+08mfyM4NLZwpcUwNpjdmiLmUCybiGUNEXYH1YLQ1Uz+EQA08bnCzO84kONpAqNj4R4oRKl1FkzVpdMRb/bvqS9ZWUo/LqLEKqumWjy8VLnGwcvWQHmYV1RI/5o=;
	7:p3XQ5E/eczUwGd8nqc0bBuGua1s/LL+0QGdW4NOVqgdTy1N5aUnKlu9czc8c+wj3NNCcXhgLf4R73A1fXQWjhFysQObbTDde/so9kVSDcoOvypbgVUyLPp5lW0v6IePdum1Ev+zc6ORF8CBfW2J1Uw==
x-ms-office365-filtering-correlation-id: edeffdfd-cb2b-48ab-fa08-08d64b752f86
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4090; 
x-ms-traffictypediagnostic: DB7PR04MB4090:
x-microsoft-antispam-prvs: <DB7PR04MB409038A25F1AB77C8E3775DF84DD0@DB7PR04MB4090.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231415)(944501410)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DB7PR04MB4090; BCL:0; PCL:0; RULEID:; SRVR:DB7PR04MB4090; 
x-forefront-prvs: 0858FF8026
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(396003)(366004)(39860400002)(136003)(376002)(199004)(189003)(105586002)(14454004)(1857600001)(81156014)(81166006)(3846002)(186003)(8676002)(6116002)(106356001)(68736007)(6486002)(5660300001)(6916009)(26005)(386003)(6506007)(36756003)(316002)(102836004)(66066001)(256004)(14444005)(6436002)(2351001)(2900100001)(86362001)(52116002)(5640700003)(2501003)(476003)(478600001)(486006)(99286004)(53936002)(305945005)(71200400001)(2906002)(8936002)(2616005)(6512007)(97736004)(25786009)(4326008)(7736002)(71190400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4090;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: MHaqFqgIjlk0Ygjj5ojva1xui5HoLZG+J1iSXrV78znd/8b5tkWN5kJy9cVFjg51Fj3b8mTisRsFct3YkuqLH4aU9opcr7WyBKgU10owscag3LpOQ7WhpW+dOOaYrJycz4a93eJExL2qOv+6lpuFLPH+cPLDKFI6JszFl3+yx1rHMPrq9ASf1fAAX+3gW0siYU0lEV+A7QaxdbuPSfFzlTNF+HfkJxuVXhDXri8wk1I+fBKLlY8qJoA/I35xHaJ4VW4lnZSvLUQxUeXV38X0wRwnXa56E8Xbu3qInUMj/fi+1PXxvZ024ER6LK5pc/AIMHljaHJ4uPmW4Z9+diTpD1hwNamm9moTvCDjfAOcGZw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edeffdfd-cb2b-48ab-fa08-08d64b752f86
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2018 03:40:00.8417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4090
Subject: [thud][PATCH] ppce500v2: remove spe *The PowerPC SPE support is split off to a separate powerpcspe port
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
X-List-Received-Date: Fri, 16 Nov 2018 04:11:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Chunrong Guo <chunrong.guo@nxp.com>

(From OE-Core rev: c67bc9bdcbcf46ed54dfbafd1bb6e405ed77f86a)

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/conf/machine/include/tune-ppce500v2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machi=
ne/include/tune-ppce500v2.inc
index 3a006e2..d318bba 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -15,6 +15,6 @@ SPEABIEXTENSION =3D "${@bb.utils.filter('TUNE_FEATURES', =
'spe', d)}"
 ABIEXTENSION .=3D "${SPEABIEXTENSION}"
=20
 AVAILTUNES +=3D "ppce500v2"
-TUNE_FEATURES_tune-ppce500v2 =3D "m32 spe ppce500v2"
+TUNE_FEATURES_tune-ppce500v2 =3D "m32 ppce500v2"
 TUNE_PKGARCH_tune-ppce500v2 =3D "ppce500v2"
 PACKAGE_EXTRA_ARCHS_tune-ppce500v2 =3D "ppce500v2"
--=20
2.7.4


