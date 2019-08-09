Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54D097F223
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 06:49:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x796mjbm016058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 23:48:56 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 23:48:35 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Aug 2019 02:47:37 -0400
Message-ID: <1565333257-171001-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] lttng-tools: enable manpages option for configure
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
X-List-Received-Date: Fri, 09 Aug 2019 06:49:05 -0000
Content-Type: text/plain

If disable this option, production will prompt "No manual entry for
lttng-help" when execute "lttng --help" series commands.

Enable the option will make lttng-tools compile manpages and then
package them into lttng-tools-doc/.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb
index aa6d19d..9270916 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb
@@ -21,7 +21,7 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
                  PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
 "
-PACKAGECONFIG ??= "lttng-ust"
+PACKAGECONFIG ??= "lttng-ust manpages"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
 PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
-- 
2.8.1


