Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUa-0005Wb-5u
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:40 +0100
Received: by mail-gy0-f175.google.com with SMTP id g19so802214ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0VVrQbU2KwwzZ7SHzNhjF4HXCiUvUFzpuGu7t/WRFvc=;
	b=BZUyIJCrYi1PkDVRARBqouzi0wC3ezIjDiN/a+uifoSmGHbsofSCN5/j6CFXXuRSpE
	1FED5ys9Wd1BpSrnO4rSFOX5h/llwp5VB6G2kuHZ2XV3F2BwNrvGn8u1YCG7uqVLSF8v
	1qxn0CCK/jegHnJlxNrD5c9k1EnCavVe5tRQY=
Received: by 10.236.116.193 with SMTP id g41mr2594714yhh.104.1327684433070;
	Fri, 27 Jan 2012 09:13:53 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.13.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:13:52 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:42 -0600
Message-Id: <44da5e7cfcbee2ba1d95b993e97d4ebb20b15317.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 04/10] external-csl-toolchain: fix critical PATH manipulation bug
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
X-List-Received-Date: Fri, 27 Jan 2012 17:21:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../distro/include/tcmode-external-csl2008q3.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl2008q3.inc b/meta/conf/distro/include/tcmode-external-csl2008q3.inc
index 93615b9..1586365 100644
--- a/meta/conf/distro/include/tcmode-external-csl2008q3.inc
+++ b/meta/conf/distro/include/tcmode-external-csl2008q3.inc
@@ -6,7 +6,7 @@ TARGET_VENDOR = "-none"
 
 EXTERNAL_TOOLCHAIN = "/usr/local/csl/arm-2008q3"
 
-PATH =. ":${EXTERNAL_TOOLCHAIN}/bin:"
+PATH =. "${EXTERNAL_TOOLCHAIN}/bin:"
 
 PREFERRED_PROVIDER_linux-libc-headers = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-gcc = "external-csl-toolchain"
-- 
1.7.8.rc4



