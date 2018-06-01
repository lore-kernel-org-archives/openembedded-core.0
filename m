Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0088.outbound.protection.outlook.com [104.47.32.88])
	by mail.openembedded.org (Postfix) with ESMTP id BA4BB75069
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 21:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=aWRxOfHd+7WFtpgGvLyWy2B5XxzfTx6tDhkzPwqrVpE=;
	b=eAEHZnu4xfOsgslWhtCOciZinqnbZPCkZ1AZJJTUaMuxlwRbA4xYV6M++7t3tkgW6AyT4UQE4Cf7fw3pABjVGQhINhSfnFjGTluvcVgGQvJY4UDrs7tiYZzdiK+1O1k+g4FYkn6sVFMfuOyrqal7/zRK2qzWMxfCDaT74k9Fxd4=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3417.prod.exchangelabs.com (2603:10b6:302:3::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Fri, 1 Jun 2018 21:03:16 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 14:02:39 -0700
Message-Id: <20180601210240.14969-7-mkelly@xevo.com>
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
	3:YuCOsswx9Ot2oWOvQEEjqEJTVp2IfmqLnybnr2bqzuk0o2SJPvkhCgXbuBnGwr1QJR7Qys8Y7sIe9tg3zzzX80hrGyFXueO7OaTZZtzNg6LFq9gxRuDktM0O1LVs2aS9K7EGupkvV6EWsTj5TWbekWUshJpv68sFuLLI0l/FHsCysHEElpwTY2N14kSUVHgXzuAIk1NPxnw7O3ScLQ6rG2dKMsZsK2fT/6kN2CUaiJItDJ2Ctboi74XvetLhDjh4;
	25:AG1vhuAkI1UoV9Yg2LxjUaiJwh385L4HL19l9nGIb+ACT7hv6pCyhY+V7pNnNXOBzwbJVBjtU1/0HOokhcnJeoAaMaRdCuFHEdXrtSWY8L0oNkqNNxvrbUQCWmsBcVqa7qxqCAK81m1j+1w7ejl3uGeTDowZ4JNg4dqLEbJBdv3Mk571RedYGGhIg7dw0S/1JjEHsdxJI3huwYZfxpCb4yiUzn/KgMQ/rtybhDMMvt82RhJcQMCO/MaBz4V/IaIc0l0tQZi0/tfG2ARAYCktya+OAJU+kzGmZBcUuB0yjqsrzWlSXJyM/9Q9Vmty7kLddWdK9E5XEKMHMgZpbLKN4g==;
	31:XIzhFB1UBsHZJfYQjkF+POrgYHiiSg3MzEkr+iDK+AM+cxMnUnfOQtQuJNdrUfrLcfgRRx25MOYdf3DgrHeYaMsyRJMoCaW0f96LlXFShJKtmjkT/m6yv1z9UxN6lJNzxr6JRHpxjlPh8rceZ40s3OqXKLj2molnhfrGLo1pVcrWEAnrVHPF7oqbKgdrBUKBQr//qua/JtEWQnvMTiFd2UKa2Sl8minGbeX0P6eQB0U=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3417:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	20:FSE4iNuVnYZLGndBc9OahIQhxRS6FQD4Dw3YQSkiobOfuna1qY3UBwuDXYo5zKBI0WRtSy0qD24AnVDtiWfnGSryxPtJy7vdQPGJbJKjtzBcN9uUTKRYD9w6Kt5JkykzmfZJLNeZ/F32fpKX8jUtVj9SRnQ2H3dtE/e6RkrNZVXEtDPHgK3/6S7VEnIz68yY/mQ4aFu1MCX7/mAvWkvwzIajwqohxNbT6y7rvOvjl7PRR7BkcX8nWMxta9muOXNBy5HTI5+a9QNlY+No/iZBBtk9sH/XzPErCErai0eJDLQwznFIVtuS4xtpLVuTrB1kvBXWufT1Xk02RhcXRAHJo13F1Ca7byaCk47FVbFmaQFZ3x5NGK4vMcnp+Op+ugHYZi6NgKdScswWPpEmknUDYdCjamLxZ1ieIoi0kzXYwfoYmwdzH/0j8I/2DsVOrr2Q3OOIUeu3JuuN4yvVlME0U+8CaNHDz7EJgdwufwS4ULFJ33f2+2wbwda4M/Nwm2LU
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3417386A923C5FCF16FF9722AB620@MW2PR0102MB3417.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(250069074691196)(166708455590820)(48706222282353)(85827821059158)(788757137089)(17755550239193);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3417; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3417; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	4:o6GDvkmPsTmh4LsXGtb3urNPaeGSGc+PPCbqGD8/QU31SFRA4m8VqKpLGTB3oXbXOHhjV2zXJGwYm8j9F3S0tnh3AaAsCU2h7GrMOXXO3B5ddZQ8OwHoDH/Gx6GV4zm0jEiUAjvy9EiQKajCnqGPWGbiAUh4QdJ+OFpcjO8lc/PxZpG8939w+Om/S8ulQHjYESYppgE1PJGo66WlSZZJxmpo1NYb2y+vU0tnlLZdQAdZhXo1nskvXSuVNBHCHLWYKzqqIZaR7I54dXP/mDv1r4FSs12AqrtwItBnAwK3enNmkQEjuP06AFqi7Fi5I3OH4DZVXCiRTP30+LxfanNCobMyyAR/cTmfogDt+n2X94760bjgDboLhAszLWW62vgyvucKdQlwky33oRAjgGrzEirdtdZUVNLQUI8Mm1kSRwG0wU5XTssryI9znc2OdgoAqxW1UO9a0lA7Rtl0cHWvD6dywvQrNxs4ivVMW2MGgqI=
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(376002)(396003)(39850400004)(366004)(199004)(189003)(186003)(68736007)(6486002)(86362001)(66066001)(106356001)(105586002)(47776003)(7696005)(51416003)(52116002)(26005)(81166006)(8676002)(16526019)(76176011)(7736002)(305945005)(50226002)(8936002)(486006)(2906002)(59450400001)(956004)(446003)(476003)(11346002)(2616005)(81156014)(386003)(25786009)(39060400002)(2351001)(48376002)(2361001)(4326008)(3846002)(6116002)(1076002)(53936002)(6916009)(6666003)(966005)(107886003)(5660300001)(53946003)(6306002)(478600001)(16586007)(316002)(54906003)(36756003)(97736004)(50466002)(403724002)(579004)(559001)(460985005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3417;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3417;
	23:mRfcdbuIaHaazN3Ul0xJDTnbhXj4/WRayIFeXjb?=
	=?us-ascii?Q?QVwhBNYSGLPwqE7CGamrsu2vWllbnsd9iGZ7q4baXPSUwQVqDCsndiih36y9?=
	=?us-ascii?Q?+rnk70kTsnersFGg4ndMuyu49liKqCxqamYP4tTiZcfRbOQ0OrTvEPQZ0aDY?=
	=?us-ascii?Q?Z2o2vDuqiSEsw/810HzTnAh8QL23FrjQ5lPmXAVBrj1l7MlSC4k/JTFH6vCy?=
	=?us-ascii?Q?SEBhJOO3IUq+AVsNmuHDnfHaRnyRVcihRd+rr4A+cZrF5ilhFH/aY8QH7ifp?=
	=?us-ascii?Q?1+bCnTVcGX32gtx8jMugeolhAZU+lG7l0nerleDsE0TjepmZTMLwSsOamz/E?=
	=?us-ascii?Q?rlz+5/p1NvG2L9jrHv2SQ6cTQ7IJNuudDnMHoTYivwrGh9ECDM0Fycx/FZ2g?=
	=?us-ascii?Q?xWiimV5s1urZopiBr70WSF4RJCY739QbB2ZnVtaseD5+WXBNWp8aZKMgoK1D?=
	=?us-ascii?Q?qMB6Bzi9CZGc73AmtI2pEzUSi1jmoVoO+zlU+BWJV5SEv217/FKwfZPDFkLe?=
	=?us-ascii?Q?C47y4EAzfY7SdHfAqw5APzBxlllWvFLqL1B3OpRh/QpGHzD7Deu+YpN2eQyC?=
	=?us-ascii?Q?hhOl87EoOnowz1CmoE2ObJMaKDpBiPpTWwHYTyUNoBjXKHFB1yKQ5riI64G8?=
	=?us-ascii?Q?5vY6mHKLbxeRYN4p2vaBR+GQW2Xb5QJg3RS5dIvxCAG8ts8at1WXkSdPtEly?=
	=?us-ascii?Q?0ttfCUVDsst9nAG3+S4fHt9im+4rrl0BOMiW5ZvwK4ClJlbZ8S4Aby4L+C9j?=
	=?us-ascii?Q?i5UuO6N78pmkNSRnT0lpz6jSU3a5vPAv5oKR0oaV5lBMTKf926lDmLmbCPET?=
	=?us-ascii?Q?y6ePw+4EgmFqjvkVRwsrn0+yUdJ6CgBz6QeanX4XGSRGte1b/1qXQoLypHmG?=
	=?us-ascii?Q?xbc26PpBVMVnRCwElg6uYLNEu1vIJ8TIhmMLEaxOtBuR3uxAISomrGjB3wJ8?=
	=?us-ascii?Q?vviKJ83VeBU76mDQuZ/5mnnSWBlw0mY/Asg8u53GP9xcq6DeyJDRj+NZBWKh?=
	=?us-ascii?Q?GwrZaM1AVYPMXx0GC+HoXMAT9y2K1UkB4Wjxj5WJELT33rluC5WT87jmXyFl?=
	=?us-ascii?Q?AP17n9+Q2AbESWrm7xcDK1lw1N7SbICSS5+T8vY2wSfJbGYGf3Nfdso1Nt3p?=
	=?us-ascii?Q?FWsrt9B5Z4x/uQaJVZLK8FfY3alge6YdSjK6wKiZqMGJ5JSQkuu6+HauzmZM?=
	=?us-ascii?Q?iMdNshPSaGql73FKstTOaqCnpK445Ib6k039xcmTFSBCTKISPUWGZgG44u5z?=
	=?us-ascii?Q?KHdQ07HLJvi8VkGI4V1eSDJEKkzT+2W/Wqcmh6Cg8qwZdn6+JGBhxqszRIbS?=
	=?us-ascii?Q?3R2FZQzp9IY1iS+HfUX/eMCALcYMg59v+DMOyekN+zila9IKJtxGg+BTBczO?=
	=?us-ascii?Q?s2mqAgNJ88XevavHUMKD0albiZPbmi87io6PLsyUeCTDgQ6af1cDKIsS5mAX?=
	=?us-ascii?Q?mqSRH7e/QmknChffBzj3EXtre9nj9qco=3D?=
X-Microsoft-Antispam-Message-Info: QguoFuuIfWeYTiIAAK/qbg0NhTZxndr3zr0BmhlxwE9XTibQHKb1KhMAUEqYqjIwitaFUtsCua1K/jwnSufYaLmlLEwcGNXjNRAxCS5a/lBJ2ZOP4YdyaDDqULgYUP/tbmVH7Myv5kV7IXClGfuglTeJsvmSHyMCuDbT8pvEPs3X4BKoFwAzUxAwdW/+kA+P
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	6:H0IRoTBB2zoIt182kZ1vP6bhuqCCZSLgp2aPPTJ01xBGoXDx4q4+F5goKkxlClSHNMZ+ONAtz2rvk99cKDqlorbtcDU7UsZoT2llp7go0Ga5CDQfg2qsOKffACYB2OSB402lCPSskgWCovQG69fSrAlHP6d73dx5aobitfO84Trls4PJ9cJRXzXfMZnG/YouztpXGRyBpWVbvNeiG9xx6XYJOnYBbR4uxVq3574B4KTTEICNw3hjpjW/9onxiJlZWT+bszrNEB0c5rrmBcPqOhHjfNvKCKXLjm0+VvaEdxGGEc/3szXlwBntcgXZw78UWQa6wZMYoDT8AdRu4JdIj16ceRctakJnvOvex3+dEAe0SGJu8HPUifyQYJ7QCVBxdtcQnecZEwWg1nHX1mlJvV7auoG5kigsQTfG37xtR53P0C2HMGvTeOG7iiHbhf9lEJDqPlQhHcgbPMW1euIlbQ==;
	5:RouPveicApzTyCsRZgIx5bEiPy/M7B904IG4eKwzoM2OfNqDuWzwahhp97+DVhQ4JLHkHDPB6QC3Q4eJMh+xyy87c2fhf2YKfC45/roLx0KYTBmvI36PJATMdwIA7S/ee4I504MSJrWfZwJ6OX9KJc30GLVitVNXriHVpGLiKHo=;
	24:Nr2Lk63UX7rrXsMdLnIcD68xXsAZEVTO1qZVmQnBvrgAQl9nM/77IJ7eKOsYKCWfsZZxY3pt2f+Hi2qGdrN0HvIBh8f2aityCaVDOAHhCAg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	7:zeZkhl1BdsuOxERinpL+TuJiyzg0vooFVzIY5HToQJIR+SPxhhao4NekFE372bZ1P375v48R/wTvSzx2UqhvescvlgEHbgEgJI9ROIY+xutW3MLzEassoMwU26//YNy091a5bCuirju0ftQjUWDmQDeqgyDHz9XdXmQqT3qw4A1B98vKZ9AhIALYZW5V5O/4/50TrbGH2Cl10Km/KnJamtHBBLwRWwU/bKTTaYSJQ5yuaz0x6DORb9APzn4nXtuY
X-MS-Office365-Filtering-Correlation-Id: 6454e6b5-db8c-48e6-afd6-08d5c8031847
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 21:03:16.0132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6454e6b5-db8c-48e6-afd6-08d5c8031847
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3417
Subject: [PATCH v2 6/7] meson: handle exe wrappers
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
X-List-Received-Date: Fri, 01 Jun 2018 21:03:17 -0000
Content-Type: text/plain

Add patches to enable meson to handle being wrapped with a shell script.  This
will enable us to do so for supporting the SDK, which requires us to setup env
vars and point to a meson.cross file inside the SDK.

These patches are all merged upstream, so we can drop them soon.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
v2:
- Switch to new version of patches to fix exe wrappers, as upstream tweaked the
  previous patch.

 ...0004-Prettifying-some-output-with-pathlib.patch | 188 +++++
 ...on-command-to-use-when-we-know-what-it-is.patch | 851 +++++++++++++++++++++
 meta/recipes-devtools/meson/meson_0.46.1.bb        |   2 +
 3 files changed, 1041 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0004-Prettifying-some-output-with-pathlib.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch

diff --git a/meta/recipes-devtools/meson/meson/0004-Prettifying-some-output-with-pathlib.patch b/meta/recipes-devtools/meson/meson/0004-Prettifying-some-output-with-pathlib.patch
new file mode 100644
index 0000000000..e75633beb9
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0004-Prettifying-some-output-with-pathlib.patch
@@ -0,0 +1,188 @@
+From 253ab5bf6d6d925abcf625b72f5fcacf99be13bd Mon Sep 17 00:00:00 2001
+From: Niklas Claesson <nicke.claesson@gmail.com>
+Date: Wed, 18 Apr 2018 15:25:03 +0200
+Subject: [PATCH] Prettifying some output with pathlib
+
+This is a backport required in order to make
+0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch apply.
+
+Upstream-Status: Accepted [https://github.com/mesonbuild/meson/pull/3423]
+Should be in the 0.47.0 release.
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+---
+ run_cross_test.py    |  6 ++++--
+ run_project_tests.py | 51 +++++++++++++++++++++++++++++----------------------
+ 2 files changed, 33 insertions(+), 24 deletions(-)
+
+diff --git a/run_cross_test.py b/run_cross_test.py
+index e285e218..71914028 100755
+--- a/run_cross_test.py
++++ b/run_cross_test.py
+@@ -22,13 +22,15 @@ Not part of the main test suite because of two reasons:
+ 
+ Eventually migrate to something fancier.'''
+ 
+-import sys, os
++import sys
++import os
++from pathlib import Path
+ 
+ from run_project_tests import gather_tests, run_tests, StopException, setup_commands
+ from run_project_tests import failing_logs
+ 
+ def runtests(cross_file):
+-    commontests = [('common', gather_tests('test cases/common'), False)]
++    commontests = [('common', gather_tests(Path('test cases', 'common')), False)]
+     try:
+         (passing_tests, failing_tests, skipped_tests) = run_tests(commontests, 'meson-cross-test-run', ['--cross', cross_file])
+     except StopException:
+diff --git a/run_project_tests.py b/run_project_tests.py
+index 8c02a9ee..3c516240 100755
+--- a/run_project_tests.py
++++ b/run_project_tests.py
+@@ -14,14 +14,22 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
+ 
+-from glob import glob
+ import itertools
+-import os, subprocess, shutil, sys, signal
++import os
++import subprocess
++import shutil
++import sys
++import signal
+ from io import StringIO
+ from ast import literal_eval
+ from enum import Enum
+ import tempfile
+-from mesonbuild import build, environment, mesonlib, mlog, mtest
++from pathlib import Path, PurePath
++from mesonbuild import build
++from mesonbuild import environment
++from mesonbuild import mesonlib
++from mesonbuild import mlog
++from mesonbuild import mtest
+ from mesonbuild.mesonlib import stringlistify, Popen_safe
+ from mesonbuild.coredata import backendlist
+ import argparse
+@@ -198,7 +206,7 @@ def validate_install(srcdir, installdir, compiler, env):
+ 
+ def log_text_file(logfile, testdir, stdo, stde):
+     global stop, executor, futures
+-    logfile.write('%s\nstdout\n\n---\n' % testdir)
++    logfile.write('%s\nstdout\n\n---\n' % testdir.as_posix())
+     logfile.write(stdo)
+     logfile.write('\n\n---\n\nstderr\n\n---\n')
+     logfile.write(stde)
+@@ -245,11 +253,11 @@ def run_test_inprocess(testdir):
+     sys.stderr = mystderr = StringIO()
+     old_cwd = os.getcwd()
+     os.chdir(testdir)
+-    test_log_fname = 'meson-logs/testlog.txt'
++    test_log_fname = Path('meson-logs', 'testlog.txt')
+     try:
+         returncode_test = mtest.run(['--no-rebuild'])
+-        if os.path.exists(test_log_fname):
+-            test_log = open(test_log_fname, errors='ignore').read()
++        if test_log_fname.exists():
++            test_log = test_log_fname.open(errors='ignore').read()
+         else:
+             test_log = ''
+         returncode_benchmark = mtest.run(['--no-rebuild', '--benchmark', '--logbase', 'benchmarklog'])
+@@ -318,9 +326,8 @@ def _run_test(testdir, test_build_dir, install_dir, extra_args, compiler, backen
+     gen_args += [testdir, test_build_dir] + flags + test_args + extra_args
+     (returncode, stdo, stde) = run_configure(meson_command, gen_args)
+     try:
+-        logfile = os.path.join(test_build_dir, 'meson-logs/meson-log.txt')
+-        with open(logfile, encoding='utf-8', errors='ignore') as f:
+-            mesonlog = f.read()
++        logfile = Path(test_build_dir, 'meson-logs', 'meson-log.txt')
++        mesonlog = logfile.open(errors='ignore', encoding='utf-8').read()
+     except Exception:
+         mesonlog = no_meson_log_msg
+     gen_time = time.time() - gen_start
+@@ -390,11 +397,11 @@ def _run_test(testdir, test_build_dir, install_dir, extra_args, compiler, backen
+     return TestResult(validate_install(testdir, install_dir, compiler, builddata.environment),
+                       BuildStep.validate, stdo, stde, mesonlog, gen_time, build_time, test_time)
+ 
+-def gather_tests(testdir):
+-    tests = [t.replace('\\', '/').split('/', 2)[2] for t in glob(testdir + '/*')]
++def gather_tests(testdir: Path):
++    tests = [t.name for t in testdir.glob('*')]
+     testlist = [(int(t.split()[0]), t) for t in tests]
+     testlist.sort()
+-    tests = [os.path.join(testdir, t[1]) for t in testlist]
++    tests = [testdir / t[1] for t in testlist]
+     return tests
+ 
+ def have_d_compiler():
+@@ -517,7 +524,7 @@ def detect_tests_to_run():
+         ('fpga', 'fpga', shutil.which('yosys') is None),
+         ('frameworks', 'frameworks', False),
+     ]
+-    gathered_tests = [(name, gather_tests('test cases/' + subdir), skip) for name, subdir, skip in all_tests]
++    gathered_tests = [(name, gather_tests(Path('test cases', subdir)), skip) for name, subdir, skip in all_tests]
+     return gathered_tests
+ 
+ def run_tests(all_tests, log_name_base, extra_args):
+@@ -566,18 +573,18 @@ def _run_tests(all_tests, log_name_base, extra_args):
+         for t in test_cases:
+             # Jenkins screws us over by automatically sorting test cases by name
+             # and getting it wrong by not doing logical number sorting.
+-            (testnum, testbase) = os.path.split(t)[-1].split(' ', 1)
++            (testnum, testbase) = t.name.split(' ', 1)
+             testname = '%.3d %s' % (int(testnum), testbase)
+             should_fail = False
+             if name.startswith('failing'):
+                 should_fail = name.split('failing-')[1]
+-            result = executor.submit(run_test, skipped, t, extra_args, system_compiler, backend, backend_flags, commands, should_fail)
++            result = executor.submit(run_test, skipped, t.as_posix(), extra_args, system_compiler, backend, backend_flags, commands, should_fail)
+             futures.append((testname, t, result))
+         for (testname, t, result) in futures:
+             sys.stdout.flush()
+             result = result.result()
+-            if (result is None) or (('MESON_SKIP_TEST' in result.stdo) and (skippable(name, t))):
+-                print(yellow('Skipping:'), t)
++            if (result is None) or (('MESON_SKIP_TEST' in result.stdo) and (skippable(name, t.as_posix()))):
++                print(yellow('Skipping:'), t.as_posix())
+                 current_test = ET.SubElement(current_suite, 'testcase', {'name': testname,
+                                                                          'classname': name})
+                 ET.SubElement(current_test, 'skipped', {})
+@@ -585,7 +592,7 @@ def _run_tests(all_tests, log_name_base, extra_args):
+             else:
+                 without_install = "" if len(install_commands) > 0 else " (without install)"
+                 if result.msg != '':
+-                    print(red('Failed test{} during {}: {!r}'.format(without_install, result.step.name, t)))
++                    print(red('Failed test{} during {}: {!r}'.format(without_install, result.step.name, t.as_posix())))
+                     print('Reason:', result.msg)
+                     failing_tests += 1
+                     if result.step == BuildStep.configure and result.mlog != no_meson_log_msg:
+@@ -597,7 +604,7 @@ def _run_tests(all_tests, log_name_base, extra_args):
+                         failing_logs.append(result.stdo)
+                     failing_logs.append(result.stde)
+                 else:
+-                    print('Succeeded test%s: %s' % (without_install, t))
++                    print('Succeeded test%s: %s' % (without_install, t.as_posix()))
+                     passing_tests += 1
+                 conf_time += result.conftime
+                 build_time += result.buildtime
+@@ -641,7 +648,7 @@ def check_format():
+ 
+ def check_meson_commands_work():
+     global backend, meson_command, compile_commands, test_commands, install_commands
+-    testdir = 'test cases/common/1 trivial'
++    testdir = PurePath('test cases', 'common', '1 trivial').as_posix()
+     with AutoDeletedDir(tempfile.mkdtemp(prefix='b ', dir='.')) as build_dir:
+         print('Checking that configuring works...')
+         gen_cmd = mesonlib.meson_command + [testdir, build_dir] + backend_flags
+@@ -706,7 +713,7 @@ if __name__ == '__main__':
+             except UnicodeError:
+                 print(l.encode('ascii', errors='replace').decode(), '\n')
+     for name, dirs, skip in all_tests:
+-        dirs = (os.path.basename(x) for x in dirs)
++        dirs = (x.name for x in dirs)
+         for k, g in itertools.groupby(dirs, key=lambda x: x.split()[0]):
+             tests = list(g)
+             if len(tests) != 1:
diff --git a/meta/recipes-devtools/meson/meson/0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch b/meta/recipes-devtools/meson/meson/0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch
new file mode 100644
index 0000000000..8fb277a150
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch
@@ -0,0 +1,851 @@
+From 717480549bea68ed2da1420141f64c1c15cda11d Mon Sep 17 00:00:00 2001
+From: Nirbheek Chauhan <nirbheek@centricular.com>
+Date: Fri, 1 Jun 2018 13:00:17 +0530
+Subject: [PATCH] Set the meson command to use when we know what it is
+
+Instead of using fragile guessing to figure out how to invoke meson,
+set the value when meson is run. Also rework how we pass of
+meson_script_launcher to regenchecker.py -- it wasn't even being used
+
+With this change, we only need to guess the meson path when running
+the tests, and in that case:
+
+1. If MESON_EXE is set in the env, we know how to run meson
+   for project tests.
+2. MESON_EXE is not set, which means we run the configure in-process
+   for project tests and need to guess what meson to run, so either
+   - meson.py is found next to run_tests.py, or
+   - meson, meson.py, or meson.exe is in PATH
+
+Otherwise, you can invoke meson in the following ways:
+
+1. meson is installed, and mesonbuild is available in PYTHONPATH:
+   - meson, meson.py, meson.exe from PATH
+   - python3 -m mesonbuild.mesonmain
+   - python3 /path/to/meson.py
+   - meson is a shell wrapper to meson.real
+2. meson is not installed, and is run from git:
+   - Absolute path to meson.py
+   - Relative path to meson.py
+   - Symlink to meson.py
+
+All these are tested in test_meson_commands.py, except meson.exe since
+that involves building the meson msi and installing it.
+
+Upstream-Status: Accepted [https://github.com/mesonbuild/meson/pull/3654]
+Should be in the 0.47.0 release.
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+---
+ meson.py                            |  17 ++--
+ mesonbuild/environment.py           |   6 +-
+ mesonbuild/mesonlib.py              |  48 +---------
+ mesonbuild/mesonmain.py             |  34 +++++--
+ mesonbuild/scripts/regen_checker.py |   6 +-
+ run_meson_command_tests.py          | 186 ++++++++++++++++++++++++++++++++++++
+ run_project_tests.py                |  20 ++--
+ run_tests.py                        |  43 +++++++--
+ run_unittests.py                    |  64 +++++--------
+ 9 files changed, 297 insertions(+), 127 deletions(-)
+ create mode 100755 run_meson_command_tests.py
+
+diff --git a/meson.py b/meson.py
+index abbac6f4..dc84b513 100755
+--- a/meson.py
++++ b/meson.py
+@@ -14,13 +14,16 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
+ 
+-from mesonbuild import mesonmain
+-import sys, os
++import sys
++from pathlib import Path
++
++# If we're run uninstalled, add the script directory to sys.path to ensure that
++# we always import the correct mesonbuild modules even if PYTHONPATH is mangled
++meson_exe = Path(sys.argv[0]).resolve()
++if (meson_exe.parent / 'mesonbuild').is_dir():
++    sys.path.insert(0, meson_exe.parent)
+ 
+-def main():
+-    # Always resolve the command path so Ninja can find it for regen, tests, etc.
+-    launcher = os.path.realpath(sys.argv[0])
+-    return mesonmain.run(sys.argv[1:], launcher)
++from mesonbuild import mesonmain
+ 
+ if __name__ == '__main__':
+-    sys.exit(main())
++    sys.exit(mesonmain.main())
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 15b37378..d02a8370 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -263,10 +263,9 @@ class Environment:
+     log_dir = 'meson-logs'
+     coredata_file = os.path.join(private_dir, 'coredata.dat')
+ 
+-    def __init__(self, source_dir, build_dir, main_script_launcher, options, original_cmd_line_args):
++    def __init__(self, source_dir, build_dir, options, original_cmd_line_args):
+         self.source_dir = source_dir
+         self.build_dir = build_dir
+-        self.meson_script_launcher = main_script_launcher
+         self.scratch_dir = os.path.join(build_dir, Environment.private_dir)
+         self.log_dir = os.path.join(build_dir, Environment.log_dir)
+         os.makedirs(self.scratch_dir, exist_ok=True)
+@@ -279,7 +278,8 @@ class Environment:
+             # re-initialized with project options by the interpreter during
+             # build file parsing.
+             self.coredata = coredata.CoreData(options)
+-            self.coredata.meson_script_launcher = self.meson_script_launcher
++            # Used by the regenchecker script, which runs meson
++            self.coredata.meson_command = mesonlib.meson_command
+             self.first_invocation = True
+         if self.coredata.cross_file:
+             self.cross_info = CrossBuildInfo(self.coredata.cross_file)
+diff --git a/mesonbuild/mesonlib.py b/mesonbuild/mesonlib.py
+index 2a3b920b..01561658 100644
+--- a/mesonbuild/mesonlib.py
++++ b/mesonbuild/mesonlib.py
+@@ -38,58 +38,12 @@ except Exception:
+ 
+ from glob import glob
+ 
+-def detect_meson_py_location():
+-    c = sys.argv[0]
+-    c_dir, c_fname = os.path.split(c)
+-
+-    # get the absolute path to the <mesontool> folder
+-    m_dir = None
+-    if os.path.isabs(c):
+-        # $ /foo/<mesontool>.py <args>
+-        m_dir = c_dir
+-    elif c_dir == '':
+-        # $ <mesontool> <args> (gets run from /usr/bin/<mesontool>)
+-        in_path_exe = shutil.which(c_fname)
+-        if in_path_exe:
+-            if not os.path.isabs(in_path_exe):
+-                m_dir = os.getcwd()
+-                c_fname = in_path_exe
+-            else:
+-                m_dir, c_fname = os.path.split(in_path_exe)
+-    else:
+-        m_dir = os.path.abspath(c_dir)
+-
+-    # find meson in m_dir
+-    if m_dir is not None:
+-        for fname in ['meson', 'meson.py']:
+-            m_path = os.path.join(m_dir, fname)
+-            if os.path.exists(m_path):
+-                return m_path
+-
+-    # No meson found, which means that either:
+-    # a) meson is not installed
+-    # b) meson is installed to a non-standard location
+-    # c) the script that invoked mesonlib is not the one of meson tools (e.g. run_unittests.py)
+-    fname = os.path.normpath(os.path.join(os.path.dirname(__file__), '..', 'meson.py'))
+-    if os.path.exists(fname):
+-        return fname
+-    # If meson is still not found, we might be imported by out-of-source tests
+-    # https://github.com/mesonbuild/meson/issues/3015
+-    exe = shutil.which('meson')
+-    if exe is None:
+-        exe = shutil.which('meson.py')
+-    if exe is not None:
+-        return exe
+-    # Give up.
+-    raise RuntimeError('Could not determine how to run Meson. Please file a bug with details.')
+-
+ if os.path.basename(sys.executable) == 'meson.exe':
+     # In Windows and using the MSI installed executable.
+-    meson_command = [sys.executable]
+     python_command = [sys.executable, 'runpython']
+ else:
+     python_command = [sys.executable]
+-    meson_command = python_command + [detect_meson_py_location()]
++meson_command = None
+ 
+ def is_ascii_string(astring):
+     try:
+diff --git a/mesonbuild/mesonmain.py b/mesonbuild/mesonmain.py
+index 2b6281d7..67f99439 100644
+--- a/mesonbuild/mesonmain.py
++++ b/mesonbuild/mesonmain.py
+@@ -73,9 +73,8 @@ def filter_builtin_options(args, original_args):
+ 
+ class MesonApp:
+ 
+-    def __init__(self, dir1, dir2, script_launcher, handshake, options, original_cmd_line_args):
++    def __init__(self, dir1, dir2, handshake, options, original_cmd_line_args):
+         (self.source_dir, self.build_dir) = self.validate_dirs(dir1, dir2, handshake)
+-        self.meson_script_launcher = script_launcher
+         self.options = options
+         self.original_cmd_line_args = original_cmd_line_args
+ 
+@@ -129,7 +128,7 @@ class MesonApp:
+             env.coredata.pkgconf_envvar = curvar
+ 
+     def generate(self):
+-        env = environment.Environment(self.source_dir, self.build_dir, self.meson_script_launcher, self.options, self.original_cmd_line_args)
++        env = environment.Environment(self.source_dir, self.build_dir, self.options, self.original_cmd_line_args)
+         mlog.initialize(env.get_log_dir())
+         with mesonlib.BuildDirLock(self.build_dir):
+             self._generate(env)
+@@ -268,12 +267,27 @@ def run_script_command(args):
+         raise MesonException('Unknown internal command {}.'.format(cmdname))
+     return cmdfunc(cmdargs)
+ 
+-def run(original_args, mainfile=None):
++def set_meson_command(mainfile):
++    if mainfile.endswith('.exe'):
++        mesonlib.meson_command = [mainfile]
++    elif os.path.isabs(mainfile) and mainfile.endswith('mesonmain.py'):
++        # Can't actually run meson with an absolute path to mesonmain.py, it must be run as -m mesonbuild.mesonmain
++        mesonlib.meson_command = mesonlib.python_command + ['-m', 'mesonbuild.mesonmain']
++    else:
++        mesonlib.meson_command = mesonlib.python_command + [mainfile]
++    # This won't go into the log file because it's not initialized yet, and we
++    # need this value for unit tests.
++    if 'MESON_COMMAND_TESTS' in os.environ:
++        mlog.log('meson_command is {!r}'.format(mesonlib.meson_command))
++
++def run(original_args, mainfile):
+     if sys.version_info < (3, 5):
+         print('Meson works correctly only with python 3.5+.')
+         print('You have python %s.' % sys.version)
+         print('Please update your environment')
+         return 1
++    # Set the meson command that will be used to run scripts and so on
++    set_meson_command(mainfile)
+     args = original_args[:]
+     if len(args) > 0:
+         # First check if we want to run a subcommand.
+@@ -351,9 +365,7 @@ def run(original_args, mainfile=None):
+         else:
+             dir2 = '.'
+     try:
+-        if mainfile is None:
+-            raise AssertionError('I iz broken. Sorry.')
+-        app = MesonApp(dir1, dir2, mainfile, handshake, options, original_args)
++        app = MesonApp(dir1, dir2, handshake, options, original_args)
+     except Exception as e:
+         # Log directory does not exist, so just print
+         # to stdout.
+@@ -381,3 +393,11 @@ def run(original_args, mainfile=None):
+         mlog.shutdown()
+ 
+     return 0
++
++def main():
++    # Always resolve the command path so Ninja can find it for regen, tests, etc.
++    launcher = os.path.realpath(sys.argv[0])
++    return run(sys.argv[1:], launcher)
++
++if __name__ == '__main__':
++    sys.exit(main())
+diff --git a/mesonbuild/scripts/regen_checker.py b/mesonbuild/scripts/regen_checker.py
+index a9b00c7b..80d9242b 100644
+--- a/mesonbuild/scripts/regen_checker.py
++++ b/mesonbuild/scripts/regen_checker.py
+@@ -14,7 +14,6 @@
+ 
+ import sys, os
+ import pickle, subprocess
+-from mesonbuild.mesonlib import meson_command
+ 
+ # This could also be used for XCode.
+ 
+@@ -32,7 +31,7 @@ def need_regen(regeninfo, regen_timestamp):
+     Vs2010Backend.touch_regen_timestamp(regeninfo.build_dir)
+     return False
+ 
+-def regen(regeninfo, mesonscript, backend):
++def regen(regeninfo, meson_command, backend):
+     cmd = meson_command + ['--internal',
+                            'regenerate',
+                            regeninfo.build_dir,
+@@ -48,11 +47,10 @@ def run(args):
+         regeninfo = pickle.load(f)
+     with open(coredata, 'rb') as f:
+         coredata = pickle.load(f)
+-    mesonscript = coredata.meson_script_launcher
+     backend = coredata.get_builtin_option('backend')
+     regen_timestamp = os.stat(dumpfile).st_mtime
+     if need_regen(regeninfo, regen_timestamp):
+-        regen(regeninfo, mesonscript, backend)
++        regen(regeninfo, coredata.meson_command, backend)
+     sys.exit(0)
+ 
+ if __name__ == '__main__':
+diff --git a/run_meson_command_tests.py b/run_meson_command_tests.py
+new file mode 100755
+index 00000000..6efd911b
+--- /dev/null
++++ b/run_meson_command_tests.py
+@@ -0,0 +1,186 @@
++#!/usr/bin/env python3
++
++# Copyright 2018 The Meson development team
++#
++# Licensed under the Apache License, Version 2.0 (the "License");
++# you may not use this file except in compliance with the License.
++# You may obtain a copy of the License at
++#
++#     http://www.apache.org/licenses/LICENSE-2.0
++#
++# Unless required by applicable law or agreed to in writing, software
++# distributed under the License is distributed on an "AS IS" BASIS,
++# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++# See the License for the specific language governing permissions and
++# limitations under the License.
++
++import os
++import tempfile
++import unittest
++import subprocess
++from pathlib import Path
++
++from mesonbuild.mesonlib import windows_proof_rmtree, python_command, is_windows
++
++# Find the meson.py adjacent to us
++meson_py = Path(__file__).resolve().parent / 'meson.py'
++if not meson_py.is_file():
++    raise RuntimeError("meson.py not found: test must only run from git")
++
++def get_pypath():
++    import sysconfig
++    pypath = sysconfig.get_path('purelib', vars={'base': ''})
++    # Ensure that / is the path separator and not \, then strip /
++    return Path(pypath).as_posix().strip('/')
++
++def get_pybindir():
++    import sysconfig
++    # 'Scripts' on Windows and 'bin' on other platforms including MSYS
++    return sysconfig.get_path('scripts', vars={'base': ''}).strip('\\/')
++
++class CommandTests(unittest.TestCase):
++    '''
++    Test that running meson in various ways works as expected by checking the
++    value of mesonlib.meson_command that was set during configuration.
++    '''
++
++    def setUp(self):
++        super().setUp()
++        self.orig_env = os.environ.copy()
++        self.orig_dir = os.getcwd()
++        os.environ['MESON_COMMAND_TESTS'] = '1'
++        self.tmpdir = Path(tempfile.mkdtemp()).resolve()
++        self.src_root = Path(__file__).resolve().parent
++        self.testdir = str(self.src_root / 'test cases/common/1 trivial')
++        self.meson_args = ['--backend=ninja']
++
++    def tearDown(self):
++        try:
++            windows_proof_rmtree(str(self.tmpdir))
++        except FileNotFoundError:
++            pass
++        os.environ.clear()
++        os.environ.update(self.orig_env)
++        os.chdir(str(self.orig_dir))
++        super().tearDown()
++
++    def _run(self, command, workdir=None):
++        '''
++        Run a command while printing the stdout and stderr to stdout,
++        and also return a copy of it
++        '''
++        # If this call hangs CI will just abort. It is very hard to distinguish
++        # between CI issue and test bug in that case. Set timeout and fail loud
++        # instead.
++        p = subprocess.run(command, stdout=subprocess.PIPE,
++                           stderr=subprocess.STDOUT, env=os.environ.copy(),
++                           universal_newlines=True, cwd=workdir, timeout=60 * 5)
++        print(p.stdout)
++        if p.returncode != 0:
++            raise subprocess.CalledProcessError(p.returncode, command)
++        return p.stdout
++
++    def assertMesonCommandIs(self, line, cmd):
++        self.assertTrue(line.startswith('meson_command '), msg=line)
++        self.assertEqual(line, 'meson_command is {!r}'.format(cmd))
++
++    def test_meson_uninstalled(self):
++        # This is what the meson command must be for all these cases
++        resolved_meson_command = python_command + [str(self.src_root / 'meson.py')]
++        # Absolute path to meson.py
++        os.chdir('/')
++        builddir = str(self.tmpdir / 'build1')
++        meson_py = str(self.src_root / 'meson.py')
++        meson_setup = [meson_py, 'setup']
++        meson_command = python_command + meson_setup + self.meson_args
++        stdo = self._run(meson_command + [self.testdir, builddir])
++        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
++        # ./meson.py
++        os.chdir(str(self.src_root))
++        builddir = str(self.tmpdir / 'build2')
++        meson_py = './meson.py'
++        meson_setup = [meson_py, 'setup']
++        meson_command = python_command + meson_setup + self.meson_args
++        stdo = self._run(meson_command + [self.testdir, builddir])
++        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
++        # Symlink to meson.py
++        if is_windows():
++            # Symlinks require admin perms
++            return
++        os.chdir(str(self.src_root))
++        builddir = str(self.tmpdir / 'build3')
++        # Create a symlink to meson.py in bindir, and add it to PATH
++        bindir = (self.tmpdir / 'bin')
++        bindir.mkdir()
++        (bindir / 'meson').symlink_to(self.src_root / 'meson.py')
++        os.environ['PATH'] = str(bindir) + os.pathsep + os.environ['PATH']
++        # See if it works!
++        meson_py = 'meson'
++        meson_setup = [meson_py, 'setup']
++        meson_command = meson_setup + self.meson_args
++        stdo = self._run(meson_command + [self.testdir, builddir])
++        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
++
++    def test_meson_installed(self):
++        # Install meson
++        prefix = self.tmpdir / 'prefix'
++        pylibdir = prefix / get_pypath()
++        bindir = prefix / get_pybindir()
++        pylibdir.mkdir(parents=True)
++        os.environ['PYTHONPATH'] = str(pylibdir)
++        os.environ['PATH'] = str(bindir) + os.pathsep + os.environ['PATH']
++        self._run(python_command + ['setup.py', 'install', '--prefix', str(prefix)])
++        self.assertTrue(pylibdir.is_dir())
++        self.assertTrue(bindir.is_dir())
++        # Run `meson`
++        os.chdir('/')
++        if is_windows():
++            resolved_meson_command = python_command + [str(bindir / 'meson.py')]
++        else:
++            resolved_meson_command = python_command + [str(bindir / 'meson')]
++            # The python configuration on appveyor does not register .py as
++            # a valid extension, so we cannot run `meson` on Windows.
++            builddir = str(self.tmpdir / 'build1')
++            meson_setup = ['meson', 'setup']
++            meson_command = meson_setup + self.meson_args
++            stdo = self._run(meson_command + [self.testdir, builddir])
++            self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
++        # Run `/path/to/meson`
++        builddir = str(self.tmpdir / 'build2')
++        if is_windows():
++            # Cannot run .py directly because of the appveyor configuration,
++            # and the script is named meson.py, not meson
++            meson_setup = python_command + [str(bindir / 'meson.py'), 'setup']
++        else:
++            meson_setup = [str(bindir / 'meson'), 'setup']
++        meson_command = meson_setup + self.meson_args
++        stdo = self._run(meson_command + [self.testdir, builddir])
++        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
++        # Run `python3 -m mesonbuild.mesonmain`
++        resolved_meson_command = python_command + ['-m', 'mesonbuild.mesonmain']
++        builddir = str(self.tmpdir / 'build3')
++        meson_setup = ['-m', 'mesonbuild.mesonmain', 'setup']
++        meson_command = python_command + meson_setup + self.meson_args
++        stdo = self._run(meson_command + [self.testdir, builddir])
++        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
++        if is_windows():
++            # Next part requires a shell
++            return
++        # `meson` is a wrapper to `meson.real`
++        resolved_meson_command = python_command + [str(bindir / 'meson.real')]
++        builddir = str(self.tmpdir / 'build4')
++        (bindir / 'meson').rename(bindir / 'meson.real')
++        wrapper = (bindir / 'meson')
++        with open(wrapper, 'w') as f:
++            f.write('#!/bin/sh\n\nmeson.real "$@"')
++        wrapper.chmod(0o755)
++        meson_setup = [str(wrapper), 'setup']
++        meson_command = meson_setup + self.meson_args
++        stdo = self._run(meson_command + [self.testdir, builddir])
++        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
++
++    def test_meson_exe_windows(self):
++        raise unittest.SkipTest('NOT IMPLEMENTED')
++
++if __name__ == '__main__':
++    unittest.main(buffer=True)
+diff --git a/run_project_tests.py b/run_project_tests.py
+index 3c516240..3d22b152 100755
+--- a/run_project_tests.py
++++ b/run_project_tests.py
+@@ -38,8 +38,7 @@ import time
+ import multiprocessing
+ from concurrent.futures import ProcessPoolExecutor
+ import re
+-from run_unittests import get_fake_options, run_configure
+-
++from run_tests import get_fake_options, run_configure, get_meson_script
+ from run_tests import get_backend_commands, get_backend_args_for_dir, Backend
+ from run_tests import ensure_backend_detects_changes
+ 
+@@ -88,12 +87,6 @@ no_meson_log_msg = 'No meson-log.txt found.'
+ 
+ system_compiler = None
+ 
+-meson_command = os.path.join(os.getcwd(), 'meson')
+-if not os.path.exists(meson_command):
+-    meson_command += '.py'
+-    if not os.path.exists(meson_command):
+-        raise RuntimeError('Could not find main Meson script to run.')
+-
+ class StopException(Exception):
+     def __init__(self):
+         super().__init__('Stopped by user')
+@@ -324,7 +317,7 @@ def _run_test(testdir, test_build_dir, install_dir, extra_args, compiler, backen
+     if pass_libdir_to_test(testdir):
+         gen_args += ['--libdir', 'lib']
+     gen_args += [testdir, test_build_dir] + flags + test_args + extra_args
+-    (returncode, stdo, stde) = run_configure(meson_command, gen_args)
++    (returncode, stdo, stde) = run_configure(gen_args)
+     try:
+         logfile = Path(test_build_dir, 'meson-logs', 'meson-log.txt')
+         mesonlog = logfile.open(errors='ignore', encoding='utf-8').read()
+@@ -417,7 +410,7 @@ def have_d_compiler():
+ 
+ def have_objc_compiler():
+     with AutoDeletedDir(tempfile.mkdtemp(prefix='b ', dir='.')) as build_dir:
+-        env = environment.Environment(None, build_dir, None, get_fake_options('/'), [])
++        env = environment.Environment(None, build_dir, get_fake_options('/'), [])
+         try:
+             objc_comp = env.detect_objc_compiler(False)
+         except mesonlib.MesonException:
+@@ -432,7 +425,7 @@ def have_objc_compiler():
+ 
+ def have_objcpp_compiler():
+     with AutoDeletedDir(tempfile.mkdtemp(prefix='b ', dir='.')) as build_dir:
+-        env = environment.Environment(None, build_dir, None, get_fake_options('/'), [])
++        env = environment.Environment(None, build_dir, get_fake_options('/'), [])
+         try:
+             objcpp_comp = env.detect_objcpp_compiler(False)
+         except mesonlib.MesonException:
+@@ -647,11 +640,12 @@ def check_format():
+                 check_file(fullname)
+ 
+ def check_meson_commands_work():
+-    global backend, meson_command, compile_commands, test_commands, install_commands
++    global backend, compile_commands, test_commands, install_commands
+     testdir = PurePath('test cases', 'common', '1 trivial').as_posix()
++    meson_commands = mesonlib.python_command + [get_meson_script()]
+     with AutoDeletedDir(tempfile.mkdtemp(prefix='b ', dir='.')) as build_dir:
+         print('Checking that configuring works...')
+-        gen_cmd = mesonlib.meson_command + [testdir, build_dir] + backend_flags
++        gen_cmd = meson_commands + [testdir, build_dir] + backend_flags
+         pc, o, e = Popen_safe(gen_cmd)
+         if pc.returncode != 0:
+             raise RuntimeError('Failed to configure {!r}:\n{}\n{}'.format(testdir, e, o))
+diff --git a/run_tests.py b/run_tests.py
+index 648e6ce1..736cdc07 100755
+--- a/run_tests.py
++++ b/run_tests.py
+@@ -21,13 +21,16 @@ import shutil
+ import subprocess
+ import tempfile
+ import platform
++from io import StringIO
++from enum import Enum
++from glob import glob
++from pathlib import Path
++
++import mesonbuild
+ from mesonbuild import mesonlib
+ from mesonbuild import mesonmain
+ from mesonbuild import mlog
+ from mesonbuild.environment import detect_ninja
+-from io import StringIO
+-from enum import Enum
+-from glob import glob
+ 
+ Backend = Enum('Backend', 'ninja vs xcode')
+ 
+@@ -42,6 +45,28 @@ if mesonlib.is_windows() or mesonlib.is_cygwin():
+ else:
+     exe_suffix = ''
+ 
++def get_meson_script():
++    '''
++    Guess the meson that corresponds to the `mesonbuild` that has been imported
++    so we can run configure and other commands in-process, since mesonmain.run
++    needs to know the meson_command to use.
++
++    Also used by run_unittests.py to determine what meson to run when not
++    running in-process (which is the default).
++    '''
++    # Is there a meson.py next to the mesonbuild currently in use?
++    mesonbuild_dir = Path(mesonbuild.__file__).resolve().parent.parent
++    meson_script = mesonbuild_dir / 'meson.py'
++    if meson_script.is_file():
++        return str(meson_script)
++    # Then if mesonbuild is in PYTHONPATH, meson must be in PATH
++    mlog.warning('Could not find meson.py next to the mesonbuild module. '
++                 'Trying system meson...')
++    meson_cmd = shutil.which('meson')
++    if meson_cmd:
++        return meson_cmd
++    raise RuntimeError('Could not find {!r} or a meson in PATH'.format(meson_script))
++
+ def get_backend_args_for_dir(backend, builddir):
+     '''
+     Visual Studio backend needs to be given the solution to build
+@@ -133,13 +158,13 @@ def get_fake_options(prefix):
+ def should_run_linux_cross_tests():
+     return shutil.which('arm-linux-gnueabihf-gcc') and not platform.machine().lower().startswith('arm')
+ 
+-def run_configure_inprocess(meson_command, commandlist):
++def run_configure_inprocess(commandlist):
+     old_stdout = sys.stdout
+     sys.stdout = mystdout = StringIO()
+     old_stderr = sys.stderr
+     sys.stderr = mystderr = StringIO()
+     try:
+-        returncode = mesonmain.run(commandlist, meson_command)
++        returncode = mesonmain.run(commandlist, get_meson_script())
+     finally:
+         sys.stdout = old_stdout
+         sys.stderr = old_stderr
+@@ -149,11 +174,11 @@ def run_configure_external(full_command):
+     pc, o, e = mesonlib.Popen_safe(full_command)
+     return pc.returncode, o, e
+ 
+-def run_configure(meson_command, commandlist):
++def run_configure(commandlist):
+     global meson_exe
+     if meson_exe:
+         return run_configure_external(meson_exe + commandlist)
+-    return run_configure_inprocess(meson_command, commandlist)
++    return run_configure_inprocess(commandlist)
+ 
+ def print_system_info():
+     print(mlog.bold('System information.').get_text(mlog.colorize_console))
+@@ -214,6 +239,9 @@ if __name__ == '__main__':
+                         'coverage.process_startup()\n')
+             env['COVERAGE_PROCESS_START'] = '.coveragerc'
+             env['PYTHONPATH'] = os.pathsep.join([td] + env.get('PYTHONPATH', []))
++        # Meson command tests
++        returncode += subprocess.call(mesonlib.python_command + ['run_meson_command_tests.py', '-v'], env=env)
++        # Unit tests
+         returncode += subprocess.call(mesonlib.python_command + ['run_unittests.py', '-v'], env=env)
+         # Ubuntu packages do not have a binary without -6 suffix.
+         if should_run_linux_cross_tests():
+@@ -221,5 +249,6 @@ if __name__ == '__main__':
+             print()
+             returncode += subprocess.call(mesonlib.python_command + ['run_cross_test.py', 'cross/ubuntu-armhf.txt'],
+                                           env=env)
++        # Project tests
+         returncode += subprocess.call(mesonlib.python_command + ['run_project_tests.py'] + sys.argv[1:], env=env)
+     sys.exit(returncode)
+diff --git a/run_unittests.py b/run_unittests.py
+index 6d4e0339..3c215db4 100755
+--- a/run_unittests.py
++++ b/run_unittests.py
+@@ -36,7 +36,7 @@ import mesonbuild.modules.gnome
+ from mesonbuild.interpreter import ObjectHolder
+ from mesonbuild.mesonlib import (
+     is_windows, is_osx, is_cygwin, is_dragonflybsd,
+-    windows_proof_rmtree, python_command, meson_command, version_compare,
++    windows_proof_rmtree, python_command, version_compare,
+     BuildDirLock
+ )
+ from mesonbuild.environment import Environment, detect_ninja
+@@ -44,9 +44,9 @@ from mesonbuild.mesonlib import MesonException, EnvironmentException
+ from mesonbuild.dependencies import PkgConfigDependency, ExternalProgram
+ import mesonbuild.modules.pkgconfig
+ 
+-from run_tests import exe_suffix, get_fake_options
++from run_tests import exe_suffix, get_fake_options, get_meson_script
+ from run_tests import get_builddir_target_args, get_backend_commands, Backend
+-from run_tests import ensure_backend_detects_changes, run_configure, meson_exe
++from run_tests import ensure_backend_detects_changes, run_configure_inprocess
+ from run_tests import should_run_linux_cross_tests
+ 
+ 
+@@ -488,13 +488,13 @@ class BasePlatformTests(unittest.TestCase):
+         # Get the backend
+         # FIXME: Extract this from argv?
+         self.backend = getattr(Backend, os.environ.get('MESON_UNIT_TEST_BACKEND', 'ninja'))
+-        self.meson_mainfile = os.path.join(src_root, 'meson.py')
+         self.meson_args = ['--backend=' + self.backend.name]
+         self.meson_cross_file = None
+-        self.meson_command = meson_command + self.meson_args
+-        self.mconf_command = meson_command + ['configure']
+-        self.mintro_command = meson_command + ['introspect']
+-        self.wrap_command = meson_command + ['wrap']
++        self.meson_command = python_command + [get_meson_script()]
++        self.setup_command = self.meson_command + self.meson_args
++        self.mconf_command = self.meson_command + ['configure']
++        self.mintro_command = self.meson_command + ['introspect']
++        self.wrap_command = self.meson_command + ['wrap']
+         # Backend-specific build commands
+         self.build_command, self.clean_command, self.test_command, self.install_command, \
+             self.uninstall_command = get_backend_commands(self.backend)
+@@ -521,7 +521,7 @@ class BasePlatformTests(unittest.TestCase):
+         self.logdir = os.path.join(self.builddir, 'meson-logs')
+         self.installdir = os.path.join(self.builddir, 'install')
+         self.distdir = os.path.join(self.builddir, 'meson-dist')
+-        self.mtest_command = meson_command + ['test', '-C', self.builddir]
++        self.mtest_command = self.meson_command + ['test', '-C', self.builddir]
+         self.builddirs.append(self.builddir)
+ 
+     def new_builddir(self):
+@@ -581,7 +581,7 @@ class BasePlatformTests(unittest.TestCase):
+         self.privatedir = os.path.join(self.builddir, 'meson-private')
+         if inprocess:
+             try:
+-                (returncode, out, err) = run_configure(self.meson_mainfile, self.meson_args + args + extra_args)
++                (returncode, out, err) = run_configure_inprocess(self.meson_args + args + extra_args)
+                 if 'MESON_SKIP_TEST' in out:
+                     raise unittest.SkipTest('Project requested skipping.')
+                 if returncode != 0:
+@@ -601,7 +601,7 @@ class BasePlatformTests(unittest.TestCase):
+                 mesonbuild.mlog.log_file = None
+         else:
+             try:
+-                out = self._run(self.meson_command + args + extra_args)
++                out = self._run(self.setup_command + args + extra_args)
+             except unittest.SkipTest:
+                 raise unittest.SkipTest('Project requested skipping: ' + srcdir)
+             except:
+@@ -900,8 +900,7 @@ class AllPlatformTests(BasePlatformTests):
+         https://github.com/mesonbuild/meson/issues/1355
+         '''
+         testdir = os.path.join(self.common_test_dir, '3 static')
+-        env = Environment(testdir, self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
+         cc = env.detect_c_compiler(False)
+         static_linker = env.detect_static_linker(cc)
+         if is_windows():
+@@ -1182,8 +1181,7 @@ class AllPlatformTests(BasePlatformTests):
+         if not is_windows():
+             langs += [('objc', 'OBJC'), ('objcpp', 'OBJCXX')]
+         testdir = os.path.join(self.unit_test_dir, '5 compiler detection')
+-        env = Environment(testdir, self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
+         for lang, evar in langs:
+             # Detect with evar and do sanity checks on that
+             if evar in os.environ:
+@@ -1285,8 +1283,7 @@ class AllPlatformTests(BasePlatformTests):
+     def test_always_prefer_c_compiler_for_asm(self):
+         testdir = os.path.join(self.common_test_dir, '141 c cpp and asm')
+         # Skip if building with MSVC
+-        env = Environment(testdir, self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
+         if env.detect_c_compiler(False).get_id() == 'msvc':
+             raise unittest.SkipTest('MSVC can\'t compile assembly')
+         self.init(testdir)
+@@ -1544,8 +1541,7 @@ int main(int argc, char **argv) {
+             self.assertPathExists(os.path.join(testdir, i))
+ 
+     def detect_prebuild_env(self):
+-        env = Environment('', self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment('', self.builddir, get_fake_options(self.prefix), [])
+         cc = env.detect_c_compiler(False)
+         stlinker = env.detect_static_linker(cc)
+         if mesonbuild.mesonlib.is_windows():
+@@ -1713,8 +1709,7 @@ int main(int argc, char **argv) {
+                                        '--libdir=' + libdir])
+         # Find foo dependency
+         os.environ['PKG_CONFIG_LIBDIR'] = self.privatedir
+-        env = Environment(testdir, self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
+         kwargs = {'required': True, 'silent': True}
+         foo_dep = PkgConfigDependency('libfoo', env, kwargs)
+         # Ensure link_args are properly quoted
+@@ -1847,16 +1842,16 @@ int main(int argc, char **argv) {
+         for lang in ('c', 'cpp'):
+             for type in ('executable', 'library'):
+                 with tempfile.TemporaryDirectory() as tmpdir:
+-                    self._run(meson_command + ['init', '--language', lang, '--type', type],
++                    self._run(self.meson_command + ['init', '--language', lang, '--type', type],
+                               workdir=tmpdir)
+-                    self._run(self.meson_command + ['--backend=ninja', 'builddir'],
++                    self._run(self.setup_command + ['--backend=ninja', 'builddir'],
+                               workdir=tmpdir)
+                     self._run(ninja,
+                               workdir=os.path.join(tmpdir, 'builddir'))
+             with tempfile.TemporaryDirectory() as tmpdir:
+                 with open(os.path.join(tmpdir, 'foo.' + lang), 'w') as f:
+                     f.write('int main() {}')
+-                self._run(meson_command + ['init', '-b'], workdir=tmpdir)
++                self._run(self.meson_command + ['init', '-b'], workdir=tmpdir)
+ 
+     # The test uses mocking and thus requires that
+     # the current process is the one to run the Meson steps.
+@@ -1981,8 +1976,7 @@ recommended as it can lead to undefined behaviour on some platforms''')
+         testdirbase = os.path.join(self.unit_test_dir, '26 guessed linker dependencies')
+         testdirlib = os.path.join(testdirbase, 'lib')
+         extra_args = None
+-        env = Environment(testdirlib, self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment(testdirlib, self.builddir, get_fake_options(self.prefix), [])
+         if env.detect_c_compiler(False).get_id() != 'msvc':
+             # static libraries are not linkable with -l with msvc because meson installs them
+             # as .a files which unix_args_to_native will not know as it expects libraries to use
+@@ -2095,9 +2089,6 @@ class FailureTests(BasePlatformTests):
+         Assert that running meson configure on the specified @contents raises
+         a error message matching regex @match.
+         '''
+-        if meson_exe is not None:
+-            # Because the exception happens in a different process.
+-            raise unittest.SkipTest('Can not test assert raise tests with an external Meson command.')
+         if langs is None:
+             langs = []
+         with open(self.mbuild, 'w') as f:
+@@ -2232,8 +2223,7 @@ class FailureTests(BasePlatformTests):
+         '''
+         Test that when we can't detect objc or objcpp, we fail gracefully.
+         '''
+-        env = Environment('', self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment('', self.builddir, get_fake_options(self.prefix), [])
+         try:
+             env.detect_objc_compiler(False)
+             env.detect_objcpp_compiler(False)
+@@ -2328,8 +2318,7 @@ class WindowsTests(BasePlatformTests):
+         ExternalLibraryHolder from build files.
+         '''
+         testdir = os.path.join(self.platform_test_dir, '1 basic')
+-        env = Environment(testdir, self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
+         cc = env.detect_c_compiler(False)
+         if cc.id != 'msvc':
+             raise unittest.SkipTest('Not using MSVC')
+@@ -2399,8 +2388,7 @@ class LinuxlikeTests(BasePlatformTests):
+         '''
+         testdir = os.path.join(self.common_test_dir, '51 pkgconfig-gen')
+         self.init(testdir)
+-        env = Environment(testdir, self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
+         kwargs = {'required': True, 'silent': True}
+         os.environ['PKG_CONFIG_LIBDIR'] = self.privatedir
+         foo_dep = PkgConfigDependency('libfoo', env, kwargs)
+@@ -2650,8 +2638,7 @@ class LinuxlikeTests(BasePlatformTests):
+         an ordinary test because it requires passing options to meson.
+         '''
+         testdir = os.path.join(self.common_test_dir, '1 trivial')
+-        env = Environment(testdir, self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
+         cc = env.detect_c_compiler(False)
+         self._test_stds_impl(testdir, cc, 'c')
+ 
+@@ -2661,8 +2648,7 @@ class LinuxlikeTests(BasePlatformTests):
+         be an ordinary test because it requires passing options to meson.
+         '''
+         testdir = os.path.join(self.common_test_dir, '2 cpp')
+-        env = Environment(testdir, self.builddir, self.meson_command,
+-                          get_fake_options(self.prefix), [])
++        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
+         cpp = env.detect_cpp_compiler(False)
+         self._test_stds_impl(testdir, cpp, 'cpp')
+ 
diff --git a/meta/recipes-devtools/meson/meson_0.46.1.bb b/meta/recipes-devtools/meson/meson_0.46.1.bb
index a18cab81f4..77f6416cc2 100644
--- a/meta/recipes-devtools/meson/meson_0.46.1.bb
+++ b/meta/recipes-devtools/meson/meson_0.46.1.bb
@@ -9,6 +9,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar
            file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
+           file://0004-Prettifying-some-output-with-pathlib.patch \
+           file://0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch \
            "
 SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
 SRC_URI[sha256sum] = "19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78"
-- 
2.11.0


