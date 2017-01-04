Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 556B060762
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 22:58:10 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so55464904wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 14:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y0hs1FYk4nCmwiElW0tlk8mHoBm6kADosRNyTv7vPuM=;
	b=amo23Kefkrt7cIV/5QnJ2zdR4dFE1gRq2yZCuNTqSl7uIOIML+oTfpeDM8WgVIq+Jg
	+hMMYEuH+POx0t/D4/QeUxAr1AEGtGP7CKbdRqPNXtPuFHyVIh61b9OqvA6WpE1Cv+3z
	xNw+ZHe13+MXe7K3IYtTGo61gzV3P5niUkMII/QLLoXViJ9ldceGuH2n50sXFyjYt+U4
	BumklLjI+GdTNaD8xJpCrNYFAiaSKPU6Ecl4ySSVXnIchOvADChjDs/ceQCCspdC3iKG
	9PE9ZPok3Kq1UUIePy6Jl4QaZBCS/PEj2Nk1iQLSahgppBCH+K4n20ZKHSyGXbOJtQOF
	yOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y0hs1FYk4nCmwiElW0tlk8mHoBm6kADosRNyTv7vPuM=;
	b=fFKBHUbMTmT8HTo97NSoMvTo9KL8xC3HIdC8YFgBGp2LPW5FFde2dm3HRklSFcEfai
	hhGX7g/bEQswRv7HQeJGvAH5ncgCQUqFiPTyE98/O3lc84FCTDLEW/pvszlCncKqejMT
	ko9oKTZ2OWsx6ibs5C1KwVKeo+XDqTQvW4es911AK75JEyKdI0PTLzp71fJG75Ls7f+t
	Mu5h8zSTU2n98S6eonZvWKs1+EjOj5cINBhD/5T1EfpH6YL7L5Wjq0p2SbM+3zeYwiIQ
	/VY+BqrkXYcjKfE4XEultt28z8S0+474ir4p+HY+d0xHYWuuN8YZKrh8zUtita3FQ2/Y
	jHVg==
X-Gm-Message-State: AIkVDXJYvVGcg0RfW+sQb++bDdZErdPKtlRrGV/90KnzfXZq9cXDHfkbLZ30nxm74XXmMA==
X-Received: by 10.28.173.131 with SMTP id w125mr58266741wme.0.1483570690422;
	Wed, 04 Jan 2017 14:58:10 -0800 (PST)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id 6sm100453855wjt.5.2017.01.04.14.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jan 2017 14:58:09 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 15:57:54 -0700
Message-Id: <197a588e306cab0f5e14b60b3aefea4b1919e709.1483570577.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483570577.git.chris_larson@mentor.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/6] packagegroup-self-hosted: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 04 Jan 2017 22:58:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

This rdepends on libgl.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 73430b8..c1bbdfc 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -10,6 +10,9 @@ inherit packagegroup  distro_features_check
 # rdepends on libx11-dev
 REQUIRED_DISTRO_FEATURES = "x11"
 
+# rdepends on libgl
+REQUIRED_DISTRO_FEATURES += "opengl"
+
 PACKAGES = "\
     packagegroup-self-hosted \
     packagegroup-self-hosted-debug \
-- 
2.8.0


