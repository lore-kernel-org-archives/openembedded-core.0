Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id A92A77F3AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 10:29:46 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id c2so87584956wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pi+gfXETtLnCNaeFD+fUHNvCHSC2jO82qF0b3Xdu9IE=;
	b=LhYAjCSgqTOxp26dDkTf21UXa8Vs+MszMvihkLG3ft4z8xt+WmHgRIfw31NCwBZMaT
	AFGFWY/A/D8Ze+FmBOe+AJAsYSFBapjMDSGfqVYJv+ukU6m8QPgRu8bJfAzBWhbrl2Zw
	ANSbXu2Sfi4kFX+b8F+LulpjkAQmdicf3dVEAhivff1cupBkK5nwC+OooLad4zCMHFod
	G73QpUTQZcqzNtfOLAzDX2xj0sZb68N5CMOWIYQcTC1rllD4y0qdZ9FPBXy64HesdiEC
	5hT9gybQtSwhpDoQeXVxj8WSoE3y3Dtu0F2qc51UKNRK8BFdIAxKvjfAk4Yqcw/qfrV6
	0giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pi+gfXETtLnCNaeFD+fUHNvCHSC2jO82qF0b3Xdu9IE=;
	b=jBnmC1DE0jlLH8szMO37Dh/SpxlbpVBiKke0bVt+DfTrrp7dhGzjJ0r4GxLm3hHH/I
	+3GRj64+uYdbq0IhJNPpXsmULi9fzB6zhYQ5QN5ivZmD3rK540XOLMn3m7VwiHa/8ZRn
	lKcJRDclFzKwbc3ThvULASkd75gFs7mfMKpWV+7NJQrvtDcZq2blRKQXhGjH/aDfVDK3
	Tnr0ibeZYwhVHvVaL07C60R10UhpGfpkb3am+vNR2gD9AG0yhIPM+roUzc6xBfCP6p0B
	0FlVu8lCQiSlazCa6u9uw4ph4X8jbaXs8NMK44oBRXLl533ASicrzmk4FrbdJdHwSTEu
	V/Gg==
X-Gm-Message-State: APjAAAX9XYEnU8bqcX4DH61iG9Z1rTqCNDaSHKevDrtpeht5PcTK7z6b
	npbLFelQKujauNunBQc5aewVWsUF+6aLPA==
X-Google-Smtp-Source: APXvYqzjc8OATADATkpWmb8DPI33safd4HqQ1Vv7pPv6lqVw8pvrtzdFPu8opwHrBCp5T5LC2G1sGg==
X-Received: by 2002:adf:e552:: with SMTP id z18mr10196647wrm.45.1565173787401; 
	Wed, 07 Aug 2019 03:29:47 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o3sm79705336wrs.59.2019.08.07.03.29.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 03:29:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 12:29:36 +0200
Message-Id: <20190807102939.12760-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807102939.12760-1-alex.kanavin@gmail.com>
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/7] apt: add a missing perl runtime dependency
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
X-List-Received-Date: Wed, 07 Aug 2019 10:29:48 -0000

/usr/lib/dpkg/methods/apt/setup is a perl script.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/apt/apt-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index da91451d7f6..922f739d0d0 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -35,6 +35,7 @@ FILES_${PN} = "${bindir}/apt-cdrom ${bindir}/apt-get \
 	       ${libdir}/dpkg \
 	       ${systemd_unitdir}/system \
            "
+RDEPENDS_${PN} += "perl"
 FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
 FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages'))} \
 		   ${docdir}/apt"
-- 
2.17.1


