Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C33A479367
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 17:33:02 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s12-v6so10591072wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 10:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EVDp9/+Hvf12mG4/4up6zSNW3WPiR5PKVkegGp7BiSA=;
	b=EYQ0rB0tiHNRDme0YVaCze6qEqC3sK/07W0yZmhSXoeb9rya408C6ZzwMxxS0MTRXc
	TcgfB7i7yVDHGluLxK3Sx8j/b0gjKdYzL1tN3lYoNmrGbS6RLOXkRj8lC91AmBXndwEO
	BSiEFelY4zyigDR+9A20X4jhCVQD8Xd/NyRQfJjgc8U7FG/HjoQtqjlFb+h5NClW7t3G
	t9ulN8qY8YVr0FFxU6SjEcf2CJWhni7wH6oqbSUIhZ/ejUEGGAh9YEHGEOVHXFxtAy4B
	sbmbSLm+heWwkJdhxmlMR/3grc2EGMJ8b5rG2jVA1ZjYHtYxyv8YszC7qhwtHgQe896A
	V60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EVDp9/+Hvf12mG4/4up6zSNW3WPiR5PKVkegGp7BiSA=;
	b=N6c0DtMjypNkcwRRyJONWq8DV297N/NOvtLAubnFxp0Y9IPkp7v7NNUG5QTqn9Drzs
	6pjzh7Dub5WTR/2Ot0ym5xv2U6wHXf0LTI9ap5iVw766NCHDbamRDNel1OP0qB+hLs+B
	WSVajYSJZeHuZkcoFbF7kRVkKW+WeLI/aWB3d4pUbg7xH9Lzb3OxqrSG1esw5GfgKJf+
	pTJdXeLfKMCs9kIQ9+q9PbiO2McEXE/4lVsmgVSk42bG+atOZBZBHs0xmM4EctVA/iRr
	V5B/uJnADJbQqafj6j9QgPwWdqyUeKwlt0rCuQxIf80UhJGAfTYt7TlMDf1dPXVzep/A
	DjfA==
X-Gm-Message-State: APzg51B45+pdsqz+dagDUTnIeeR0P5bngKSOFZs5bqsArS27gD8C/4P8
	HyBbP9pXn2Vk+fH2KWdegGFF9Qkp
X-Google-Smtp-Source: ANB0VdYamLi3jInGMPC+RtMH3q946o4F/SsoQmjcGPijNM82dKkia0SjrrEGaMTXbc/jg5o7M1wEyw==
X-Received: by 2002:a1c:cc0e:: with SMTP id
	h14-v6mr12749964wmb.2.1537205583265; 
	Mon, 17 Sep 2018 10:33:03 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	v16-v6sm20310629wrw.12.2018.09.17.10.33.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Sep 2018 10:33:02 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2018 17:33:00 +0000
Message-Id: <1537205580-3142-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gpgme: Inherit from distutils-common-base
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
X-List-Received-Date: Mon, 17 Sep 2018 17:33:03 -0000

Inherit from distutils-common-base and pythonnative/python3native to
avoid runtime dependency on Python, whilst still fixing clang builds.

Fixes: 8bfb54edc6fa ("gpgme: Inherit distutils3-base")
Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-support/gpgme/gpgme_1.11.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.11.1.bb b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
index ac9fccf13326..86fae94609bb 100644
--- a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
@@ -48,8 +48,8 @@ LANGUAGES ?= "${DEFAULT_LANGUAGES}"
 LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' python2', '', d)}"
 LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' python3', '', d)}"
 
-PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' distutils-base', '', d)}"
-PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' distutils3-base', '', d)}"
+PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
+PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
 
 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \
@@ -60,7 +60,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERIT}
+inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT}
 
 export PKG_CONFIG='pkg-config'
 
-- 
2.7.4


