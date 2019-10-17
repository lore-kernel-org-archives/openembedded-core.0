Return-Path: <prvs=5193919e2a=fridgecow@fb.com>
X-Greylist: delayed 1861 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Oct 2019 13:02:35 UTC
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
	[67.231.153.30])
	by mail.openembedded.org (Postfix) with ESMTP id 02BAE7F36F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 13:02:35 +0000 (UTC)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9HCTOZn028129
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 05:31:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
	h=from : to : subject :
	date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=facebook;
	bh=YOb3bBftldiszC/mSSrwaqNJx5UzLsiDOnmVqIE4Cig=;
	b=C+OfNhw2oRHMaFWXkl1yDGE0cSlSs7rlbeAxR4waeNU9o8ZSPQhylG4yqBa459t4gObo
	H3z4CpCbFkmOwpskkINQd9V7vUr+Q4UEXTXTJpor1z7u/45t1xxV8u/9OgCInBaqFwXo
	ZxCSFTcJMZ9KOtRqggZTUEGS3MMGQpbSB5c= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
	by m0089730.ppops.net with ESMTP id 2vp3uk5at1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 05:31:34 -0700
Received: from prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) by
	prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Thu, 17 Oct 2019 05:31:32 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
	prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Thu, 17 Oct 2019 05:31:32 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
	by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
	via Frontend Transport; Thu, 17 Oct 2019 05:31:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gf7eeofxZG2sQVcchG8BIak1cYjKT/Unt6Yh0kIsc/wMMNphRoqpVrv8B8rl66aTtRfrBJiLlt6l3sUCcBEiuSmHsjretIsBBVUJAcBHHOpdQMlfqy0WRbXdfusiRNUbfr7f/GplR3TbE7pbDSvPH6PCilgEPo4GhIgo7nSnWonaeprrEqauEMNNukPeuw8QW81NgrNatOqkU733prWhn4+xb4UPLU7u14p2StESISabLCWrheLdi+De9hTgkgLzrb9/awFAAfYPrnrLbdqJ5XS3ImZl7m7kVncICkXDDnKI1wP1zt00VMHPrtjxdtv5uLOGkcxY98sl4TN29mzu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YOb3bBftldiszC/mSSrwaqNJx5UzLsiDOnmVqIE4Cig=;
	b=ldgqnyuWNV7p+DA1DkfItc0GaNHm6QWk4j2TAqkQBTN2TH+hZdImBlhT7NgBtTCLCefYIwKfGzrxD8qSqK+AlSDtMMSgpADAnz2+waOMHnzZlVfhoCu0JbfZZr29Fb4EgmotWPW/ME0hs3Wej736/6an2/lwaM+G5Cz58wYEH15bJOr9dXjIuvNdH6toyrZkJYC4kg6B/6vmURLelDvlpp2n6BcHXfZV1yqUI0/N07l3DgVFItl1qWgWYV0n/XNRq+dcOHU7XG8F8UWJwZb75gkddlxYtbiDXK+7zU/+es2CXwH4MO8ggBu7hUcvub8B+lJGETGjabP2AHIc2PA0Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com;
	dkim=pass header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
	s=selector2-fb-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YOb3bBftldiszC/mSSrwaqNJx5UzLsiDOnmVqIE4Cig=;
	b=ckhn67dgCuuts1VuJyYGutVFy7YlO0ba5nsd6Lb2BtUl8GPN/2frVUlQQu+NL6NKz9L0CQ0KlPgd0vmFrvZpoy4Y3bRXO3tnwRu6l0YYwL4r7kK5Hu2WgrOvPxaFfymhGsaCbJ37v7VIfIeI+xil1VgV3R3HWeKFQknCmOSrodg=
Received: from BYAPR15MB3094.namprd15.prod.outlook.com (20.178.239.76) by
	BYAPR15MB2711.namprd15.prod.outlook.com (20.179.157.211) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.22; Thu, 17 Oct 2019 12:31:31 +0000
Received: from BYAPR15MB3094.namprd15.prod.outlook.com
	([fe80::adae:d1fa:4e1b:130c]) by
	BYAPR15MB3094.namprd15.prod.outlook.com
	([fe80::adae:d1fa:4e1b:130c%7]) with mapi id 15.20.2347.024;
	Thu, 17 Oct 2019 12:31:31 +0000
