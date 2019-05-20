Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C84AB7E024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h4so14804337wre.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8p+/GD6CrOfipRBHgQ7sbwnejcB+fIp+L4EOEinzx6c=;
	b=fipgKhoGIInO4fo68/sgr+AjXu0yS2NN++XT3od8vYuaKjijnsEawA/0PnSVNCn6SA
	yLYlGK+sffDFlhHBp4bZI9UGBKCxfQJRMBeQ6NedYg9M9oNdIV7uxRNyniBHABWROVfC
	M0GIw8ZSerpVpdTvJl4+B5gf5gp5ng9cLlzV1B4Yictm2Pcl3X+6Qz31xTTV3atn5G0K
	ZpQAfzerdhc5YczU3j5AVPFKbpzRqCMrn07tDPKIkWlTDJA4BWZISb4eACL6yfNzr2p4
	NP5jnp0jWFRSmiKDhrJNu+FbRzECeXu0Cl548gcSWbZYOSChIiTOOrX2RS+fXRhgduBz
	C+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8p+/GD6CrOfipRBHgQ7sbwnejcB+fIp+L4EOEinzx6c=;
	b=JozZKdZViMvB5/fNF3UH7/y9aF7uGNwR5Y0LNp4CKMVj8961GnxSgCin8+SnZltGBs
	1N87pbN9ZEqwOWeOXm0+jnVsc3yp4Y6MuBmjQWcTo2vVGQygAyiwU2aUOmr5tdZJcPHj
	DMViuau8n0+s4ocZRDSm/EQBgx/5K6/6ohuoUfIS7KtjjnpQwktEvMsheWhd2yNgb4ja
	it1g/yaQXJV1y2o443HqD6TshZgAhAQRm0rePMMvVzAet1P8A/LcrTIHucOIE84ahnnS
	uGpGJfznBszfVerE+EHFTjwmjbP0XhjbU90P8tHSutNGruXxdZ4hQp+Tl2tTMxxvJQ0v
	mmsw==
X-Gm-Message-State: APjAAAVHTpfCAQL3bMqgnpfIOHpuR8YThJ4v+Y9qlD1PLNq5VLSYM4N0
	kfXFv2hOCBaSqxwFw/4c6ddrCp7X
X-Google-Smtp-Source: APXvYqxi3sslLvOXb4cs5O27L9D5PmXDPzvgRGPqTsB5gGGgRR43vfu66MfuxCG86T6tnDDvpDd2CQ==
X-Received: by 2002:a5d:4cc4:: with SMTP id c4mr33941665wrt.164.1558361524519; 
	Mon, 20 May 2019 07:12:04 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:16 +0200
Message-Id: <20190520141125.10805-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 33/42] gst-examples: upgrade to 1.16.0
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
X-List-Received-Date: Mon, 20 May 2019 14:12:04 -0000

Upstream has started to tag releases, so drop UPSTREAM_CHECK_COMMITS

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-examples_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
index 75ac9b75c13..f2a3afbbfe3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
@@ -6,11 +6,11 @@ DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-
 
 SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=https \
            file://0001-Make-player-examples-installable.patch \
-           file://gst-player.desktop"
+           file://gst-player.desktop \
+           "
 
-SRCREV = "2b3fc175c252cd5a537e4b2864b572a8372473d6"
-PV = "0.0.1+git${SRCPV}"
-UPSTREAM_CHECK_COMMITS = "1"
+SRCREV = "d953c127c1146b50d5676618299933950685dcd7"
+PV = "1.16.0"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


