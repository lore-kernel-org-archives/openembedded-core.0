Return-Path: <JAEWON@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0085.outbound.protection.outlook.com [104.47.34.85])
	by mail.openembedded.org (Postfix) with ESMTP id 1E93278EC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 00:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=P0+bdrhep30niAox6UdZUf1Lo3ecQGIB4BCRiajBOM0=;
	b=za/qlPWXOv026mhRRhFWOe0Zba44t+vO3NBBiLhFfGJ1bKqSWkcRTKIMy2LN5IoY7YoeSXBqZzgWMsZ73QyVmpwmgWo723+kWoHj1K0RcPuoFU4Mf7w/QA3Qs/zcPtEASF/q+lQwPhLowVHD3LXb0e5axdJYOA2MRSYAJswcnNU=
Received: from MWHPR0201CA0039.namprd02.prod.outlook.com
	(2603:10b6:301:73::16) by DM5PR0201MB3509.namprd02.prod.outlook.com
	(2603:10b6:4:76::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.21;
	Thu, 9 Aug 2018 23:41:48 +0000
Received: from BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by MWHPR0201CA0039.outlook.office365.com
	(2603:10b6:301:73::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.19 via
	Frontend Transport; Thu, 9 Aug 2018 23:41:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT056.mail.protection.outlook.com (10.152.77.221) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Thu, 9 Aug 2018 23:41:46 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1fnuYs-0007Fw-0p
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2018 16:41:46 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1fnuYm-0007LB-Sv
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2018 16:41:40 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fnuYc-0007JX-GN; Thu, 09 Aug 2018 16:41:30 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Aug 2018 16:41:29 -0700
Message-ID: <1533858089-20244-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39850400004)(136003)(376002)(346002)(2980300002)(438002)(199004)(189003)(2351001)(36386004)(106466001)(14444005)(54906003)(2906002)(106002)(8936002)(50226002)(16586007)(316002)(72206003)(26005)(575784001)(81166006)(305945005)(356003)(81156014)(7696005)(51416003)(9786002)(5660300001)(50466002)(48376002)(44832011)(63266004)(6916009)(36756003)(478600001)(1857600001)(126002)(336012)(2616005)(476003)(77096007)(107886003)(186003)(426003)(486006)(8676002)(47776003)(4326008)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3509;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT056;
	1:CQ87W/S5m4yNzeQ6Hcq08t1gC7nFjPhykP3v2PXaETXwT0hkSOACNFZG+MdrYLkaC0i87OWcXjzkG00PXLl0VRnQ4nvsyu0hVmeLzvgfDZoEhKitW67NVO8VBT/AMvv2
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7b5b019-6efe-4fd6-f75b-08d5fe51abfd
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM5PR0201MB3509; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3509;
	3:BLkiCMEnYwRRnJ9pguoWtLqtz0eQzx6JDm/WDxvfCK9/DhrfSFB2pOMq3GaL/UgziMdqRCAfqL3kAOkjuvX7NhsT+5qQe9y1bDI0Bak6sPErf7kFRxWAgcWRsT573Z/hagm3D7/qzTs2gQxwSgmZV1VBd20tkHvPIUEXOPIM0Pjb3Wd+LK09k29Rr7TmUCPpoWr3qw1cpsFLfnIna7OfzArlEMAy9cZdoamF3K9MusqrZjEC8SPFkGH+L+uxIQaOPkkBAkN9IAkM2nTqyrfIY6TxIwW3WgA62ZiKI7MbiqB3mb5cEZM5Fzu15dq/PTtCc1Gaxfv8gM6N6SJn4DqQJt/tiBvsNCdqz5kULblklvM=;
	25:ETFLQxbgCRoGr5K0PtHEf82Bv8EWfINvKR+tCZf/hRqlMkeVSI6friTl1SnbEnpLiX/yjat9M/fcbB5CRG68x1L2wtORjKTGHbp7VwpAtPEO7SQldiCZRlvOq/nB+HNNKO30OpWogm7/DmeqXKNG4zpbEv2uB5yOryYACYz95b0jJ98iWIbEP18kXG+XxSae0JE1vIMcVYkrf7egS/znddniXrsYqI2cm0nL+qYKfONmQ4vhZcvHMwr7f7hXKAcAi+hg24Q9WWwd1wuX3ZbGLZEh/1tY51qvmpL3dSd7csYxKTrSPaz8vRejqkiiL4MFnq+9uMZR34k5hxHwvfCftg==
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3509:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3509;
	31:ASpKVz3d8T3BFY581FsahxrtlOMvmFT7hk2XdVOibwMjtqOMAB8R15EHv2A4zYGvHR2lDwi6ZuYSBnmoDxJmSPZvmG6oTqjfhHdk7lUIXfMB9vTSSF63NC2nialgR8SyPTmrQABb1PiEYSKLd2XGW3XJXyT/dCp/HfkBiU7KvL163t6iuF8YGFwR4DWMl2MMFRJ9q5L85DQ/4GBNCuWilLUKC+VdqB6waYSEc2D+2TQ=;
	20:WQJFgrF29a1/UfuKCEhyvMYvN85CPD5sq0myKTJdpsZPuMHe+fj23ixNEpGcyByD/kamywvoQUHMV7txL0LAHNqpiW64EYdRYAdUZOz5y11qdgK1L4FKYPhx221NxTEFwliiHidiKSfL+8jqpr/udlcnlm8irIgBU4+0fdftAy5XEIDIBDWeFJSUyezgmWaHTdkYKhFZrgpV84x8UTTf2xAXv4boqte3up30r9KpI3tJJg1qgUyYJ3gkvK5cZElcuLo7BpnDIkHDt4+U2J2ozLl/IIEYUF86G21N2Si5dnx7eTF4WJtCPo/u2bUM9VHlHmMCR13B92BiAzynBk1dBdhxgbTGl4USaqUfPa/VRoLMtH3u3kDT8EOZXn83JcNutpSQLToRjwIXQ9ziPaY1JlRvlp9Otm734cd6EvBYyHrsJQ/6wFfRw+55/xie0zzHQQZJk91UhYf6IYkgklUgt7G/mNIb1tEH36HUtYEnnz/fHwUvTk7k1SajjC2VQqKF
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3509772B03788B112A080D5FAF250@DM5PR0201MB3509.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231311)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0201MB3509; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0201MB3509; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3509;
	4:Pf4i3iQonMZmCQxt6/Vza5U3ZBO2QdmCFSbz2/u3mAsYb9l8fmbPeunal6PlvxhpbSTmRAX/yexiSpLfXEip60RtPJS5dZVrt4T2pGcffmJivMU571nLDQONjkAg/BvUc8IxAchNeFCR0Tvw5W4C94IR4Yvbpwcp/Eea1ve6Nmu7Y3xx2qGq3mQg2Cytop4TZ4lvbvF+S0fUPLxquoLqFtUOfuupN4WXPXTRMoZIq+FoKItXN+8ioMH654jH86Oe/uE9q8qr+y+Ta8GydClaPU/gO5+eQ5ivAMD6ZZ20Lst43FNVBatijaXTxrYh52In
