Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RH0Zo-0001dY-IQ
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 23:55:00 +0200
Received: by bkat8 with SMTP id t8so4276863bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 14:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=FxbcDe9YtMElytu40aaPvUD1gvZ8RtAw4qbj7fZHsR8=;
	b=qRcEzlYehf8FQA8SvfkA00Q+XoRtHkwfORrLzdludiskcp+3P5AasI40Q1+B83k3qs
	XsnnUGy1bjhzlLiDQMyqc7bYboByggOk2VD8VqNZAwIR3yJHk5AK1L1JxKKWMPQrW8C7
	/9aQciH+2N7x4Am0MbvHpPj0U+lJA9rQ6lsWc=
Received: by 10.204.140.6 with SMTP id g6mr9100196bku.90.1319147348287;
	Thu, 20 Oct 2011 14:49:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f7sm2501533bkc.1.2011.10.20.14.49.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 14:49:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 23:49:00 +0200
Message-Id: <1319147340-23871-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <20111020214817.GM3522@jama.jama.net>
References: <20111020214817.GM3522@jama.jama.net>
Subject: [PATCH] default-providers: switch virtual/libgl from mesa-xlib to mesa-dri
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Oct 2011 21:55:00 -0000

* to match default virtual/xserver

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/default-providers.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 66f7ff3..be23d36 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -5,7 +5,7 @@ PREFERRED_PROVIDER_virtual/db ?= "db"
 PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
-- 
1.7.7



