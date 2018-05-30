Return-Path: <mkelly@xevo.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0076.outbound.protection.outlook.com [104.47.42.76])
	by mail.openembedded.org (Postfix) with ESMTP id 0A22E74E40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 23:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mkWkt2kRdPgaxIlcPvFJU+KEz73/9jj4oyWPl174G0o=;
	b=sx/hWqP3UiOf9zaXfuUJCURbBU4azscX0xFepOdSNUrUhYBzbEyz3at2BOO5Dzu0kjZu9SQbRXsTJ2oh/blbvbNZlhwtwpSX2MlbkmJdCvOTpzTXC20FAS4mS31uzxtuI5vAPTOOHv45g5rW9dJxxFNXMogv8BSPIyOxh7pOTuk=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Wed, 30 May 2018 23:14:40 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 16:14:02 -0700
Message-Id: <20180530231407.19759-3-mkelly@xevo.com>
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
	3:SSBs6lt/EuSPwM+S7l3eT9VSqC6jfoO3HuGJitvLYbSpghzwk85UMMqM8wtani3OZFlj7LXBTqsSeXDd17hTc8GjNmqkOWIRrUjOwZAXP50Lgz7G7irluW2QDP8h85CQKeLmTGLjAqNgafalDYsZJuWFoU6C3nh0Fi59rDSjySGMa39+vVaqsop7CGPWrkjpHacIP/gK6dfzawRsomyBj4ev5L4BsimwqEW85j3Vf3CympIHSDoNJdnNISUbwr7a;
	25:BWefTdMZsO1PFQNqi02IdqZ/DAP/WPY1IJ55sEsFxWoNqXZ0RXduCUNAkfUjlRlhMNfyt3u3WEFS9Jjzs0HG4lLb8JHvB9BXt7CP7Ly/kr5bwvxiyG/ihSGksAf1R0y68zrAkueMi4oeedJEwFTYTGhTGi8HA3JV94RrS8v7/F7RBRlXwhaoM7oNwQ2P1UHbINw3Vi2rDKqpxWV2M33tQHQojOkpmih89eaZkpMXUWj3wR8i6fPvn4K/cjCs9sQbiycFuVK/jVXHPF2GugJethsmV+doQgepbuGr+6pXx0bKIBwKPsNmDbaZrUcpWIq1yBICohNeHULqTB6opie6aQ==;
	31:Js0mDn8Td3GRxVG5Hw8v+fSYtGdMqKvr35bxZYtaUDfy28NnrFeihEqJoRpGvTCpxdf00nMhPzTs6hoZykAhWIw7OVvetugMJ5VGiWcMd7pg3O/HeZo0MYLZKKnLUsy4wkDtdM38j4PYBoCuvLZsQD9ZOBpHMYz1bXWJJ+WQx2IWC13Ho7Ka9ecoVDn6+y/dph+BcpDt7K7WU4k5LwnG48jowRD3phuvGFZngtUBvh0=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:kWKi4pfO6bU1dCEokyI3TQfSPtA/+pdjL4wLeIXDD/4IGrWBx81ZHs0Sjc4oqR3Q/qne6u/Ad4VXJejp1fV6H94/4bkBYQ0kXfeKLInwCJyZpfNEB0T4xZsHAyhxE24IDZ7Xcet6MSO8WGMNW9YE1Zda5Kl6zmRCF9i7zWTZ4evHPjF3/j6q7qGeE5T9PJYau/eD3qs9mjpYgf6QcXEBSjIgLNMBefFYHNI0bujVkn38rbbxp9qEEp2kVOmL5jMxT6T5pZOKjMMlomMJw/xbb1cdTJ6AwzCJp9+0Wh1XoCr10SIXUlNOD4iFDPmm4iWPPCgFTfZBmwSN3DCDUe5N5Kk7YzxvGIqogBx1cBj4AWmUZzlVE3JD/jPvRBwVg7mK6AAhp/HK7m/Ji74KjU6/783sgJzT004G7xRhAIgO3impDTL0nCjRGTvyoREXcWcVufTNQ0bLRmsd1yKh/kfrmRur/yMFSjDZuUT1+AMFM6FqOEoGx29TmrYRXfiZS6Aa;
	4:cb5nkyk+2GYXuf8deRIh1JQ8dmxcYr+k4teDojDG8j5lEmTbDL2cf3qNcdKeQi3Xrb9gFlwInckouy/hC9gxR2Chb0DRmhgdarPzmxCkWa2BwCos1FhBLr4MXjN3XF/Yvc+GO/WG0LJ1YZw1IwENPSPvJ+aM0JGlNpc6LGsD3wlebLWLYfrloqAWAJ7cHn7rITGht6/NEFBou1KmWPRh4OIAf34ajGF6fqXGLy47ppbmIm0lH3A6tT4C715OmgIHVI6nmgatE/KpXkxsDf3h1w==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34198CB264CE562023236EB2AB6C0@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 0688BF9B46
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(39380400002)(366004)(376002)(346002)(199004)(189003)(11346002)(1076002)(486006)(36756003)(16526019)(6916009)(186003)(47776003)(2616005)(956004)(50226002)(3846002)(476003)(6116002)(7696005)(305945005)(86362001)(4326008)(39060400002)(386003)(53936002)(52116002)(51416003)(478600001)(7736002)(26005)(6666003)(107886003)(76176011)(6486002)(48376002)(68736007)(81166006)(54906003)(81156014)(50466002)(8936002)(25786009)(16586007)(8676002)(66066001)(316002)(5660300001)(2906002)(446003)(106356001)(105586002)(97736004)(2351001)(2361001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3419;
	23:cYO69IkAx2C8fSwLTxC/gwgaM2LcARsdsSfESC9?=
	=?us-ascii?Q?tgVxgU0lpbJE18h9QlPwIpB+rIJMqasA0wgxKaav8Inf8ZBcWWFibe7JxN2j?=
	=?us-ascii?Q?mdlLiehu2qq2ECPRsIOFeeLDcDgHGyzQOTCstTefpg/OCLnDdrmOkoY9A7D2?=
	=?us-ascii?Q?j9h2h1sboPzIUqwUDhDzhv+RmH4TaGhBFukrJSeQxNqdP1Pg5dEPp5LDO12k?=
	=?us-ascii?Q?G3YsYCfjZArNdbx82ESaqtE4DB1sv1GTwwtYPXdyB4Y3rIaLnN7FfFuWxDsT?=
	=?us-ascii?Q?1CWcbyLQR3yyQZ2L9rXYJBfPjOVi6NGtC8r3VaEz8mmXLXfrJ+Uy3qbS+CwS?=
	=?us-ascii?Q?HuX3s1A2djd7Mpc5idcild/KVgcnEj4Kqw6zh+jp+mDILUwNOPToNcZV/2Wd?=
	=?us-ascii?Q?+jf33QSBb4/DqgWkkNRVsK1qDquWupOafNwXAgPFgx+WlwRyhsxdfliw6v49?=
	=?us-ascii?Q?UDe6bx/UyCKo6SgbBnT4MhYs5CyAJMBgCoPVR+Ny0tUgkxYbR4BDCH+Z4zNE?=
	=?us-ascii?Q?YHBOJFKl5CjNoxQY0u5MIlhKBcAQ/udNKuJLZLl7n7pQi/9MQOJB5g891YrN?=
	=?us-ascii?Q?gmlUyoula+i2xWlw3ez5LebgEkKoM8n1kG8XWjBKx5+V+ZiZM5/4PtQx7QGx?=
	=?us-ascii?Q?2LVKY897fVONxiIqjyEOB4wlNsUeCxQL/NojfV6XDwD/9ZJzCUzd94JoWsfz?=
	=?us-ascii?Q?R/oOgIwb1oNRBA0/cvn3ES2crtuMTMUGRhT0SYV6c0ZY0TP17LR/lUbH+5IM?=
	=?us-ascii?Q?nQUKLNUcrcz/OOywRW4563mW097A7BiJXx1tmgC3J9fdgLYXmfgPCTH/paEP?=
	=?us-ascii?Q?3M9fn+tHi3zDFhGcZrtwNgR7KSO5XeUrqWkadvv4rBzjE6mWVMvOwhuLvnd9?=
	=?us-ascii?Q?WzVHD8qE0ojVkhkM7Je1QCLxe99EtaDdyM1MnVY2IuwSV89xoXqsQxzFHAnw?=
	=?us-ascii?Q?zWaZKda+EQBOf4zUoh2jKPlU6p4r6nmJzSGcKqTKsjD/and37+2rpQtMi8Nk?=
	=?us-ascii?Q?ttMI/YT3/tur2tFD8CT6NPnxd0ptZBQe4CtVaUIW5yaeb938wMqMl3/fCWNn?=
	=?us-ascii?Q?XsJVB6rhF3E0B4Ez6qfEACyMRb64lFJvZjkF9enW7cr03YTL3R2lrDlbWOPc?=
	=?us-ascii?Q?IeOjfp466AkFEMg+N/hQrkd6DJnDkhPbxOgjmgz7vKYb1B5LIoXnf0591C5Q?=
	=?us-ascii?Q?39woJUyp6c73PezwpAEnD34xdkzGEXZObeAaWNl/pPSIfSsWNzinaSCg1Dwu?=
	=?us-ascii?Q?aoKjijXzxGVrzudCZsmPQ5bkcSC+WEpR3Tz2vnMWvVc2AeCygpdX8dMb0+L0?=
	=?us-ascii?Q?qPw=3D=3D?=
X-Microsoft-Antispam-Message-Info: yCVLK6qpQHer3J3IVYefY7kV+XphD4pwv33cQlwKKJlbs+e4EVpubLYE+HfnbbflixTyQxIDF6XGCzUS5ArZVFQ7RGeo1Xzk0vWpNwx+WkYOLhZttrsyyK5yvXBKOaWjPxYFrjHrnDTPAhy5lneEyN3gksqY1Ket0F2F3W05jBwUwKoEO5qiltoSIueJTOQY
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:TpzpejRWmkxWWYxg10nUBw+RylYM9MvR6HQbiJ3iXJh7KqyXNTTxBAZhxfTziH/GCru9sAMp1Pmg6i8uJ2RNSIvQDGubLAj3oh1nNazaq62FV5oWSCeEhP1aV1RCEuNuMj83PFmo+7Juc68uL4hCFb2Jh/65h+ha/FTrnrZ8LXL+NJwyLdGZDNl1+nr8QGNrkBtturq1WTybD/b9m/0dUmpntB+RQi3l0pf2w2B7HQL97uadq2vwV0ZLA+ux/ejBaBfm8b5QHmJTNJGd/jINKJ6jIakDqRnj694dwCngKQ51lW0PbB0AOS3GxAoKdUNONjo/CbcWbZWE5AAc46qDAlyBUlvgkC0KJ3jHUSLdP9dOIhHtQUKqTQOgVKr5g6U6N3VX/wC3FX6a1FPgg2e/omfP18ijRjiuf29I1+wO9OHOHuwVZav8mH+YmvSAyQiEfrciuWzActJl0zqSAMq8Dw==;
	5:j96C5ablErBk4k6d9rRnaPrZo9U2+F9CAgOT5Nqp6dvLU7Unm+UTSEBWrqaxHdVY08Cydqb/CBWroHyo2q8HV8dQA+dycnmKf5nXlHpFP1YmAPmlc1bF8Nh0jACoF3DwTCHta6k2VlonJlCZ9huo1lYaYKUd+YUQEcnABExQbVY=;
	24:AoCq6MyyK6LHZ2FMT3YqAZkeFqclbd8SnqrWL3POZc74F8ra48nUwT5hTngeykBCnJkvnKCPW9b9SAgZhi46dmJJOFrBAyBWe3srXpnQC+o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:C2iqvv0Hr59djZMYkqdV56DNvOSqNv4rVkp80EKH6TTvlB1lpF6mj106TyOrud+Iqkim6j+zcAQpMBC6a2Hgj5jhvExUF3VA1qbr4toE6SJcJ2rPh3VYJeAityKwezGj66sKMJkgj9w2Pqx2VA9OUZM+MaZ2MsjveX4L57yOafFcKIuql577RF62NX0ajCvLU5rQUmEvDg1Fyq+b5SkciuSzwubPSxUAYINDkNumeCS+PC4Bhm/FqetZlyY9gfqG
X-MS-Office365-Filtering-Correlation-Id: 6838df5d-9809-499a-d3bb-08d5c6831f07
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2018 23:14:40.6102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6838df5d-9809-499a-d3bb-08d5c6831f07
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
Subject: [PATCH 2/7] nativesdk-python*: suppress user site dirs
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
X-List-Received-Date: Wed, 30 May 2018 23:29:27 -0000
Content-Type: text/plain

Currently, $HOME/.local is being added into sys.path in the Python SDK
causing subtle host contamination. Suppress this by exporting
PYTHONNOUSERSITE = "1" as documented in PEP 370.

This issue occurred in the past for python*-native and was fixed
similarly in OE-core commit 8fe9fb4d5a61dcbcb3fc5b9ee0234cc135af873f
("python*native.bbclass: suppress user site dirs").

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-devtools/python/python-scons-native_3.0.1.bb | 2 +-
 meta/recipes-devtools/python/python3_3.5.5.bb             | 2 +-
 meta/recipes-devtools/python/python_2.7.14.bb             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-scons-native_3.0.1.bb b/meta/recipes-devtools/python/python-scons-native_3.0.1.bb
index dae89ab5d2..68b63c9357 100644
--- a/meta/recipes-devtools/python/python-scons-native_3.0.1.bb
+++ b/meta/recipes-devtools/python/python-scons-native_3.0.1.bb
@@ -4,5 +4,5 @@ DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
 
 do_install_append() {
-    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}'
+    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
 }
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index f893b846ad..4dae4fa4c6 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -176,7 +176,7 @@ do_install() {
 }
 
 do_install_append_class-nativesdk () {
-	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
+	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
 SSTATE_SCAN_FILES += "Makefile"
diff --git a/meta/recipes-devtools/python/python_2.7.14.bb b/meta/recipes-devtools/python/python_2.7.14.bb
index 41a8609b15..b923b9237b 100644
--- a/meta/recipes-devtools/python/python_2.7.14.bb
+++ b/meta/recipes-devtools/python/python_2.7.14.bb
@@ -130,7 +130,7 @@ do_install() {
 }
 
 do_install_append_class-nativesdk () {
-	create_wrapper ${D}${bindir}/python2.7 PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
+	create_wrapper ${D}${bindir}/python2.7 PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
 SSTATE_SCAN_FILES += "Makefile"
-- 
2.11.0