X-Forefront-PRVS: 0759F7A50A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0201MB3509;
	23:+g1bFzIwez4m6bA3a8c//LuCgMcqQwxxRbn8MtV?=
	=?us-ascii?Q?XXjrIypUbmOEBGj8F3QOUQnOhekzb4srULRRm1rFZf8/Rgf3Pscv97us5nOa?=
	=?us-ascii?Q?wV4GinlkoKEppo99B6Yl4RtoYjmRxgRZ8/MWKonTsCSNywUUl0oPTwgJZq8Z?=
	=?us-ascii?Q?MFmgV8k4b7qfwLakJPqKJ2DX1I3C2tUge2xU7bEzZYIzdpWbF1tqH5wyEsPu?=
	=?us-ascii?Q?5poaPqx9RvyZUMw0jQpZ7qwFexKDCdqvMGDlfqWSA6MhFsE2P7xokEUZ0OcL?=
	=?us-ascii?Q?sgw9Og0biurw9T47yfShbrhaI6LK2rdwQLKi/k+HuJuje8hvGCKImwmS/kg8?=
	=?us-ascii?Q?vsFAUhqGbhq3Y3YAL+Cl2aw17OkFjGsZGI8b6yf0ytWIlq9Z5qTL9TM0yDRM?=
	=?us-ascii?Q?8ehRdR327l0jRG3wcPzN/mg8frArFNs0MObnYfaHmrL8ie+2YbpKaSf74r+j?=
	=?us-ascii?Q?d5SOYGnkxiILczTp6EzAsAPsv6HrOIRFyqOPAN+E+zQmAKp+dfHFvQUmWxbP?=
	=?us-ascii?Q?S0aZRvIImll3RH0CBlhf+NmUGyVwFvhl7rZSY4jMonbjEJtJlSnl+W6N9VUE?=
	=?us-ascii?Q?cmz4scz+pySk37VoU6px2qU04uk03LXsMtdvmV7gOIGmTnjUHrEFfYfWQQwJ?=
	=?us-ascii?Q?xr/hL997bs8xQ82PWmzN8ze5rYRMcs7d2njnTpHCXFuSpvlM0aAgLwWlU+J9?=
	=?us-ascii?Q?gyzko7nPOCqonMR704RQSFe+V465OP7lb/p7RU9faXA5c9gq2LhezbRmS/Zs?=
	=?us-ascii?Q?BJch71Z+NMTaIm7Jz5Ih+FLWjMspiESnjCVLTH+/stxfHuZFZBflwYk5NwjZ?=
	=?us-ascii?Q?UfTyWdmKUPQTKur1kfCYaCfb5KBHHRKGwkzTpxAeIhDeYcAojIVQwaDe+DyR?=
	=?us-ascii?Q?XzWgEvguAGMWWP9mILFNx2f3q21g7AAk2ULXPLmNIjzLvixUWY3BZb5OqZu+?=
	=?us-ascii?Q?OlQe2TVelrZ44NBSKVQU+6O/etK2SPkXH1MUUGoD17QgFgbDV8Vdjc9wZIUU?=
	=?us-ascii?Q?VZVoALmInud0e530LTSyerk3lA9eyiqoxgHuIuezerWY/Z5ViKlh0IuE4l4S?=
	=?us-ascii?Q?TbLo6bTODiWQ5/qkghZweYmvIqUKYbRTEY7XPsLS2v9B7yb5H8aTacZFXVPA?=
	=?us-ascii?Q?gJh6MX20NHz9qTjambCFxmUxMia9V4nHDWXwRukWIEA4lsqh84UHfWw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: wOyfnU7NonI9Oq74XxsZsMIgHZmzHcXWM+RXm2ZVktUu1VhjaA2S9YhEP8TlBmtJXggHxgEgy1sPfV/t6z4nZStolSS961bgWgelQckrVSiux/TsY+Tvi4WrUT+L9vi/FrmdFVASGGlXYPqtCJnYXV4l8Dz2Quemir2l2fPFbcszRKZ54oa9ZSIIxfpNoAu1VVAevCjuxXnsuIJpZQY1TKNqasWMboZNKpwNkFJNyDE3MVMdA6BLEQ7QBoH+WMDdbL7wv8SxX3Y1eKYYFztDX6vDMDIeApGMpihMDNMCezHV55LNmewPa2v6UWVUVTzMJ52LHHO+9Pkuu5VXc4w83Uy58zQvfksqRqm8hwlSSlM=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3509;
	6:dx0/Ga0IPJe/ou3S7/DsT7JAV2NSIuj9PqCoV0wmC4PArG1WwLta9RoR+w2PzIbhLSkY7MtcGX2nxwEYfucguVHil5eSRxFTZJe8Q9LwtITfI0r5wSEtQHqsmYcPqS20W0a2YmLpVMN2f3C5S7q1ITrep06GUQIdnQBAqKK9kdCrME2sXrC19tsh9rV4bSOPxvnVTPYbJ5IyzUingO4HP7uyQJm87RiaCkXDD141Ox8bAZXb0Gc81kTmEkVQn1kudD4gybN+aaTeesKmq89EnANvKIPBM3TArp6P2lUME7QzpIwymfkXCgW44WvAeQgr+b5qgnrlz/CN3Aw/o95AvHUdWQ7Fn4yq0hLgfM80FzOqpCInrrau9wbNKP1TEbYGfbckZWYVON9C8Pn4kWFVJ6J6saA8hs5+Jm11UM2yfI+/sxZNqSGEwYuIBmKCvGOQ9RxNEIUyhuJ6BxIzI8yYHw==;
	5:uCn856JrC5Wp9ibxg9qzTlxx/0AKdk/kAdwY/+l7NZMR48DXhxCopUBAh5iQZnKrOMzTserf792bEL93sWP4Yw6WvnxwdDUd0gqUTUDePLRy+I8S6OWFqv5DSlY3hMZ93QlJYeUfn7nnuh/CujDJTDIjkgy3tHXrY4qE2lvBIs4=;
	7:wGdZXAjMNOzITXl7grwSwj/qId+lqBWRBe6i5uMXYqdYtrcOP8hu90wAj05CKmu21N9crH5EmeWXeuCBitMNDJ1qd+elJSo4zEvCc2lGi7SzQaiSFN2cZilqLrZGf/beJcPcKHM8ETeb88amhh4kyRrA6vwA06GEXqO2qLJMTRDnsGwCM1AzAs5VlmquCmdjIOS5t/4rT62iLBWs4CNQjSKqK2MjU500tyR0QD9VlrIXBYw+IRqMRtVHJNGSUg4S
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2018 23:41:46.9147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b5b019-6efe-4fd6-f75b-08d5fe51abfd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3509
Subject: [PATCH v3] devtool-source.bbclass: Support kernel-fragments/patch not in SRC_URI
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
X-List-Received-Date: Fri, 10 Aug 2018 00:14:04 -0000
Content-Type: text/plain

