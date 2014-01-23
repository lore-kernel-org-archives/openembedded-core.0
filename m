Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A348A6C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:02:07 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id n12so1336581wgh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cQXATuK8jnZVurvrBJ50wHEwEtAGBnkQ9wx3FGUJ9Nw=;
	b=LwfffBKi7b79hRzPFntuzYGZJHjnZlDkXpiYDz4wr7sv8rTP9GfEU3e3hU0fGRQLgZ
	g7I/sfwJLMfE6ec/NC4RnTnR+1MFoBUEZZ7eoEGwLC4P4VL5Df10FKll0kfQooO9UiMs
	Nd95grUYfgS/0WtvUeQCiznFzXWnlaZUICUQJtZLi1KIYNb1ue2VS8nf/9cyyIfF3LoI
	xKmTYfywnuS3adJdlAeeVwwQ4fia2aQPWNOV91Mvb4AZJfE4HXTIak40rF265tudi51J
	9wBkoIAY+OZpdHIGvf3qDQ7isjAKGJ/bkAQ42ydVN3tLhLGYhgbBisJsATTFfsnBDS5g
	LCuQ==
X-Gm-Message-State: ALoCoQl+aNMPhR9ikko3YFlpgmX3bP+nbM2cCH1j6BI1JWf7o4oNQ4RBhi7LZqKnIc78BS7jYJvB
X-Received: by 10.180.107.1 with SMTP id gy1mr7475943wib.47.1390478528071;
	Thu, 23 Jan 2014 04:02:08 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by mx.google.com with ESMTPSA id
	ci4sm21793194wjc.21.2014.01.23.04.02.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jan 2014 04:02:07 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2014 13:02:04 +0100
Message-Id: <1390478526-12041-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.5.3
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, patches@linaro.org
Subject: [PATCH 0/2] Fix SDL recipes with regards to GL/GLES/EGL
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
X-List-Received-Date: Thu, 23 Jan 2014 12:02:08 -0000

As discussed on the list, SDL fails to build on ARM platforms where
'opengl' DISTRO FEATURES means gles/egl, since SDL assumes that
'opengl' provides gl/glx. So until we find a better mechanism to
support GL vs GLES at the DISTRO FEATURE level, this serie create the
proper PACKAGECONFIG so that SDL enable-video-opengl can be disabled
more easily in .bbappend or .conf file.

If this gets merged, I will send a backport for dora, and a slightly
different backport for dylan which does not have the _remove feature,
hence i will be using an intermediate variable like PACKACONFIG_GL.

Nicolas Dechesne (2):
  libsdl: add PACKAGECONFIG for opengl
  libsdl2: add PACKAGECONFIG for opengl

 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb  | 12 +++++++++---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb | 12 +++++++++---
 2 files changed, 18 insertions(+), 6 deletions(-)

-- 
1.8.5.3


