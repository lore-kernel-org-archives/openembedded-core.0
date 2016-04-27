Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D483731E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 12:56:56 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u206so48135641wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7pWnzv+ZPjbBTVRz3SRqmzFnT4ecxaQibNhlv4+piLI=;
	b=voi4A2ntNDO8iMwjOdF0FmKNchK6ePAkJO6ujPY0BjbkYuFovgF3fGzd/mNQ+9Kj56
	0YH/l0O/R4yTZv8eaDTI/RQQ811Mp4chReMjqny6qXaSINQNHRyMDkGqWSH77b8inShQ
	4uxSKeTZLAIr/HSm7vSFkQHVYOH9WeBJmDOjAQJejK1rkZFxyIYth1RyQhpoNC1m1FvK
	HNd1XpqTNuRZvG33zI3ugZ/EM24IolkCZg3wNfy9wChhHQvoUo4gqVvEymyQsPddtDXd
	jjmX9uD6uHF+hKfjQg999/KOUAFmljEZC9wYw8yxmMPkNurpDxErPFUf2knfU8H8Fsiy
	6TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7pWnzv+ZPjbBTVRz3SRqmzFnT4ecxaQibNhlv4+piLI=;
	b=aWQcgXwk9bsMivagfuSIFVPU7JBn+5IT807oKNpLl6m6GQwkM5BCUeSMNySYuVAAiZ
	VNovuNbUDQo04MLdAOKo3g3fXxhIIyhsYzMdA8R6Ium9ydmhNg2jJGhgG2i5Js2zJrNq
	0xQhD89M/LuyUkY2R6ly2wWp7VaNLf8E1QT1ripCMrvdqXWri9UzqrFRGoY7t0JoKZJP
	w/ikxQg0c05htLKtjegikIHxv5T0w109h8UUjJ3FCvIWQtsFY8/YuNt3tLlhCpP6CIR1
	dBhgobpLGD75shTHSsHcA4isJmhcr86n+oYDkvOmfaGEGDIOBgQLbcLTgrx3skO8ftKh
	0Wqw==
X-Gm-Message-State: AOPr4FX/Ut5/ye3K6C+rC1UAuAJv0ky2FCBfF49PP3SXQjuGfvhlaN0Gm0HCpuS2vMhRgmGQ
X-Received: by 10.28.125.138 with SMTP id y132mr9822804wmc.90.1461761817283;
	Wed, 27 Apr 2016 05:56:57 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r123sm8376474wmg.20.2016.04.27.05.56.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 05:56:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 13:56:53 +0100
Message-Id: <1461761814-30036-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/2] python-pygobject: remove redundant gnome-common dependency
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
X-List-Received-Date: Wed, 27 Apr 2016 12:56:58 -0000

The gnomebase class already depends on gnome-common-native, so there's no need
to depend on it again.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-pygobject_3.18.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
index a9871fe..00c5079 100644
--- a/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
+++ b/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 inherit autotools pkgconfig gnomebase distutils-base gobject-introspection
 
-DEPENDS += "python glib-2.0 gnome-common"
+DEPENDS += "python glib-2.0"
 
 SRCNAME="pygobject"
 SRC_URI = " \
-- 
2.8.0.rc3


