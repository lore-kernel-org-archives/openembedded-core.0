Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHye7-0004ce-RR
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 16:35:43 +0200
Received: by wibhj13 with SMTP id hj13so828244wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 07:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Zh0UzQVZjOBO0VCSumaZ4jp6Q1LRqy/EbTnJ0Ylko90=;
	b=V8O2UQLhfdycRPTXq+1ktr8zYHgfNoa06HeAR+oWJhmMGruRBFnLbG0Url7VS4xKOg
	Br7DBqrNNMBMVaZxrK6u65atFg2L9Ba8H30QSQFHvXj2nAPfig/IfXeSdIEKx53HZf5D
	HM7q28uSZmeVFZYNPPz6RBdWauTmgVcCpJMtf+GVs8q3qMfkxMUd0uS/boK+hIjWwXC7
	689WW7t4NbGYlMNize6iwj4xJQdFGzhbIgMjhKpn8i1w6PanhZYCnxzuapNWQkfC1duM
	XWEP6b3luTkYXTd2f5fzFL6EJ4su+VqEzfYqhrS7ulVPonlplcATu2NgGT5wtNYTkvD8
	2lSA==
Received: by 10.180.96.228 with SMTP id dv4mr7065070wib.14.1334154385115;
	Wed, 11 Apr 2012 07:26:25 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id l5sm45283288wia.11.2012.04.11.07.26.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 07:26:24 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 17:26:17 +0300
Message-Id: <a7b1eb3389a4a54ed6076cd7f1497e8f2cb52d3e.1334154247.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <46a62192da80f228b08dc5412f61143f15dcff57.1334154247.git.andrei@gherzan.ro>
References: <46a62192da80f228b08dc5412f61143f15dcff57.1334154247.git.andrei@gherzan.ro>
In-Reply-To: <cover.1334154247.git.andrei@gherzan.ro>
References: <cover.1334154247.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkEHJcEfeVqA0wAZrDlDHCm0NHGDyfoWdXg0j+DwYRrgRgF+rKiGbWzMFVem4J60q4IJ5Kc
Subject: [PATCH 3/3] rpm-native: Compile python rpm module (with-python)
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
X-List-Received-Date: Wed, 11 Apr 2012 14:35:43 -0000

This module is needed by python scripts from createrepo native package.

[YOCTO #2134]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 4576f67..d44ff99 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -99,8 +99,6 @@ WITH_PYTHON = "	--with-python=${PYTHON_BASEVERSION} \
 		--without-pythonembed \
 	      "
 
-WITH_PYTHON_virtclass-native = " --without-python"
-
 # Perl modules are not built, but they could be enabled fairly easily
 # the perl module creation and installation would need to be patched.
 # (currently has host perl contamination issues)
-- 
1.7.5.4



