Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 6945 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Apr 2019 08:35:51 UTC
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690053.outbound.protection.outlook.com [40.107.69.53])
	by mail.openembedded.org (Postfix) with ESMTP id B963E7D167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3udR3VsosigYNTQFOGk1bkkpUmbEfex/MmBueGspOGE=;
	b=4UqGLIuqkm4Xl7FYo+zOMZ7IBhHctTkkQ3FFi+v7c+Y2XndDk0YNEuWbleAkpRM+waL6m6sKjaNV9z7xnImgR30lHVPqFP+nyVO06altC4o2UaTqpiDLM/0VFd6PoCvANR/wmaTHuzXMEiOI7LOsbqhsS7slpyS4/uegIi73x48=
Received: from BYAPR02MB5816.namprd02.prod.outlook.com (20.179.62.217) by
	BYAPR02MB5173.namprd02.prod.outlook.com (20.176.254.74) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1750.17; Tue, 2 Apr 2019 00:01:54 +0000
Received: from BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::a96e:3c68:20c3:6122]) by
	BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::a96e:3c68:20c3:6122%4]) with mapi id 15.20.1750.021;
	Tue, 2 Apr 2019 00:01:54 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: Jaewon Lee <JAEWON@xilinx.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alejandro Enedino Hernandez
	Samaniego <alejandr@xilinx.com>, Manjukumar Harthikote Matha
	<MANJUKUM@xilinx.com>, Bruce Ashfield <brucea@xilinx.com>
Thread-Topic: [oe-core][THUD][PATCH] Introduce mechanism to keep nativesdk*
	sstate in esdk
