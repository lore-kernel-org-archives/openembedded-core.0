Return-Path: <mkelly@xevo.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0074.outbound.protection.outlook.com [104.47.42.74])
	by mail.openembedded.org (Postfix) with ESMTP id 596F56079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 23:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VfocHzJdjHP2o9WqpX73yRgQyrbO1jm0CI5H5p7P954=;
	b=Fl+61HyPxr8MaekOpXFUXkfH7ubOSYs1S927ge5ZLWjMB52aEKUGAzbquDpwTH6Xv6ortLLFUdNWje9CJ8UQ86HyawugsirRh2u5QMWbFFzTnFT9Lr3eHelS7ynr5qSit/KyPmy4HCgql9mzWxz2xAgkebwlyznrnmHphP8pzOw=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Wed, 30 May 2018 23:14:43 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 16:14:05 -0700
Message-Id: <20180530231407.19759-6-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180530231407.19759-1-mkelly@xevo.com>
References: <20180530231407.19759-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR15CA0072.namprd15.prod.outlook.com
	(2603:10b6:301:4c::34) To MW2PR0102MB3419.prod.exchangelabs.com
	(2603:10b6:302:3::12)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3419; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	3:5DzR9oprjXDrPRJlZ5cXcMdht70ESh3lRkfZVM3Avz11rgyAJSvmcffyted8WwWrD1HBKyhh/OoSSU430Q0eLol3L0pQGZ2scYAqQOXtF9mzUfxLfmfsXftxlCBfeVx6pk8f5CH5E8VbziFFOGH6wYWGpjd8A2MeBIb6KMDlsuZo8GqjiaSF7uBUrwuibjIz9Q/K8cRn7y5ZD85lRNax+Wr4CKVjHMG8DCYr7BO64ARtHB8JUnz+qzuf/KRsPrQE;
	25:lZ5BZg0ui7DmdSPiVVP0unUIpPG9Vvt1Wb1G1lW7zqRmFUVh+uH89ermocnT1PNqx5qep+tjOjJX58I4uCNh0NpwCoMRlVo+8XxDawLjBbjjtIwsWW4TznQ4mcZFVm+oLTVtUUvHhZuItUSKYnd77Q7XbzABXTWoCCSsrNpWJbdQ9G1REMdagpvG80n1JjEj+4YVXr7j6M4O0fd29ZCuQ39ACxJxZ2lcjak/MDgNggu/pKY3Ap0tSE/CDXpxSCG7nccZUnY55AWbqSvtwhaJLRARkOHam0c/qT/3nTIBSYix1u49iEWoFS513/nbIOWgH0ED0QygtpGHYd93H6k0xA==;
	31:RKZFDuFK1yHOhEf6Do0jPFBaYaDHR5iuhssr24XlRHDbt4Z1L5nQgEQ3UiTbedRf1orpLwRrDYwSUYERarYzrI17Ffsk84Tey4mY9UK3yAYTsrwjFSkotVMnWZCUsFsRzavX6zA7eCiB4F2Ab2OU5di1vqZRpQLAR4kXmSZG6EXn6Co9UHxESA4vGXYzJNJv0zNL5lL8IPlYATINRdS27wSj3eW99/h/QM+9SsCaHtw=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:PbibmwcOlqIzTDJO1VXWbtOlKBkHO7/Wr+5SAPRozzR+/XoVevxPKKeo/+ujdYhGdUUthhKKJuoM93rtQNg+h9h/GhC+BQsyxTzX7O4DRln3wR4RSE4jqLo0WG+SzQv49yAQa7ttifKeRYtdnPFPOEiKn444H+Q+GMQK2pHXKnllQ7gda20aPOnQV1dPvslblAmltvPepcWolpemqPt812V57E+yENXy1VlGEEo1FqsWoXamqQf4Jg29fXlX3RdklPnGgqu+A+s3/J7dTtgRN3w7uuDvbTMDf9XtGsX+Qk2Wqx8vh+syMKaAUiF2UI1TXR3YD7nfH52FI2zs+dYVr+g2cjzR8C0lTVk2mHqpgkeJV17gnpR73iqXPNi32BshcvUdb9+nSACEha1Km5lYL/CzWysoRUBz0jPN3kZUwYAeSGJe2nsgnjvsUXsIKXhk6CG1w6g11541QkgK81Q8CZu/zg6BEC4MVQgt29xk6A5KRUPN0c4lXyKtVXPkFSxe;
	4:+Pc5jPF6awuieRA8tw7c77Aquw+x41G4f0GFU8rk+rAQPDcbZK0uGfFp1IY/xc0mRf+0r/jNt/3OSxu7t8nOjjcPms7WAAcm9vvOLeHhBxqCvDVbmUDC81dEah1gMO+Egq05TvpcP9ShO90WiSfSBQofH6kG4LRRxq5A2zTvul4zIyNRJkuSLOuACvlP2ctNqAChgvNfMFQXoT1jhjWcYLDerbsBJg3B4ZFu+/RaKOwNKs0rJsEa/orBujuymyisAzsNy+Gb/ppFmbG+UNxIpg==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3419E0CB60FB6A73A97A616EAB6C0@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 0688BF9B46
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(39380400002)(366004)(376002)(346002)(199004)(189003)(59450400001)(11346002)(1076002)(486006)(36756003)(16526019)(6916009)(186003)(47776003)(2616005)(956004)(50226002)(3846002)(476003)(6116002)(7696005)(305945005)(86362001)(4326008)(39060400002)(386003)(53936002)(52116002)(51416003)(478600001)(7736002)(26005)(6666003)(107886003)(76176011)(6486002)(48376002)(68736007)(81166006)(54906003)(81156014)(50466002)(8936002)(25786009)(16586007)(8676002)(66066001)(316002)(5660300001)(2906002)(446003)(106356001)(105586002)(97736004)(2351001)(2361001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3419;
	23:Xc7dyMDGkb5fTHl02lAbcj0msT1QBXIAbDwpC90?=
	=?us-ascii?Q?q6PARXEEMYl1jFF8SCQCXp62D38rlzCp1XDDLnys0RG0G+CUv8DWgjNxO7M0?=
	=?us-ascii?Q?wiYT/XPBkzL1w/RgEQnoVeBWXVJEzXGpWowcgaMK8mcWLyh4IFvi117yvN5n?=
	=?us-ascii?Q?uYT148Snmy95MMPgt5xOMvCntH6jdpDpZkPUzAALNoC7AQagHsWEKWRUOeLZ?=
	=?us-ascii?Q?yQl/TTzyk++GUnDXOx52ztGM8udwWD4TI3tW+o3L6RfwBLD3GuRMpNQcjAk2?=
	=?us-ascii?Q?vtFvjyUr/mBLHeWGdC+tPfi5g4E+vroKsRjeFF7gGJ5sqzhfYo8OjnWHgdht?=
	=?us-ascii?Q?q8FTsdymgXrGrTKMSLZUTn6lpWVLfnNokNuodlclXwIF1Etk8Fb0u9HTaCnS?=
	=?us-ascii?Q?Rd5vM23hMBLkpS8hyPP292oB7Jx6V4vbEJAWIUfKfi+74relsD74oNb3jlI3?=
	=?us-ascii?Q?WyrjUZquaNvSNISsd03XIYl9wj+08Tx2e8T5LD5FzzDyDSVXlGI2pPaZ65eu?=
	=?us-ascii?Q?3Lx+1UMpRe1N3eWPmcr8uMK1lbyc3hlHTvNY5QbA49gDPIxu36zrGQQlH8pU?=
	=?us-ascii?Q?5aYNXaSrDMi/TuRjpu4kVrWXuq56/Ypd5WtQ9RNt+lvR2uKcoEJyeZj6nvvG?=
	=?us-ascii?Q?BJg2I9neQrNt4uE00XIMWiQloQF5psCt2qyngmgKu+1WGBsrRWMV6qJop5Fg?=
	=?us-ascii?Q?yDyEBu3JtR0aak335lT0m9mDq+wFfAaXHEykhv2jfP9JJ8PgtuYpFLz5N+BX?=
	=?us-ascii?Q?PYQ+xMsk+JSVYdJoeDLTyuZaUmSkPoXekZRxuXb1cv8KswfJB14Mx05EzQ9R?=
	=?us-ascii?Q?9S9er0jgIn0f3bPphZxbaW4YNaqd485Kk3831+5djbuSQTHKJHq0/9VpSKBx?=
	=?us-ascii?Q?mngFckH8SeaGtdNsFvcQ6boFt1nipW2yi2p3fmyu2ywZyh6ebtHJe1ijcEIr?=
	=?us-ascii?Q?zGmsHO6o5L5kZGR+L/XGVPGoGn7HQy78FWRjDiftYbYpcLvfsoWK81SehGgV?=
	=?us-ascii?Q?6HK2qyEywOjgZ7BPXS1WeQz8bLrL6rf85Ypo3XzIXv2jtpp6YRwatTKakiEc?=
	=?us-ascii?Q?kX/9B9NsrvVB+m2ObcBHaBO2/m0533QnvLePOsAAYIFkBS32ajCVGUAMOFvP?=
	=?us-ascii?Q?8fAuVpMTjzNqkcnMisL9v3vpl2SkR/vspJOxkafMbOEfIsANP/N34uzBp/za?=
	=?us-ascii?Q?zaM3cnK3KzoxGMIO1/GV7iz2z6lLesSFlheNJpY9ywTGzuJn4tz6FffijMUw?=
	=?us-ascii?Q?IZj3Halak3dUy2BsqnPuRK57AKW5o/Ccdq0JolKA+n27gStV6i8ylrSn4+E/?=
	=?us-ascii?Q?LsIuTWaPK6xAPXGKxVv8rm2I=3D?=
X-Microsoft-Antispam-Message-Info: qe1LxsSVo4dON1ZgZzTWLSoh+Y5j4h3DdZar7b6k/HbpOnRyAnOTaj0ykKPz35YikJKKlbqrx6Pef8Swgn8PcvyuBFl7bRIzb4dAr1rl9u8oSmpzji2fre4sZc51Ik1Pqradk2eCvQZAyN4ajp2rWtrV7MoKvZW+6/WFrJ/WfXX91cavTtUojmXEqVGzhjWp
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:LK0+KENGUY0/nGwPTZxi/PHPuv+5RE8D8bxl5hZPBIvaHdS4jC+WHnOxp+EUMsFOiC8eMnphVv310aAqoivK3+nMRfQHYvlYm10gz5aT7fZSNm/03vSdOacoLGSrnotiVSZ6PovP75lOQlpXPkr3VSBgz6C7kr5Z5H5+osnxUGFOjec34qrC9DIeR5pmbepiGnBmm8qljoRFoBtMC56oQ+YHsNMiaG/Gp+OFOYzi9uZ6lrg6VtPwzM69zI9ZUHmUz3WFby59dwJmZs/PKNfs07KgEDYI5cjgVwqemyHHsl7WtiqYzh5zyBl8v/f7+GUBvYbuBADJovRqxxOXAGgMy1AcCSDJxOeMk0Oq12bS3bHpfIrsrFoVB3eWyBoExYn0ukewoEAjPWwFtuQP2iBuhjfBflVR7JNAUjxpWFbgeLsxAfwHiBWTi977LTXTKWDVD4RkAX27hT0HWdUbSlZxVg==;
	5:5xXDYzlKfWSmiW+uIdKnp7swrxYYVmIOeYVY1A08qTN/CU4eJDJjlOvAPey5b+wsXMxR4HxD7IJOTdQ+aE8LwOVHPc4x4RcOF13huYaFe/qG78k4yg22Ra9lLoDoUihzdxBLoUGqocW5L7OxQFkV0701PultPRhl29A0JK2ZvMI=;
	24:G4GQB2uUYQJPv7aPp50YmQrfB9b+jweK7lvuvBdN9TZLGS5hfSXzbVlXzgGDdiDrup+fDdTYHgQWKXJP/yrOEaBOPjkm4M6VvAO9MdMTCVQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:FxLLd5v4yCIS/X9ikPH3YcFGyLQfVveqBA8QI53z9n8MvCzkiKehLkI/Sck6PVoQG+Asu23GvAsHfK4Emn7XnMXRMc75cKbkFYswsCIGkAFcyCFxIqx5X444HvYmuD0vPzTcf0V6a1FV5UGfLDjIMFSabw/JM9aSMF/9gdvMq4MK9mXlPN/HZuYE2zaxdQY4A3fun2fSy5lmniZbYuprGAui13gy4o0XvWHe4xNC9lsi/Dq9+c7rFxLV4c2ChDvl
X-MS-Office365-Filtering-Correlation-Id: b1c9456e-8233-4022-3697-08d5c68320cf
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2018 23:14:43.5946 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c9456e-8233-4022-3697-08d5c68320cf
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
Subject: [PATCH 5/7] toolchain-shar-extract: pass env to post-relocate
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
X-List-Received-Date: Wed, 30 May 2018 23:30:40 -0000
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


