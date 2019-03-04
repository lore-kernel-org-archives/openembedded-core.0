Return-Path: <Aditya.Tayade@kpit.com>
X-Greylist: delayed 905 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Mar 2019 18:39:00 UTC
Received: from IND01-MA1-obe.outbound.protection.outlook.com
	(mail-eopbgr1380075.outbound.protection.outlook.com [40.107.138.75])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE337C75E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 18:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=X5bVnkmf+sN0BjYYReKo40iQplfx3ogz+wvolDnV47w=;
	b=RNvlwYYnFKb4FDVsc7PAfdeEIX4BipMIJOmJiX8Bj9zRLPY3Z3VBB7n6tZJ154O41Vdh0nSVnVa6Bd43cJK4gtylC8JgyQgxyhZIB3+o+R0QLuW/Pp0XGgvv61joI4rWbSQ2BvQkzS01oFmXVXOhPTnhi9AykVCVfvSMgsrlaks=
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM (10.174.216.146) by
	BMXPR01MB0919.INDPRD01.PROD.OUTLOOK.COM (10.174.217.19) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.15; Mon, 4 Mar 2019 18:23:53 +0000
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::fd31:8a8e:b35e:2c6]) by BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::fd31:8a8e:b35e:2c6%6]) with mapi id 15.20.1665.019;
	Mon, 4 Mar 2019 18:23:53 +0000
From: Aditya Tayade <Aditya.Tayade@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][sumo][PATCH] run-ptest: supplied user inputs to
	add_person_cpp
