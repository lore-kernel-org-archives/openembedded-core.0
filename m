Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9982971B99
	for <openembedded-core@openembedded.org>;
	Sun, 12 Jan 2020 06:14:59 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a33so3093822pgm.5
	for <openembedded-core@openembedded.org>;
	Sat, 11 Jan 2020 22:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eR2ft08DeiTl24R83rzvxRaio6Hyt0t+pPTAj7elHuk=;
	b=YZ9SXkgEjFHnyzdOWhoS54KTP42EDhGfg3N142KQ4jbX2B/BucowZRwsBPS+3QpV7y
	8uOfsU+U9AQNjyOsF4+dmLVHL6oObc+OEzx4echRxLX5KY9Dk9Cq87L9pfhhnRMS4GB8
	K7IXmoJvIAxqi3DohuKzZEF2OCF+YfRjmypIy7vCqyYF9XiwuggZ4L14c9j+ZlYeuyph
	/+xyHg3B2vxp/S0Kx5ljaT2jQCLd8U+/q/FPYVvdp2I8CURQKO1OppmEPL/hgIY0SiFJ
	UNrsmtXZtOFyWd1dp09rdAH2v0FfTXgYjyo1HYHyWHr7ntirD7NrDRVJQBJYkcLFyQgW
	NbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eR2ft08DeiTl24R83rzvxRaio6Hyt0t+pPTAj7elHuk=;
	b=Q7e0CbwIx8lMVGkHEt5/Rb0tJEyjQy7wQ2i0+kDtK/bPyEsC07gBQiYx0dJ8CWUpqC
	2lyxolBwU7oL2HMS6HSF4qcTbJ0zG+uzuS8Gm3qGHtUOMVDbdHl+kC1ySinOWYZzoJWw
	NZ0a6i3RWyr5XN/Y1EHLUwEk643dKvujc2awQB1IvCQsjd1tM0EE1omuAFBvqY5VUzyo
	Uku7CwImrhgmN2mLgrHZW4VzEoK3nSXXcAgnAHNjFrhYBV7r92Jbf38PWRgo7oTnNHTg
	HfC6kJrZvA6/3uLGTnB3A6yITzmzMT634/HLnDf+6YCX/8S0x9Z8X6kTjVM2eiGtc1rB
	ZWiw==
X-Gm-Message-State: APjAAAW87wW/GUd80kS9CmU9N/FlxVYL8qWCjqkX5eNEtAM3JDi5IzWt
	vYWcjN9wAe+ZWOL16g7T/dqs4PlM
X-Google-Smtp-Source: APXvYqwwqF0RryAF9oEP0v5MEa5brfx4Ex9STw4l+jl4XYb2fiwkIi6kKOiVOSFLc0jxBu3y4m+rLw==
X-Received: by 2002:a63:3f82:: with SMTP id
	m124mr14718723pga.431.1578809700712; 
	Sat, 11 Jan 2020 22:15:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:3849:7200:d754:59fc])
	by smtp.gmail.com with ESMTPSA id g8sm8978559pfh.43.2020.01.11.22.14.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 22:14:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sat, 11 Jan 2020 22:14:55 -0800
Message-Id: <20200112061457.10741-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200112061457.10741-1-akuster808@gmail.com>
References: <20200112061457.10741-1-akuster808@gmail.com>
Subject: [warrir][PATCH 2/4] sudo: correct SRC_URI
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
X-List-Received-Date: Sun, 12 Jan 2020 06:15:00 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

The old URI returns 404, and has an invalid TLS certificate.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73ff6aba0a53ffc3ee0a5859a3ad4c8021be4de0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index 7460a5bfed..bbca8395b9 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
+SRC_URI = "http://www.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            file://CVE-2019-14287-1.patch \
-- 
2.17.1


