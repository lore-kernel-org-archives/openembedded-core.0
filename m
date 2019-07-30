Return-Path: <jlock@vmware.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720075.outbound.protection.outlook.com [40.107.72.75])
	by mail.openembedded.org (Postfix) with ESMTP id 9E4DE7E265
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 13:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=k1GmpYtBhReSkRbQlF+Cnbcfuo0NS0WMOPq1xZJcr4f6uH34Ka+zBgy37EcUPSVy52uZeIUSPXz2+xsXriFE++T+OHlEojmPKv/kHpxkLHqtMHXMLA5h74tkpHMNu4DpaB1xacr5s+CK3vmUPwybugZsxdBu0HpRSWkQN4cp9Ek4I6Qs07/ly1tbx2zhQWsM335pMeLD/gTWP1Gm1G6au7kcDLZTZY4Fv4/U8bjN+EfTs1rRnU5ZyxWyHkhtyycLc3whw4NcCdznkMg7U7iLRsT3JfgO6+bHoSoOai9GmZKZs3EV8iHFjr7DS8yKAweM8ViFxZwwtdNBQcJUImOpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XKjc2x+uzEXw9QEnDkuFPl1CMyWwEWjtpK6NhF5W1Lo=;
	b=mZn4aA++MJKpoDRAvGkZFFXsmMU2C/z8IuH87GI+TN0GrGgBO2LFksyZswGntMTypCPQUcWUep3sLcwIz93OijDqXafjCnnzDvQOkkPBXMRQJZBzzX8GAdVuPx1B40xwwEe5nqGQnNRx4IcCA+/8CF/8+ygfGj67yz4i2YdKYuHiKvSlbUI4w03glAARhWtdoT7cXRV6y5W4ZgGy171w4pgR+kNLC7nvqGJhzYMBWABIPceNMqwM3KyUM/veFr+yFW6c0xEq3zgT8T7aVDfbHvUtyhVUriUzXfs9TNrQ1nkBS9a7bj2M3Z6N0kWvZDWUYiW0A9R8HABgDLQHuzlxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=vmware.com;dmarc=pass action=none
	header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XKjc2x+uzEXw9QEnDkuFPl1CMyWwEWjtpK6NhF5W1Lo=;
	b=MYmL9mNdaBA4V4Fi+6Wx8L3WNNK9SO+fjFxNV3WL2aUexwHNqiGygOxN/pTidAd8RUt42LUffDTl5n89O5x5/X/mz3MT+LYW30RD4uvQd91cND7xVTX0bS43BllCJ2+gZ4MteAd1GHs7V1DcE/27mKAnnvnE2ucajqv+OuRK1kk=
Received: from CO2PR05MB2645.namprd05.prod.outlook.com (10.166.91.154) by
	CO2PR05MB2662.namprd05.prod.outlook.com (10.166.95.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.12; Tue, 30 Jul 2019 13:16:04 +0000
Received: from CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59]) by
	CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59%5]) with mapi id 15.20.2136.010;
	Tue, 30 Jul 2019 13:16:04 +0000
From: Joshua Lock <jlock@vmware.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2 0/3] Enforce Shared State Signing when optionsset
Thread-Index: AQHVRtjwvpOO2I4kBkyTF8Bu5ybVTA==
Date: Tue, 30 Jul 2019 13:16:03 +0000
Message-ID: <cover.1564487218.git.jlock@vmware.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0020.eurprd07.prod.outlook.com
	(2603:10a6:6:2d::30) To CO2PR05MB2645.namprd05.prod.outlook.com
	(2603:10b6:102:8::26)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jlock@vmware.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [212.140.202.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 622fa1bb-02e2-4689-b267-08d714f012be
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CO2PR05MB2662; 
x-ms-traffictypediagnostic: CO2PR05MB2662:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CO2PR05MB266252FEE299A57E4E8111CCCEDC0@CO2PR05MB2662.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(189003)(199004)(478600001)(6512007)(256004)(14444005)(81156014)(2351001)(316002)(966005)(6306002)(5640700003)(476003)(486006)(7736002)(6486002)(50226002)(6436002)(305945005)(66476007)(2616005)(53936002)(2501003)(14454004)(6916009)(66556008)(64756008)(66446008)(2906002)(66946007)(68736007)(8936002)(6116002)(3846002)(25786009)(26005)(86362001)(102836004)(6506007)(386003)(36756003)(66066001)(52116002)(99286004)(81166006)(71200400001)(5660300002)(71190400001)(186003)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR05MB2662;
	H:CO2PR05MB2645.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d3mKWZMYqMSW+uUNjceGOBYQEFEgKTEPcu8NNRCi8bzAe30ocLwloPl86geCPUYgAxlxSl46/vx3tScA9IzBruNJQ/OgBgmQj7bOQYjXkZLwmvqQFS27PpcoLuJms4QwVdwsznFPNLQRZLAIBKr9hWL+hB2c+TU1XLS/n7AnN9+HnXWLxAV56WKfOUO514K4/0mGbSwadkIkFFH9AGrLEgvIlYcjW5JX/n5tsddSknCkJaSK4lKUpWzXQWOKby8MNoeS+L03H881k7z+PApCMwmPKBcgZzQTzvoXZ2Idv+AppcECULgW22IsuzBfM3X9f2quhiY6d8yjx5VwJYbaNDkNi2HEUV/862XW2H86UDCcowA8xDtISErs1HhZdb5x6pJRS9lb7Awv57cbBBa+R8KrtNUoSUYsDTJQ0Z7PePk=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622fa1bb-02e2-4689-b267-08d714f012be
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:16:04.0516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlock@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR05MB2662
Subject: [PATCH v2 0/3] Enforce Shared State Signing when optionsset
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
X-List-Received-Date: Tue, 30 Jul 2019 13:16:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

There are 2 surprising behaviours in the current shared state signing
implementation which this pull request addresses:
1) when signature verification is enabled a failure to verify doesn't preve=
nt
   the shared state object from being used. A warning is printed and the
   unsigned shared state object is used to accelerate the task.
2) when signing is enabled the taskhash doesn't change and any existing,
   unsigned, shared state objects will not be signed. This is particularly
   problematic when combined with 1.

Please review the following changes for suitability for inclusion. If you h=
ave
any objections or suggestions for improvement, please respond to the patche=
s. If
you agree with the changes, please provide your Acked-by.

Changes since v1:
* removed spurious Python subclass class and handling of an error condition=
 that
  couldn't occur

The following changes since commit 835f7eac0610325e906591cd81890bebe8627580=
:

  meta/lib/oeqa: Test for bootimg-biosplusefi Source (2019-07-23 22:26:28 +=
0100)

are available in the Git repository at:

  https://github.com/joshuagl/poky joshuagl/signed-sstate2
  https://github.com/joshuagl/poky/tree/joshuagl/signed-sstate2

Joshua Lock (3):
  sstate: fix log message
  classes/sstate: don't use unsigned sstate when verification enabled
  classes/sstate: regenerate sstate when signing enabled

 meta/classes/sstate.bbclass | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

--=20
2.21.0


