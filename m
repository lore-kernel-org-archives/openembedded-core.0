Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0087.outbound.protection.outlook.com [104.47.32.87])
	by mail.openembedded.org (Postfix) with ESMTP id C13107506E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 21:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VfocHzJdjHP2o9WqpX73yRgQyrbO1jm0CI5H5p7P954=;
	b=KIJgruct7+PEVl5WA+RBpehULUmdXwfLIlIZwWToWmXffqLJp3sqLXhk9cWPhucwGvja7g5CUDUoI0Vz5OSoeei5yCLRnF7J/ChvcYw5pmoYr8JdlNXHB5XXZ4l8pzcLG40z8Q+ZcRFWXdiedNsIatcYe9cj2SOTJpRHAw72kzY=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3417.prod.exchangelabs.com (2603:10b6:302:3::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Fri, 1 Jun 2018 21:03:15 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 14:02:38 -0700
Message-Id: <20180601210240.14969-6-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180601210240.14969-1-mkelly@xevo.com>
References: <20180601210240.14969-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR1001CA0028.namprd10.prod.outlook.com
	(2603:10b6:301:2a::41) To MW2PR0102MB3417.prod.exchangelabs.com
	(2603:10b6:302:3::10)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3417; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	3:/mSY+yildfgG2yojbJEaCFfYHBLO+ZnZplh/hFEDzk+kPdza39IUur8iYTq0g5cSjMJdRKHmgXaELXlk6RFh/Mcz7Hq+h6wwf0S5P7cq0Ou+8tDq1/lTQ/3XODgJp/g5deJK6WAiI9KvnDrrNJJc83QLMBTRQmNmEirtMvXBmLvrekT8EQeCeDJMTuBgRylQHhpFmJTqNu1OhWwThFazWVC6FtS6KwHQ3c6cVCzCLq/6wBfjUhiGo9ZiPY3Yl7Q0;
	25:VNUD7v+ukKB4q1Oz0SA5cqeDyrdUUBB/zqKbUvQINANC3OKbAF9a5wOdvyGBCGe7qkW9372FycYIGLk/6djbZiSrJK9LAjalVaXQmKVuFQsBPM+qtSgIQeU3IbFfXGNK6F3pDfelbBS+zpL1JHlO0DBUedVTYXOpEhh9q57Ll1s1x8NEF+JhiYawJYNzo7EPL4+4K0019JK0L5+1EEMHCRAa3/cE74B777Q3skpiP7Ps+lT1owo8yxJqhN7lLlhd+zgocyTY6/44vdEfsgTt63fMe8OZG0V+oPH6vrj0P91DeWpVUPniCLDRKxr9YgLNSZ5Eajp6DHlHoDJnvFbEew==;
	31:TIYl7wjdgMizlguYFbJSKfCVml35i4cMzQKtcOB4CGZ1lBf/rIRZhzE/EIqEkoIt51H7Kn3dkLzMdPbs8kwDoHBNOEUq775pz3wF6HCmLqETE97WtcU4/ZfEKKktH3RkDN3p6BKbnPJATrFpu+mfJShczBYv1hBsiAIFpG++IwQUjOpal/wh6KLO28Dvlw3ghAiAMCvqjl8szBttCoWOfH3ZYDRtsT/Hmr8KCS4v2Bs=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3417:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	20:/U/H4YVRR8iZWUVm9Y+34G3zmI7DklZyajflKosXx7NREej2NXZlyrQzM+6tD0mGQGa/3bR7qACIbJncPBRD+uI8CbRg0NV3+YlNnenyEKq/rZstu5OI31EkypHCsxq5dCHnvdAPMXFhmtVm31oUC9r/7daQg3BhOBJpYf+RdjAzJ0A1xdvXq6F5tYfCEi8qnBTOPlfzi2W99ful04g/6I57X+OJCHU73k1ugc6DzW9hlkYdz05BvWYWMmRivC7gv6BThKsilWREnZER5Zb27zFEkfvZsva3Oyyn1qyN19Gi0d52M0uBgn+Ie6unQzIH2QbkMjLUZy4aYrYfKa0GoxDBhIbIEWlAIXsepyXnmaVIatw8Jb8ekvYZap+xq9G33brWTNzX68j3nUhZ+rKbMNkxR4iA1vMNHoiQf6WK3SWkZBciWV9mpqh3Ee0T2PaHax3SwRdnNxUxJhRlXsoe9mOgeOKkyv7hc/t+MjlEvHaiHKshzsceeuGsCx8jUg06;
	4:5JXO8/9FfFuPvQfWmDNpQUQzj+yLGc5U+yx7Iye+0g0zXggqq2FSvSxF26hIjyzUijjdJqbu0ltXMVpoqIg7zkIBtjskkS5uk6LTk+b5HgIrfSD3vjY9XBYvtX3VsZ8WPkM0XqX/h9cdWcQw5dcKbKVi+lC36LhP9Ta29eyxM2Z0el75RcUtnneEpXbOC+sxYq0rYFdGrFa/DuQsTri8HW8CVEcSf065fldgwpQj0es+OzbIviiHFrhR2bJFlbxFEzems0gDx2+zolbbEtBJ8g==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34173395EDCD5857FBD578FBAB620@MW2PR0102MB3417.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3417; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3417; 
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(376002)(396003)(39850400004)(366004)(199004)(189003)(186003)(68736007)(6486002)(86362001)(66066001)(106356001)(105586002)(47776003)(7696005)(51416003)(52116002)(26005)(81166006)(8676002)(16526019)(76176011)(7736002)(305945005)(50226002)(8936002)(486006)(2906002)(59450400001)(956004)(446003)(476003)(11346002)(2616005)(81156014)(386003)(25786009)(39060400002)(2351001)(48376002)(2361001)(4326008)(3846002)(6116002)(1076002)(53936002)(6916009)(6666003)(107886003)(5660300001)(478600001)(16586007)(316002)(54906003)(36756003)(97736004)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3417;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3417;
	23:HnR0+jq6YbNoH6b1XAGkp0Y4KRLTfhareVrBo3k?=
	=?us-ascii?Q?jAM6VWnTVtUrcIfp8AN5pL8Tn36AFjenqwbO/CivVCjBPO+pWhrtQd8S18XJ?=
	=?us-ascii?Q?LxKqUqNCM1KTFg5BdS4JPW/Vj9WN0LRMOFhTM3y5ErQa3oYNQEj0d+IcJE1H?=
	=?us-ascii?Q?iPjq3f33uMCsyCQO4oVYy508hzEwU98RovQuOws15kGyn6YV32ZaojDgR0sw?=
	=?us-ascii?Q?TylJZG0z0qt0OeoEHUPyVnTZ8Xwx2OG8opSu8jSbYS6Zrm13DxJU1l4BwMI0?=
	=?us-ascii?Q?6dHgN59rvYMMiZSyQ0GFYRSi6f32lj2LrchUYsebg0SKuOA2rqLXAqkSSJDP?=
	=?us-ascii?Q?z5Vnvn8iOtMKyBVLNnyo+WLDcA7waAe+JSTYlsI00P5DK0Z3dUgfp7oKFHo1?=
	=?us-ascii?Q?01IzZAh/2QeN4rGjk11y0WPLBqIlXBjyuIRnVa50EyJpZSS8pWTK+I627oQQ?=
	=?us-ascii?Q?8lBgvWKklkPRSIDYR50UHC9qqHZHTBh0fDsa+YNzou8laUm02VR0XXBE0NoO?=
	=?us-ascii?Q?abFku2PX2rH1Hs2EeyoK7vopCDB7j6fpsY3Yp6niQZzdiuENQaLC2e0yPrW/?=
	=?us-ascii?Q?974rZ2mR7TNslHD5guWbH1u/I5XW9jT+nvT3DjmvMZbxpD3TO8Lv0xGHDUXi?=
	=?us-ascii?Q?2v77OEzL/7VS+Hf1MIWVxutEKpSipf4hcE5sBQke1S0vdyuzZo7JAUptUYdq?=
	=?us-ascii?Q?Tdxm3ttYoJAATxZTTtTgFQ/avE9gesoNGORn9NTxKy+FKkN7XwC1/FGLO4gC?=
	=?us-ascii?Q?/IGXgE51SquXn0zW8WytcLU3wXHWxVpPabMXYNpO39zgz0KvEd3c7Vq4BeP8?=
	=?us-ascii?Q?HwCToI3jufrZPbYJZcDQKUgAa/vC1EQdmMRP6JGLHAmdsBytA3jSw/g+clW9?=
	=?us-ascii?Q?cEBXFAvqqNG8Hpy6wu9ZN3lgrtnvNu4we9E9Gt84eHv5VRpYb2u/7ZIVfSTa?=
	=?us-ascii?Q?m+jOyifEjQrOFEtYAuA6WVtUDmJnTZ5SIvHkXU+x74NPWZIs3ysvS17a55bM?=
	=?us-ascii?Q?ywOHOE+B7koJB7moO2prkRjPbxmyLWFlBl32+Ft29eRrgdxPYtAnarlTvsQS?=
	=?us-ascii?Q?RowXi+sCIeewC33goMhGu3EeJ3yoPM0ns6NDw/Ggg+GGSMUrStjauE2vNXBw?=
	=?us-ascii?Q?odlbj8c9l+fq2VLvrDAlNhNDWDREpbgwos4XXuxgoxh2JMuKxT/aOMyjp5tM?=
	=?us-ascii?Q?q3+5d+9hqwHrIAa7dLXGFVyXg+gTwZEM0Xl3d2aMSii4ZixwEypu5dm+eFOO?=
	=?us-ascii?Q?Uc8jywIIRCHovrjEQ1VjBW35toORQewfN78uK0adTgeSMf5uZqPO9ygMEZQ/?=
	=?us-ascii?Q?ENt6lmRoa6XwxsHHND4UHheo=3D?=
X-Microsoft-Antispam-Message-Info: KqyJv1R8Yu+GCXbP8Est47qWiY1436BrWWnKQy+bhANcY9Uuz/BFAA4lRW5mTzo9VH8uA2vXvbyuQujKF/9YqSQ/WQ1S4EfX5sLXRMNJfNJm1bZPU9gt5DThFQIfpf3Qx/tKusbi2uaeah9dzGB3HY0qaB99LgKVSK8XNPNsWcs2+FZSAYTngCc2KoTynuwE
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	6:3Fd3t2xnE/aAB4UJ/Aa8m6oAwjvSCrPgd2N+PnIxMzpB6ovjfKAwY+c37LxZ39oC62HSE1BZ7Y2oKqYCExIjMO5vHN3MnnMygpn8IbjTsjBLZ26TSJLcsWXjT1hOBwXSYDU+TRp5RjHAILz8so1jyJZhBbJjEzmKW4ho1AzLcooUzyage/eKM8aZUKB8wsJ0miQWsuWcQ1wdMd7tflUWX0rBcXKVTRrxsJ+xrvpod7FOhgbr2FJ0OJOJn+9H44BirgWvpYJ9VTKUJ0HDn+YUL4x24ovi1jl0Jm66G5B0zPyeHs/sVnqE//lCloDObd6URCnu1940YffIrZNqGAOTch2H81xs+P2pMpLgPuaK9Z5JsKqcBHplnIvwUrkyMdehqL2afx7OLbGjkTnNrAL7F4nJsAgVrEEDeV050shWXpy0JA6m5lRaI2DCfCertustu+p28XijaWKWBO0eMJ1uPw==;
	5:o5cQc/Ay35gTuNKV0/JKb1jSw2IBXIYl+XLLaIGsSSPd58R8TRADO1gfpEd2dHyOUWkpD7oB18AzpscyiJU/rLVmnUuKhhtG4WX3IMdO7C/6ODZIVSgW/GTQ0xMMjz0bp8rS6pUhO+MkF1+FG3+SMPA8pLae9Gf5R6GI2uxxFm0=;
	24:1B0BecV4j4PhdfeFUF3FdLCGLGUsCzPXnVUn3KHZUEaW19sxwlnoKuF4osDqndUS9VeZt65LpkJNalXWVcuX5vbpOMxvSyfszY7L2ii017E=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	7:spXYxlXPmqvcP7Jd+gg6s83YhaFfBvnR/k1FjqCtFT7AKLJEMmZdExiRF7w6kKItY4zvb3M1VjdEzc/PS6xSZM+FRGlYHfnRWdjoh1kD+RRjaZEFJ0i13KDvp25HwdSZJ2MlJ9FsIfWZLRD7LCL55MfsI2RiF1tcH+eWcSuBFwU85cXP/4UjthZeD1nV3vL/sm4zUxub02Rg+eU2bUOfNYrG73kxKlnPRcL+fqjOwa6JlQJujW3EhjBIXFrV8hMW
X-MS-Office365-Filtering-Correlation-Id: 4aca25ae-ecf8-4775-3bf7-08d5c8031813
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 21:03:15.6851 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aca25ae-ecf8-4775-3bf7-08d5c8031813
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3417
Subject: [PATCH v2 5/7] toolchain-shar-extract: pass env to post-relocate
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
X-List-Received-Date: Fri, 01 Jun 2018 21:03:16 -0000
Content-Type: text/plain

It's useful for the post-relocate scripts to be able to see the SDK
environment, for example to see the values of CC, CXX etc. in order to
dynamically generate toolchain files.

To enable this, source the SDK environment script prior to calling the
relocate scripts.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/toolchain-scripts.bbclass     | 17 +++++++++++++----
 meta/recipes-core/meta/meta-environment.bb |  5 +++--
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index ae7bbef034..5f99fd8c03 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -118,11 +118,20 @@ EOF
 }
 
 toolchain_create_post_relocate_script() {
-	script=$1
-	rm -f $script
-	touch $script
+	relocate_script=$1
+	sdk_script=$2
+	rm -f $relocate_script
+	touch $relocate_script
+
+    cat >> $relocate_script <<EOF
+# Source the SDK env script in case it is needed for the relocate scripts.
+. $sdk_script
+status=\$?
+if [ \$status != 0 ]; then
+    echo "\$0: Failed to source $sdk_script with status \$status"
+    exit \$status
+fi
 
-    cat >> $script <<EOF
 if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
     for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
         \$s "\$1"
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 09f757a087..74c0600c3d 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -51,12 +51,13 @@ create_sdk_files() {
 	# Setup site file for external use
 	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
 
-	toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
+	sdk_script="${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}"
+	toolchain_create_sdk_env_script ${SDK_OUTPUT}/${sdk_script}
 
 	# Add version information
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
 
-	toolchain_create_post_relocate_script ${SDK_OUTPUT}/${SDKPATH}/post-relocate-setup.sh
+	toolchain_create_post_relocate_script ${SDK_OUTPUT}/${SDKPATH}/post-relocate-setup.sh ${sdk_script}
 }
 
 do_install() {
-- 
2.11.0


