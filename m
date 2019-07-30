Return-Path: <jlock@vmware.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720075.outbound.protection.outlook.com [40.107.72.75])
	by mail.openembedded.org (Postfix) with ESMTP id BB0C27F2C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 13:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=nbQRn7cfpFfKHwd1R1JxNEjClOT9aJRx+sKeEUleUriVWkSIVw5ndP5RLp+n6WcWP0IlgGeCVvqCV0BxqMDn46ztBXN2YKoF1yO9Ce74Mo6SQ85RA3GDqExVCHkhIlwmKik0Ay0+Q5xMR/BL8VKbRb7l7SnhBZ6rvADGuMgGWF7oGJUz5IbuQC0xyiFhj+6znr9b1ZDCfKOtOiUFWKJQESHvbAl8RMHjI4YFyjr6WKFfnr31rkr3gbs18JmAujEnDArqHq8ouvd9Hwskm2egSjCOHf4FnxIj4lQt1OpOidqckXHXwI/Vz1OXmZCyiRNK1eCZCxaC6bkqmRG3SuOC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=On2PiaCQIlkzX2qQomA9qZS6YBq0hbCkUD7qNO439dA=;
	b=Wupt01pEdCPrHoqXWqS7QP+/j6lGxFWP2cinq0cwyZy0u6kD5rvU1tkdz+0dz0Ywxlsq/spq7XCfK0G7jlRWUuQ1qIgRga/PNLr6sEqaCDyIAnQQ1jc/6M74V/+cDxQw2a6UDOUcFx/2B7rVjMv+rie0fftPKxLA1x8MMiT+/s9QHhRq+lNPPnF5B5R7DXf9s/qGo9fN1gB8ofwUpBPPdAKpJoRiPLU+gl+1XbnN3tvP7oGYwiocN84++Ve+el/JRVWIGoBHOiptScKjnV0idb9GFCDQ6yW0u7uahEEVIu8jNvqqH6oSfCfbEG0GJdk6W49qGPap9SOlgb83rClDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=vmware.com;dmarc=pass action=none
	header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=On2PiaCQIlkzX2qQomA9qZS6YBq0hbCkUD7qNO439dA=;
	b=VKSdg7jR5NUlBJG5kTeOhw7DQo/esq0lWzKD8ABYAuPepb2sc/U0vp1OupahnRzNgTYGC7oAzm3TPbpd+PVueKt5n18D19r46J/DhvMzFKAjlUpED0YV9VmOGPZGAAE4uH0a3i21aEUVam9E0DmtxmpT8nlygbwvApmuTmr4ZiM=
Received: from CO2PR05MB2645.namprd05.prod.outlook.com (10.166.91.154) by
	CO2PR05MB2662.namprd05.prod.outlook.com (10.166.95.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.12; Tue, 30 Jul 2019 13:16:05 +0000
Received: from CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59]) by
	CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59%5]) with mapi id 15.20.2136.010;
	Tue, 30 Jul 2019 13:16:05 +0000
From: Joshua Lock <jlock@vmware.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2 1/3] sstate: fix log message
Thread-Index: AQHVRtjxtsS7MCRRTU2znCwJWGtuhA==
Date: Tue, 30 Jul 2019 13:16:05 +0000
Message-ID: <797e4bdaec90a43d8e4614fb3ee4091cbdbf89bd.1564487218.git.jlock@vmware.com>
References: <cover.1564487218.git.jlock@vmware.com>
In-Reply-To: <cover.1564487218.git.jlock@vmware.com>
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
x-ms-office365-filtering-correlation-id: 46c01f5c-f0ac-444e-fbc2-08d714f013af
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CO2PR05MB2662; 
x-ms-traffictypediagnostic: CO2PR05MB2662:
x-microsoft-antispam-prvs: <CO2PR05MB26627703AC0FDE66D5D749BDCEDC0@CO2PR05MB2662.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(189003)(199004)(4744005)(478600001)(6512007)(256004)(14444005)(81156014)(2351001)(316002)(5640700003)(476003)(486006)(7736002)(446003)(11346002)(6486002)(50226002)(6436002)(305945005)(66476007)(2616005)(53936002)(2501003)(14454004)(6916009)(66556008)(64756008)(66446008)(2906002)(66946007)(68736007)(8936002)(6116002)(3846002)(118296001)(25786009)(26005)(86362001)(102836004)(6506007)(386003)(36756003)(66066001)(52116002)(99286004)(81166006)(71200400001)(5660300002)(71190400001)(186003)(76176011)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR05MB2662;
	H:CO2PR05MB2645.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wXyTPlw/j3G7JQQ/mIxkcd1HcrQVTGGUIOOn/lI1Lu/uFCRe6sLJg0SVQOnEQD5j0LrkVq8khA4TgAYtgQmWXU7O8k8LG02JQFEyWE2lBNaNRQw3sA9bYacHgK/xDYGUO+eaVe51ahBE4X252KyDxFTWsGoalC2xcLTCT6HmdxJSXKNW7rEMN0TxazhO+6zXyilH5gl6at6hXyhUG9T2bDHj6xEbszSGtZpZo71mZzh2vv3NJGnl7Mt9WQfMidVljUMjKvgtalvederw8gFpsFGhbJIxAwJJuPCpFiA0WvYc6uANF4IOvkVRaOlxALGI4A7XN9z2H1SOrSOr1a4Ctb3L3+AvZZNIcM7XKN77AL/nY5XKY0Hwa7Bu4ys9qlylu/jTJIFTCGeQmRuvfl3kUswpGcyqgk1AYDGquudDBKY=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c01f5c-f0ac-444e-fbc2-08d714f013af
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:16:05.5259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlock@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR05MB2662
Subject: [PATCH v2 1/3] sstate: fix log message
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

Referring to the sstate object as a staging package is an artefact of the
code's origins. Switch to referring to an "Sstate package" in order to be m=
ore
accurate and consistent with the rest of the file.

Signed-off-by: Joshua Lock <jlock@vmware.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b604729d84..d8fdcece6a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -329,7 +329,7 @@ def sstate_installpkg(ss, d):
         pstaging_fetch(sstatefetch, d)
=20
     if not os.path.isfile(sstatepkg):
-        bb.note("Staging package %s does not exist" % sstatepkg)
+        bb.note("Sstate package %s does not exist" % sstatepkg)
         return False
=20
     sstate_clean(ss, d)
--=20
2.21.0


