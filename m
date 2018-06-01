Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0087.outbound.protection.outlook.com [104.47.32.87])
	by mail.openembedded.org (Postfix) with ESMTP id 90FFC7505D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 21:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=X/uIQo+L5zZogxzjkbl0cejMvoeQAxENvtIx++Dq0Ms=;
	b=argAv0R38wy6/VoKHqDNUduGIZBlE53AfNjPTJhqGACSKgAyaN3RwxjoG81WexCW9Yef8b1AaCcdpktPARXXxkEzvL0yN0KsEksFdwcOmMk+yZLlhh3SaG9Jm7RIq4/L/NNqD4vCs7CnSB+9rLi1Kflwt7fosTa5nkXGm3/wPRY=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3417.prod.exchangelabs.com (2603:10b6:302:3::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Fri, 1 Jun 2018 21:03:14 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 14:02:34 -0700
Message-Id: <20180601210240.14969-2-mkelly@xevo.com>
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
	3:Jh/cFUclfjwNQe7JSDeGYpos0k4WvVWRbCj1GgzYDM5yHAkFK00uJAoZm2joP95S+mRovj/1+jaZzd1YIHKS+UW6wfkkjeVN2OLi49ztwAxYbTyaqZLyF+chuizHxLB33y0cUrUoVU77WU+Gc0GdN7jvibZVwe+82qRAZ4WgNt1pzRDvW+8FrCRz2kxbsUN0NV5vQ1YsdkLaDcViZHai3Rx3HA+6P5QTtkym6i3amMOGqzqd6X8yoQ+cx59T48Ng;
	25:G+ZddYAkB4W8cRRdf7oXkS6QVGsnh8Njr6yeb2ZGCSKgwEUtBP8zhc/soCyJ93rhNK4RnH9SgXiyZF3+nN0ICeJqwI5rnNmyYMRsJvtnTYXwdtTC5BdU07I3Vo2ZDEPz8/m/Ke7LWYjfx6ev8ZHniT/Gvmk0B/uNkCb4ouWXhqrWQeIiRq8CU9WD8gnqEEdqp51KBI6J+50pqqYjrIW5DdeEfDxRND+h1yWh6fy59u4O2bTn8df0hyZRKzPaMCeFwaU03PkBQw2WQHr8MVspHT60HWEfCgxDLr4rGBZROXej1rEui4S41P0/iWb4dDjGgrYDqkrziipOtDrWpjvVgA==;
	31:oIX6zVt2076HNkUDhJNffS4+rXsb4+sxL2IIJS8tqzlohNexBx+1gpA8B5JUnHeOTZw7buu88pZoZjjrEcRz6CJJynYIonxtx6bcx62I684e+W95GeDuKg81mwR3KpVxVQFFSwH6Top4w/shxpVVuAZRGuyowJP1vanx0e14ZMGSNQp0mdUeNPqF1kFJRmULVE2gkFtn/aeJX/O8tGEynODLqgl3kVhmFLBNxkudBsc=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3417:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	20:v3j5rT5lSvYbE244VVfjKUWAgQI9Wc/BKAe9bg1hRVo5oICdqw7TTznLuVpjcjZRnhHfVLQBPWUk5D3DLWZFKdJQuxenRpCIikMXefH3fDup1xb392w61LBo1ByIxJ18nudezDi75xvWRtK50CfPkIIlWiEhjPIKoRd4mmvwyuWIM5k6nvFe93AzuP+Kt6NoX7JD4gqQGxyO5+jSQjlRr7ZCpUh0RbBwGBUifZoeLt62nIrNFdPLqgXRRqdL1TBbwXyY3VAK1KGvKCljtwLkGxfifffiSQj4uHNmsBXRDHJzULKCdAT+UpqYYa6GH66VtDfDkzi8b9BlZGA29VKYQENjl3wSlptx5lYgQavq/DOCkbtieoMSpDVS3NaBnLm3BgpTxXEtD3ryszhpF06dkrxVl9Smi8QWpY+rlpu0/AvRV8hVgASXaeitSXhAJTxA5CKlr/8XV6BJDOjNBpQCrOw9oDtVGRd+Y1s2ooROnaqYNdRdaw6Mqu5NEcip3HwB;
	4:mjGHr+yLqTSkateqjPBmEn2PP4FwG4NgCsbEF0BpxUUo/QeeC3B2+WRLAHcbq2Reld4vrDiiDFgB0OeOHcYNxKBsF2D0zFDJ0SUp7++vdqHu9TjEzgdjOOvVGOX5FxH1hR/3Z4EkGtgdyLJ+qnPdq8oZGBN+XuCGM/hR9VakBM7tblEnQItxT11Jko1IXwhEfa5zewxVK8rqJsIepn7i3JABF7+2oEnRk+cPWpqTuPMjqw69WPrrXZFd/6tjnTgeyDQZHH+n7dnXvikFvNPv8Q==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34172299722D8D73CF0D9F47AB620@MW2PR0102MB3417.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3417; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3417; 
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(376002)(396003)(39850400004)(366004)(199004)(189003)(186003)(68736007)(6486002)(86362001)(66066001)(106356001)(105586002)(47776003)(7696005)(51416003)(52116002)(26005)(81166006)(8676002)(16526019)(76176011)(7736002)(305945005)(50226002)(8936002)(486006)(2906002)(956004)(446003)(476003)(11346002)(2616005)(81156014)(386003)(25786009)(39060400002)(2351001)(48376002)(2361001)(4326008)(3846002)(6116002)(1076002)(53936002)(6916009)(6666003)(107886003)(5660300001)(478600001)(16586007)(316002)(54906003)(36756003)(97736004)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3417;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3417;
	23:bBVSYDaFcj34lRp2Gp/FZ34F3IRHMdQUNZ7QDGP?=
	=?us-ascii?Q?YQ1BA18pW0+XzCATrE+jmlwyyaRJOWdRk+7HAtuOs+cLQxUQui94QOXA+tlz?=
	=?us-ascii?Q?NgSQfN6MqYcd9ooHaquuhRCg4SBX3pd2lmNUACOrb9mt0lUXvtN3cArwLA0w?=
	=?us-ascii?Q?w52MFKrVTiI2Bd6YveghOzLfhLCdiCAdRQCynlRL698h/A/0mo0xMS7vaUYb?=
	=?us-ascii?Q?PyYb07qvYV0YhZobj7r/9nrSBwXYsbPHNOfMk7NnRBnEPz9pcKQ2hoODuLIh?=
	=?us-ascii?Q?fuGVosFiNlF6dOP74W9GKPjp1GGwciSTTnpofYXFKHMibgJCdnSUFK5m2ACn?=
	=?us-ascii?Q?Ur3wnshqrBGEBrrDgSUpSlS1GzyjjFrxrHCakTUlo90/cG77wFu3tAXlgVhT?=
	=?us-ascii?Q?YtXn9yoD44MxDq65VFpp5QBHGEYsFNg0iF7ENj6EzwqX8211KUNC5yly8zFe?=
	=?us-ascii?Q?xzTkZiiRJfYeOzpm2we1CJlr4FhhTDwv9nFVNlvypPXd3btSxV5dl2bUL2Ch?=
	=?us-ascii?Q?rbBKfzmVYGeXNdjbGSQtNi1pPQK8cWR49aitaJX7rvRsaMIvs4RTh+whKopc?=
	=?us-ascii?Q?v1z6dKCIHgh7DATrFc334/8Jbm2F6j0InlPGgd6lfkABE++pm17K+ijFaJlG?=
	=?us-ascii?Q?KlWdqS0P1J1Nq/GiQEQpO7cpVZb0xdmCjwGxTOoNsoFYMAPReY6yny/VrgAM?=
	=?us-ascii?Q?rsygToEtTFABVNYsII4utGTiYpj0DcWGiPrmGndFcy1MzxjNz+/MbZVdtTUR?=
	=?us-ascii?Q?XP2bXLNH7VPz/NNPDPb3K8IkNyJrTXH3sYC995Y652A47XVwS2RRpAahUTnO?=
	=?us-ascii?Q?x0TJJll8SoAvwmo+i+5aWXiTvr2oeHGj22Uj9fAjbv0BKIbU+bRdonuomRcG?=
	=?us-ascii?Q?YL/VAmyyxoCn4YaSgKavkbeKQatkWrp1KU/7ZAYXDhcg7FEPWna/jxu6GCCz?=
	=?us-ascii?Q?eHexNF2bPG9upnTnbeSwikS9CCFVm7gzu14G2LhcUHGMz87t3RbhzZ4x0DqZ?=
	=?us-ascii?Q?yt+MeM3SavaA/XdYTybhsXrzVtR0/iCEfKQn7onFH50MzMKUdlkD4NalguTm?=
	=?us-ascii?Q?d8IVYwUe+t6/6Woc2aJv5/LCf3C5s4Kg6Jh2apdN50BFrL8+dmbpEZJLLLCT?=
	=?us-ascii?Q?HZ3aSy1rjrdX+v5oMNrAZjz6Z4f4X+eu6BYHorb9sGysqK7s1pqN2azANwTs?=
	=?us-ascii?Q?CqwHsGP773whw90Lh9OPByFiarqR5bOr/DFtRwY9Ktl9kdBnrcIjddUg5oZZ?=
	=?us-ascii?Q?DQHeDvnSlbmSFjE3/prTZxgicif81wYs46mnFPSPfPwKp3/TlFzGiuwRcqm1?=
	=?us-ascii?Q?tSg=3D=3D?=
X-Microsoft-Antispam-Message-Info: EE9GxfrnxAEmNgfv6qAt1+RiydW3hHOrMp0L/FEmfAJQf8HSk53JEZZ3Ule0Pyr0fkm+8lVOHNSxGW8bAUZRcaY3P8AKa5IFKNrqm2cKzLPtftXAn5oHQBFAykhTywC9fsHZRWQW8l7tAzIRaZiSCa1+5PQa+5f1YrmKm5rEDhuwIizEocM9Osz6rjfTYc0q
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	6:QSXlY2JDEYF/sDVLP29Wfq5bhCXt4JnStA+NF780le7wNBTgiQLKibhCLoT8hAdkJr0L2R3Lwo4HY1+FobDAIt7N/aTh4yx48ixAeSTsU+mSFdHlcouWqGUvW/CyYfp8o6mB1SPHaQ5cR7/lk7Bdy/FdRgtCGWqsBkwbyiIyNKquKCPF3NlimrrkvVUo8YxWqDIebT1sN+IzzHt7G+osgzelffAAYPrdvZ7ELzqzOqv5lm7Sa0qAUd3ndiuYTCxZ+Xu7YupRD5CjqSLzY69Ej/87+iwie+BO4IfblmNL7SqAc/LuP/bOrkH0b659eeKCaT45HalcyAqkzfsUbBvs9MZm2PrNY70DY+22mNqspAvftwAzwDq+MnNqJ6BZObRljnmXynYZBELoHJUhzP94OVLSNjFMNZlMeFsfNLvtYtZREnQdwE+RURGAxZ9oCrlOgM4j5SuqNXDutNaEJSuNAQ==;
	5:y1HLvu+MiTUR5ImArl+bj6RpamE2Cwsd+X3DZTrUqc5c+KToflXetJp7ERBnb5ygYLJ6RUUs/4LpHutS9K19u7L767qQCABG+tXajaO43ZIFt12Er7WWoXcrndwhNip16JrDs0rz1wrYeMkjK3YQ9wQSmHQxpP2gis+TfFNYIC4=;
	24:XyymTlmfqpCVNdWbJZOTzDHSQWzvSkxnfwWVab895uBS6HYVmbH6WpP/2IHNaA7ZbtfT3yOq63vMT/vUzd5AbX6zfa616Cw34YpH3qzNw78=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	7:XcLXMomoWyCsPVIBBdne8mKTAtA1tvfdHcg1DbzWP6N5+hvLf5epkEn1rOxVRIvRjXUtLD6boCPmquzEaqve2OueQ4w+sMln4oKSqF7a+HFZ7sRAF0ncYsZ/I44/yWMrFN/j18xovM7MhTRC7pLQm+xdT6gIwavH2FnS+5XKD3Gai0S3Pe2CcQWGRIuy/7yL8oHMUC7EELokTtWm2MSCyiYxcYp62PTafC50fE2lE84MNsVIh3Kv2GdMn0OQaSYD
X-MS-Office365-Filtering-Correlation-Id: 13558487-7058-4b5f-e2e9-08d5c8031737
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 21:03:14.2320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13558487-7058-4b5f-e2e9-08d5c8031737
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3417
Subject: [PATCH v2 1/7] meson.bbclass: refactor native override
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
X-List-Received-Date: Fri, 01 Jun 2018 21:03:14 -0000
Content-Type: text/plain

The native override is specified in two different places, so let's move
it into a function to reduce code duplication.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/meson.bbclass | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 2d7ee4fffc..5881765abb 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -90,7 +90,7 @@ meson_do_configure() {
     fi
 }
 
-meson_do_configure_prepend_class-target() {
+override_native_tools() {
     # Set these so that meson uses the native tools for its build sanity tests,
     # which require executables to be runnable. The cross file will still
     # override these for the target build. Note that we do *not* set CFLAGS,
@@ -100,18 +100,15 @@ meson_do_configure_prepend_class-target() {
     export CXX="${BUILD_CXX}"
     export LD="${BUILD_LD}"
     export AR="${BUILD_AR}"
+
+}
+
+meson_do_configure_prepend_class-target() {
+    override_native_tools
 }
 
 meson_do_configure_prepend_class-nativesdk() {
-    # Set these so that meson uses the native tools for its build sanity tests,
-    # which require executables to be runnable. The cross file will still
-    # override these for the nativesdk build. Note that we do *not* set CFLAGS,
-    # LDFLAGS, etc. as they will be slurped in by meson and applied to the
-    # nativesdk build, causing errors.
-    export CC="${BUILD_CC}"
-    export CXX="${BUILD_CXX}"
-    export LD="${BUILD_LD}"
-    export AR="${BUILD_AR}"
+    override_native_tools
 }
 
 meson_do_configure_prepend_class-native() {
-- 
2.11.0


