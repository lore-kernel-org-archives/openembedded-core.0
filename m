Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 117226 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 09 Dec 2018 16:22:17 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820047.outbound.protection.outlook.com [40.107.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3DDAC6C4B5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Dec 2018 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xlpmOq+Gd+pAj5Reat60kwXh/9NuQBmHWU3vHLmNlKw=;
	b=hr3PdYcOf35VyBJH3lmcoq4IHDdiWEtJrYwhnfx5XssxHEb9N2LsKGmia6TBn6/1ZqgI5AcRGwnPqOHrPKdVc7BigFWzgz+kMSSCXGdAd6q6XP6ivs2qPn+3KPVm6BAJjBoy4giJ1xJqZxAO/oxigHu9xGKeNVf65+t8VX4sji4=
Received: from MWHPR02CA0023.namprd02.prod.outlook.com (2603:10b6:300:4b::33)
	by DM5PR0201MB3511.namprd02.prod.outlook.com (2603:10b6:4:77::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1404.20;
	Sat, 8 Dec 2018 01:32:06 +0000
Received: from BL2NAM02FT013.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by MWHPR02CA0023.outlook.office365.com
	(2603:10b6:300:4b::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1404.18 via
	Frontend Transport; Sat, 8 Dec 2018 01:32:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT013.mail.protection.outlook.com (10.152.77.19) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1404.17
	via Frontend Transport; Sat, 8 Dec 2018 01:32:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47519
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gVRTQ-0008Az-C9 for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2018 17:32:04 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gVRTL-0007ic-8n for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2018 17:31:59 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wB81VwFB010871; Fri, 7 Dec 2018 17:31:58 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gVRTK-0007iX-9O; Fri, 07 Dec 2018 17:31:58 -0800
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Dec 2018 17:31:56 -0800
Message-ID: <1544232716-20173-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39860400002)(136003)(396003)(2980300002)(189003)(199004)(316002)(16586007)(106466001)(2351001)(6916009)(63266004)(305945005)(47776003)(107886003)(2906002)(486006)(36756003)(476003)(106002)(126002)(478600001)(36386004)(7696005)(51416003)(81166006)(2616005)(336012)(186003)(77096007)(426003)(356004)(50226002)(81156014)(4326008)(9786002)(50466002)(8936002)(26005)(5660300001)(8676002)(48376002)(192303002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3511;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT013;
	1:/MdgyH2VkpOiqzK1XiHOdUBbAliSkWb93heiuK+sC6wIPv2QwQqMNlzwshB5aokZ+i72Y0jlT1eaGCuSYkiau1UEkZ5tLC/jj90VHydWXauUaZclNkel9MCw0futpFoX
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47003544-6256-4a92-be8e-08d65cacf609
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM5PR0201MB3511; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	3:mrhO5K5d0JAVw0r51eNjY5RNKEPhAPAM+CkwgdIZe4th8WMsJZMIALdM7ZGn6XjqnJu/xENA3bJdaT8VncUJ6XE4sNTIMX8TmvTxwgPXmcl/pASoCTqXt28bItP1oihWMbbmXrGWThCd/pcM50SW7Nch/Unb9okdfF22cYjPixigPT3OJUbv62YtxQEu3pb1nYKeilrmiejBd4QaaZpBcME+7NpqiuodikDxPcNREVzp1A7TtE/Igdy0L6iNhUR3jk4YVQOMBMtduT5cQHlBbJIJ5Ni153rgOp2JM5NcWbIfbcQUeN/TYipjGT5il/VBuq28Ft/aShNa07L8XQkd2SkXYA4RrES5THFMJWe7zRI=;
	25:Xnyf2ly/w4rNqhdhvjguqm/7lKUWUiGeplkjXOEs5p58jHUQ//r0ObkP2SzRZxdlqCilAk394LdcuQjAFEsz90tAc7oyK4YrqNtEU4VFIqykNSacMeGnrrf87sPhfbVtsj8vxZUSzx5rCIWPcj0tW1J0zlGh+P6Fgodwl0HCpvbdMZULj9KiD6xg9KQ9vrUypoDMwjuGwEVg3GH7YYzk6NT2s+DWpYZ6RfY6h8cV3jBVuMIb5LE0a6/yIhH7cyB4VfHwv29EU1PWRjZZ8KOogeR9C0d7zoYW+SON9vqg06WpCdNUIhfYSyR2i6P6AGJJeJQu/KU6qfKhHSVsFOFWOQ==
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3511:|DM5PR0201MB3511:|DM5PR0201MB3511:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	31:86QNYO7vo5wj6yt4XW+fV61VhZ9p2mTWMj07dXEqIvh8nvGVYuHJDwuuD/V6yFI+gJNjzNjFTJtxFIq87sliVW8HOQacNvIPBusBA64yhbkVjrlkBe9YkmsqTCAJ4rfpFAQIuQJ4SeCVxWlEhizRSl6VUTfJ3TtalDkmDExggb68qHAgd1dHPZCcw3iGR27D0Tsiug3sMetvV8u9+EJymnlhAElLW2gZv0Mqa03XRXY=;
	20:jnjL7a69Z+awXJirIYjYSFEKrt9KDXXp9vb+WdlJTmzyP5Ygk7QQ2yCKiS5SJFswsbgFB4bBOzKfYiBPPR5Bx2BZsQ0rJTt64dOrYifXugMcHFSHK+gBYwnGZkmNVBObHYzQQXRX2NTHVpe7/gwLG6oF1HNemHSmzI21vjl7vRhHf0j8ja43xpQ1Q/VyxwlloWPyjEgwI9QOTl6eVi2OvHxlSCkQZlc+jVyFyk1+wY+09wJuBNdfhgDg+cyaHWRyUht27eIEW27V0DwzdAe8IDhdT1EWI9eYqFnfmESxqJrzySx1fzCioFPFdGUfWMvhd1wA8rgZnoSuCe23ZO0DWofJtdt9IKBrJqcepm5Vj+LjINwm37Q99Hec2G4h6n6//K/jkRAInauUGJvbcEBN8NdhV+5tBPU/BnOI1imQZ8GDxzERmrdWB3KBe/hy6rLtAFKNvUyOPQqSThWXEN8fMFCW/edKP3sCutnCmRfSf0Lkq/RqFaQGhFEVJ4OSo1Af
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR0201MB35113BCC1B5388FA6C90C9DBACAB0@DM5PR0201MB3511.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93004095)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM5PR0201MB3511; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0201MB3511; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	4:mN7jZQi5d3lamyt4l4A8zS10qb+6yPzrhkL8p9Uee9b6qe8bcEsBoRpcDsKmO1mA3e+pSnNCsGYA757qJ4/0EDy50+R1+eI8AEi1cOLIoVDZUo0SslsSKjQNFGNcqmIWs3/Kjf3wBCzHdRlpqv0tBCxZGK9eX1LE4dkJ12+C+CAtb6ZcFiIJfNSQsSo6/M9XqzrrNMibDHWPnA0IkKNL1wDMINrmyMW2ufAf+MhzLJXXGYJ7FO6e3y7VaYUnZ2SxMpBCbf5vmoxWg4SG5RmKqg==
X-Forefront-PRVS: 0880FB6EC1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0201MB3511;
	23:az/4dFj1xn5QsRjLTs7+HVwyzbSduyvRVWyXgtv?=
	=?us-ascii?Q?RfBkpV1XqtCg5zc6Ua9QM4LgVnOlyYC5sZ5HPrVIY0ykBbEaVF0VYWLpNCxW?=
	=?us-ascii?Q?AR59FW7cx68fcMeuLwCp8OgwaHin3axW0YZMDu0m5f/WXCBJ0UlgAasuZwkE?=
	=?us-ascii?Q?rUp2476UXljnLDoqEa9d6m6vopaL7IsshPcOPaf5PTZYW5WQT0SiYeTMaITY?=
	=?us-ascii?Q?dEh4LcEvYVV3N8qTSTLibWypP9v/WwtlrtqaB+qk/JJNeqrpPVCxwV+oLcGs?=
	=?us-ascii?Q?mchk4P12ldxzd/z5iIB8VDNo5Zvz6BSvZQ20k7m/N9UuLEueUUO5t0DpYN6Y?=
	=?us-ascii?Q?UpAhj4knP8MF0QHbDhJcmKKnX+432JDlnGET821tM6RylOyqupGylJ5mTkaA?=
	=?us-ascii?Q?q06OknhQb9IATxHlpTFBgQ+foYzOZ2misek2mVQkSFRVEOTjk0l3yqAaZFsj?=
	=?us-ascii?Q?4g6unVBI5N7L8CgEPR5z50RsV6DvudYMHj+hVT85Q9vukN67JyUGaJEZDb6t?=
	=?us-ascii?Q?daPYsBZb1xMnSnvqAB+cifHDoeaMws3Lh2Mc/v2tINxgZV6rojgm7MXbeDIH?=
	=?us-ascii?Q?YQRJFbqxWrf5fFNwQ/wFtjEPfOdr0J4TAuA5YNf3OCrmvpaaApgfd9s/9wmg?=
	=?us-ascii?Q?djhY/Fyc9wWXlwwijtCluHyzRLY0E3EPJCQ+kgq9PI7iWvOwcNrijYnBixY8?=
	=?us-ascii?Q?7NtWAJ/89e94QM1qqlQn3CtoTC13/xJY2CBMABTh+s+SHN5pvpUR5IL/n1vX?=
	=?us-ascii?Q?ljJdex6fIAeEYvcQKqrIZzRmzNAFJ1nzrDYUIvmbRC82rwnpCYIx6Ogi4Oef?=
	=?us-ascii?Q?X6zJaO4bIfTaOqG+KCtcQD9wMUB3YJ2ySo1lng2wJlOzWZN2W8EVMn2NWvFg?=
	=?us-ascii?Q?BUfib8i0Gli2NL3Zatu/HLW6jhYw5WMtHbGaztxKtXJ5UtdVFybjXdtdmXDk?=
	=?us-ascii?Q?knhr5C8bgL5dVoWq6A2Hf/EvECI2hL+1wBeojqcLnAyUVXLGMaArhaARH0Qn?=
	=?us-ascii?Q?EVAvunKnwAfrA734ADfHqyNBO97UDkiYVeH1zeHdEYdmOJpDeqVh/H/02HX6?=
	=?us-ascii?Q?t28lNlM8=3D?=
X-Microsoft-Antispam-Message-Info: 9lSUDmtW51jrlFBYBDITtx/ChmPwUc4SgAetlakSFD3a2C0TSRdLEq+JOfNA0tJqO66Wu9EqbVjFp+3fbDAIObeiP/vI2DPLsFCZ/itOsrAzl9TCXU0XRtL+qkMuvW0BttDMNh4bmBS8IoFgHYO6IFdUIdS2DvMAdHeCpDMKAe6a7qG+f8jWHI2ZP2u+vVOxZ7Wkva+XfHcO2X5AozOQPeMOFJYciZvnhSCCzG7rMbmDzHOwB4vyzHWJjLDz/w17A9YZ+CLDhTFG0k4eXkQf+fFQJrzjKyL0cKJ002J6CH1d96Ys/6QaGxKdKKvOwokwBJJSdVad0KhvqVg0h3b2QTiHp9/1L0dVN4KyvgLcFqY=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	6:JXDejjbxPxGJiICDcKntsC2N4PGEvN0B3rIyPDzC5ajcT+b+Di4AOJzDP38biw1sYRZetLUS1kcZAxScY9ktfPCeccZRkdk2o4Y9RwR7pMlcXMGqx6dCswgzNuswkcGb13Pqp84hUB7YeRaWkkkuTEzqNNqb8ZIg4oyBQY2vb1FhkmCoeXP4377I4lM6eK21pMt1siFdQjSsLvM4/pQo8tcaA21hiJ/duP/R4WAdraGaeIn4sKrl7q0imjHBuC4LHwo4sKVIkAvWSkI8hnaLZewIZvoX0xLIh2uVrHPNhn9sDfqug/i+QLdrx0ZcaZGGvpo7bI8lCPnQ3UAyapyDMOya9hUbTKrvmhF9wT0rlL/nAje2H0URbKfapLiW1MwPDKZ9G4k7w/XMYA0vC3zLp/tzbDGT+T7a2AUdRQz4Gmydf4cU+QFe0novyNRKy2gMyJGy4mPW1QNCMA0KsQh6cw==;
	5:To3Wz4uVEEstHdsCLNdG4yTCUbLYHsJbn9mTx2R94BLskT8eGygObjASxlTUrJHw9N+ucr1rNhw9SksdnZs1uYdhMto565gJ0rc7TUAPXwZSIb3sM1F9c7HgLE+WN0ZeqcjnlqlJnV/ypkR/IYgtibaoOj+WFLztpynDlpnT820=;
	7:+LIBKOiUHuZBZFunbEVr7kSNn6s42RwyCMeL5ZtoujPhdcp58ObuE9AGJYJfIbsAfw4WEmkwEqG5EM/v2gqB+tzCHGSS/OgoKCUOm/3MDOBlxypghhXhBSe+8yWKxAygaNdNU7lE/la1Qwg1Ihh+Pg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2018 01:32:04.8967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47003544-6256-4a92-be8e-08d65cacf609
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3511
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	23:ldSKlfrfPvw3AEb0zrCNXpxktEaM9jtYeiM4rbG1fOEJZX7ks8HYQ6iREDPgSkpFwHpal4TCNevcygMO3CGCbG4Pc3eQ4IuqTLMyvNqs1ilVn9lPwYUZNZ1o2zhpTlkGdE6XnvjFLfQzD97YrGsPzA==;
	23:IY0fewzOCmx6waMhSedFxRlQ5D17kXmCtjKVufxXLgBDAHG8T/RfWgxbSzLiWWZbZluZeL3qqsgJ9aTn7y6fVwaqBix6O+2nYJdafFPOhAV3oSLYep25mqBIXvX+xGQiUO7crdEHC2+DT/Z+yAtoPw==
X-OriginatorOrg: xilinx.com
Subject: [PATCH 1/2] create_manifest2: Dont match filenames which contain the directory name for new manifest
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
X-List-Received-Date: Sun, 09 Dec 2018 16:22:17 -0000
Content-Type: text/plain

When creating a new python2 manifest, there is a corner case on which
the filepath for a certain dependency that was found, could contain
the path of an existing folder, e.g. ${libdir}/python2.7/xmlrpclib.py
module path contains ${libdir}/python2.7/xml, this causes an issue where
the dependency doesnt get eventually added on FILES for that module.

This patch checks if the dependency that was found is a directory, if it
is, it checks if it matches one of the existing directories on the
manifest, if it is not, then it checks if the dependency's path (without
the filename) matches one of the directories.

Also some misc indentation fixes.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../python/python/create_manifest2.py              | 28 +++++++++++++---------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/python/python/create_manifest2.py b/meta/recipes-devtools/python/python/create_manifest2.py
index b674865..3465951 100644
--- a/meta/recipes-devtools/python/python/create_manifest2.py
+++ b/meta/recipes-devtools/python/python/create_manifest2.py
@@ -209,7 +209,13 @@ for key in old_manifest:
 
             inFolders=False
             for folder in allfolders:
-                if folder in item:
+                # The module could have a directory named after it, e.g. xml, if we take out the filename from the path
+                # we'll end up with ${libdir}, and we want ${libdir}/xml
+                if isFolder(item):
+                    check_path = item
+                else:
+                    check_path = os.path.dirname(item)
+                if folder in check_path :
                     inFolders = True # Did we find a folder?
                     folderFound = False # Second flag to break inner for
                     # Loop only through packages which contain folders
@@ -262,16 +268,16 @@ for key in old_manifest:
                                        new_manifest[key]['rdepends'].append(newkey)
                                     break
                     else:
-                      # Debug
-                      print('Adding %s to %s FILES' % (item, key))
-                      # Since it wasnt found on another package, its not an RDEP, so add it to FILES for this package
-                      new_manifest[key]['files'].append(item)
-                      if item.endswith('*'):
-                          wildcards.append(item)
-                      if item not in allfiles:
-                          allfiles.append(item)
-                      else:
-                          repeated.append(item)
+                        # Debug
+                        print('Adding %s to %s FILES' % (item, key))
+                        # Since it wasnt found on another package, its not an RDEP, so add it to FILES for this package
+                        new_manifest[key]['files'].append(item)
+                        if item.endswith('*'):
+                            wildcards.append(item)
+                        if item not in allfiles:
+                            allfiles.append(item)
+                        else:
+                            repeated.append(item)
 
 print ('The following files are repeated (contained in more than one package), please check which package should get it:')
 print (repeated)
-- 
2.7.4


