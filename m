Return-Path: <matt.ranostay@konsulko.com>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC636193D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 23:47:50 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id c20so297845lfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 15:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pBRDajap9lae4bhiX94qhFAeeSUlZajpvLnHt+kuYg8=;
	b=gsOozUWVJHreaf4y+7FHu2KYr9KssMUVKiou1DK9cTRb/Z0VJTw1t9Pi4ZdJhSx2H2
	cD9iq/5TU/MxOSyFsZshIM9qwSwKGsBJKuLDJQpdKCo3/EyAo7ZaHIFWhnVdBI+4GjYq
	ta10qVJP9NhXnHRQfkFMTJO+GzFqGZEsZ5Vik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pBRDajap9lae4bhiX94qhFAeeSUlZajpvLnHt+kuYg8=;
	b=TVukfaxOFyt4+gvE1toy8xbzS/+146j0HeeKbOnqklPdBEBQleS2Hu5RthI0JAv1G2
	mmXqSgEzYMrgKz2sUrHE77cMDtt2EaOwM7kJWUqsJMAVOQ/Rqaf1LJxkdr5fVE2pEmi6
	ZS688Z/VJM2yT9yWsskjnRHFGPd7LW9f3FGg9exUYlm6FdyOZ9PMaZRHEDx4oW/5ZigT
	HRhFJHraCGuTPdihLO1zi5DJsMbA/slF0Z0q1u1ujgNHrSmukXsgbu+g/SAApoT1tNOx
	ZSDLEO1mnK4u2XUhwj20cGQ/v7i5ZIVKPp7hUPCCy1NjOXZs7T7JXitwwUtWvM3yYw7h
	AL5A==
X-Gm-Message-State: ANhLgQ3cHJcDa94Eh18oNyGquKr7/N4+B/VM7Kl8Dl3V9aT2froFZQqn
	5j+nedjhs04gEJg1ZLfkfmDaTeNXF3BKEQ==
X-Google-Smtp-Source: ADFU+vtNoWcERnK6YyTWK9BxPNIR/4ySuSJ9U7KFAxIBABVRQRLiaWDUNlFAPE1mHqDKoyrxI5esVQ==
X-Received: by 2002:a19:4cc2:: with SMTP id z185mr2032710lfa.0.1583020070473; 
	Sat, 29 Feb 2020 15:47:50 -0800 (PST)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
	by smtp.gmail.com with ESMTPSA id u5sm8459547ljl.97.2020.02.29.15.47.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 15:47:50 -0800 (PST)
From: Matt Ranostay <matt.ranostay@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Mar 2020 01:47:42 +0200
Message-Id: <20200229234742.3780-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: freetype: add pixmap to PACKAGECONFIG
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
X-List-Received-Date: Sat, 29 Feb 2020 23:47:50 -0000
Content-Transfer-Encoding: 8bit

Add pixmap to PACKAGECONFIG defaults to allow consumers to
render color emojis without distro changes.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 meta/recipes-graphics/freetype/freetype_2.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.10.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
index b179a0ed47..d1c093054b 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
@@ -27,7 +27,7 @@ AUTOTOOLS_SCRIPT_PATH = "${S}/builds/unix"
 CONFIGURE_SCRIPT = "${S}/configure"
 EXTRA_AUTORECONF += "--exclude=autoheader --exclude=automake"
 
-PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG ??= "zlib pixmap"
 
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
 # harfbuzz results in a circular dependency so enabling is non-trivial
-- 
2.20.1


