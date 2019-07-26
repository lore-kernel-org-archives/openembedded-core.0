Return-Path: <jlock@vmware.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820073.outbound.protection.outlook.com [40.107.82.73])
	by mail.openembedded.org (Postfix) with ESMTP id 848F87E26B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 11:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=QB43X4k01f3JT/CQuBSrZeOXNpVxJzrRQWWILGKAsQWrlGe4Zw/lJXzRtZms5Xh8awGFNHcsCKSjs9Ge0tYTjjrgth7TwV7IAvaY/80Cw6rQAT7BN/sWvGBUq2rEa9+bqHdJk8DW7Od5SpDQFtPkSlEdcBcJ00ONf3CXseFue47ISqVpiX5gE1hbGyHS6RGdyode+d2eh9chhxzAmE82w2JkRXtR3WJhW85Htsp8T7feVVKoex/L5fEbQdEH47C4b0uJcp+XMAv14aYNVXNR1CHhtd3ur5hafs1HgG1PXw71/c9pDqjfyOrgEu5AVHh+DqxC+KT1Y7rJu3YWLRS8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JLybzILN7SfL/DCLt8byBMc18GVJlrsB1op3XQTt154=;
	b=mbfKgAJju4dkzNdCLsrQoeVYFC62AMJLiHJvnY+Z26HBPoQuc/IqqXdapfCZ0jfXKVUjIbKuTp5Z/JbU4nWzDMFZEDJjePLiZmzWa+0MOcdeR360GPdU8gJlOtgCDtV5JwZqzqQqKv4Cnufq0t8UCoWUReKob0dtzaPYOiVVGapYINKZJwoybOrkDv+VobMgwkH51zznhvtWIThR8Gd8Q7hueyZECYGFdRbQ8hOAO1ChxBPhcWA54DqiPSZIffeXIWtLDU8zxTiWuk7BDVr/q/B5pbZ9sQ3H9ZXJ/YdNhbgnvdjhmXefdCoMS+WXl6PhNyN1/XXbpoW+J6Trt44M3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=vmware.com;dmarc=pass action=none
	header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JLybzILN7SfL/DCLt8byBMc18GVJlrsB1op3XQTt154=;
	b=aA9PiOyeiiyqMTt77lmGkID6tg6CZQ6bbOFoZYoinjf6TP37B2LdPG1tufS83RzUC+UZe6aPyqoUUA06rFV6y8XNDM15D9KPXePlioryuclyI9hw4/Mox92sP0V7tiMBviFtCjGVH+QQkXT+eVaYFxSTAeA9AiuqCL6zRpEb3oQ=
Received: from CO2PR05MB2645.namprd05.prod.outlook.com (10.166.91.154) by
	CO2PR05MB2453.namprd05.prod.outlook.com (10.166.214.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.9; Fri, 26 Jul 2019 11:26:47 +0000
Received: from CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59]) by
	CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59%5]) with mapi id 15.20.2115.005;
	Fri, 26 Jul 2019 11:26:47 +0000
From: Joshua Lock <jlock@vmware.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [RFC PATCH 0/3] Enforce Shared State Signing when options set
Thread-Index: AQHVQ6UCcci5UrkoyECZU0JtfLRwuQ==
Date: Fri, 26 Jul 2019 11:26:47 +0000
Message-ID: <cover.1564139487.git.jlock@vmware.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR04CA0015.eurprd04.prod.outlook.com
	(2603:10a6:10:12::28) To CO2PR05MB2645.namprd05.prod.outlook.com
	(2603:10b6:102:8::26)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jlock@vmware.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [212.140.202.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a4e8a0a-afc7-4dfc-86b4-08d711bc2509
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CO2PR05MB2453; 
x-ms-traffictypediagnostic: CO2PR05MB2453:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CO2PR05MB2453512873F298D8059C3D06CEC00@CO2PR05MB2453.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(189003)(199004)(6116002)(6436002)(3846002)(5640700003)(2501003)(86362001)(2351001)(5660300002)(66446008)(64756008)(66556008)(66476007)(66946007)(6506007)(386003)(102836004)(14454004)(2906002)(966005)(52116002)(6486002)(478600001)(486006)(305945005)(2616005)(256004)(14444005)(476003)(7736002)(6306002)(6512007)(71200400001)(99286004)(71190400001)(81166006)(81156014)(8676002)(6916009)(316002)(8936002)(50226002)(25786009)(36756003)(186003)(66066001)(53936002)(26005)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR05MB2453;
	H:CO2PR05MB2645.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZRIQPcwPa4Jk069LiXjcbN9N9dt+ixKJeMyKLqIFo19dceHbhCG+QZsduHX7ToLqZ05CUGyWmPb+1A/+ndUXpYT0VuL/MfjzGhyvf9JNDv+MpDEzWfcytcPy4Mmvq5/2MZs70vKAtb948Y99Ei5hiMa7CI+9GRXnyLOIQpWdd29R9lHbZnV2nKT6Ck9wtjOibGKRDxfFcVqW2dvoZBJBrmkZs3J5stGbqeEDgyq3IVZp6VHH414sOaBzSD7Ab93Igvr0VoSnJVaMmQab3PEXAGjfjPHUSJxUWc8zNdtNOmnjHp7SkQqzr8vgPD5etXJmEXFSw/KOCPOwuwaWlE/Jp31vPE7sU8NdeXAiaHPINbA4VWASmfGJoVdPMtrBslAeZ9KscN7CX7/1x0J87+sesQIn4TJcb/CQWkKNj6xQ+vs=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4e8a0a-afc7-4dfc-86b4-08d711bc2509
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 11:26:47.3037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlock@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR05MB2453
Subject: [RFC PATCH 0/3] Enforce Shared State Signing when options set
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
X-List-Received-Date: Fri, 26 Jul 2019 11:26:47 -0000
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

The following changes since commit 835f7eac0610325e906591cd81890bebe8627580=
:

  meta/lib/oeqa: Test for bootimg-biosplusefi Source (2019-07-23 22:26:28 +=
0100)

are available in the Git repository at:

  https://github.com/joshuagl/poky joshuagl/signed-sstate
  https://github.com/joshuagl/poky/tree/joshuagl/signed-sstate

Joshua Lock (3):
  sstate: fix log message
  classes/sstate: don't use unsigned sstate when verification enabled
  classes/sstate: regenerate sstate when signing enabled

 meta/classes/sstate.bbclass | 15 +++++++++++----
 meta/lib/oe/gpg_sign.py     | 10 ++++++++++
 2 files changed, 21 insertions(+), 4 deletions(-)

--=20
2.21.0


