Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 21382 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Feb 2019 05:38:04 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790045.outbound.protection.outlook.com [40.107.79.45])
	by mail.openembedded.org (Postfix) with ESMTP id 42BD17C4C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 05:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7bJMBKLbde4y4Mxta7wNnzvlIi6s3fcJgvMED+PH3Vs=;
	b=Lxi08iz6rYZICTHteAULYVnvYCtuafS4agTztQj1cEUi0ApsZ6vw9MoDwIfEVUmSYSMh7tmvKjw7z4dNfFmkVeUfSuP3+GquoKl2/yKC6DEt7f0jSxHlhoCW6aTcP1ms3Bl7mw22Gk0hieuW07FxCR7TmXoDCowI5A8ua7KPZOs=
Received: from MWHPR02MB2576.namprd02.prod.outlook.com (10.168.205.142) by
	MWHPR02MB3344.namprd02.prod.outlook.com (10.164.187.156) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.17; Thu, 7 Feb 2019 17:07:57 +0000
Received: from MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::e0d0:c6dc:98ad:9955]) by
	MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::e0d0:c6dc:98ad:9955%2]) with mapi id 15.20.1601.016;
	Thu, 7 Feb 2019 17:07:57 +0000
From: Chandana Kalluri <ckalluri@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-Core][PATCH v2 3/3] devtool: provide support for devtool
	menuconfig command.
Thread-Index: AQHUtOei8G0M0tPNvUOboOoPJBE95aXUpQrw
Date: Thu, 7 Feb 2019 17:07:56 +0000
Message-ID: <MWHPR02MB257673C04CA2E07601B102FBB0680@MWHPR02MB2576.namprd02.prod.outlook.com>
References: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
	<1548445982-25182-4-git-send-email-chandana.kalluri@xilinx.com>
In-Reply-To: <1548445982-25182-4-git-send-email-chandana.kalluri@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ckalluri@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR02MB3344;
	6:xV4zb1sXb2mP7pLqhHC8WWlGS18iblSfagGNzO7x1r3UDva+oB72YnWo0ptBennIO2hKVuFC3h3M6TJ2+PWlBGlr1PKc/xh8exmD/JS3Bj4gh4i4jDvSd5Qae1vJJiIVw3OUOzI3rPFUDLAADOCpSAPkiRviXxtjmTmY0nU2hbgOaajJcx9Nl7EV4EsuTi7X1PG7FpqJhURdT56UPI29em+c+AoKG39Q9OTUaqFbjbkqOm7YsfrX8URlHHw8e9FknEJCWhXcu5xfh+YtBeCfBeD8kuFsZFJ7Z5n5+KW8QBu3RplB4Xeo3CKHwtjnGg5uDe1dhBIlrbav71Wk8VkXefQ0IneKVdpSqMysr7DIlHax6iLrnPF3zwSpm35lO0phBxpx6TCfGO99tS4IQi+ywXdqbflpTTIdmkUc7yBh9y1FRQaQI7N1LP3eUmus+tMWZDcPPawcOdfer5y1ZkxXnw==;
	5:TXQyyWN65/nL3zvgZUXrCQI7Gw2pxazEw/d7syP58pHqawAfl34VnmoO25jC5nTdDy+HuM7oMkOwUpngPlAcepcjO3x3Ch28oimhnvkgE5SyjckE6UrczshuJU5MoirybQTwVkdSge8GqjxJmCYsMgX9QPs/uI7HFfsR4TFWvfPOr0OtYunmkShODxruREM9J2R2iKF86S9KfVu+/IWaWw==;
	7:cvs72nEvstJVL4g5yapfcayunzAsxbtFzYtCEB9Gv5ixh2V70zgNlKK6FjvyZyl+buD6dOsPdHJE4nFpaPRwJQjsRnqwgMq1x6PIvRIWUPemFZhrG26QQeW9ibToZDEN5XnQaN1K85hNKFnfsJwb5w==
