Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBV-0001jA-Cc
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:45 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:15 -0700
Received: by mail-we0-f175.google.com with SMTP id r6so507606wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=vWaoBYRmKW6dXjAP1WQNDQogqwgkhlaTZ9XaqJpYqMU=;
	b=Ej2LRtkuuLX0AlpBVvPm34egaalIsKY+UVZnSQjD+0bdI0h+cuHGF2l3fAc9sUR8Lp
	gQ/jawCRHWz0Y1SFeuaXKMm0niNrpAl0u5Vewu46LyuQl95wNUKLwC8cMaCJBTvj3/CE
	oZGlWRiF8RTod0/KhuzHwrHQhCYBelS8Snivr4mCh6L24JQz+A6NUClMWdAIH5/06Mem
	yyQbajW5EMeomN4n+cMjVV/cEvmOjd3nnt4g/fUmWd2LxLl59yKDJapSudlx74tZweux
	5YHDG8BgNIn63HiKB4kY7Zqekg0oUasQLBZmrNllNuFMUzTrhrfuCq98CpxOcZr7ph64
	9SPQ==
Received: by 10.181.13.164 with SMTP id ez4mr27107917wid.21.1347391155485;
	Tue, 11 Sep 2012 12:19:15 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:18:02 +0100
Message-Id: <1347391088-30390-12-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmJtZ/gpSI2i3ooAiDjBwUulmBVp5yhz5CWRf+qC9QIvLaZtiPpuIy73J4vFUnsFWwZx+Dl
Subject: [RFC 12/18] default-providers: default to libx11, not -trim
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:45 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 2d8a17d..07222c2 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
-PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
+PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
 
 #
-- 
1.7.10



