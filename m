Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 10879 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Jan 2019 02:52:41 UTC
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700046.outbound.protection.outlook.com [40.107.70.46])
	by mail.openembedded.org (Postfix) with ESMTP id E172D7C296
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 02:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bCVsk5GS5PZNoi1X9Zt5ox7Uv4SveJ7lFhl2jdD3lnA=;
	b=mN8p2zTU5sAOQQr9hNdXGOBAkrsEkJ7ZrDUN4v+SK3EwHUh1lvyt5sUpcehYylHWv+21Qja92Xu0CGBLzHqrOcJi8UhnTpv+VH8u5cLMfUc0dsiuf+AmBqhAbIHSKVIQDPaFFk6Cigwkk5QwbPiY7YO5tcSiaWPK2Q/65R1Nic0=
Received: from MWHPR02MB2768.namprd02.prod.outlook.com (10.175.49.146) by
	MWHPR02MB2799.namprd02.prod.outlook.com (10.175.50.9) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.16; Mon, 28 Jan 2019 23:18:46 +0000
Received: from MWHPR02MB2768.namprd02.prod.outlook.com
	([fe80::50c6:4927:8a6b:7300]) by
	MWHPR02MB2768.namprd02.prod.outlook.com
	([fe80::50c6:4927:8a6b:7300%10]) with mapi id 15.20.1558.023;
	Mon, 28 Jan 2019 23:18:46 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: Jaewon Lee <JAEWON@xilinx.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "nathan@nathanrossi.com"
	<nathan@nathanrossi.com>
Thread-Topic: [OE-core][PATCH v2] device-tree.bbclass: Add support to compile
	overlays separately
Thread-Index: AQHUk9YScayH2uHGhUmn079WwxKv/KXFl+9A
Date: Mon, 28 Jan 2019 23:18:46 +0000
Message-ID: <MWHPR02MB27689CA8E8E40CC5DD5CA84AAF960@MWHPR02MB2768.namprd02.prod.outlook.com>
References: <1544810040-12073-1-git-send-email-jaewon.lee@xilinx.com>
In-Reply-To: <1544810040-12073-1-git-send-email-jaewon.lee@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR02MB2799;
	6:tpsurlf+6RwPQ85jBmP6IGnFmemeQGekqIQMe9b3GSPIQ6w9UKrjg+3L9mrKYgM7JVxLnh84f3Q5JzLsCjojQUNsyw31eMSDnE5xpXe0/rjPVu4Cn+mXL8MNzUmIJmbpGSxlz6r9sBzqn1Wdne/umX0IxJglqclhUoZJbpEPtYAIR1P8kyButVYKHAAFdT9BjzOJ0tb+Cgni1ScpQezMdZJtjIjg/aM8eLY45EwSYuJqxHka8pD5h+ypXQC5O9xydj95ECjqL+jyVSv7ApfbuPw5XlHyqNgoPGLzJE2f+304Zm2zxf/v8tOF/wTzUEYes9XpnQzp4Xm2Q8pYH0xgCiMh9yqTwUU30J4Wz2sQt7HZEfDabILsY9Df45lpwHKPs4g2+z5lz/m1kAxIPAyAi0737Z0bMoWwDS0Ddb8tLmJGvhZ/5T6mNjGd6QaeeSKRVCZiV9vJoOb2hBQ656cbAw==;
	5:JvJkmMStcSfFc5+vC2weibFwr/GmOKv/C7WULsd2rCiP4w0lNAqDxcLiP2TM5OXvG+CUKR4lDHVFYuGDe+9VekdqeiPI3XtVOyrmOua46GKYeJ+Ojl0K4ltvYhzMkp9vfESkvapo60TZjBmPB9L8b754/M9IbJm6hfpWu9kIWXolVzSY9IAQBo918SE4Do1bK4cL4LF9Ng9sqtkdq7/VPg==;
	7:xoWQj5HRsP7NdlI5GCdUEIMtLOwpgC40FDy6JOq8wXFT07S+WNV2XY5X15OnNquoPg3WCxRP6+rKG9gxaAtwbDTBEss53PoHFXAQk+Gzv3UboLNEH/ZLovA4E68RsZGjV8SZKyn1EM7C4ddctYy+Kg==
x-ms-office365-filtering-correlation-id: 4a7104a4-958e-40b6-9027-08d68576f405
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR02MB2799; 
x-ms-traffictypediagnostic: MWHPR02MB2799:
x-microsoft-antispam-prvs: <MWHPR02MB279991A06C0B8B73CE7D6E30AF960@MWHPR02MB2799.namprd02.prod.outlook.com>
x-forefront-prvs: 0931CB1479
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(136003)(346002)(376002)(39850400004)(189003)(199004)(13464003)(7736002)(476003)(66066001)(25786009)(53936002)(81166006)(11346002)(81156014)(107886003)(8676002)(6246003)(105586002)(2906002)(33656002)(86362001)(4326008)(55016002)(3846002)(6116002)(68736007)(106356001)(9686003)(54906003)(316002)(110136005)(97736004)(8936002)(486006)(72206003)(478600001)(6506007)(186003)(446003)(2201001)(256004)(26005)(74316002)(71190400001)(71200400001)(14454004)(2501003)(305945005)(14444005)(7696005)(99286004)(229853002)(6436002)(102836004)(76176011)(53546011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2799;
	H:MWHPR02MB2768.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nxJAZ6jIC8iZXrYh/wAJff+EDqTKP07gvUM0NtA8xZ8Z0s+azy0z5mcogI1piy8YSvZ+RBJoMkgM8WUetePXegULhUczHfBABPPja+VXTZ40XFqXie86nNwZ2bEQDLky817pHp3w1rSRldYb6akz8DRmpP+h78WZ/4W4qLLJ4vd9171F+Mq9uXAG9wbcL/eWYhT9m55k8IVzvNKvy6cNqVCt0cfqFfpYAfGbuu+4zqZnYHN4RjVXf10A4oGA58dls9MujtnyhB1kE2lpEjpL9vXW6SsFfTz5Bm1DUXODxEWNuH/LRRY0UE7iTiiKvMhVfiIWDHKH8mEvgRNYuwnwlus2/g9nqenGaiF/H5Flhc+tYqBnvYEY/fK/ulUy0AkpvMn/LrpyOpOTKqiqhdvyvRQJTawLK1ZApp/BqU4hNNI=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7104a4-958e-40b6-9027-08d68576f405
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2019 23:18:46.5188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2799
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
X-List-Received-Date: Tue, 29 Jan 2019 02:52:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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


