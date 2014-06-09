Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id E3F8166099
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:45:12 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so2165989wib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 08:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=U0EcVCcA3B7AOouMo7NmM/O0WSrFl2JP/6sFVvdb3BA=;
	b=G4Hw8j9x2BHniJ8oMHVeNzABcQOwNJeJK81HPRcVNb9tQdVUTk0QYktpU3b0QPiUt4
	7Yh0oYjvDWAyUBCDXWjN9R9rCdM7pSuVxBXzu6AYEJt8fK/nECMXWzrg4GO4hvIwiY0Y
	MlDzkNplc5bwNjllm0EFf5UvnQ/1BzlZ2v+lwSLzuZ9GMbr81WvS30ST8vNZCxQOX+IF
	DTPPHBM4wmD9H9d9CdY4iJ9p2gQPu849M9D8m9AdOw5ePxwJKdmDTfdyU8CZ0XhpKEg2
	yNB1n2aOyfgpeFhNnre2VIE98BY4ikDzB+p0VJb3UUyCwypO690hOaRXurH9U0uRDgWa
	mGFA==
X-Gm-Message-State: ALoCoQnvkIZA221JHsoj7E1WE9jXD8Hi9y7ZLWQqftD9wOZne8rxto0PARfjGISsxRaqvhlDeCvo
X-Received: by 10.180.12.33 with SMTP id v1mr15494475wib.0.1402328713060;
	Mon, 09 Jun 2014 08:45:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	en6sm15386875wib.11.2014.06.09.08.45.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 08:45:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:45:04 +0100
Message-Id: <1402328704-6854-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402328704-6854-1-git-send-email-ross.burton@intel.com>
References: <1402328704-6854-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] glib-2.0: fix paths to test binaries
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
X-List-Received-Date: Mon, 09 Jun 2014 15:45:15 -0000

The tests are installed to $libexecdir not $libdir/glib-2.0.  By default these
are the same location but they can be changed independently.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 6a47bbc..e2b130b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -51,7 +51,7 @@ FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb \
 FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py"
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d \
                                ${datadir}/bash-completion"
-FILES_${PN}-ptest += "${libdir}/glib-2.0/installed-tests \
+FILES_${PN}-ptest += "${libexecdir}/installed-tests \
                       ${datadir}/installed-tests/glib"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.10.4


