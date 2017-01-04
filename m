Return-Path: <kergoth@gmail.com>
Received: from mail-wj0-f174.google.com (mail-wj0-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 49C4960762
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 22:57:46 +0000 (UTC)
Received: by mail-wj0-f174.google.com with SMTP id tq7so243704051wjb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 14:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=30XAwR8/F4kstOVBfObPAj6GCutAB8PDf/PxPrFkiWg=;
	b=C8K1BmubaiZpYtm+G1icQnqf/4wGhh34NkQvzpxv11a9IUO2brrMXCAdOALrIBu+ap
	YiNtXvbBuPYSIw2JhXkBTfam58/68Mldsh5RIZHZW9r4BsXViMlI8vV/S4DMITY8UC9t
	+y2VWeNnimBVD2lSRTq+HQlFubDTZcNP+iTWnzA8GPErNiwbsi+bCXVzkRLv4nuiCIkJ
	THs3OXfEfaI/HzORQuZ7hUTfSIkTtPLcmO4oZLCoD7ysnYKPCNv8Uv4nV0eMUz2pC1qE
	nMfshV3sg+VtG+/Xsja/WYqw3jSmcITQOOaA1548AWsH0EQn4tC0QdKbAVYVvG5fYfe+
	pI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=30XAwR8/F4kstOVBfObPAj6GCutAB8PDf/PxPrFkiWg=;
	b=nRXRx4Kw54LhUEnXk8LFzfSRQjjLjLUzMrUqJjTg+9qZsihx4djdH3coUIFYWTLk3u
	L/Ao6PyyE+jpsqj1ajKTqQvwA/axVksipKNC1eX8l6OUAFJ1LvB/f9ufIGq3lzSIBOES
	lxK9YvTSQ8hAg1/ocjrukGgnGcsXVVuoWeeuDmL06BJooVW2SbMyOXWDt8khlXFdxgzb
	hAOOanavboqq7xsjaEFVcnjn/8z7JQv/vtlE1WSVww47CLv3prfo2I0sZ14H9L6WReG/
	HA3ci344Zc5lWV256J/LFmE1oZxcYf1qurXmMIRZxfyt6cn+zCIUdBpkMf09n2CA6yCR
	fegA==
X-Gm-Message-State: AIkVDXLFubbvhM6UNKkeoGiNciowgpmUAZpqcnl6ctj+xT7a5sWUoHmTN3Tr/btxibaOkQ==
X-Received: by 10.194.115.226 with SMTP id jr2mr57499361wjb.75.1483570667027; 
	Wed, 04 Jan 2017 14:57:47 -0800 (PST)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	jd9sm84797429wjb.9.2017.01.04.14.57.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jan 2017 14:57:45 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 15:57:38 -0700
Message-Id: <cover.1483570577.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/6] Add opengl to REQUIRED_DISTRO_FEATURES for some recipes
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
X-List-Received-Date: Wed, 04 Jan 2017 22:57:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

These aren't buildable without it, and adding it fixes oe-core world builds
with nodistro (which does not have the opengl feature by default).

The following changes since commit 425afe2484707640ac71194885fdb263e95e9950:

  lib/oe/utils: Drop python2 compatibility code (2016-12-22 08:50:21 +0000)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core without-opengl-fixes
  https://github.com/kergoth/openembedded-core/tree/without-opengl-fixes

Christopher Larson (6):
  waffle: add opengl to REQUIRED_DISTRO_FEATURES
  piglit: add opengl to REQUIRED_DISTRO_FEATURES
  libglu: add opengl to REQUIRED_DISTRO_FEATURES
  eglinfo-x11: add opengl to REQUIRED_DISTRO_FEATURES
  packagegroup-self-hosted: add opengl to REQUIRED_DISTRO_FEATURES
  packagegroup-core-lsb: add opengl to REQUIRED_DISTRO_FEATURES

 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb  | 3 +++
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 3 +++
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb           | 3 ++-
 meta/recipes-graphics/mesa/libglu_9.0.0.bb                   | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                   | 3 +++
 meta/recipes-graphics/waffle/waffle_1.5.2.bb                 | 3 +++
 6 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.8.0