Thread-Index: AQHU0rds8S8VKjAMzkexrLaGWAuOIA==
Date: Mon, 4 Mar 2019 18:23:53 +0000
Message-ID: <1551723824-5064-1-git-send-email-Aditya.Tayade@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BMXPR01CA0003.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:d::13) To BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:11::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aditya.Tayade@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [43.241.126.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b454a939-1ccc-44e2-0572-08d6a0ce8e4e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BMXPR01MB0919; 
x-ms-traffictypediagnostic: BMXPR01MB0919:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; BMXPR01MB0919;
	23:RlIZMq7vMEbxkbB1vD+mDgbkx6H+jhazkzbOrF3?=
	=?iso-8859-1?Q?fLXj+EeGG8nnsS5v2Qjki0WhpypnZ0Qp251122uejzGALf2lUnj8Bbbfr5?=
	=?iso-8859-1?Q?Zy2vyby73jXZQalNRQWCnt7L1Us5y110Od9rdwZTd7isY7FGA+CmXztZm0?=
	=?iso-8859-1?Q?eiEZLHTzs+qy3J6HwonjPlPz3OkASCmfHy9/RmrDK2lI7fPMh8Xiza6LCs?=
	=?iso-8859-1?Q?t0Str1WVFeayrQvcexkGfGN+tlQe3hynZgxH/7/ntpKhoFUhJXmY6Pff5k?=
	=?iso-8859-1?Q?Tfklbs3K6JS3C4ojRnNqYJjuLsTIxtPYsp9wF+o9yXLALW8XqfCgI7Mvxn?=
	=?iso-8859-1?Q?wlkOjtRRKTw2GDZXBuPjP71N1z7PSp7xWGGJhG945SSSizewhtINrkD/Rw?=
	=?iso-8859-1?Q?TThH3InUXuuixGIlU+s/SmLK5sUXIFv6g9QgsAIHq9PB2XPFM7IKm5rDjs?=
	=?iso-8859-1?Q?RqBpo0KCW1MVCLL7Di1981PiYiGaYhp9gPoaDS4qPZibehOSBKwfPJgg8r?=
	=?iso-8859-1?Q?JrxjOxltDnzCMMwvJIdLg5bycEiwrs5K2WgTPRzt128lywgG6mOZpfMGCg?=
	=?iso-8859-1?Q?Ea/bL5merHkEzj9Pncm6THRD9tiRHj9LVi91pPSdGUrp4Q782WHtmEXz37?=
	=?iso-8859-1?Q?suIPexZ4PGvs2mSoAJ+v/+AmxYRG+RsL3NqOf3IyboN8EGCRISwCcLHRuW?=
	=?iso-8859-1?Q?qsNr9HxvYXkio68rZM19KUqMLMmcanlRViSMMrbYohPxDudGmWYblt/2dG?=
	=?iso-8859-1?Q?/YWovLNNbrIk0zkM4ZfH8IZkgFep9/EIwCanbViTvWJI/8miflGoZL9uJB?=
	=?iso-8859-1?Q?mj0pEP2Pcy3UfzzFItMRJD147OpBZK9pQJmfA4/u3vGm67UK3vNdudZEgJ?=
	=?iso-8859-1?Q?e0JCVKyCNVX+kobIbl4sm3CXBdyJmgzdiZ3r82p1QnslmDfW+7GISjj0e3?=
	=?iso-8859-1?Q?mhISVqelaQTp0L0Sk9jLtceCvl43hq9jjnUyDGdg5yuaMa+ZmsV6GHc0UT?=
	=?iso-8859-1?Q?py3LSO4TLxfJCx8o7glSF5A498HggiT/zsx+625UPqxzYCtTqtsRzMY74v?=
	=?iso-8859-1?Q?Gz3DhAdqOx7gqDpPetlypQen/1HmOiFLUTHqVAIW7TTrcpwvNAJHVf9t0Y?=
	=?iso-8859-1?Q?Ce9N8C48KwhS80bsLbLMKnPddPd5ceh1Fpwl22+uimMCZg/58HBFaFBu0O?=
	=?iso-8859-1?Q?iESAybypK5UkY5/6oH9bDYdYUhMu5u3fNfVsvztlip2wEEtypXtdqt/v7j?=
	=?iso-8859-1?Q?EBtlgSiOBN/9NXclkxRKotZNBFvZDtl+IVvvGG4Bv+cJYzXjAx6wyi8LJJ?=
	=?iso-8859-1?Q?AE=3D?=
x-microsoft-antispam-prvs: <BMXPR01MB0919A1D9F91B36975B9878E291710@BMXPR01MB0919.INDPRD01.PROD.OUTLOOK.COM>
x-forefront-prvs: 09669DB681
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(136003)(366004)(396003)(376002)(189003)(199004)(6486002)(478600001)(7736002)(25786009)(6916009)(386003)(4326008)(2616005)(6116002)(6506007)(99286004)(486006)(97736004)(53936002)(6512007)(6436002)(2501003)(476003)(71190400001)(71200400001)(3846002)(72206003)(102836004)(5640700003)(81156014)(81166006)(186003)(50226002)(26005)(107886003)(5660300002)(8676002)(66574012)(52116002)(66066001)(68736007)(2906002)(2351001)(86362001)(105586002)(305945005)(316002)(14454004)(14444005)(106356001)(8936002)(256004)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BMXPR01MB0919;
	H:BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xZGXCxdRPLaV1xISQtsx8et2lfPkngp0qyt4La31KOXcgu14S7a6VTD1rJpWvgHp5skPZAS6s5MYGPwcUeKpZelB4qzpJO5rrNd12i8f1ndVMPygcGMLAjMMI786z5cHeebkmqu/zmCGvbks4ITn7klfujpBf/KJm6qJQaDJ3/e+rB58+BBDerp1E1Jb01EyV7KOmxWX/7FrztI1ivignAJfLZJm0Z4CQ1PL524ZjpSGhUJaP8GDDYABasyHQDyMcHTVXUA8GnE953XbTRzV5xG0YPE5GW+q/KHwC6QAPVah569CjyOmpn9uDx66ti1Q1qmiwSZ6NAq2vVPt4oSLVmLEgyQImFpwC4w91Bv/AAs7nQ088VzrOPEngX9aiPNCeri+jkAQbueBD49buRkB+3T9BKg7DYkOIIB1KMwEPqY=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b454a939-1ccc-44e2-0572-08d6a0ce8e4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2019 18:23:53.4291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0919
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: [meta-oe][sumo][PATCH] run-ptest: supplied user inputs to add_person_cpp
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
X-List-Received-Date: Mon, 04 Mar 2019 18:39:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

During protobuf-ptest execution, add_person_cpp waits for user
inputs to write data into test.data file. Fixed this by supplying
dummy data through standard input.

Upstream-Status: Pending

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest b/meta-oe=
/recipes-devtools/protobuf/protobuf/run-ptest
index 7c3a8d1..dc6c83d 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
@@ -8,7 +8,7 @@ for write_exe_full_path in ${DIR}/add_person_*; do
 if [ -x "${write_exe_full_path}" ]; then
 write_exe=3D`basename ${write_exe_full_path}`
 echo "Generating new test file using ${write_exe}..."
-${write_exe_full_path} "${TEST_FILE}"
+printf "1234\nname\nname@example.com\n" | ${write_exe_full_path} "${TEST_F=
ILE}"
 RETVAL=3D$?
 [ $RETVAL -eq 0 ] || exit $RETVAL

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