When using a recipe space kernel-meta, scc files are added through
SRC_URI, but they may include corresponding kernel fragments or patches
that are not necessarily in SRC_URI.

For bitbake, this is not a problem because the kernel-yocto class adds
the path where the .scc file was found to includes which consequentially
makes the .cfg, .patch file available to the kernel build.

However, when using devtool, only files specified in SRC_URI are copied
to oe-local-files in devtool's workspace. So if the cfg/patch file is not in
SRC_URI, it won't be copied, causing a kernel build failure when trying
to find it.

This fix parses local .scc files in SRC_URI, copies the corresponding
.cfg/.patch file to devtool's workdir, and also adds it to local_files
so it is available when doing a devtool build for the kernel.

[YOCTO #12858]

v2: also supporting patch not in SRC_URI
v3: fix spacing issues

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/devtool-source.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 56882a4..67cd0ba 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -90,11 +90,23 @@ python devtool_post_unpack() {
                         fname in files])
         return ret
 
+    is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
     # Move local source files into separate subdir
     recipe_patches = [os.path.basename(patch) for patch in
                         oe.recipeutils.get_recipe_patches(d)]
     local_files = oe.recipeutils.get_recipe_local_files(d)
 
+    if is_kernel_yocto:
+        for key in local_files.copy():
+            if key.endswith('scc'):
+                sccfile = open(local_files[key], 'r')
+                for l in sccfile:
+                    line = l.split()
+                    if line and line[0] in ('kconf', 'patch'):
+                        local_files[line[-1]] = os.path.join(os.path.dirname(local_files[key]), line[-1])
+                        shutil.copy2(os.path.join(os.path.dirname(local_files[key]), line[-1]), workdir)
+                sccfile.close()
+
     # Ignore local files with subdir={BP}
     srcabspath = os.path.abspath(srcsubdir)
     local_files = [fname for fname in local_files if
-- 
2.7.4


