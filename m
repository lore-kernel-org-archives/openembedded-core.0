Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4EE616B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:10 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id t79so285429wmt.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OFrtkvrpG2EHt8o9P7RZJAewKS073NApzlI7uL2WKws=;
	b=D+VMouvZQIX7+19KNH/71d4dbvWW3SKoiZvOP3vjdbc9GHcQp0kMNW/HaN8+5RL0ou
	aWtGI70Eh1iG5l33rl2Pp8Vyw4x2SfS+qyYR/lx40z8Scuq8RCpQZ2VEBOlQkRLCjB8H
	mamDIDCzlMkz9eodfMzSapKyo97JG5NNNFObl148l2pHYDlrsAx/bt8r4ap6JOxNVmR1
	ggPOfZpb4IFu6qIC0GnEKA4IlViokumiRl2qXGVEXLVKOeCNjD8fws4f2kd4jJqZ1yXG
	tsJ4f5o2SOSLFFH6gbhJBBC5RBh7UBRIUoE0TQVGIxTyzUQ8A32tDAeeHRN5A0/OTmZJ
	ejrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OFrtkvrpG2EHt8o9P7RZJAewKS073NApzlI7uL2WKws=;
	b=HDmtiDCfPlrmA7uBFHBbQ2Lym7A+BBcW5Bu17JCkEfWNbnF6hhBhXKqWo704z/m2Lk
	qq4A1sk9OEfM0YTxRGmwKwrNhv8IT6JgScLiv9uyhwh64t1GO3YmJmCqxZ7rwjDxiI44
	xu29xVcZZNbSkiZ/TgQ9e8QYbUznhYRXh+W9XtFkOZyi3QOeEbjcXWxkC73aYMoiAiBi
	O9SzjNfvfObihh944h+aGk9TEzpJRFfLgCB9Xp70Q8BRPc9shWi42/UZwbhSTdEW2Ef5
	4Ht+fBFbKUef+o/DE8xiHFj22wRJsUSk+ElheWnGhuUiWAMd0mRPwZEpQ6Qm3KqyeGxV
	S7kg==
X-Gm-Message-State: APjAAAXFKfpwJd+d/9k3rjwh3a9mdNV/4TzuLzpLQnm0j3PuXH9FiAbC
	WtRvxt8Al0IAhzZyZnJF/iY3XiI6
X-Google-Smtp-Source: APXvYqxpDImu+MH6pn8M1G1F7uABkfglwZBMsfiktHkhgu2A+n8SvCeVI+/vZ0b6/OY+mB75ZC8vAg==
X-Received: by 2002:a05:600c:2107:: with SMTP id
	u7mr630376wml.54.1582656850617; 
	Tue, 25 Feb 2020 10:54:10 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:29 +0100
Message-Id: <20200225185335.19326-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] python3-mako: upgrade 1.1.0 -> 1.1.1
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:10 -0000
Content-Transfer-Encoding: 8bit

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-mako_1.1.0.bb => python3-mako_1.1.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.0.bb => python3-mako_1.1.1.bb} (63%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.0.bb b/meta/recipes-devtools/python/python3-mako_1.1.1.bb
similarity index 63%
rename from meta/recipes-devtools/python/python3-mako_1.1.0.bb
rename to meta/recipes-devtools/python/python3-mako_1.1.1.bb
index b139e5ab00..bc38009de4 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.0.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.1.bb
@@ -2,14 +2,14 @@ SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=df7e6c7c82990acf0228a55e00d29bc9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=943eb67718222db21d44a4ef1836675f"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "6c3f2da0b74af529a4c4a537d0848bf2"
-SRC_URI[sha256sum] = "a36919599a9b7dc5d86a7a8988f23a9a3a3d083070023bab23d64f7f1d1e0a4b"
+SRC_URI[md5sum] = "2660a4916f2f63456e6885c727b7cd2f"
+SRC_URI[sha256sum] = "2984a6733e1d472796ceef37ad48c26f4a984bb18119bb2dbc37a44d8f6e75a4"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.25.0


