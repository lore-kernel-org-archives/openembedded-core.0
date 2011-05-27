Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQ12f-0002yF-Fq
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 19:41:48 +0200
Received: by pwj9 with SMTP id 9so950577pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 10:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=bFbEM1lkqRHeygEIQUFnpilAMcA1IX2wZg0Cliqbk68=;
	b=UQR/o4t/Ky7tqKxKpuWN9PjhprDuBrJbDUnhFauiVi0U4qx6VicH/XyGibtCbNqYUW
	2heTE3Uurms0hqdWzNLgruj33XJJI2VQwSQAlD5FhxkVWNTFY/BOzO5L13e5/YaxUdtb
	Tikc3N5xS08LsnyPLDD1T3+zAN4BJ7hCnWNLQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=K8YdyVnAIT7Rfvyq0XzDbD8lmDcnsEe7t3lXfZkiHtYz4rFfbgAUeLNuHr5KgqHN45
	RBBksTAiKUeyXVJ7HyYEtUwuZN+SXkqlRr0dejsWbDZ9z8cqaKEZc/Vzj4Ce9rSjUr1Y
	8lZ6rRWxINg8oUa6ozxEb6AeHViJJoSIkZyfk=
Received: by 10.68.3.104 with SMTP id b8mr917456pbb.324.1306517907914;
	Fri, 27 May 2011 10:38:27 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id a6sm664450pbo.79.2011.05.27.10.38.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 10:38:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2011 10:38:15 -0700
Message-Id: <a5d4c320e0e6133105333fd1998018784be650f1.1306517584.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1306517584.git.raj.khem@gmail.com>
References: <cover.1306517584.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] uclibc_git.bb: Fix patch path in SRC_URI
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
X-List-Received-Date: Fri, 27 May 2011 17:41:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 3d5f7a7..eded2fb 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -27,7 +27,7 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://argp-support.patch \
 	file://argp-headers.patch \
 	file://remove_attribute_optimize_Os.patch \
-	file://uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch \
+	file://append_UCLIBC_EXTRA_CFLAGS.patch \
 	file://compile-arm-fork-with-O2.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.4.1



