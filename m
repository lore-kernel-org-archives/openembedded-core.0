Received: from mail-gg0-f169.google.com ([209.85.161.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U0A01-0002FC-JJ
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 13:09:13 +0100
Received: by mail-gg0-f169.google.com with SMTP id j5so28398ggn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=7mCP5zG7L+ow1ZOf6R1+h63UMllTJt4JGWeqvSFwbAc=;
	b=dk/Y0Y5cd+tpkB7u0WlgrRmh//NRXNkqCqnyxsO94BGmWwsDQS5DK2UFRfzrlJUqRa
	godmKDyuL8nyV/Vmud/lkfPtu6N+5tRteZgV4jk8jXp5Uv/naG+v69mRYHKc2tUXX/Qc
	CX21Aa0saJHTkMc6WSZStzl+mE3+tQFlUWC21PsKK7WDoDF43XK0kl1EZtTWfV0uX0Ly
	PwShSF1QU9O1QzHbD9p0FOvMcmU3qco3XzA05kOuzINpsiMKROewRu4Xz0TzLXRLtN1+
	RvxGxknK27jJcFKTokG/AAKZZ6Aty6AmevKTABWwJ3mKtI6rJkZcIaLBMhXivSOyGprR
	6I1A==
X-Received: by 10.100.238.18 with SMTP id l18mr175240anh.82.1359460413589;
	Tue, 29 Jan 2013 03:53:33 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.35.66.48])
	by mx.google.com with ESMTPS id z6sm7037801anh.13.2013.01.29.03.53.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 03:53:33 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 09:57:47 -0200
Message-Id: <1359460667-26291-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359460667-26291-1-git-send-email-otavio@ossystems.com.br>
References: <1359460667-26291-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 3/3] default-providers.inc: Set 'virtual/dri' as default for 'mesa-dri'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 12:09:14 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 444176c..d0b84bd 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -5,6 +5,7 @@ PREFERRED_PROVIDER_virtual/db ?= "db"
 PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/dri ?= "mesa-dri"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
-- 
1.8.1



