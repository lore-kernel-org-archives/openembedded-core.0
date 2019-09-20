Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53A837DDCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 17:02:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8KH2Fkf016621
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 10:02:36 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 20 Sep 2019 10:02:09 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Sep 2019 13:02:08 -0400
Message-ID: <20190920170208.33173-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] python3-pip: ensure pickle is installed
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
X-List-Received-Date: Fri, 20 Sep 2019 17:02:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

pip3 depends on pickle, so add python3-pickle to RDEPENDS.
Without it, errors such as the following occur:

>>> import pip._internal
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib64/python3.7/site-packages/pip/internal/init_.py", line 40, in <module>
from pip._internal.cli.autocompletion import autocomplete
File "/usr/lib64/python3.7/site-packages/pip/_internal/cli/autocompletion.py", line 8, in <module>
from pip._internal.cli.main_parser import create_main_parser
File "/usr/lib64/python3.7/site-packages/pip/_internal/cli/main_parser.py", line 7, in <module>
from pip._internal.cli import cmdoptions
File "/usr/lib64/python3.7/site-packages/pip/_internal/cli/cmdoptions.py", line 29, in <module>
from pip._internal.utils.ui import BAR_TYPES
File "/usr/lib64/python3.7/site-packages/pip/_internal/utils/ui.py", line 16, in <module>
from pip._internal.utils.logging import get_indentation
File "/usr/lib64/python3.7/site-packages/pip/_internal/utils/logging.py", line 6, in <module>
import logging.handlers
File "/usr/lib64/python3.7/logging/handlers.py", line 26, in <module>
import logging, socket, os, pickle, struct, time, re
ModuleNotFoundError: No module named 'pickle'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/python/python3-pip_19.2.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pip_19.2.3.bb b/meta/recipes-devtools/python/python3-pip_19.2.3.bb
index aa7253d3f3..019e327e0c 100644
--- a/meta/recipes-devtools/python/python3-pip_19.2.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_19.2.3.bb
@@ -25,6 +25,7 @@ RDEPENDS_${PN} = "\
   python3-setuptools \
   python3-unixadmin \
   python3-xmlrpc \
+  python3-pickle \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.21.0