x-ms-office365-filtering-correlation-id: 9edde5de-2893-4d54-c447-08d68d1ece7d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR02MB3344; 
X-MS-TrafficTypeDiagnostic: MWHPR02MB3344:|MWHPR02MB3344:
x-microsoft-antispam-prvs: <MWHPR02MB3344BD4FE2D6B647EB75854DB0680@MWHPR02MB3344.namprd02.prod.outlook.com>
x-forefront-prvs: 0941B96580
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39860400002)(366004)(136003)(396003)(189003)(13464003)(199004)(105586002)(3846002)(106356001)(486006)(4326008)(2351001)(97736004)(6246003)(107886003)(6116002)(316002)(14454004)(478600001)(7696005)(186003)(6916009)(26005)(53546011)(446003)(74316002)(11346002)(76176011)(66066001)(102836004)(476003)(6506007)(2906002)(33656002)(256004)(68736007)(99286004)(8676002)(8936002)(2501003)(9686003)(71200400001)(71190400001)(14444005)(53936002)(86362001)(5640700003)(229853002)(81166006)(81156014)(7736002)(305945005)(25786009)(55016002)(6436002)(2004002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3344;
	H:MWHPR02MB2576.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /FGUbxk2jNwU88WLV8fj2ha5wU6qeiJPG+WtmEIBs2NdA/PIUijYO/LBVDVD3UJ/Phx5uqdlPLJBnp0ML2Tr7VFaXFqIvP4Hk6wg0KbVJCQk7JdUTa4lMkry0xey5/LnZJjr/mFi1jIy2NRB6cvJ9E2SojiaMVUTf4clCan5/kToIDbCX82JwjhzzKp2Uc7oUMNM1+ChWyTgMozRAo1shFTcXrYxhxtXpNTI4yVdxyL8Qg6zeHZWPy2m/TEjTgIvgEdN8+HXt7M45mUTh3zCrfiznr3/+eoJBkqb6C9boRxkU2bwaHnfqc0YiSKrSCYR6sGVSIgnhSdzRgGf99ulC4IY63SRZ73WFaxaxIc6VLgWAUk2NbVffDVkooP59xA3iqbwaHVSaNFPNA0mzPyCshxdCFfdiU5Iq/nRnSWvDRE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edde5de-2893-4d54-c447-08d68d1ece7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2019 17:07:56.8754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3344
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3344;
	23:LVE2Z82R5leXreMDeXWDUahgipHMirvTMiuvDgyFBGqHGstPN86pRsFz8FoOypVxm4qXM+RZINtYmxF0GaN73zfo9urTUYJCyinP5yzf521tOUDmL5rGR988egCkoexHbZF4i7eG9kSdAxzTl4Y/bg==
X-OriginatorOrg: xilinx.com
Subject: Re: [PATCH v2 3/3] devtool: provide support for devtool menuconfig command.
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
X-List-Received-Date: Fri, 08 Feb 2019 05:38:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

-----Original Message-----
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>=20
Sent: Friday, January 25, 2019 11:53 AM
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>; Chandana K=
alluri <ckalluri@xilinx.com>
Subject: [OE-Core][PATCH v2 3/3] devtool: provide support for devtool menuc=
onfig command.

All packages that support the menuconfig task will be able to run devtool m=
enuconfig command. This would allow the user to modify the current configur=
e options and create a config fragment which can be added to a recipe using=
 devtool finish.

1. The patch checks if devtool menuconfig command is called for a valid pac=
kage.
2. It checks for oe-local-files dir within source and creates one if needed=
, this directory is needed to store the final generated config fragment so =
that devtool finish can update the recipe.
3. Menuconfig command is called for users to make necessary changes. After =
saving the changes, diffconfig command is run to generate the fragment.

Syntax:
	devtool menuconfig <package name>
	 Ex: devtool menuconfig linux-yocto

The config fragment is saved as devtool-fragment.cfg within oe-local-files =
dir.

	Ex: <workspace_path>/sources/linux-yocto/oe-local-files/devtool-fragment.c=
fg

Run devtool finish to update the recipe by appending the config fragment to=
 SRC_URI and place a copy of the fragment within the layer where the recipe=
 resides.
	Ex: devtool finish linux-yocto meta

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/menuconfig.py | 80 +++++++++++++++++++++++++++++++++++=
++++
 1 file changed, 80 insertions(+)
 create mode 100644 scripts/lib/devtool/menuconfig.py

diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuco=
nfig.py
new file mode 100644
index 0000000..38133db
--- /dev/null
+++ b/scripts/lib/devtool/menuconfig.py
@@ -0,0 +1,80 @@
+# OpenEmbedded Development tool - menuconfig command plugin # #=20
+Copyright (C) 2018 Xilinx # Written by: Chandana Kalluri=20
+<ckalluri@xilinx.com> # # This program is free software; you can=20
+redistribute it and/or modify # it under the terms of the GNU General=20
+Public License version 2 as # published by the Free Software=20
+Foundation.
+#
+# This program is distributed in the hope that it will be useful, # but=20
+WITHOUT ANY WARRANTY; without even the implied warranty of #=20
+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the # GNU=20
+General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License=20
+along # with this program; if not, write to the Free Software=20
+Foundation, Inc., # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301=
 USA.
+
+"""Devtool menuconfig plugin"""
+
+import os
+import bb
+import logging
+import argparse
+import re
+import glob
+from devtool import setup_tinfoil, parse_recipe, DevtoolError,=20
+standard, exec_build_env_command
+
+logger =3D logging.getLogger('devtool')
+
+def menuconfig(args, config, basepath, workspace):
+    """Entry point for the devtool 'menuconfig' subcommand"""
+
+    rd =3D ""=20
+    kconfigpath =3D ""
+    pn_src =3D ""
+    localfilesdir =3D ""
+    workspace_dir =3D ""
+    tinfoil =3D setup_tinfoil(basepath=3Dbasepath)
+    try:
+      rd =3D parse_recipe(config, tinfoil, args.component, appends=3DTrue,=
 filter_workspace=3DFalse)
+      if not rd:
+         return 1
+
+      pn =3D  rd.getVar('PN', True)
+      if pn not in workspace:
+         raise DevtoolError("Run devtool modify before calling=20
+ menuconfig for %s" %pn)
+
+      if not rd.getVarFlag('do_menuconfig','task'):
+         raise DevtoolError("This package does not support menuconfig=20
+ option")
+
+      workspace_dir =3D os.path.join(basepath,'workspace/sources')
+      kconfigpath =3D rd.getVar('B')
+      pn_src =3D os.path.join(workspace_dir,pn)
+
+      #add check to see if oe_local_files exists or not
+      localfilesdir =3D os.path.join(pn_src,'oe-local-files')=20
+      if not os.path.exists(localfilesdir):
+          bb.utils.mkdirhier(localfilesdir)
+          #Add gitignore to ensure source tree is clean
+          gitignorefile =3D os.path.join(localfilesdir,'.gitignore')
+          with open(gitignorefile, 'w') as f:
+                  f.write('# Ignore local files, by default. Remove this f=
ile if you want to commit the directory to Git\n')
+                  f.write('*\n')
+
+    finally:
+      tinfoil.shutdown()
+
+    logger.info('Launching menuconfig')
+    exec_build_env_command(config.init_path, basepath, 'bitbake -c menucon=
fig %s' % pn, watch=3DTrue)=20
+    fragment =3D os.path.join(localfilesdir, 'devtool-fragment.cfg')
+    res =3D standard._create_kconfig_diff(pn_src,rd,fragment)
+
+    return 0
+
+def register_commands(subparsers, context):
+    """register devtool subcommands from this plugin"""
+    parser_menuconfig =3D subparsers.add_parser('menuconfig',help=3D'allow=
s altering the system component configuration', description=3D'launches the=
 make menuconfig command, allows user to make changes to configuration. cre=
ates a config fragment', group=3D'advanced')=20
+    parser_menuconfig.add_argument('component', help=3D'compenent to alter=
 config')
+   =20
+parser_menuconfig.set_defaults(func=3Dmenuconfig,fixed_setup=3Dcontext.fix=
e
+d_setup)
--
2.7.4


