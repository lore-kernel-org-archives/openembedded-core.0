Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 40DE47EB49
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 13:25:09 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id v19so8972003wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DcYgBrS3iQZkSiPR1xpjovHqQJ2tPw074xVk4JB/uEE=;
	b=p/xLUwTup5MjmHhzaV4biWvmEMV8daIZ6GvSCuQJOZUL3h991DAfC5qO2oXZw4pwWW
	jlBb3uJBOgJZisQKzP3ZlBYx0tsgcwqCTlhPK8baRhrgsqRYdihVa4anTOwZ9fwRR7gr
	0ze6ceRyv0qGc5rKd2noJOJl1kvb7dOHmgX+90SOdlxNMHFfst8fdFMxDM9cbqm8rg71
	fBPoprR+ZsAkh4709v7vqrNzZ+oRUTSb+YsZ55CQ6q11+XUX5T2YLiKsyO6JCLyuhKSd
	e73UP/LWZcMSu9c7+izvZ4Mrx9NW53DYqW71cXjAdw1mAEumWub8S6NEXbf/z0cqgiko
	gZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DcYgBrS3iQZkSiPR1xpjovHqQJ2tPw074xVk4JB/uEE=;
	b=R0qWzzFx4cB8peP7AH1biJNPZHXAdxAA7oVIAaqsWOfoy2sbkrj/v1amtcTk3h6Uww
	lWS9jHw/sihbq902hNy4pmLRKA0oRBnaNd2k5khwXHsFrWhz+qtgdLOkwqhGSu2+56Nj
	dfil7dTe5CDVW0lxANxaTW55AoqB/fEzZCjrxQu+ppEJSA0FswBIhB0Uu8bSJmpCZkk5
	N+eb1dW6PEZ13VpgB6jEpXVDnQ6oG0TeFVZ1qIkPus9Om4RWFjfmBq2GHQTf7dNwyrvX
	x0H4Fy65FyJwXKXk4LVCVWMxOrZhrKyw+YUFtilcUxW6Zj04oQPAPL88mRKwWREm0Xho
	Xbgw==
X-Gm-Message-State: APjAAAXLvBm7d3u5c8IT00g9luPCWeJir6IZcy2LrjMb0j+ggLqhXmaY
	lsI4hZcPBYkvZKjL5qT8o7Zep6O8
X-Google-Smtp-Source: APXvYqzcrtPP4DrwsG1ZgQPwwm/1H7OuTfj5KSpf9B+DKyy6mcJ3vdDH1MDb5UcKUxqiVsZgnvIIIw==
X-Received: by 2002:a7b:c356:: with SMTP id l22mr216660wmj.97.1561728309528;
	Fri, 28 Jun 2019 06:25:09 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id z6sm2158338wrw.2.2019.06.28.06.25.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jun 2019 06:25:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2019 15:24:55 +0200
Message-Id: <20190628132457.39465-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628132457.39465-1-alex.kanavin@gmail.com>
References: <20190628132457.39465-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/6] meson: add a patch to correct gtk-doc traceback
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
X-List-Received-Date: Fri, 28 Jun 2019 13:25:09 -0000

Somehow upstream missed the needed change in a stable release.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 ...ly-pick-the-compiler-for-gtk-doc-bui.patch | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-gnome.py-correctly-pick-the-compiler-for-gtk-doc-bui.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 943dd512086..694b7aa4e69 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-mesonbuild-environment.py-do-not-determine-whether-a.patch \
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
+           file://0001-gnome.py-correctly-pick-the-compiler-for-gtk-doc-bui.patch \
            "
 SRC_URI[sha256sum] = "2f75fdf6d586d3595c03a07afcd0eaae11f68dd33fea5906a434d22a409ed63f"
 SRC_URI[md5sum] = "a091995861e0bc23e3c856b0c8d1ef90"
diff --git a/meta/recipes-devtools/meson/meson/0001-gnome.py-correctly-pick-the-compiler-for-gtk-doc-bui.patch b/meta/recipes-devtools/meson/meson/0001-gnome.py-correctly-pick-the-compiler-for-gtk-doc-bui.patch
new file mode 100644
index 00000000000..06cf132d07d
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-gnome.py-correctly-pick-the-compiler-for-gtk-doc-bui.patch
@@ -0,0 +1,30 @@
+From 5d5d16f7726d8de301d9dac04538276854c8bf56 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 27 Jun 2019 17:19:14 +0200
+Subject: [PATCH] gnome.py: correctly pick the compiler for gtk-doc builds
+
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/5566]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mesonbuild/modules/gnome.py | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index fd9e063e..aa815c7e 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -1045,10 +1045,7 @@ This will become a hard error in the future.''')
+ 
+         cflags.extend(state.environment.coredata.get_external_args(MachineChoice.HOST, 'c'))
+         ldflags.extend(state.environment.coredata.get_external_link_args(MachineChoice.HOST, 'c'))
+-        if state.environment.is_cross_build():
+-            compiler = state.environment.coredata.cross_compilers.get('c')
+-        else:
+-            compiler = state.environment.coredata.compilers.host.get('c')
++        compiler = state.environment.coredata.compilers[MachineChoice.HOST]['c']
+ 
+         compiler_flags = self._get_langs_compilers_flags(state, [('c', compiler)])
+         cflags.extend(compiler_flags[0])
+-- 
+2.17.1
+
-- 
2.17.1


