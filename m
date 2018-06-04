Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0051.outbound.protection.outlook.com [104.47.34.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4BAD675489
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VlEPprRYezxA3WoLJg6rXnB5dl0h9tdDMott8lW3cfI=;
	b=r1ZY4QLm9d1B2kX2qiw2aY/L0ihAqCCC90WIHaC2otmXCwJT9o+XrPGr3jxHxxAM7F439xmMTmBfC6C4aYS+qBbZaW4yZSr40xtmubxJE9lsW3VZbGPBzH18Rr7sl911Nm9LN2XRnAu+elhhleJIdRja/CtS365Vkk5//m0jQXE=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	DM5PR0102MB3416.prod.exchangelabs.com (2603:10b6:4:a0::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.13; Mon, 4 Jun 2018 23:06:34 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 16:06:00 -0700
Message-Id: <20180604230602.8461-5-mkelly@xevo.com>
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
	3:kSGT98PqVSFOE/9ZhQuqrfCjDoSZP+TjFjVA7hyiDzWD0PMW/Kvb3Gb30Atl+q+ZH73nHHeHWiLWye8GEvFgC6K/CyEG+Eu6CndTWR8Q6PCNmUg0rcEWCXNJfKYpARAbAtRd8EiT/G8pHkcuAOBkuBHw84qVE+MIWAjmEF4tnyKxAuCETCOvceqYuruk/2/pEt735h1FoEo7Kp4Tvt9y3QNg6DxHZiLhiTXh63SUtPJrZQd3idYIfQI278A0UNux;
	25:Mgqu03O6Uz6n2lBulbZamJZj8Sb9vtlmTkzNfYUelGUMPzHrtrVO3r+0wlHjAp2J+8aOSGvJSXVxbGV8VZVMwtmgWRg1zyr9ZnuOhTn4SCyr5xwuMjlwwNOPDF+BAfIPZdE1v4oOnQ4JexS2PwgFEg8zVhWrk2nrupof+YdqPIBNLZbtXeuWltjbDN40mYr8t/sAGo6w1xk5Nnw8uRjYzQ1MiHT+iloEuaQW6hqyrDKpOmbvMjXvfMW6+oQYbJOBmegnnWTZXMHdec5bRt3QdYKLyZnn4RXtbF+EYP/cQlhzxaw5FOGTdB8otmdSgOQS/qlNQMGUCEdU3wlIJMLCdw==;
	31:FJHAGpD4UE0l42JnfMm612TEk+QdTjxdE0rkZGHhZeanrJ3EI1rRmve2Clm6naBKZynPfJlwrBt/vk3TDvBpzoPnKEY7Zlw6D7DpeZPMHQiif+/KiVI+gwWfyGHixfkZc/YPCneCkX+B9RV3sc7MdH1EKl0+VVyKsjkYVbuA4fmTWxvwtgJ1pnUvjMqRTCEdvtwkjJl3IeQjA8erjQ2PFhtdd5jAl9YujT5OLK7QsGY=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3416:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	20:l8aOMdm07Gt+GjFk9hK6+OD52tDGjMO7BUtZJJvigh27aGwhbT/8ML3cDJw+2f1kAX/kVyu5C44HUfOAETDqeiOdDuRjf5H+3aqNf1hy+LbVS9219fA9tiAMSVYnX9Yx7/DV6PXGh5P/NcaEnnyA2jV3je1EK5p6NnV7C1K+3KnNYMcDuDAvx1Lc83sEFVL2StCyz/y5kcKL/fLX3Re1p42adl/sTJUrxAbWaQH0QDrvBkmm5LJt7VLKRZMSl6rOoJ/5pm84pYJ8CO2W60Oonq0EUIv0nZXfT9JrZiN/QkBnZKGEC6n/B5HeFMBXQhNxM/6gMt04ULYOvqXaveARxzVZYqx2D5Ic+HXYCzD3RVpEm0eu6M6inKIyTr2mJRVPAsBG1+dM3W2XhAL6c1Le/FW54k9kqZzfuu29Tj5VITZEp0jUe5jxCYT7DuKhFy2EY9OUOlnR7TiRQvdYedgxhhQys0C/ttVXraw4RMxLgk4UYxy8GBF58K+032B17f4s;
	4:PY7WhGdNY7s9SgYlOvDoN3c525aN3MPUPMWBzM0oH91CfROBxlCMNk3oPPGD3CBJxfEg9QYt75amQtGlZMNom3904cv8zxZHH8n2tmuvP7ORJv6D0913oZt7FhYwMyp581chsExN1wg8FGh/gc9QZedtkG/L1VNI0nkW7izqrPSxR8j1hSDuGtWlmWBSGOVkRknq+FaOFumulilyr9rDXjWQ8ssxIdqKgSrBHEVtii6WWy/gqcMF8XTWm7KI8oC/r7NcCSrpjy5OGY9PKszo2w==
X-Microsoft-Antispam-PRVS: <DM5PR0102MB3416BD3C455C1806B8E37D74AB670@DM5PR0102MB3416.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0102MB3416; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3416; 
X-Forefront-PRVS: 069373DFB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(39380400002)(376002)(39850400004)(346002)(396003)(189003)(199004)(39060400002)(81166006)(81156014)(4326008)(54906003)(97736004)(446003)(8936002)(5660300001)(2361001)(11346002)(53936002)(50226002)(2616005)(50466002)(16586007)(6486002)(2351001)(48376002)(476003)(186003)(956004)(486006)(47776003)(316002)(26005)(51416003)(76176011)(386003)(59450400001)(3846002)(6666003)(7736002)(2906002)(16526019)(36756003)(6916009)(305945005)(68736007)(1076002)(66066001)(106356001)(107886003)(86362001)(8676002)(7696005)(25786009)(52116002)(105586002)(6116002)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3416;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0102MB3416;
	23:mQtblpYHUEAGslcAwblcNlJma1uRpxLnyIM/wdT?=
	=?us-ascii?Q?YOIgcDrpxTi25ImiH0Bt17qaGfsXiagmU7fS+rbzMEaAHsxm4QnQExP8c4CY?=
	=?us-ascii?Q?GEbVJkvnh4cAIX55gG56OzVZEJBDfn09SjhB8oKzULa4/h8w6lZEcRGuDFMr?=
	=?us-ascii?Q?2yi4tXNeXtnSlWV0VOe0j7ra5mo/Ap9uyYSZw15ES/7r80Ih81hKSP6A5lrm?=
	=?us-ascii?Q?MJ+A3OH2jq2SpTpL0KOd114sPTvda7tJAdR18E4KgUO3/KF73jeS505EPMkZ?=
	=?us-ascii?Q?sj8sZCTEIubVY91dnoXD4ESlEKk//bfkSby87LD0GhcNRLjxFNS+CwHquygb?=
	=?us-ascii?Q?FGmK3te0QJlk37nOgfU8v5DFSXkzwRut1BMAXAsTI+o3uGZUpfS5CezXSrCF?=
	=?us-ascii?Q?a7cymOPFK6R3FAlfKrDV6GX14GkcASdYRPQ0mTNWIEvh7wyipNFRmL14MAuz?=
	=?us-ascii?Q?/XS7KbL60fN7ar54pF0eW34YFVyNTnUV9cf78hk6g58U+56FxPxq7xhp2+QY?=
	=?us-ascii?Q?7vNF3aSp+PYRYsr3cho/kWg54WoLXN8pkBp2nv2OAcoxUVrZArnWQgsZ0xtp?=
	=?us-ascii?Q?9eDtHEdJiJ0CQ8n0LXxiIXOiLUJDbFCN9t8lLqCq2NGJzO1ZCOX/B5hIJNJE?=
	=?us-ascii?Q?udTULGBmdz6BEFoA/6rqJjtzV7Y3Sb3PsySvFldEMz2DEaCMbqZKqe1UwMWn?=
	=?us-ascii?Q?vMgjKqAvB9mbhAAVHvSmdqry79IdMA/opPdvfWL9BWZPAlRNDPrJFSFgP0nd?=
	=?us-ascii?Q?u+le+kjQMSJ+D6oiDAgdMIs7daVynBSliTQcnEh0TEMT5GG/2Nkan1D9zyU4?=
	=?us-ascii?Q?jo4nao6sKcxdWR+H+GEUjuB+M3gxLcFWBQd7khDnKUlMYIM4YHSGC+gqFysw?=
	=?us-ascii?Q?sL04j0rA+ROrP3p4VlcoQ+epdaNV9nS8NHGZZ/hjbyL4ic6j89S1sgWv/A6v?=
	=?us-ascii?Q?VJSmcZpROfzFm/ePjebpEUF8B4piQqeUkyfbHF1f8cDMQ2lbDWg44NEKYMhL?=
	=?us-ascii?Q?xU1C3jrz3oHWW6GxjTOAwLYani8Z7dpMxR6cebQpkg9rGHha8xG2b5iOOr9u?=
	=?us-ascii?Q?24CSvUVib56TC0VGqQ0Fvn+HfduVOkUKZntTBaSWjK2b5QDhdrcyRvM46t6x?=
	=?us-ascii?Q?HEd+FmexY4/OS+7PIJpMfDswq8+ESZxx7h3B6PLUoyXDp035F4YF0uIObkIL?=
	=?us-ascii?Q?9vajHb0T+NN23RrH7nWIuPmv/+dpBrJtZ0aQwNyT+CdXutdCh3akntUvnD0h?=
	=?us-ascii?Q?PzCDw6Qs0+SiPGJl9GYN9dMQywu8XGPKRJnPls7b+k7bTj1iY1juAfeSGYPJ?=
	=?us-ascii?Q?NygoU6JCEAR3uX9HThym6JvE=3D?=
X-Microsoft-Antispam-Message-Info: br8AuX7OgIE6Dc6acde0uiwG38yPKLAfjRoJpVP3CoowRUOeB20/HJG8fk0vojN+qosl2VjbvSKEUIF+cyz7LFRO59HG+cs6+iyc7ONePbiHXo8qT2l+FP6Gt2G6C67RDZwhT7qMuyVq3uKmDn7CmA3f7JrTmHvW9iSW/FXQ2chrqTBvi+k2w9SBHWNhhZgr
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	6:DhQl8113kuLHTex7haJJ/Ab6/SehCM4hNS1a8AnlDq15PwKEbc+jytnDplXg8nIO8KEjfIaiuW2N3S/RsjawZ+2JZwjh+ML1Pelrf/1se7NCBvxqXgmHU2G+uosuIP6XnXBO3SVzLnL8wAY4eDVt1aifQ6HtsYW9vunaXY+QupUvQ7/HGkG0rlfLBZPKxqBe+kudqsW8Veletor2xJplGO13K9BAY+4ICYwnE5rlqH5DFemSUcIapyozvV6zw2bzrcQ/pXN/vdVyujjPjxQjwF3ySuTU9EsOojyBgnfn/w3lsX+FmxQq27NgyYLT1V3u01K/hMTwCsnrn/7RSVIuCYMkANxQi8otfQhHh6+OyLElIMTtQOyETjt9ECN9ymNsmoIKee79fkK4kNZHae+qkcdlxguT1cLwCqcC4Gjxf1fTxmXJUSGlhN95n+kjVN4OuMCqEtYGD7RMudZcxxddzw==;
	5:M3Pnf8G1wfYWJaExJnMK19foca+nTVE0xh7lUw+lFXZuOp0/1Z5UJBWPy+SagKsBZzGbLsYyyEZBSk+QhZS51mVCs8XSbirxNgHfWojN8QjMbBXwFJFx4G08k7E5iQ1WguZl/S5RkNVdgJ3KRjNWYhr+AHW6Y8aID4kgI33ICOE=;
	24:hBB5HWn1RcGFKiDr4YAu4Zwj6+dlaX6n2qvfo2MuNlxmUkJ2TR0ZIUhR+AgGZwk71YwbesYRLEKiCs/GA5UrmQXem2T9AcKEP6enMVZ5ewA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	7:OWroSReMZju0O+9rcc/IVbkwQCgcsTb4+J5z1P2u2PiB0H+dPBNND7wvVz/JmYAPhhnEif4JkkAoeS11ROhfRoYRQxmAkZoMAy1NtH93rmwgiBcoFJeg49AoTGy3IpwYndNIljndRIklg2XOmPUIIFzAXB48UIs7NZItIWHwxCTRc7J78bvqADtU1nF1LaP69ANPw65mkWENlQAOBHz1u7FwjKPud5tj4zA5GUGFTVcVX6AgesyfhungGaCX4aeK
X-MS-Office365-Filtering-Correlation-Id: e7fc7f84-dff2-4265-98ff-08d5ca6fd173
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2018 23:06:34.4175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fc7f84-dff2-4265-98ff-08d5ca6fd173
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3416
Subject: [PATCH v3 4/6] toolchain-scripts: pass env to post-relocate
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
X-List-Received-Date: Mon, 04 Jun 2018 23:06:34 -0000
Content-Type: text/plain

It's useful for the post-relocate scripts to be able to see the SDK
environment, for example to see the values of CC, CXX etc. in order to
dynamically generate toolchain files.

To enable this, source the SDK environment script prior to calling the
relocate scripts.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
v3:
- Source all top-level env setup scripts instead of just one.

 meta/classes/toolchain-scripts.bbclass     | 20 ++++++++++++++++----
 meta/recipes-core/meta/meta-environment.bb |  2 +-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index ef190a69ec..727bdab4a0 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -118,11 +118,23 @@ EOF
 }
 
 toolchain_create_post_relocate_script() {
-	script=$1
-	rm -f $script
-	touch $script
+	relocate_script=$1
+	env_dir=$2
+	rm -f $relocate_script
+	touch $relocate_script
+
+	cat >> $relocate_script <<EOF
+# Source top-level SDK env scripts in case they are needed for the relocate
+# scripts.
+for env_setup_script in ${env_dir}/environment-setup-*; do
+    . \$env_setup_script
+    status=\$?
+    if [ \$status != 0 ]; then
+        echo "\$0: Failed to source \$env_setup_script with status \$status"
+        exit \$status
+    fi
+done
 
-	cat >> $script <<EOF
 if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
     for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
         if [ ! -x \$s ]; then
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 09f757a087..da1230bead 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -56,7 +56,7 @@ create_sdk_files() {
 	# Add version information
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
 
-	toolchain_create_post_relocate_script ${SDK_OUTPUT}/${SDKPATH}/post-relocate-setup.sh
+	toolchain_create_post_relocate_script ${SDK_OUTPUT}/${SDKPATH}/post-relocate-setup.sh ${SDKPATH}
 }
 
 do_install() {
-- 
2.11.0