Thread-Index: AQHU6ObMMg7tXGwOGU6nMDWyWTir0KYn/LHQ
Date: Tue, 2 Apr 2019 00:01:54 +0000
Message-ID: <BYAPR02MB5816D70403507090867CF434AF560@BYAPR02MB5816.namprd02.prod.outlook.com>
References: <1554163092-21464-1-git-send-email-jaewon.lee@xilinx.com>
In-Reply-To: <1554163092-21464-1-git-send-email-jaewon.lee@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15f91191-b0f0-4ac5-4f6e-08d6b6fe6a67
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR02MB5173; 
x-ms-traffictypediagnostic: BYAPR02MB5173:
x-microsoft-antispam-prvs: <BYAPR02MB5173E2264F9E254EF50788A5AF560@BYAPR02MB5173.namprd02.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(39860400002)(136003)(376002)(346002)(199004)(189003)(13464003)(74316002)(106356001)(81156014)(8676002)(2501003)(9686003)(3846002)(55016002)(305945005)(33656002)(316002)(8936002)(7736002)(6116002)(97736004)(105586002)(81166006)(68736007)(478600001)(26005)(229853002)(72206003)(11346002)(66066001)(6436002)(25786009)(6506007)(110136005)(186003)(102836004)(7696005)(53546011)(5660300002)(486006)(256004)(14444005)(76176011)(52536014)(476003)(6246003)(99286004)(2906002)(71190400001)(86362001)(53936002)(71200400001)(6636002)(14454004)(446003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5173;
	H:BYAPR02MB5816.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b7mQboLd1l7XlNq1UAVVgpNDBZQRhGf06j3yR7SIElGr8VGTobXdvOUh/qoa67amzYC85H5PKpgs9ul+EC3fGn/Enk6S7l/Z5JHLS7B5wxrpvUaN9R7cIOEVi75UcmXbUC0jLjqUIRnDFLw18WUofCm3UdP1AN2v+1uG0znscP93LBZDFbcsW3EZ5/3pwa7PBFUPOU8KkiJ82mCpcPuzQklHTO911UGY1R1NztinikBWkCIXP30lsqrktWtZc9YY58yii+JmxfB3BBU1GCvtsLHc5EsuVJf1IAcZ6GH4x8HghCnP40SJD1fBcSs2AKXRQaEwnKKUyTWAzjXrg2U8GMz4NFAIqJl+c4b83l9/rOvEXOYfcGm2lovAc1mZBjWq+4ApkG6iwckkeEj4hbK+LCfy12teRJWCzq5vRWLg7l4=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f91191-b0f0-4ac5-4f6e-08d6b6fe6a67
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 00:01:54.0766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5173
Subject: Re: [THUD][PATCH] Introduce mechanism to keep nativesdk* sstate in esdk
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
X-List-Received-Date: Tue, 02 Apr 2019 08:35:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Disregard, will send on master branch

Thanks,
Jaewon

-----Original Message-----
From: Jaewon Lee <jaewon.lee@xilinx.com>=20
Sent: Monday, April 1, 2019 4:58 PM
To: openembedded-core@lists.openembedded.org; Alejandro Enedino Hernandez S=
amaniego <alejandr@xilinx.com>; Manjukumar Harthikote Matha <MANJUKUM@xilin=
x.com>; Bruce Ashfield <brucea@xilinx.com>
Cc: Jaewon Lee <JAEWON@xilinx.com>
Subject: [oe-core][THUD][PATCH] Introduce mechanism to keep nativesdk* ssta=
te in esdk

Using SDK_INCLUDE_NATIVESDK flag to toggle inclusion of all nativesdk* ssta=
te into esdk Currently locked-sigs.inc is generated during do_sdk_depends w=
hich doesn't pull in nativesdk packages. Generating another locked-sigs.inc=
 in do_populate_sdk_ext and pruning it to only nativesdk* packages by using=
 a modified version of the already existing function prune_locked_sigs and =
merging it with the current locked-sigs.inc Also adding SDK_INCLUDE_NATIVES=
DK tasklistfn to the logic surrounding setting tasklist file to not prune e=
sdk sstate during creation

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
---
 meta/classes/populate_sdk_ext.bbclass | 28 +++++++++++++++++++++++++++-
 meta/lib/oe/copy_buildsystem.py       |  8 ++++++--
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_=
sdk_ext.bbclass
index 40b0375..d98b0e5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -20,6 +20,7 @@ SDK_EXT_task-populate-sdk-ext =3D "-ext"
 SDK_EXT_TYPE ?=3D "full"
 SDK_INCLUDE_PKGDATA ?=3D "0"
 SDK_INCLUDE_TOOLCHAIN ?=3D "${@'1' if d.getVar('SDK_EXT_TYPE') =3D=3D 'ful=
l' else '0'}"
+SDK_INCLUDE_NATIVESDK ?=3D "0"
=20
 SDK_RECRDEP_TASKS ?=3D ""
=20
@@ -401,9 +402,27 @@ python copy_buildsystem () {
     excluded_targets =3D get_sdk_install_targets(d, images_only=3DTrue)
     sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
+    #nativesdk-only sigfile to merge into locked-sigs.inc
+    sdk_include_nativesdk =3D (d.getVar("SDK_INCLUDE_NATIVESDK") =3D=3D '1=
')
+    nativesigfile =3D d.getVar('WORKDIR') + '/locked-sigs_nativesdk.inc'
+    nativesigfile_pruned =3D d.getVar('WORKDIR') + '/locked-sigs_nativesdk=
_pruned.inc'
+
+    if sdk_include_nativesdk:
+        oe.copy_buildsystem.prune_lockedsigs([],
+    	                                     excluded_targets.split(),
+    	                                     nativesigfile,
+                                             True,
+                                             nativesigfile_pruned)
+
+        oe.copy_buildsystem.merge_lockedsigs([],
+    	                                     sigfile,
+    	                                     nativesigfile_pruned,
+    	                                     sigfile)
+
     oe.copy_buildsystem.prune_lockedsigs([],
                                          excluded_targets.split(),
                                          sigfile,
+                                         False,
                                          lockedsigs_pruned)
=20
     sstate_out =3D baseoutpath + '/sstate-cache'
@@ -414,7 +433,7 @@ python copy_buildsystem () {
=20
     sdk_include_toolchain =3D (d.getVar('SDK_INCLUDE_TOOLCHAIN') =3D=3D '1=
')
     sdk_ext_type =3D d.getVar('SDK_EXT_TYPE')
-    if sdk_ext_type !=3D 'minimal' or sdk_include_toolchain or derivative:
+    if (sdk_ext_type !=3D 'minimal' or sdk_include_toolchain or derivative=
) and not sdk_include_nativesdk:
         # Create the filtered task list used to generate the sstate cache =
shipped with the SDK
         tasklistfn =3D d.getVar('WORKDIR') + '/tasklist.txt'
         create_filtered_tasklist(d, baseoutpath, tasklistfn, conf_initpath=
) @@ -658,9 +677,16 @@ fakeroot python do_populate_sdk_ext() {
     d.setVar('SDKDEPLOYDIR', '${SDKEXTDEPLOYDIR}')
     # ESDKs have a libc from the buildtools so ensure we don't ship lingua=
s twice
     d.delVar('SDKIMAGE_LINGUAS')
+    if d.getVar("SDK_INCLUDE_NATIVESDK") =3D=3D '1':
+        generate_nativesdk_lockedsigs(d)
     populate_sdk_common(d)
 }
=20
+def generate_nativesdk_lockedsigs(d):
+    import oe.copy_buildsystem
+    sigfile =3D d.getVar('WORKDIR') + '/locked-sigs_nativesdk.inc'
+    oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
+
 def get_ext_sdk_depends(d):
     # Note: the deps varflag is a list not a string, so we need to specify=
 expand=3DFalse
     deps =3D d.getVarFlag('do_image_complete', 'deps', False) diff --git a=
/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py index 7c=
b784c..5bc728e 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -168,7 +168,7 @@ def generate_locked_sigs(sigfile, d):
     tasks =3D ['%s.%s' % (v[2], v[1]) for v in depd.values()]
     bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
=20
-def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, pruned_=
output):
+def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, onlynat=
ive, pruned_output):
     with open(lockedsigs, 'r') as infile:
         bb.utils.mkdirhier(os.path.dirname(pruned_output))
         with open(pruned_output, 'w') as f:
@@ -178,7 +178,11 @@ def prune_lockedsigs(excluded_tasks, excluded_targets,=
 lockedsigs, pruned_output
                     if line.endswith('\\\n'):
                         splitval =3D line.strip().split(':')
                         if not splitval[1] in excluded_tasks and not split=
val[0] in excluded_targets:
-                            f.write(line)
+                            if onlynative:
+                                if 'nativesdk' in splitval[0]:
+                                    f.write(line)
+                            else:
+                                f.write(line)
                     else:
                         f.write(line)
                         invalue =3D False
--
2.7.4


