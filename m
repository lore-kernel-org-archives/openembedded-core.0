Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 22695 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Feb 2019 01:56:00 UTC
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730068.outbound.protection.outlook.com [40.107.73.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4D75B6B005
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 01:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Xbg/1ZNDW98M0c4OPU5fYx+oYgnI+nUdIl44G24iEMw=;
	b=WJe0Q735NUSklpvtCixnHyZce1ay3lJpN3N+Sy+cvgUKEObKSU3Q6ZgBJu/x81Q7tfVhrW2QslfLp3b0rmerzeEiXux+byO3ipXBAs1NydWT9gibQYbWK0u59vR+3L3qMxfzzqRt38objPydrJeIly0dO0jAC7mMGWDivWJWoKU=
Received: from MWHPR02MB2768.namprd02.prod.outlook.com (10.175.49.146) by
	MWHPR02MB3311.namprd02.prod.outlook.com (10.164.187.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.17; Mon, 11 Feb 2019 19:24:53 +0000
Received: from MWHPR02MB2768.namprd02.prod.outlook.com
	([fe80::50c6:4927:8a6b:7300]) by
	MWHPR02MB2768.namprd02.prod.outlook.com
	([fe80::50c6:4927:8a6b:7300%10]) with mapi id 15.20.1601.023;
	Mon, 11 Feb 2019 19:24:53 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "nathan@nathanrossi.com"
	<nathan@nathanrossi.com>
Thread-Topic: [OE-core][PATCH v2] device-tree.bbclass: Add support to compile
	overlays separately
Thread-Index: AQHUk9YScayH2uHGhUmn079WwxKv/KXFl+9AgBW+pyA=
Date: Mon, 11 Feb 2019 19:24:53 +0000
Message-ID: <MWHPR02MB2768AE076F276CBED8BA9A72AF640@MWHPR02MB2768.namprd02.prod.outlook.com>
References: <1544810040-12073-1-git-send-email-jaewon.lee@xilinx.com>
	<MWHPR02MB27689CA8E8E40CC5DD5CA84AAF960@MWHPR02MB2768.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR02MB27689CA8E8E40CC5DD5CA84AAF960@MWHPR02MB2768.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR02MB3311;
	6:pzSOYLvv/yeop/g1EmxtXQzBIf71X9PkxyzH9ivUwBnHgVscCaIFgUbJ5ce08n40RDvokcZz0VL1fhW4OKdtgSGQT7kYUh3Et2HKHojlYkoRAFJvsYlck4y+NV/OQVFiCmUKM8aOjnlAbSUmEyXgLSYc/bM3TMmuSSKGu/y0X5hEkej15f50ODfR7UigNLKr6o8ETkgbSgmjyWaJF83LktLVEtI/f+HNYup21m+j/GcSGu72kT/Y0FIvaLfM0iS3D37i4Sdww+coMxp94zoxb8nLRhgTsjaOzfNdHP4ONVsUerxub2RIAomxs9CmVpphB1VVM+HzVyK7P+J/9ml13vPhFb0MmUtuWHKuVTGqi8gqmmvm0gUigJKAgubLYGJcyUsFoOBfeC+EcqwZpAkG93hZCaqGx1PmDxfnqdzE8+pF2hURSb2ZNdF70pFMvn8nqdud5jDEfxcbXAagfeBgKw==;
	5:sUDZD7tVXp84JMYp2QIPru2Wcqkju7jVPKMlzN9Lgm7HOnkFkxjT/d4u6ICyGUpxwVmGaAH4UT0JBp2qZo4hwoTMdKWlhQtjyIEAcMvjR3Rc0sTpMYjwoZbgxxc33TV/8fL1EAlIn1+KOOKeLwETLGfX+uf4kbnOzpoEU8veNYSjDhQLkwSgFwvUN8ZgtvGJrK1zXOGGNSJDaDeX7EMcTA==;
	7:09q58sOS433mZCvm7g6h5CeybnQs8E61oNNH8YE/ESXHu231bYHinO+ckyInQBzh7s62PGEw8WR82EENK3WmOWId+8ZdvQFjZRfzzqBPRAeeKJsa8zJH4FmS2MIKf1SjKuW9xiA1NdpAGSc4B7WqYA==
x-ms-office365-filtering-correlation-id: 96c87554-31c4-4842-f724-08d69056998a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR02MB3311; 
x-ms-traffictypediagnostic: MWHPR02MB3311:
x-microsoft-antispam-prvs: <MWHPR02MB3311EFA429D64BF8711DEC8BAF640@MWHPR02MB3311.namprd02.prod.outlook.com>
x-forefront-prvs: 0945B0CC72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39850400004)(136003)(366004)(396003)(376002)(189003)(199004)(13464003)(55016002)(7696005)(76176011)(9686003)(99286004)(476003)(71200400001)(66066001)(53936002)(14444005)(256004)(97736004)(71190400001)(2906002)(11346002)(229853002)(110136005)(54906003)(6436002)(105586002)(33656002)(316002)(8936002)(25786009)(106356001)(478600001)(305945005)(186003)(14454004)(486006)(4326008)(8676002)(3846002)(86362001)(6506007)(72206003)(53546011)(74316002)(446003)(26005)(102836004)(68736007)(107886003)(7736002)(6246003)(81166006)(81156014)(2501003)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3311;
	H:MWHPR02MB2768.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5tKIvKJeSQp6OjuRCzdo9BneLv0Ihz9ZTgir0CZeiRsJGxt5AudF7+TTEKBx/cSfQT84f0l4CVvuUs8fSBQoBn9nitCRj4eUR95gur44MrljC/QDZ5T0Tjktwj38h/QIxrbnGLhIeuUEnD1OZ0ktMUjstWImknCma7VNRgKUfguQbql3uR4061/2Wv/PoqchNMhGY7ZrCp3dlTIloNx+a7/Hy5RXFv8rUJSns/5cVla99BhD5HIpbwFNIyKiBmow1m2vFhWBJy1BgtQbhBF6w4KSKLHp+wKpqPDEu17Oy6uOWAbo38SyZvhNZRlrdnNhhUGlm6gcqL99itaJ8vq68NL912fIGt7O0SXcoR+WvYGIWW7eZnyL/9cnhEe5fp+jZpoLO7UBTPTN1GA1YBPI1iILqDKajTRn3z/BVwoq7vg=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c87554-31c4-4842-f724-08d69056998a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2019 19:24:53.4720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3311
Subject: Re: [PATCH v2] device-tree.bbclass: Add support to compile overlays separately
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
X-List-Received-Date: Tue, 12 Feb 2019 01:56:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

-----Original Message-----
From: Jaewon Lee=20
Sent: Monday, January 28, 2019 3:19 PM
To: Jaewon Lee <JAEWON@xilinx.com>; openembedded-core@lists.openembedded.or=
g; nathan@nathanrossi.com
Cc: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>; Manjukumar=
 Harthikote Matha <MANJUKUM@xilinx.com>
Subject: RE: [OE-core][PATCH v2] device-tree.bbclass: Add support to compil=
e overlays separately

ping

-----Original Message-----
From: Jaewon Lee [mailto:jaewon.lee@xilinx.com]=20
Sent: Friday, December 14, 2018 9:54 AM
To: openembedded-core@lists.openembedded.org; nathan@nathanrossi.com
Cc: Jaewon Lee <JAEWON@xilinx.com>; Alejandro Enedino Hernandez Samaniego <=
alejandr@xilinx.com>; Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Subject: [OE-core][PATCH v2] device-tree.bbclass: Add support to compile ov=
erlays separately

Currently only dts files are considered when looping through files to compi=
le. Modifying the loop to compile other files that are overlays.
Also surrounding this check with a try block as the function to find overla=
ys parses the file for a '/plugin/' tag, and there may be files in the DT_F=
ILES_PATH directory that are not parseable.

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/devicetree.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbcl=
ass index 8fe5a5e..d785285 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -120,9 +120,12 @@ python devicetree_do_compile() {
     includes =3D expand_includes("DT_INCLUDE", d)
     listpath =3D d.getVar("DT_FILES_PATH")
     for dts in os.listdir(listpath):
-        if not dts.endswith(".dts"):
-            continue # skip non-.dts files
         dtspath =3D os.path.join(listpath, dts)
+        try:
+            if not(os.path.isfile(dtspath)) or not(dts.endswith(".dts") or=
 devicetree_source_is_overlay(dtspath)):
+                continue # skip non-.dts files and non-overlay files
+        except:
+            continue # skip if can't determine if overlay
         devicetree_compile(dtspath, includes, d)  }
=20
--
2.7.5


