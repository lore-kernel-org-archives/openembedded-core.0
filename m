Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0084.outbound.protection.outlook.com [104.47.34.84])
	by mail.openembedded.org (Postfix) with ESMTP id 6966C75454
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Vl+hp1cQImfXWfwzE4rVlAt9kwsH7hzgZ2HwYJNoXl4=;
	b=jEWmIaRIx6FCY320m7NUtvloWmk6hxp/NhMOaxRwOndEtSUGKNTochD/6ZX2OvJW59NF85XPmGbiwfJRnOep+hXCi3BhvBHPe5G2B9YCvlEzqdyuIg5+z2Xq/XFak2DLtC2mrAZliEIQhuAi1QQHX5Xx3re0I1n8Lb/2RY6SAg4=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	DM5PR0102MB3416.prod.exchangelabs.com (2603:10b6:4:a0::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.13; Mon, 4 Jun 2018 23:06:32 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 16:05:57 -0700
Message-Id: <20180604230602.8461-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180604230602.8461-1-mkelly@xevo.com>
References: <20180604230602.8461-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR0201CA0027.namprd02.prod.outlook.com
	(2603:10b6:301:74::40) To DM5PR0102MB3416.prod.exchangelabs.com
	(2603:10b6:4:a0::17)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR0102MB3416; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	3:MCTR5PwnJY4qHjGxURg2wNr/uSKFW9V9IfGvTWX65zcFj9m9LMlhMTnEs1cOlrwJIcnfQyzJYo2c7apYl2HcHIx7OwDVrNz/lDfR/jhLFAtFLknhNbS8XlZO3SklMRdpHAb8d97QPMjdErSHiN8+bWooyEZ/0TkhYvl7YrQvsUk0nnpe1Zl770WH4209uXulsJLe+c+anELdba76MWyaeQJDgTTmlEwpqCKJJyrLwdVTkftaR4IyUDPLZJOTBRsD;
	25:W3yauLtB1ShKP72dJ1xlFiq4sjAGdEbUQhHBONCvNfyXUFzZ9Hkb7g4cyXLUAQcNf8TufWvPvujlcJBNW8n5yn279UOpYVbh/EpTETnKzgEKE+xrdwQji5BofXzPMFUcBFCqqMLb49yDrYIaJHK0xpSm8D4Xukl3uXr0RZquQ3yELuiCA+6W/GQ0LLT3BRAD0HJCN8W6zFvCZxhqN72f62zgieNnjgIs/NyZPTGYaUMEGxXMoYy2CFoPnWOCat9pZ9CDbPd4jrTk6x9l6pq5ud6M7PlUEV0G6H4kzgNn1vkJa70OWyaYNJLlP09GC6Eje7bSw7P2pSh0y+I4ntsgGw==;
	31:BjrvijBmDSLV+xN2nt4Cgd6DDqZV4y+lQKmLGk8NdXVfvZKdAsy6d9QkI1Cxok5k20OMirIlHAtjsNwwovW/heLpocNOp3zrq/UX+Hfxz61Rr48Uay/61KXYIcsARA3QBBCb7N62fHBKkTxRp5XsTsDCVMX+AJseOVfOVDWtxZKyjUCX8sZLVJylJxnsgYCQAp7GDlRlFoaZ4uQ0+MioNvz8KrqI5+1NlXV95SaX0y0=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3416:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	20:C+bpZhpM6H7qru18feGW/zmB0NPB6SOohnz2KxKVVqF65g6P3iWXOHpkeHvcCXHK7IpiuiA8fA2tAf2vO8NVUquijoAfsTTyYn9NrcFN04dq6KgxFfdzHVdiSbmjWe1L8Ddf7DhaYPbNoD0qokKv+6Ph+PMfJeeX02GVqfEEB7B8cR/1PJhy1DfMrkCdp28hOII0s7wWhvdH08mc6uuiXymU1X3r3JuLI5OSLX0hdbIUOqBNw7p0EHXd9m7/H054U1TzdInzqZS4lBVjSK+wFg8AEJ7AHagZmKpsRE5Ug8usdoTYzjFDAy6Vx2lOkBaFombKGET9rkbv7BbTlHEoeGmKIHXcSlhipqYPbjKH5I71JwNV0AXFJjfFG08maj82NBAWfGg8pDoug+sooDhgNuJtHpDdSAwF7CG+29zNyQgGJUDdKPgw/ArWPJ+qc0dbnjU8q3w5Vb4XNZDZFXXPFTj4PvG/OFR0jzst3U6VSjfeR2FJwFvwe9eXftTDv9qd;
	4:7Gq6Se8YqKLGp1dIGc7PN5Ml3y+cwO05VEdfupHu6GAhuROC5cDI2aW/TIw2aIfUD+7/1QjzTfEvy3jxvpSKFflv3JP0TSDGkXQRM2yDwF3PJI5MwTjU/lm6W/H+D/UsZF9RY2Ok1letmkfGjWwOsogPuYOQ1rHUQtwTpL/mtrxYWrSQecC3Dnrtxbb263xFQ840pfZXTaFT62/d+uotoPRd6QAx4EwjuODj4WIFDRZ9t2rV/V6JlJJautolAl+KfVEl1IQYQt8VY4fOJY2u1w==
X-Microsoft-Antispam-PRVS: <DM5PR0102MB3416AC3C52CA46128871363EAB670@DM5PR0102MB3416.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0102MB3416; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3416; 
X-Forefront-PRVS: 069373DFB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(39380400002)(376002)(39850400004)(346002)(396003)(189003)(199004)(39060400002)(81166006)(81156014)(4326008)(54906003)(97736004)(446003)(8936002)(5660300001)(2361001)(11346002)(53936002)(50226002)(2616005)(50466002)(16586007)(6486002)(2351001)(48376002)(476003)(186003)(956004)(486006)(47776003)(316002)(26005)(51416003)(76176011)(386003)(3846002)(6666003)(7736002)(2906002)(16526019)(36756003)(6916009)(305945005)(68736007)(1076002)(66066001)(106356001)(107886003)(86362001)(8676002)(7696005)(25786009)(52116002)(105586002)(6116002)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3416;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0102MB3416;
	23:SVf2NqgLBYvqtog17kod/NIBmrvycU+sp/rxKGE?=
	=?us-ascii?Q?GPT1uTNNalzDHF7V8tYgGOPu3ozpOAEPZ0vpZcwuXy7G59MNiJI3R5sXjHl4?=
	=?us-ascii?Q?aO1EBOxIhz+oo7zTf4Otf9wiFBC/s5ILpozrgeBL7rR+DrEqjrhA2/4OqDqi?=
	=?us-ascii?Q?s3iUyyU5JWODsRI6/M42H4p91dqPEHLrJFXJIlSYanpUsYpEA5w6itq2JhNL?=
	=?us-ascii?Q?yZlKd6B/1YhELbYCiVKaiHSReXiDXElh2/mr+GvNKpmQa85DtwbWl2Nj1iUI?=
	=?us-ascii?Q?yroBJETtaapJ3ZkL+P5deSkLeQYbjYj++Hlbrfn7xAjtpGzj4zwBIF7FHlCS?=
	=?us-ascii?Q?h1zAGS01ZprWHKV8w/sEktA+2NnQJGNQ6CouCUK/9StNLJgplvMUj6XloP9N?=
	=?us-ascii?Q?ORyNMo8l3SSkSKXdOESnmWHlcuyK/vuMmwWFDg5P9TZt51EnO0KFuMiLIbYJ?=
	=?us-ascii?Q?w0tLbzSpDmTxUcoLDS0gCnYVRlOnNlwo6QyJQx5au2pG5RdbkHwiuKrZzUOc?=
	=?us-ascii?Q?ZJZnC3SwaJ7se+jOOya3lHEvw1SYlrTjGCJb00X2fglab61XJ0xnik1oF8mX?=
	=?us-ascii?Q?lFYdzCZ3Z452nDRwsl/bLDnShbLOUaq1Mn1l8NB7ZRad+CzD4vWtaubcV/5G?=
	=?us-ascii?Q?QJCbD7oD11goUTE2zOWw75YxFSTssCKT/7B42oza0RZ47qx40sDpPM9Gosvh?=
	=?us-ascii?Q?128xhoD78Ac/jHIu3LJRGfJh+xf6onTZuKXjx1GjSJW/Hlw54NCiOkrMBC1N?=
	=?us-ascii?Q?niKA/wNmmiMpKWHQ9ZNu2UM0GFAfIpJ/g8BO79w2KtYwAiw5HXinIixgeeEI?=
	=?us-ascii?Q?JacHlT7rGqyI/kJblr0P9ZLijrpEO0i+Ws6xR1AOF5qsijWgH4wvYk795hse?=
	=?us-ascii?Q?fe9xEewSnE/R6Lo8kNxDgbm0U/BQHMLDVzdj+WJdpXmtqgkzuphkjQWDuHtr?=
	=?us-ascii?Q?VajcS2zjpIy8OgurQbT/hqYso1Oq+3DW1slYeNFEdFmMMnH6/GaaZsah6PSZ?=
	=?us-ascii?Q?U5rRoAw+4xtWo+AdrB11j+CidXUpzu6XFwKxuGv/PBok92Scfve1HPdcGMkF?=
	=?us-ascii?Q?mBdk9FJLT5hyHEZMOkdudemKrIGiUx/MaS5vi9PFeOCa+F1rRY73BGdrbcec?=
	=?us-ascii?Q?YNirkKFnCZgXs+5B0Nh823u0A89TqIy8QuobTyqmFAPWCFINylE4HwV/H35E?=
	=?us-ascii?Q?lRgWXdR2ISz6dDimsNLEJBLljqAoxH5hygjAoJjhr4ss7pWGYW90WX0ipgNj?=
	=?us-ascii?Q?yQKuff226LMOJQCqFWCe34yvciv1WVzjQYjjUGpAag5KNiO3NzPUMohkBGZf?=
	=?us-ascii?Q?2VA=3D=3D?=
X-Microsoft-Antispam-Message-Info: 1i4HCXUpLlvh0JEfnumROsgEqQB1KCDR1pYekXovNTeW3SKukpxP4uS3Q5L66kNylJBTHWVgcMofX8iZW1dfjHL6GaMC2bDn1rzFpofm8ZT1zrU+FUUTmWdrgjG/EMPTu+Ge9xchHYeNWBB/T6vayVIKo5dImJ89MgTyhIcbx9gwfvPfxg0t8PmLPkg3HabE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	6:tpx2UdEwpOSlJLX1DZpWPWWold3C1DG5b/bcPt1PgTQ/BrKABmasNsVhJjsBE5Tx4ZVuVORUkUPbnPuhPZ5GrBqyCIa0C1VRsaT6fvPuq8r9+agKA4x+qA8F0qJCMkRInI8/II+r4zm1bStOkXT3Om1kTYFdu+Bg3IVju1FrScEHFsNQR9DqHfVUHdaRWwVL/KUPpEUDszdVHVMl/s6IHD1nWlHmvrleKPPKZj9fqji/0sLVPDCkK2bMF6jVE4ihGWuN+k1vtfpN+HXs/F30SW44CSa2LG2YzNM3oBrf9j6t66BoRzpBHc07imqdZ7n5Spzqvpp/ctNKBi/BZzZ8xq+kKAAyFOHVEtApnzK+uOy9GEFBCTHaC0Zk9QHGoNGU+uPoC0oW67FZgYHxWbF9eTCoDK2jTbaxv9jXufJqkJKa6+ypbH2We3QeJRdKW6qA358pg4RcOltYDan4fZjYCA==;
	5:yYUKdDd5j3sueaGu4iN1qC4btAs6JfBih2PZ581iGERs1xXDeVKn/LejZS7ilpqr1BaLnZd4tBrRKRbspFnfzBGn9hrnqy9+ZY5cPN4HjGy9XAzWivdVzKhcS+lMvGqivgpf7VxkaX4f+U19giQO2gNltIy64Z3ElCUErdkXNBE=;
	24:+MtvZzEz+3fn7NIs/EGxyHebMH7G4k5b96734DiV35pPnKXnAvpdNoQ8xn/03W6gUHZH1t6Cjz7CQ2MyObFdUqshZL1doDgZa80tIUqyBEw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	7:ijVXe+l2/hxkZiE7hqjzZ/n950towRJHH7qfvnFB8EqHhOu2Aw0W7eBiHH6GsPKEAKp+W/TeePXLc0I+wvQKt4Yd08V/dbDdpmu0WKo/WewvLAxo9cgU7oUZHGkpUx0gDpdkKPVbmRzYubZ5zF7GUGQQhnU57DRHYi4Q8/GK6B3WMgiBzrKTCWKTzOJHbU2mh4dQccKld7y5oLlllh/Be7+1qickZMHeHmJ7fcOI4r6+sj5ryO+LJQqV5TgcgyRl
X-MS-Office365-Filtering-Correlation-Id: ca6aa7c0-cdb1-4053-1b34-08d5ca6fd059
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2018 23:06:32.5902 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6aa7c0-cdb1-4053-1b34-08d5ca6fd059
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3416
Subject: [PATCH v3 1/6] toolchain-scripts: retab file
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
X-List-Received-Date: Mon, 04 Jun 2018 23:06:32 -0000
Content-Type: text/plain

Two functions is uses a mix of spaces and tabs. The rest of the file
uses tabs, so switch to tabs uniformly.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/toolchain-scripts.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 71da5e5409..a72436167c 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -122,7 +122,7 @@ toolchain_create_post_relocate_script() {
 	rm -f $script
 	touch $script
 
-    cat >> $script <<EOF
+	cat >> $script <<EOF
 if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
     for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*.sh; do
         \$s "\$1"
@@ -166,13 +166,13 @@ toolchain_create_sdk_siteconfig () {
 toolchain_create_sdk_siteconfig[vardepsexclude] = "TOOLCHAIN_CONFIGSITE_SYSROOTCACHE"
 
 python __anonymous () {
-    import oe.classextend
-    deps = ""
-    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split():
-        deps += " %s:do_populate_sysroot" % dep
-        for variant in (d.getVar('MULTILIB_VARIANTS') or "").split():
-            clsextend = oe.classextend.ClassExtender(variant, d)
-            newdep = clsextend.extend_name(dep)
-            deps += " %s:do_populate_sysroot" % newdep
-    d.appendVarFlag('do_configure', 'depends', deps)
+	import oe.classextend
+	deps = ""
+	for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split():
+		deps += " %s:do_populate_sysroot" % dep
+		for variant in (d.getVar('MULTILIB_VARIANTS') or "").split():
+			clsextend = oe.classextend.ClassExtender(variant, d)
+			newdep = clsextend.extend_name(dep)
+			deps += " %s:do_populate_sysroot" % newdep
+	d.appendVarFlag('do_configure', 'depends', deps)
 }
-- 
2.11.0


