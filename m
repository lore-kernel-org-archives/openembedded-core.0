Return-Path: <jlock@vmware.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820073.outbound.protection.outlook.com [40.107.82.73])
	by mail.openembedded.org (Postfix) with ESMTP id CED987F1E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 11:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=F0OkGFz642ohzoTY6K8EF3KvOB7EfAWjqsWDm409Db4QqZYFhtHWr/nfO9rFIWs3VvPvWMiNAjnXr5hVilXUWLo0LJOyz2ljYORc8/YO/HPndosFVQ4Vv7rRxpCll3mg8aE+WRG1nFiuqZGuIDU7BkTqTPhH2raGHbpcjlZSlC3aRFqr34cZhLNDVHfX3cix5lFMJlEQPqb2JiGhVVi3e+75ZEdYcsol48zwOiS/NBl7zYH6qLyOKKI339cHCa1Jqu1QpI3yAuk5LvpIMAOpql3bCl/r5qALWmmLFheX3qwRlp1MPi/ggQYdQ8tM2iesNENPxqZja39938SRmBQYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=On2PiaCQIlkzX2qQomA9qZS6YBq0hbCkUD7qNO439dA=;
	b=RxOAuAF2O9g+YPc5j4bhNPinoaey17cm87YUWxatDF9Z+3trSHBXO8gekiKFc3dCN8PQ6xxelAbEKU2d5A1ij6kvPRG/sNwp7sI9U74719XO+Z2O5PezcxQ6BAdCXIgaTVC/e2rZPu2bCx4BfMWarzHvu2dlq5uft1EJ2QVCVuavV9FrDXyyzEFBmoP/EOBYZO0EvbHt7DYanV/5gvRv+7w5RIVLAT9xYadGSRksl7PQa9qf63omVlgZklZrEr0QRUfGjAC/b/9ywXwTxBDJ/Wx9ICH1l8tMiIkVvWWGtPdI3VwpY+41ToQ+UZ9xTP/zZC+NnPan40Jt+JpJA5Pq8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=vmware.com;dmarc=pass action=none
	header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=On2PiaCQIlkzX2qQomA9qZS6YBq0hbCkUD7qNO439dA=;
	b=g9I84h3KchwhS9ERpI1TsFYKgvNN7JVfi4sfUGrGeeoXOe0NLoqcIdo28Do7YMW0RlE4BrVQPacR1vmMB78QdGHUthGXFgOS+lVUqAQMyOGIb2Rdrwe4gI/0ImmngOfYKlKEBwhX69VsloUdTMM9K0DM5kCUdwbeywWr0xe/y/Y=
Received: from CO2PR05MB2645.namprd05.prod.outlook.com (10.166.91.154) by
	CO2PR05MB2453.namprd05.prod.outlook.com (10.166.214.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.9; Fri, 26 Jul 2019 11:26:48 +0000
Received: from CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59]) by
	CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59%5]) with mapi id 15.20.2115.005;
	Fri, 26 Jul 2019 11:26:48 +0000
From: Joshua Lock <jlock@vmware.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [RFC PATCH 1/3] sstate: fix log message
Thread-Index: AQHVQ6UD/a/pXElAkUqgNiJjUuaeoQ==
Date: Fri, 26 Jul 2019 11:26:48 +0000
Message-ID: <797e4bdaec90a43d8e4614fb3ee4091cbdbf89bd.1564139487.git.jlock@vmware.com>
References: <cover.1564139487.git.jlock@vmware.com>
In-Reply-To: <cover.1564139487.git.jlock@vmware.com>
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
x-ms-office365-filtering-correlation-id: 58072972-9926-4c5c-61e3-08d711bc25b9
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CO2PR05MB2453; 
x-ms-traffictypediagnostic: CO2PR05MB2453:
x-microsoft-antispam-prvs: <CO2PR05MB24536F67238B7C226FD84902CEC00@CO2PR05MB2453.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(189003)(199004)(118296001)(6116002)(6436002)(3846002)(5640700003)(2501003)(86362001)(2351001)(5660300002)(66446008)(64756008)(66556008)(66476007)(66946007)(6506007)(386003)(102836004)(14454004)(4744005)(11346002)(76176011)(2906002)(52116002)(6486002)(478600001)(486006)(305945005)(2616005)(256004)(14444005)(476003)(7736002)(6512007)(71200400001)(99286004)(71190400001)(81166006)(81156014)(8676002)(6916009)(316002)(8936002)(50226002)(25786009)(36756003)(186003)(66066001)(446003)(53936002)(26005)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR05MB2453;
	H:CO2PR05MB2645.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2l/ArqscVrdUh2P/P9NTHWJyXmklQQJMDKp7DZwFv0Vf31AXHHEu3koW4IkCv2pGqsFPV1EhGKQYOssuuAPQHedNBXO9nUwyh5viV8gY3AsYFUm5ePoUXtEnWm6ftJWV8EIIDsFiSBDdNAP5+QhLKVFsO4R40eeMf8ACnYNKQXO1zsRa6Vmf5Jqwuk3cYxKO/AI22g2v2z2sH/4YTQNG58ErYkRNWqUWXYDr0X+dvqjBsGKJK3JG27/NWT4kGX9g+zTF2oTPGkm8utekALYJ/Km4YX2tJCWln4okam/W1kQ3rEdl5AeBAF0ZHgmUy0wduA6NZ2vtwD4fZXqu7cGGhlS+8L0/FHfaY5wVq/wi2F5mX/bVWk5gSiSiA3w9m0sb9Iree7dgZqYUy+Z3WuklkxU4IoKjWTo4mLZ2/bjGu+U=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58072972-9926-4c5c-61e3-08d711bc25b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 11:26:48.5422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlock@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR05MB2453
Subject: [RFC PATCH 1/3] sstate: fix log message
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
X-List-Received-Date: Fri, 26 Jul 2019 11:26:48 -0000
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


