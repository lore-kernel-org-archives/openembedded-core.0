Return-Path: <Diego.SantaCruz@spinetix.com>
X-Greylist: delayed 69554 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 09 Feb 2019 18:54:59 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140089.outbound.protection.outlook.com [40.107.14.89])
	by mail.openembedded.org (Postfix) with ESMTP id CF42A7C5B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 18:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zz1UOJ9vebw6oBkIT3Rdy4rgTZGkBIAEp/NblFcezyE=;
	b=otl12+O8dOAmcUjr4nrfH6Ar8eFhpB6bbsDSYTtvQbEQVIl451SG3yNXj0ATrKK+4bRY+7YOU24EMinXwXBey4bxIOhwvKhSM3vQEvMu8q2ImY71izGS7Kfap9PfflDbBR/GaytgKb0mRNK/1tcfNvrWuEzLU4V5uYfaMJ9/9xQ=
Received: from VI1PR01MB5167.eurprd01.prod.exchangelabs.com (20.178.120.225)
	by VI1PR01MB5343.eurprd01.prod.exchangelabs.com (20.178.122.97) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1601.19;
	Fri, 8 Feb 2019 20:29:31 +0000
Received: from VI1PR01MB5167.eurprd01.prod.exchangelabs.com
	([fe80::f933:d84e:cb4c:71be]) by
	VI1PR01MB5167.eurprd01.prod.exchangelabs.com
	([fe80::f933:d84e:cb4c:71be%5]) with mapi id 15.20.1601.016;
	Fri, 8 Feb 2019 20:29:31 +0000
From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Problem with blocked signals in daemons started from rpm
	postinstall scriptlet
Thread-Index: AdS/67mdnLMJ4wCyS5atu3K3O4lGXg==
Date: Fri, 8 Feb 2019 20:29:31 +0000
Message-ID: <VI1PR01MB51675AC59E6B6C4D17536D3F88690@VI1PR01MB5167.eurprd01.prod.exchangelabs.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Diego.SantaCruz@spinetix.com; 
x-originating-ip: [85.7.98.37]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR01MB5343;
	6:mxOsfZut0mlJjR/rnMiTGoU0MfQeCfxej/ZVNi/LoNFdjZ2UdVmP3z3AyAGCj2qUiolcHBtt+Py9kCSipJrgWmwlXu8nGLpGfRNoEZkBB9UvaOM597cYDmvQU8f9to5YeCYTb2Lyhc4t2vwQ+mHt050JOkQtXRF077W+EYNHomiycHadl/ZrQ0j1N+4/6GMgVdxbypE8OxhNVjWRjH/w2vdXxfjsimMFN4HBdadAILa6KpNFvYzsp1qLUvb9psxEpSKuZ7op+m4OdMPymoPH7ScJ7vEr+M1tt9DdbTs5TI4dZaZx2QQf1DJBYqUhVVgxES37PIqe2MRic6Epq9xY7xiE14MS3vqK6FwjTbocr7Tf/wC/xZ0hX85STwnqceE2MhyHn0wvfP5C9D+s1KFUNrQFlPp/TzYSxRGAqaW/ySj9yLVI++UaekFOzfjXYiE/xyPsDYsg8ulsGFZCEhdyBQ==;
	5:yZ2R7Ic/uUVvooeCx4kT+Ja8noCFj5sm2W2t0fVooN1XHQg4feMAvPKVuHKiGZC8hEIEwtSwdXJVm7Q2WEjBhhVeL7bTaHO83insGK/YgjAydLA9SAdMu1cA1gxcdQ/yM3GYQmq66V3AKpQPiDJ4h+QhQ/bCXcztEsW+TLhUVbvz4x7vZUY56YhYu0mOurLFlmlRaDFk2F90LcxeBsYtUg==;
	7:rSQN8sccqHl4RCYLmpRL86c7FTjyGH0zoLRUGdrzEsFeAwo3AGNGGLoDtZb7yxS2wNjq7NF/8iDhuDssrUzX6IxezLSJ4pA6p1sw0mLpsafr1qqrDGS4uZHPx1y+Icu+/tmvC7bAKJii5GrnyC1BCA==
