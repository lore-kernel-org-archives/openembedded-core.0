Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 34232 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Feb 2019 04:55:27 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740047.outbound.protection.outlook.com [40.107.74.47])
	by mail.openembedded.org (Postfix) with ESMTP id 495A66C4E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 04:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8zzZRtaDklBYTgreKNiuVbAi+eUNE3YWptYbGIAcQXM=;
	b=P9sU5qf0NhXBQCysj+ftASoQBHcJkxQesICAOEElPMB+xCASCBrZdvgN1JL8E/bfDSSdlwCm/q11eoxLoTQQiZ5j7ZAdi5GEK49qD3yzDVMkpCr01eDUh9OzpDpVGq7tLUmovebBhVfkC4cYE2U8TbTTSDxpTwnlvsEocN+V23M=
Received: from MWHPR02MB2768.namprd02.prod.outlook.com (10.175.49.146) by
	MWHPR02MB2606.namprd02.prod.outlook.com (10.168.205.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.22; Mon, 11 Feb 2019 19:22:22 +0000
Received: from MWHPR02MB2768.namprd02.prod.outlook.com
	([fe80::50c6:4927:8a6b:7300]) by
	MWHPR02MB2768.namprd02.prod.outlook.com
	([fe80::50c6:4927:8a6b:7300%10]) with mapi id 15.20.1601.023;
	Mon, 11 Feb 2019 19:22:22 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] Support kmeta directory usage with devtool
	modify/finish
Thread-Index: AQHUlA6pSjEqrWlH6kSIHkkRtyVr06XFl2LggBW+sCA=
Date: Mon, 11 Feb 2019 19:22:22 +0000
Message-ID: <MWHPR02MB27688D3C582D786B154D2E4AAF640@MWHPR02MB2768.namprd02.prod.outlook.com>
References: <1544834362-5755-1-git-send-email-jaewon.lee@xilinx.com>
	<MWHPR02MB27682793325E802E40953AEEAF960@MWHPR02MB2768.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR02MB27682793325E802E40953AEEAF960@MWHPR02MB2768.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR02MB2606;
	6:/4ITmNVjzE743W1RUajGSFv8PwXZgNAwUDvmzKf8PTP273cflGzVxKD89u7WU/kvsNFdi0crtEFCI4sctxG6xT+vDccVqyFrf7Awdlz0mGY8TsCSBkMRxZYfc6dHW51DCct0L6K5YNyvQDNX/S1iM/mh6jvOq4AhZxHgtE79huMDIwTpN4oMkDi8ZRYuvS7DADccO6JEgdcNuwDMLjIRVByFFbCMvl81W3ItswNDb3Pbyw+8ExYTCq9anCo+zCeiBJQb0Qu6gQJKyhzmUp6I+KvdnF9HG5/4yDmVtMY/tv3ROv34CuBQoJ8ybQwwGUZWoulpStdAMNXOhDvXjVqrVC5f89nNFW6NgJfi25wpoBJFg+2/EgJ5NVQUY9vCGPXl8MjLynzc9d4xlCZbjX9KCvVuP6CHRRbC/Ao987vo9M2nkt6GxCRzyIlyY52QspRGofdli2dheTtfx2SsBLsddw==;
	5:Vr85tZZOzN4ciWprLdjTsEEeI1dDlbjuxL5fS+QuWKVQHjNudqXqwTC7Ep8p8dSB11QP+D0+C3GADi8VIpDVSVS0AyhY03Bi6RSMgtw/zGXtVKPIllMxxgqOjgvAMff0WPC7WOizek+EDfKNwDZZygMi1YRHMnjPBbW0/6LVd+ATROnP7Dgh6hZfLBK6mYV5rwaIrfqwdx5bgTVx/IUGIA==;
	7:C6g2PAG4Mi40MfOZjtlLCAodOnzwrktDspb8kv6o7zzH7eamNehxeKUz/6tZo47lOV/+16IRPnj7LJR91WaTieYpySyOLrXIu2ZV8FbpSJ7adzdciAyplpjHRPuuJMMsmQC2UbKXV2MeFCIdXr5M6A==
