Return-Path: <brett.grandbois@opengear.com>
X-Greylist: delayed 75087 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 09 Feb 2019 13:54:14 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740052.outbound.protection.outlook.com [40.107.74.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7E5DE6B511
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=acnKRLjKtRyojha1MsRS62TGKdPUjKSbwL0P9lLy2bA=;
	b=Dw5gF01w4rqmUQng69G7hlTgn67AiElNTKglZJLhCnybvSH/sedq+nGs5YBCm0PQmoeYOUtoyiU+G56ARCNRgmSVuDmhcMQ05ynYksKK+4i03ji7fW7xUKXnJQN9DDllxU2w3+deZ8v1kTBaOac2G4frUamrRVgjsFmYCU2etO4=
Received: from MW2PR1501MB2059.namprd15.prod.outlook.com (52.132.150.23) by
	MW2PR1501MB2139.namprd15.prod.outlook.com (52.132.150.147) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Fri, 8 Feb 2019 01:30:34 +0000
Received: from MW2PR1501MB2059.namprd15.prod.outlook.com
	([fe80::580d:3cb2:b0dc:8f6f]) by
	MW2PR1501MB2059.namprd15.prod.outlook.com
	([fe80::580d:3cb2:b0dc:8f6f%4]) with mapi id 15.20.1601.016;
	Fri, 8 Feb 2019 01:30:34 +0000
From: "Grandbois, Brett" <brett.grandbois@opengear.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] ruby: remove CVE-2018-1000073.patch as already fixed
Thread-Index: AQHUv03jp8RKom0M7U2G3IOhjLt1AA==
Date: Fri, 8 Feb 2019 01:30:34 +0000
Message-ID: <20190208013017.10582-1-brett.grandbois@opengear.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR0401CA0015.apcprd04.prod.outlook.com
	(2603:1096:3:1::25) To MW2PR1501MB2059.namprd15.prod.outlook.com
	(2603:10b6:302:c::23)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=brett.grandbois@opengear.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [60.241.24.90]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MW2PR1501MB2139;
	6:qIiNsx8aiOvLClEBbQ/ObIhuD5K8J6CzvL3+aJDneMHPe9x0OT7snkAbkBptlQw9UrTNIKTlodFt6/Z8XIorIL7149cctrdDt6CQidsPUas07KwyZPZwp4ZlFyU76UhmjLZ70iaRMpN0Fmgi4cq/G2en4twMLQn0f3aZ39Qmn4EkJDKSLgS9n/LMXRoNRNUE+vBwbCEV7XOiWlzBUkgtr3URIKSMaFIIQMN1bDwVk4OpKTaO9Qga8Mjg+3+PyOyBE3OU2sWlHEjg8q/wuqx6X/JDfxtvV8m5WWKHWW7Pakk3JDN00wPwkgS5t5JFMLSm9obV558nu+CofbvThBu6AE3ansqJZmwMiFykvyNdMu0Jd3dWW2YWvNMfaqh3YsV46sNEn0jUm1rYNclaBskr+bgYKXawZXPRNDoW+JO6NYqoiCPExhg77/0ldjR5JKSRIM71K3cIBkez/o1FQ3z4iw==;
	5:I9ZIeX6v4FWwJ/WUpif6jueHifzYGSeIiA/I87TMJCBktzF/e9XnCz1ZfxWJpph8DtUFWek1gDbO1tOlKaWyYOAK7X+TB0fwSDBtB5gepnplK5UEzWum0lizq73CROibRK2rf7k2A0S9JIbVoRU73Zo5+19CZgGrJ/JJRcjv6t1u2vrr/Kdj/H9Lwb3gf8Be37k6bOczZcE5ru8H7xEezw==;
	7:ScieZ42dusBryL6nO0Lwdi1FvjHxvvu5QFW5PEDc0NoelzmBYrS9T2tH+XlRlpDblfGa27ZmAQEzd9aNJmToi2IboCQncBLpn94YEpX0WN0cRwkJliGCqwDj4LSm3MweHdZ/1ooYDhPJZY4laR8UPw==
