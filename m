Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E30637E258
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:34:20 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i3so2809108wml.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RQEc6bBqpMCPt5IIaL+ymArS8by0KbipZL+/YSRNeSI=;
	b=MI0QaLzxzW5YSZECsEL0448AMvkXDkdrJG/b1jAEvrlH6Q3XaG0Sp4X8wkw4+BSmHc
	d/T8tlitmMdqhhwjNI0LPt7q0fmi3KbyvU5J53iuHY+PnraxNvJO22Uia3pD8FVXksV0
	IgLocZa1Dv3zLwvTI3cJf3WrGuWWD4+ET/CdNtiQghGFz8kJIsZGfrmcKJCqNSMuxWJU
	hOChl3yq2CBkCO1tnEgt3Rm+BIQIoYwWgs9HB2lQ517ysxnZcjtwcBKFN1ccD+c/lfpH
	6IxZMMC8BkTGjmlwfAw+wiRR1QAvwuxfbyYmfzY4hwlPyqkP5UT1XXcxB5y+Fg8vg7uf
	8pLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RQEc6bBqpMCPt5IIaL+ymArS8by0KbipZL+/YSRNeSI=;
	b=FZV8i00g+ffhR9uhDg5OtI8Z6L/uFgTbqJL5+nZ8n0Z8Xkq0q3ZG+GaWaZBpe4eAKW
	q9Ed+NjXPCFW4w0VXxS4CfTgq8T1XkzEabCR369YdzRlOZBDyJNBwRzoAgdbF4TF+B+e
	bb48osuwM+vXNkTHEGgjs06QS/DNuvr/2o8uoh1vTxxvCMiqXt6v6K2QxkT36jzIWdIH
	RrgbYTz9TTFg+whUXeZZsRo8l5s3Ce8XG9gUjEitgLvV0xjBfXN54iXvi1oAJ6IAvt1P
	KiucjrMyOdhfgM0BfJz9cq6mRGUFxS4SOcOzYpLzYbK5D9wlS54bAscwsYJmU9fdg8TD
	DDqw==
X-Gm-Message-State: APjAAAWU+vCOaOw4A6wIZRwDOZiLAY1qjJNMOFYqnMF6GIdL55W/UXrq
	uP/gcubooHPte+m4nJW5xmJMIGYQ
X-Google-Smtp-Source: APXvYqxFK1//UQtK4ppyCMwA5Q5tk4aW6xwBnQBUm0ReBwGDN6irNjAFRo1joGzL1tWAlsatk5yMzg==
X-Received: by 2002:a7b:cf0c:: with SMTP id l12mr3308966wmg.113.1558442061255; 
	Tue, 21 May 2019 05:34:21 -0700 (PDT)
Received: from localhost ([88.98.246.218])
	by smtp.gmail.com with ESMTPSA id 20sm3985375wmj.36.2019.05.21.05.34.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 21 May 2019 05:34:20 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 13:34:18 +0100
Message-Id: <20190521123418.16290-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509214007.13927-1-luca.boccassi@gmail.com>
References: <20190509214007.13927-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3] python*-setuptools: add separate packages for pkg_resources module
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
X-List-Received-Date: Tue, 21 May 2019 12:34:21 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The pkg_resources Python module is useful by itself, for example for
automatic loading of resources shipped in a Python package.
Add separate packages for it, so that users can depend on them
individually and avoid pulling in the entire setuptools, which
include scripts to download other packages, which might not be
desired on minimal images.

Other distributions like Debian and Ubuntu already split setuptools
and pkg-resources in this way.

The setuptools packages now depend on the new pkg-resources packages,
to avoid regressions for other packages that depend on them
already.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---

v2: restrict new RDEPENDS to class-target. As advised by Alexander, bitbake
    cannot resolve native rdeps that mention package names rather than
    recipe names.
v3: manually add RPROVIDES to the native class instead of restricting the
    RDEPENDS to the target class as a better workaround. Also document why
    the package is being split.

 meta/recipes-devtools/python/python-setuptools.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 357aa07086..f49e078697 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -37,3 +37,14 @@ do_install_prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# The pkg-resources module can be used by itself, without the package downloader
+# and easy_install. Ship it in a separate package so that it can be used by
+# minimal distributions.
+PACKAGES =+ "${PYTHON_PN}-pkg-resources "
+FILES_${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
+# Due to the way OE-Core implemented native recipes, the native class cannot
+# have a dependency on something that is not a recipe name. Work around that by
+# manually setting RPROVIDES.
+RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
+RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-native"
-- 
2.20.1


