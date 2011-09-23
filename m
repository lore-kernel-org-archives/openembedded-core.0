Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R7BnB-0006Ry-JA
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 21:52:13 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so4179694bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 12:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4WtoVnqzuU7khVNmKZw7mXQ/IFUWUVFuvyzpPJsUXEg=;
	b=xK6WZQgn07N4bpCdCZbGpTCQ0RDkOhk5ws+D9uWcxfJXyyLtUraSxK+Zzy2waLYqu6
	wNiZQ9sA8RAl6n8bxM/okFZ5hW4832YZ8tChrhA+DbS+rRhsnDqc/bi0SGbSH42UQvre
	Bc+ANdDD1/Wwynu6YzyxTLMzH4SQfxn8nQ3bg=
Received: by 10.204.135.72 with SMTP id m8mr2766480bkt.389.1316807214522;
	Fri, 23 Sep 2011 12:46:54 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id ex8sm5500310bkc.2.2011.09.23.12.46.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 12:46:53 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 23:46:34 +0400
Message-Id: <1316807201-22623-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 03/10] bash-completion: new recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Sep 2011 19:52:13 -0000

Add a bash-completion recipe. Largely based on the one from oe-dev repo.
Changes:
1) Version bump to most recent bash-completion upstream tarball
2) Dropped custom profile.d script in favour of upstream one.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../bash-completion/bash-completion_20060301.bb    |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/bash-completion/bash-completion_20060301.bb

diff --git a/meta/recipes-extended/bash-completion/bash-completion_20060301.bb b/meta/recipes-extended/bash-completion/bash-completion_20060301.bb
new file mode 100644
index 0000000..9e8ede2
--- /dev/null
+++ b/meta/recipes-extended/bash-completion/bash-completion_20060301.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Programmable Completion for Bash"
+SECTION = "console/utils"
+RDEPENDS_${PN} = "bash"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+PR = "r0"
+
+SRC_URI = "http://www.caliban.org/files/bash/bash-completion-${PV}.tar.gz"
+S = "${WORKDIR}/bash_completion"
+
+do_configure() {
+	:
+}
+
+do_compile() {
+	:
+}
+
+do_install() {
+	install -d ${D}${sysconfdir}/profile.d
+	install -m 0755 bash_completion.sh ${D}${sysconfdir}/profile.d
+	install -m 0755 bash_completion ${D}${sysconfdir}
+	install -d ${D}${sysconfdir}/bash_completion.d/
+	install -m 0755 contrib/* ${D}${sysconfdir}/bash_completion.d/
+}
+
+SRC_URI[md5sum] = "9bca1cf97e8f8c73e3ef560cc9dead21"
+SRC_URI[sha256sum] = "29b78834b975b29810f0bf1f15e5d3a6c003a137cfac7fea671bfaf8f58f5c0d"
-- 
1.7.2.5