x-ms-office365-filtering-correlation-id: 20178455-5232-4ce9-57b6-08d68d65058c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR1501MB2139; 
X-MS-TrafficTypeDiagnostic: MW2PR1501MB2139:|MW2PR1501MB2139:
x-microsoft-antispam-prvs: <MW2PR1501MB2139CD9E8B329C1F8F56B87E82690@MW2PR1501MB2139.namprd15.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(346002)(366004)(136003)(39840400004)(376002)(189003)(199004)(25786009)(71190400001)(71200400001)(256004)(2351001)(50226002)(52116002)(8676002)(36756003)(2501003)(186003)(26005)(14444005)(6512007)(2906002)(14454004)(106356001)(99286004)(1076003)(478600001)(86362001)(3846002)(66066001)(316002)(105586002)(6506007)(386003)(68736007)(97736004)(6116002)(6916009)(53936002)(486006)(81156014)(102836004)(2616005)(8936002)(476003)(6486002)(5640700003)(305945005)(81166006)(7736002)(6436002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR1501MB2139;
	H:MW2PR1501MB2059.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: opengear.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C15Uo7vZqT9EH71ZFmzOoKjzDL5odmMwf9TDCjEJ7/CKgTZdV/J8YV5syKAGciT9yzSF42M45/l6bRDSS8i42vRVPJJn8MTWkIiic5TPNMfYWNsiKtdKwoqrsOFn+FOfA0zkqa7VEiisfIxU6Cj+gIEZ3OrVuo4joGgTeVUsUojj/L1oynO0VSGC0MAP8vmswy9Ltoa7mkCg7ix5tcxoJSEKunpm4uT1YuEqpGRNv7bFEkCuYgfH3LZWhJ4bSKwoHPqWtlaSQSQ9PJ1cPWJdsoHZpqQdIeTzU/LmEcuc0L5+54rHj9OPhF3asMVFLzfZuWVAbqdUNvlq8oT++0RZu/CS8dofoAHq7bHK2mysDRUEE/SIhf1Yo+gS+qqg+Lh/zyIDWpF06FdZMRvPWkGsBsrwgHWUCr15vMrOa6AiAc4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 20178455-5232-4ce9-57b6-08d68d65058c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 01:30:33.3253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1501MB2139
X-Microsoft-Exchange-Diagnostics: 1; MW2PR1501MB2139;
	23:thGRMGD4ISek0ZL3C0Aph32GsfgXUoUByNm81oyd+fX0zA4HxuJUuexqzhByGs/bav3p4dswidT7AxrB1KKJQoiwTUsmcxSMVZC1P5YjP5+5UR1rjoDpGYAEqcex616K2RI50e9bt6+7FOz0UnzjZQ==
X-OriginatorOrg: opengear.com
Subject: [PATCH] ruby: remove CVE-2018-1000073.patch as already fixed
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
X-List-Received-Date: Sat, 09 Feb 2019 13:54:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

rubygems 2.7.6 which is in ruby 2.5.3 has this fix and as currently
applied all gem extraction fails as the realpath check is done against
the full path including the file to be extracted which will always fail
as the file hasnt been extracted yet

Signed-off-by: Brett Grandbois <brett.grandbois@opengear.com>
---
 .../ruby/ruby/CVE-2018-1000073.patch          | 34 -------------------
 meta/recipes-devtools/ruby/ruby_2.5.3.bb      |  1 -
 2 files changed, 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2018-1000073.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2018-1000073.patch b/meta/=
recipes-devtools/ruby/ruby/CVE-2018-1000073.patch
deleted file mode 100644
index 22fa1b5f4d..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2018-1000073.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1b931fc03b819b9a0214be3eaca844ef534175e2 Mon Sep 17 00:00:00 2001
-From: Jonathan Claudius <jclaudius@mozilla.com>
-Date: Wed, 7 Feb 2018 23:54:52 -0500
-Subject: [PATCH] Non-working patch for deducing symlinked base-dirs
-
----
-CVE: CVE-2018-1000073
-
-Fixed in ruby 2.7.6.
-
-Upstream-Status: Backport [github.com/rubygems/rubygems/commit/1b931fc...]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
- lib/rubygems/package.rb |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/rubygems/package.rb b/lib/rubygems/package.rb
-index dede959..cb9c74a 100644
---- a/lib/rubygems/package.rb
-+++ b/lib/rubygems/package.rb
-@@ -421,6 +421,8 @@ EOM
-     destination_dir =3D File.expand_path destination_dir
-=20
-     destination =3D File.join destination_dir, filename
-+    destination =3D File.realpath destination if
-+      File.respond_to? :realpath
-     destination =3D File.expand_path destination
-=20
-     raise Gem::Package::PathError.new(destination, destination_dir) unles=
s
---=20
-1.7.9.5
-
diff --git a/meta/recipes-devtools/ruby/ruby_2.5.3.bb b/meta/recipes-devtoo=
ls/ruby/ruby_2.5.3.bb
index e9f0453788..3fb427e90e 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.3.bb
@@ -3,7 +3,6 @@ require ruby.inc
 SRC_URI +=3D " \
            file://ruby-CVE-2017-9226.patch \
            file://ruby-CVE-2017-9228.patch \
-           file://CVE-2018-1000073.patch \
            "
=20
 SRC_URI[md5sum] =3D "20c85b67846d49622ef3b24230803fef"
--=20
2.17.1


