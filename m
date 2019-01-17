Return-Path: <prvs=9132d74bb=Alistair.Francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id AD66879C9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 00:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547685112; x=1579221112;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=TkLsbNXRwEPcw7swWr8uW/D/apJ/p6Y7lOP35Fajfv0=;
	b=gGEeCeegYaPIwg3G/8+UxWXk4eaemOeHHe/7UTKZ2FS1I3II0uvXtCH5
	kWN0nrX11Jt3xreQxXNw270Xk5Stw0PLsp7MhAllF8VK0ESm0otPg5fE9
	pTIZn7gdGFF8d4arX4B/qsjxka/xG6J9AlGlz0OuLw96MkfRqgHiEjBGX
	gO7xBRa2FZp2E5WPNsRpR2T0IbquIn12AI/4bmvzP7TExJZKuhd12htX3
	o1VaWNqiAkehQy4y0iq6p8HQuQV/Agv+c2KGujcO4194G8yf4Pf5XiGzy
	08wjR+rw1J5mxno6OslLg+5SH3UP8WxlHHCrhk/yBEAcyaVbmaTo9tX3G A==;
X-IronPort-AV: E=Sophos;i="5.56,488,1539619200"; d="scan'208";a="203939438"
Received: from mail-dm3nam05lp2054.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.54])
	by ob1.hgst.iphmx.com with ESMTP; 17 Jan 2019 08:31:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TkLsbNXRwEPcw7swWr8uW/D/apJ/p6Y7lOP35Fajfv0=;
	b=nEhiyKOqyqVcPVPX0pl4/6rvtr5Nb3BS9PtFN/AEzFKPYLYP7gP/bvhCRlhFWLHetKTZCqZj+8XyaZD4s7VaRHGfkCi0Yv26TxfYV+Ke35bFnIOkGTggnCbctbO4nGFoQTaPYDH0NMPyO1fJN0ysfbICODd6tyPhSzkxuzRKLz4=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0448.namprd04.prod.outlook.com (10.173.48.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.25; Thu, 17 Jan 2019 00:31:50 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Thu, 17 Jan 2019 00:31:50 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] libxpm: add explicit gettext-native dependency
Thread-Index: AQHUrfwJIsFLa3aG3kKp89yQ1HLyLQ==
Date: Thu, 17 Jan 2019 00:31:49 +0000
Message-ID: <20190117003142.20122-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0026.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::39) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0448;
	6:zK0cC/TTgR7/6hI4z9SwNHBFotF2z1VthfRT/1HJ9bbkU4xYkyjRg5Upp+MqZK3XEy3lDjMCYqkNdjYcQibgCxWoyFyKF0I9KRzvGfhWQqN5cnZ2pooYpJuxcuDF6f/x/KeQs7YaMsjED0ZrG38Yf2MDhaKGwxhZwQzVbuDEbwQJOXIfAFZukJDFVPvCWMQiisOYUsvKKmSOGNLrfmPcBULTVK+/l2YkkIJas9kWtpthRKP92ebldUlH8FrbEXl0vKdj4RFz2LPA+L2v4rX/b1xLDChiU1IlqGdadtjiZXRlNt3wuhHan9I+u0sMwQGN6rPyCEOn8dWGi1CLowR2HoTUDY91Xyx6MWo7Qjjf8MP3KstR2uBHJ5c3gg5Ezpj7O/DHQbaVqa17v7qEvAmPi1caYbWISLpGiDx8/lwg2CH/FS/0acRTEN1zqzUy72ZZGdT6ZNw3AXBOh/aTxma1Kw==;
	5:6ezw2dbj0+aari4EIo5MWXmAHl3A9GGdTSTHxuuenJXRkZS1tadkgege72GyyeyFL/gToCnKRUx4jlXW9M5Juy1HVh5Ol0LqOpWc7FvL20HRh7oeIUgGiZ3ZdfS/bcxdaplwAXm1fKxkefkA/5Vz5k6uY3xxRxGt71LybQ5MLFELBmamhBRaXcSzcH+ZAjsrgGGL+59S2NtJml6gUSlGew==;
	7:gPMD6KAm8P2l/eQYXkBl0PCwg7NsRdPSuT1bJ6tFUr3UeY2rtwAN+raDfPVrW1H1Q9uJhzM0Hh3w2S8p0BaPqam68DxYFfqaZdyTzZxiHCoxy2wX6RIBj+9/u6rCqorl/4VzREYqvMonBAsG89aXUw==
x-ms-office365-filtering-correlation-id: 9b5a38a0-0be5-4526-e927-08d67c132b9f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0448; 
x-ms-traffictypediagnostic: MWHPR04MB0448:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB04488A7613E7B5BFB6BEEF7290830@MWHPR04MB0448.namprd04.prod.outlook.com>
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(376002)(366004)(39860400002)(346002)(396003)(189003)(199004)(105586002)(2351001)(72206003)(6916009)(5660300001)(106356001)(478600001)(66066001)(5640700003)(97736004)(36756003)(68736007)(14454004)(6436002)(71200400001)(7736002)(2906002)(39060400002)(53936002)(86362001)(71190400001)(4326008)(386003)(99286004)(186003)(81156014)(102836004)(3846002)(26005)(305945005)(54906003)(6506007)(1076003)(25786009)(44832011)(14444005)(256004)(476003)(8936002)(2616005)(486006)(316002)(2501003)(4744005)(6512007)(8676002)(50226002)(6486002)(52116002)(6116002)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0448;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7vy+BsFcx8raoDVWBO1+glWs68v+0DX/giGMh0lD0AsBN77Rtuj630qBG/+WZgU/5yvT3bGsX74SvZo3a73TfIybDg78YYEXzDJ/rXHlHEq3g3WtPhfQV7KO8nG5DjU1CUqEXLkes9xXRsGwI5N68iYbW9SxkRXfcCG3r4qI4+/4b/vKae3tayaM+sKGhUwsi/hGlfRvsOAucHmGm+mAx1bb4ZF8R99028kZMrX91P6/Xy7tChU5x3VjnZTsv8AsI2o2Joh902iFgWd9zNypmhoKYPbpZBfK68vkfX1QvwkwcImx3rH0NYKdidYohVIm7yh0lkAGeIFEalUhAbXQLH7h/7DNAI/hDqpsoG0sivegEBuoIVEUJ+iQ5arj94IS8od0qtzyOV306YYLLkZpWP1GZfbqRFTy5fPwg8JrJ2Q=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5a38a0-0be5-4526-e927-08d67c132b9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 00:31:49.6305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0448
Subject: [PATCH] libxpm: add explicit gettext-native dependency
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
X-List-Received-Date: Thu, 17 Jan 2019 00:31:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

In an issue similar to "atk: add explicit gettext-native dependency"
(964ea8bfc455f6017dc834104d96b8f5aa40a5bc) we need to add gettext-native
to DEPENDS explicitly as the gettext class reduces dependencies in
native builds.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb b/meta/recipes=
-graphics/xorg-lib/libxpm_3.5.12.bb
index 13a1b919ed..57b202cae3 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb
@@ -12,7 +12,7 @@ protocol."
=20
 LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D51f4270b012ecd4ab1a164f5f4ed6cf=
7"
-DEPENDS +=3D "libxext libsm libxt"
+DEPENDS +=3D "libxext libsm libxt gettext-native"
 PE =3D "1"
=20
 XORG_PN =3D "libXpm"
--=20
2.19.1


