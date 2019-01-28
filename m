Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 43413 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Jan 2019 01:53:49 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820058.outbound.protection.outlook.com [40.107.82.58])
	by mail.openembedded.org (Postfix) with ESMTP id 71BD460125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 01:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dIbLCPq3YO6uoQ3kNalTPG+oPt3NJo4Gg8Xs6u1V034=;
	b=nD7wA3TJMusFsibk/5rRkTXvEjMGcjRf8VDZ096yNWEQdFDE75Rs7OOLWW0Bj8vWW1Jdf19qAl4U4ORz+jVpxeJjMlyu9ur7uMiwScWWrCDLyrr6BJeqlhdfX0ysSg5YQtErnse2/swUUXfa2e7xkLJehEsLjE1eJt/dwYBcLDg=
Received: from MWHPR02MB2768.namprd02.prod.outlook.com (10.175.49.146) by
	MWHPR02MB2799.namprd02.prod.outlook.com (10.175.50.9) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.16; Mon, 28 Jan 2019 23:18:25 +0000
Received: from MWHPR02MB2768.namprd02.prod.outlook.com
	([fe80::50c6:4927:8a6b:7300]) by
	MWHPR02MB2768.namprd02.prod.outlook.com
	([fe80::50c6:4927:8a6b:7300%10]) with mapi id 15.20.1558.023;
	Mon, 28 Jan 2019 23:18:25 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: Jaewon Lee <JAEWON@xilinx.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] Support kmeta directory usage with devtool
	modify/finish
Thread-Index: AQHUlA6pSjEqrWlH6kSIHkkRtyVr06XFl2Lg
Date: Mon, 28 Jan 2019 23:18:25 +0000
Message-ID: <MWHPR02MB27682793325E802E40953AEEAF960@MWHPR02MB2768.namprd02.prod.outlook.com>
References: <1544834362-5755-1-git-send-email-jaewon.lee@xilinx.com>
In-Reply-To: <1544834362-5755-1-git-send-email-jaewon.lee@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR02MB2799;
	6:hF0jVeBU8WEH9bUMzfF2PyPvy1gG/oIgY8o879Z86VoempBIEk41jU6v8y4dDhvvzyC019a9wgTIf6mt9edPvJ0czZa5ws/tRJHU8xyoAWsfqR/CIha5rIs9h3FIZxTIACXqrlPND4yeuH6DNpSbQ1YU01FjjwuLkS9GCdGlq4cfdQiTsyZ3bBPx5Ewfgk5OvEBThUcbTcdOrkCFKgJ2s4u8t2zbn6zAIfMSFBWzGJLjl14SLLVx4b64Nu9Z4LsuegR80dGjHuHil/qq3kz7n+/RpLXmp9tFT1Dm3r9Kk+M4229fzgRECpzsp5SPP3EqPbeKyuVgwaf3ysafkq+HIhavU4fhUZXo9Mht3L3PsFuOkyhd5KWeSuPe5bM7SgKnHjRjsqtBqwegO0Ot2Bkly3TnXDVhAN4qbirNgkxblqRm9bKmvN10x6OVmcj4cbWMmxLsAFBkqih2ACAJ7r42Ww==;
	5:f5hEFJq3PFw3AL30tj2NZlLmTccje7kN7v4HVuJFQV2vdm2QxVvf4Z0SMRxS1NDEe+NG6xc+3nz3nz+BUV7/4GUpdmRBdIKsyU/dus2PA9Uw/Z9XhWg42C3b4t6Rgv7mNhwB9WMO4VGoj1nAAfRM7CwHbTK7El2PIANcGA+FQkpza7ds1gsU/TTomV6IiNFWNhtc0HJrsvVVh6LPjr+cqQ==;
	7:ecYmjnzS5+ATFiB7RB5RKKYKF96Ssva0oBCmDoxs+V6yD3Kb7Ny1Ks5nJlBrX0Mjt3Bk/dY9vS4GgPFLNoQYkYf8p+53u6OkjNt4g430OP0QNMrjoFJm60luxsKoFdIhbQo8PcR5H4dkesxMU6xGig==
x-ms-office365-filtering-correlation-id: a40e9e76-1d15-4d94-265e-08d68576e76d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR02MB2799; 
x-ms-traffictypediagnostic: MWHPR02MB2799:
x-microsoft-antispam-prvs: <MWHPR02MB27994BFBE6B165473C56D4BFAF960@MWHPR02MB2799.namprd02.prod.outlook.com>
x-forefront-prvs: 0931CB1479
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(136003)(346002)(376002)(39850400004)(189003)(199004)(13464003)(7736002)(476003)(66066001)(25786009)(53936002)(81166006)(11346002)(81156014)(107886003)(8676002)(6246003)(105586002)(2906002)(33656002)(86362001)(4326008)(55016002)(3846002)(6116002)(68736007)(106356001)(9686003)(316002)(110136005)(97736004)(8936002)(486006)(72206003)(478600001)(6506007)(186003)(446003)(256004)(26005)(74316002)(71190400001)(71200400001)(14454004)(2501003)(305945005)(14444005)(7696005)(99286004)(229853002)(6436002)(102836004)(76176011)(53546011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2799;
	H:MWHPR02MB2768.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UEKpS2BzmC2oOB1cAa6IadVdSPTNDwGvZao4tFvnX3LzX3lJXaQn7oN8tzUchkHvj7LVjXxUxBtI37ZlL49QbQtbajvcRSAMwCZdMaLbaxQphDsz3okX/OXep2gcA8Ve5e7UAHvH9uHFzpe1oY7kv99Uif9tVH3EtzEFd+CeNIVPyddBSWb/j6WIFU6qF+YInliYCvwgBxglJ9LTc9pLTaB/JaXmebxyZ6LQuw+X697sOcldbHHjF6Awc9/3nKqIl3PDaiOmpyEsGkkiNA7IeEKOsVNmQyuA3VjoTQfWuP8EA1sTzENEMi4+cBzcFSJ8UfARjATIPKXZcUxKNCUE9bxpK+HE8+SlVXv9KCBsBwRj/+xB9DwmILF6ul9WfLz5q8833lMCC367fJFNCE20okFFUuTBYKHf64FgpnGrMZo=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a40e9e76-1d15-4d94-265e-08d68576e76d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2019 23:18:25.4078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2799
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
X-List-Received-Date: Wed, 30 Jan 2019 01:53:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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


