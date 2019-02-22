Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5441A7CBBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:16:56 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c8so2554306wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C8ZeD56/zoIhTvQL0E17WMx5QN/XknDVyq/eZEnpZ6U=;
	b=DGpdpv83YglBH0Az8Gz9aCk2TCitbJNYhlyhR9B3eC9FZ0IH6Lm2zRmKxdMJr+Gh52
	j0QXpF/RX/fGfXYiN2KXuz+RjJVisrHW4RlcKV4wwr7rYB0986k8FXHBDI6AXdea5xKj
	G/y+ubZvKcI8ap+1iK1Tl74bWoxenuEeHYfJMZY3jp0tJ+0ymsvrzOE5bJlnPyTTxkw5
	/cjeNkTFM0gcY0pbVvRqBVXrE6lEVZDOY1ZEOtzX/QUJUMfz4nz+DHvhOKevuD5l3M+9
	aVuE3UG7rseKb7pdrddUhUwAaEcgHtOsqNahXUU6utNwRPmkSu/50y1/FruGI1yy48r/
	uFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C8ZeD56/zoIhTvQL0E17WMx5QN/XknDVyq/eZEnpZ6U=;
	b=AuzAuiQ0WNFka66QuvI82woQZ/0t2+FEU/4+8WQPMjxsFtNY20XiuPNQ+h+BXaCXfp
	gZqxx0PJJQKOBvCCmF71t3FTsyHaee9AMtF+MbtDl/2zORqBSTvBBxWPboOwqlOQiz/U
	W5Q2+M3q1W7wSeYJpVzDQx//8pEvJpDM0hODChuhPGQuquzk/rBWqweACut6XP+oGQZr
	Di4CPH2uvcIhsiiDRO5aR72hkJaDREVUfgONDq4qSTWlH5k2SSOHu5aii5cSVpidRNcA
	cFv0vgOGXYUT0M6clruHVxUu3TAW9Kp9wqd5BSqjPjsdfY6eRzluijRvBknylyzAkrMZ
	Ak4Q==
X-Gm-Message-State: AHQUAubj4BwCn59PnEOM/YG6cG0P8Hd7yZ8+osA+3+67OzduIHajbkY5
	/UL35aqyoeVKJKKHc/ZRtyAGldRS
X-Google-Smtp-Source: AHgI3IZvZ5cuLLY4N56OSJwSQ9N+sP2r6zO+xi0VzEUetmFZFo7rOJ/gua/ZBenTVw6Deadkw3h/Ow==
X-Received: by 2002:a5d:620f:: with SMTP id y15mr3007114wru.101.1550845016778; 
	Fri, 22 Feb 2019 06:16:56 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	h13sm1377309wrs.42.2019.02.22.06.16.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:16:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:16:50 +0100
Message-Id: <20190222141650.46895-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190222141650.46895-1-alex.kanavin@gmail.com>
References: <20190222141650.46895-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] glib-2.0: restore API docs generation
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
X-List-Received-Date: Fri, 22 Feb 2019 14:16:56 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 4d7fdeebbbd..6305f553b4a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -31,6 +31,12 @@ LEAD_SONAME = "libglib-2.0.*"
 
 inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages distro_features_check
 
+GTKDOC_ENABLE_FLAG = "-Dgtk_doc=true"
+GTKDOC_DISABLE_FLAG = "-Dgtk_doc=false"
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
+                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
+
 # This avoids the need to depend on target python3, which in case of mingw is not even possible.
 # meson's python configuration pokes into python3 configuration, so this provides the native config to it.
 unset _PYTHON_SYSCONFIGDATA_NAME
-- 
2.17.1