x-ms-office365-filtering-correlation-id: daef7403-47d6-4b7f-1587-08d690563f81
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR02MB2606; 
x-ms-traffictypediagnostic: MWHPR02MB2606:
x-microsoft-antispam-prvs: <MWHPR02MB26061CA3C5C731DD54D14F26AF640@MWHPR02MB2606.namprd02.prod.outlook.com>
x-forefront-prvs: 0945B0CC72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(136003)(366004)(396003)(39860400002)(13464003)(199004)(189003)(33656002)(11346002)(97736004)(4326008)(2501003)(25786009)(6506007)(53546011)(86362001)(8676002)(9686003)(446003)(8936002)(81166006)(72206003)(81156014)(6916009)(7736002)(305945005)(2906002)(186003)(26005)(102836004)(55016002)(74316002)(3846002)(6116002)(66066001)(476003)(76176011)(53936002)(5640700003)(6246003)(106356001)(6436002)(68736007)(99286004)(14454004)(7696005)(316002)(229853002)(478600001)(486006)(256004)(71200400001)(14444005)(105586002)(71190400001)(2351001)(107886003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2606;
	H:MWHPR02MB2768.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d0GPUxCu5FdTWlJdKNTxLyYRbyKJUo2Q6cbQtuK2XWphXLprewO6A/pMh9AsNjvGR8vzwtwlS1eLOhNmR2DAqXInUizomCtogXVE2xSLF2PBwOgmF6Pn1R3qSFi43yFXnmH7MdQ0+Izhw/5HvvuhxwGDGuCXxpcTrrelLqXCYmRkYjFycbMgE4alwalHm+l966J1IUgVxmtZPoc5hTOtO+hO6bGhjU4Pvtt0Oxgj+gPamNte3iSx0m1rOg4NX1H35jvnim4rEKi5L2QeWcGT56P4zXAfzpVeUDU1wIqBNz2+cxwnrY3CKD86SkkrkU6XgpGxEEybvG02gipZCxmSW/H8yU+HxcvpG6CrzjbsPF3yiNaRucYwecynBwA4kePv/czxC4EQXxQvkFSDQFR7bMI6/ZLOzw0qEgOPPJj2KxU=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daef7403-47d6-4b7f-1587-08d690563f81
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2019 19:22:22.4013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2606
Subject: Re: [PATCH] Support kmeta directory usage with devtool modify/finish
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
X-List-Received-Date: Tue, 12 Feb 2019 04:55:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

-----Original Message-----
From: Jaewon Lee=20
Sent: Monday, January 28, 2019 3:18 PM
To: Jaewon Lee <JAEWON@xilinx.com>; openembedded-core@lists.openembedded.or=
g
Cc: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Subject: RE: [OE-core][PATCH] Support kmeta directory usage with devtool mo=
dify/finish

ping

-----Original Message-----
From: Jaewon Lee [mailto:jaewon.lee@xilinx.com]=20
Sent: Friday, December 14, 2018 4:39 PM
To: openembedded-core@lists.openembedded.org
Cc: Jaewon Lee <JAEWON@xilinx.com>; Alejandro Enedino Hernandez Samaniego <=
alejandr@xilinx.com>
Subject: [OE-core][PATCH] Support kmeta directory usage with devtool modify=
/finish

When using Kmeta directories, devtool finish will add every single file in =
the directory to the bbappend. This is because in the current implementatio=
n, the get_recipe_local_files function treats the kmeta directory like a fi=
le. Modifying the function to loop through the provided directories and ret=
urn all included files instead of just the top level directory. This will e=
nable correct file to file comparison when determing which files are new/ch=
anged and need to be added to the bbappend.

Adding an extra check in devtool-source.bbclass to not copy the cfg file if=
 its already included somewhere in the kmeta directory

Also during 'modify', when moving necessary files in the kmeta directory fr=
om the workdir to oe-local-files, the dangling parent directories are left =
behind.  This in itself is not an issue as the temporary devtool workspace =
is automatically deleted, but this causes an incorrect include directory to=
 be added in kernel-yocto.bbclass.  Changing the order of the if statements=
 to catch the correct conditional. This is safe to do as when not in the de=
vtool context, there will be no oe-local-files directory.

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/devtool-source.bbclass | 6 ++++--
 meta/classes/kernel-yocto.bbclass   | 4 ++--
 meta/lib/oe/recipeutils.py          | 9 ++++++++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-sou=
rce.bbclass
index 1372e32..a811000 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -103,8 +103,10 @@ python devtool_post_unpack() {
                 for l in sccfile:
                     line =3D l.split()
                     if line and line[0] in ('kconf', 'patch'):
-                        local_files[line[-1]] =3D os.path.join(os.path.dir=
name(local_files[key]), line[-1])
-                        shutil.copy2(os.path.join(os.path.dirname(local_fi=
les[key]), line[-1]), workdir)
+                        cfg =3D os.path.join(os.path.dirname(local_files[k=
ey]), line[-1])
+                        if not cfg in local_files.values():
+                            local_files[line[-1]] =3D cfg
+                            shutil.copy2(cfg, workdir)
                 sccfile.close()
=20
     # Ignore local files with subdir=3D{BP} diff --git a/meta/classes/kern=
el-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 496c8a7..2f556ca 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -138,10 +138,10 @@ do_kernel_metadata() {
 	for f in ${feat_dirs}; do
 		if [ -d "${WORKDIR}/$f/meta" ]; then
 			includes=3D"$includes -I${WORKDIR}/$f/kernel-meta"
-	        elif [ -d "${WORKDIR}/$f" ]; then
-			includes=3D"$includes -I${WORKDIR}/$f"
 		elif [ -d "${WORKDIR}/../oe-local-files/$f" ]; then
 			includes=3D"$includes -I${WORKDIR}/../oe-local-files/$f"
+	        elif [ -d "${WORKDIR}/$f" ]; then
+			includes=3D"$includes -I${WORKDIR}/$f"
 		fi
 	done
 	for s in ${sccs} ${patches}; do
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py index =
9c99164..e63f7ae 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -480,7 +480,14 @@ def get_recipe_local_files(d, patches=3DFalse, archive=
s=3DFalse):
                     unpack =3D fetch.ud[uri].parm.get('unpack', True)
                     if unpack:
                         continue
-            ret[fname] =3D localpath
+            if os.path.isdir(localpath):
+                for root, dirs, files in os.walk(localpath):
+                    for fname in files:
+                        fileabspath =3D os.path.join(root,fname)
+                        srcdir =3D os.path.dirname(localpath)
+                        ret[os.path.relpath(fileabspath,srcdir)] =3D filea=
bspath
+            else:
+                ret[fname] =3D localpath
     return ret
=20
=20
--
2.7.5