x-ms-office365-filtering-correlation-id: 04e53374-eede-4dac-d808-08d68e0421e3
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR01MB5343; 
X-MS-TrafficTypeDiagnostic: VI1PR01MB5343:|VI1PR01MB5343:
x-microsoft-antispam-prvs: <VI1PR01MB5343D03CE1F480E1E6DAC01188690@VI1PR01MB5343.eurprd01.prod.exchangelabs.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(396003)(136003)(346002)(39830400003)(366004)(376002)(189003)(199004)(25786009)(2906002)(97736004)(6436002)(14454004)(508600001)(3846002)(4744005)(66066001)(71200400001)(71190400001)(72206003)(86362001)(476003)(486006)(6116002)(15650500001)(33656002)(55016002)(7736002)(8676002)(74316002)(316002)(305945005)(53936002)(6506007)(81166006)(81156014)(5640700003)(8936002)(9686003)(106356001)(2351001)(256004)(14444005)(2501003)(68736007)(105586002)(186003)(102836004)(26005)(6916009)(7696005)(99286004)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR01MB5343;
	H:VI1PR01MB5167.eurprd01.prod.exchangelabs.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: spinetix.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jNA0eraY9pUzrFoLfjFW7y8fej96V0J9PiEx0FWXv5/oXQ1lXPQOfpAhIvaL7omE9YTKkIbz4+teTVIcHGuoIv9tmJUjqxBNJmrGNh6tRE+Ph0Vn261Qn2tq465Uf/BUYB7pslj2F62sbCKPzZ5B3VLb899IZ5Z++5GibrgCUR7J/M2qqKIUhwWHbcMdC24ex6sL+qDj6J7WdkhFzaUg62r/0Zu7aP5dlQ8+rCy0A4yi4E6GFXMH9DvjClT7LXLPolp79o0AmuB++OqU082xOaCXz5kiVLhNqHDPANJa1sOroPoHV0iHRuF0EleVYV0IdjFDHA6LmsjB5eD7KaPxmMkP0aTujZxTsPvpFUho27HUJ5bJc52gRlhVH7YX0QS8deEpvEi512YOjCyS8Kk/zDz7fWSlMRU9NhxTQtr/55I=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e53374-eede-4dac-d808-08d68e0421e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 20:29:31.7376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB5343
X-Microsoft-Exchange-Diagnostics: 1; VI1PR01MB5343;
	23:5aghCBS2GYq0BcWZ+CI8mhiG2N4tAUTqw4xKVWKGoNvR0wy8NAnIBlUmYi3n9/yWeZn9bNzO2IRXt3vVp4/5poeYfwpC0m1doc21t7jYVb9Cvl++rZA+wpl4cEBenDl0Lz8OlLLnsn9tHZLYeylWxw==
X-OriginatorOrg: spinetix.com
Subject: Problem with blocked signals in daemons started from rpm postinstall scriptlet
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
X-List-Received-Date: Sat, 09 Feb 2019 18:55:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi there,

I am having problems with daemons that get started from the rpm postinstall=
 scriptlet, via update-rc.d, that they cannot be killed. Investigating I di=
scovered that they have most signals blocked. My guess is that rpm blocks a=
lmost all signals so that scriptlets do not fail, but as the signal mask is=
 inherited across fork and exec the daemons end up being blocked. Looking a=
t update-rc.d it is a simple shell script which does not reset the signal m=
ask, so any daemons started from there inherit the signal mask.

Even worse, things like ntp which rely on SIGALRM fail to work properly whe=
n started from the postinstall scriptlet.

Any ideas on how could this be solved, I am considering tweaking update-rc.=
d to ignore the -s option as a workaround, at least it avoids the issue and=
 anyhow in my setup I always reboot after installing or updating packages. =
Any other ideas?

Sincerely,

--=20
Diego Santa Cruz, PhD
Technology Architect
spinetix.com


