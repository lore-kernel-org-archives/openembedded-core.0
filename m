Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfha3-0000l3-3u
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 02:45:55 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1371814eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 17:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=C2bAdaND0eE4P5ytCEF0EpiW9bLkyujFnzPzDmG125A=;
	b=vZylRMCSacfpxa4/HMSK+ex5X1jKWt2Yx0hMk/apYW7YODnrrPTK0jf/rkeWgxNHJc
	ANmdoxDwvdb3h55w6CYMORni1icCX1bsJ05U54RW5KnDkcoyWnEtqEAqmci3AKhzBzjF
	9w3joBBapyk0oZ6EuokDc7Lld12T6paG9kutkYpm99Yly2Z2LZQQhinYqQFsjONYVD/I
	F+3zadkpSsG7o/ZrelDWvKzuqNjFPA27KN0AMBb1V+HVr1/INOobuqV1TNyzoUDGXJdg
	tyPhQCcL9lsc0V1BpCJ/VQ/UFF617y4eGkkCRymjNWaDQn0sXBusDqj+JRB7xmTYjiRO
	gmNQ==
Received: by 10.14.219.72 with SMTP id l48mr3966329eep.37.1354584689490;
	Mon, 03 Dec 2012 17:31:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm34688504eep.5.2012.12.03.17.31.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 17:31:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:31:10 +0100
Message-Id: <a2b1d1a87fa1a13ce1433972ef65b23a001eb7d3.1354584580.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/6] at: drop initscript dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 01:45:55 -0000

* doesn't look like build dependency
* and for runtime dependency if needed we should use VIRTUAL-RUNTIME_initscripts

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/at/at_3.1.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
index 3580e09..96cc34a 100644
--- a/meta/recipes-extended/at/at_3.1.13.bb
+++ b/meta/recipes-extended/at/at_3.1.13.bb
@@ -4,7 +4,7 @@ the system load levels drop to a particular level."
 SECTION = "base"
 LICENSE="GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
-DEPENDS = "flex flex-native initscripts \
+DEPENDS = "flex flex-native \
 	${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
-- 
1.8.0