From: Tom Benn <fridgecow@fb.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] Update dbus-1.init to reflect new PID file
Thread-Index: AQHVhObOBOL2lvQStEmgIY+zPIrUWg==
Date: Thu, 17 Oct 2019 12:31:31 +0000
Message-ID: <BYAPR15MB30941A018693608D61D71063D16D0@BYAPR15MB3094.namprd15.prod.outlook.com>
References: <BYAPR15MB309446174D6C5DB16A8BBB66D16D0@BYAPR15MB3094.namprd15.prod.outlook.com>
In-Reply-To: <BYAPR15MB309446174D6C5DB16A8BBB66D16D0@BYAPR15MB3094.namprd15.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c092:200::1:b7dc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd477932-7f19-4ee4-8ca3-08d752fdf0cc
x-ms-traffictypediagnostic: BYAPR15MB2711:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB27117EF733516F2D75816855D16D0@BYAPR15MB2711.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(366004)(396003)(376002)(346002)(136003)(39860400002)(199004)(189003)(86362001)(71190400001)(71200400001)(2501003)(316002)(5640700003)(102836004)(4744005)(76176011)(9686003)(33656002)(446003)(99286004)(6506007)(2940100002)(478600001)(5660300002)(6436002)(8936002)(7696005)(186003)(6916009)(81156014)(81166006)(15650500001)(55016002)(52536014)(11346002)(64756008)(91956017)(256004)(14454004)(8676002)(486006)(66446008)(46003)(2906002)(2351001)(25786009)(74316002)(66556008)(66476007)(76116006)(305945005)(7736002)(66946007)(6116002)(476003)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR15MB2711;
	H:BYAPR15MB3094.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IrGnqJ8nhXQxtr6FY1gk8TJma8SAu07iAjO9SluWJ2BPoJ2Zoq+19BzePOXjYUMDZcpEOADSonnmPAYrmx6aIxyjroVTRdkDWAY+ZGtljk31anL61wOPq1I27s+VISiAbzdryqrZPcFQmpuB23bn6ESwxQ5Vk5yNPo/GgBEvt0DDBKyb47IvHE8DZ4UHcAqIvejbnlhgMRfGlAoatluBXZpQETy3Op8YbTbcraVLiH4UvH/7/B7rAoQv3eGfNnGhAyy9FBXkbUdC/S0kLd+EgW2qpQAINqfMMNnythcb5P+P62ucq9WrKDZjPBx/S/GHkUtRLGBQzCQJqv7jdkHimUYeEEM/m/vuLh4WBQhK1WoZR3/celx8bCFkNOop7JFmTzZ07ERDBXBV1dv8cAJ9dgMdbMRIpK9+PbO0tpq+OFY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fd477932-7f19-4ee4-8ca3-08d752fdf0cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 12:31:31.4416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1xFyv7Sx6geqh9BC5e8Ztu4xRdAfDk3qH1Qzr/1we+cplpbkI7mXiD4PNlXJUSfFJ4iNXB1KeK4saJj01syeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2711
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-17_04:2019-10-17,2019-10-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	impostorscore=0
	mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0
	adultscore=0 clxscore=1011 bulkscore=0 spamscore=0 lowpriorityscore=0
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1908290000 definitions=main-1910170115
X-FB-Internal: deliver
Subject: [PATCH] Update dbus-1.init to reflect new PID file
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
X-List-Received-Date: Thu, 17 Oct 2019 13:02:36 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The PID file referenced in dbus-1.init script was out of date and no longer=
 existed. This meant that dbus could not be restarted via init.d without fo=
rce removing the old PID file.=0A=
=0A=
Signed-off-by: Tom Benn <fridgecow@fb.com>=0A=
---=0A=
 meta/recipes-core/dbus/dbus/dbus-1.init | 4 ++--=0A=
 1 file changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-core/dbus/dbus/dbus-1.init b/meta/recipes-core/db=
us/dbus/dbus-1.init=0A=
index 42c86297c3..90e167e572 100644=0A=
--- a/meta/recipes-core/dbus/dbus/dbus-1.init=0A=
+++ b/meta/recipes-core/dbus/dbus/dbus-1.init=0A=
@@ -21,8 +21,8 @@=0A=
 =0A=
 DAEMON=3D@bindir@/dbus-daemon=0A=
 NAME=3Ddbus=0A=
-DAEMONUSER=3Dmessagebus           # must match /etc/dbus-1/system.conf=0A=
-PIDFILE=3D/var/run/messagebus.pid # must match /etc/dbus-1/system.conf=0A=
+DAEMONUSER=3Dmessagebus           # must match /usr/share/dbus-1/system.co=
nf=0A=
+PIDFILE=3D/var/run/dbus/pid # must match /usr/share/dbus-1/system.conf=0A=
 UUIDDIR=3D/var/lib/dbus=0A=
 DESC=3D"system message bus"=0A=
 EVENTDIR=3D/etc/dbus-1/event.d=0A=
--=0A=
2.17.1=0A=
=0A=
=0A=

