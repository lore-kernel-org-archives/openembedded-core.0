Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id EB3A961BBF
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:31 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id t24so317238pgj.7
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rGOy/7VSiSMIGRakIg2ftKrzw91wGmTGfCtlbkNVVzI=;
	b=TKJJGlqzKe1a5ArBac89j/n1uoX62r1LvOVVfMFMhnywOE23RFM/4o+Oq2s/8a5zJk
	lVKKFrQhEeVypxb9ZQMXKCaVd8eWN7tKmDNcDZABNtvnrjtGIpZMY3cMCaqTYCA70BNd
	gEubXIIFxp3SKp43nYwil77l9d/S8WMYvkmHq1nM4he672js0FOQpD/ZSmxuWnztzro3
	VzFJ3cpwZVRW/N2wzIfaosBYS3dwJY3nd1qriZiOER3L8mOU69FmjpEw4P5+RPWk8dtH
	xbs3yJPAzP14jXMfIotw2Hh7h+8tWo6jVe39r0XlTTl1Ss9+LwjKTw2xR3CHP9nyx7It
	GMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rGOy/7VSiSMIGRakIg2ftKrzw91wGmTGfCtlbkNVVzI=;
	b=U2X80L1YwTEmx8ZLVXwlAAlJLXQvJYGPRpOB1ufR3YKkzRjs3BC/41SxHUXcyAt18B
	RONWpIY97RYyoyNL3TmQaiEBvuQU5beIRSYh0D00vWX6Y/b8sS7hggw/Succ2jz9vbTA
	ZrTTbvF5SVFCMa2Xq4S6GH7SLBE8H83uOkJIKLXopI4RThk4DaVqS/UhRUtWZOuIvvhe
	jn6YssvHf2ACV65NexpEBkbZrqQMj95hL1dZCDfRkV9j+ZJElmZOXLFpafEpFySi7Iph
	posQA2r1kl1y55mAkrZDN+XYhqJ1CpjiHiU5Jt93niS1GxB8tnX42X8XXHBLPZ0xClO2
	LRDw==
X-Gm-Message-State: ANhLgQ1zEzgLvIMe0O/RYcCEhl2iZ7U0Pnpg1bnb7VSJ064h9xDbYM4X
	NqpJQlJslpbARyU6tMj8fpfbPJPe
X-Google-Smtp-Source: ADFU+vt2Tc5iH4/fGMTgglaD9TUC+uHAkgFrO7S83tvigVgOCQFWdOtXdHsK5C12jRY48lYSjNoQHA==
X-Received: by 2002:a63:715:: with SMTP id 21mr665602pgh.234.1583893592767;
	Tue, 10 Mar 2020 19:26:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.31
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:14 -0700
Message-Id: <1f903d76e50cb613e5cfe4f3eb00529b2443eb62.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
Subject: [zeus 13/16] maintainers: Add entry for buildtools-extended-tarball
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:32 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61d4d3d5a9f27e0fbf1d7ed6db818a779643b8f3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ab0c6c5541..7494873190 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -82,6 +82,7 @@ RECIPE_MAINTAINER_pn-build-appliance-image = "Richard Purdie <richard.purdie@lin
 RECIPE_MAINTAINER_pn-build-compare = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
 RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
-- 
2.17.1


