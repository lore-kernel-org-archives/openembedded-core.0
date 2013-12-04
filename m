Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1689F615B0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 15:38:07 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hn6so3796474wib.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 07:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iyoRKpuf3eDkOW/kW4YBDeuDkwjgjS6+4zFoW3ZllCE=;
	b=iO8j/pkrvr/iTabsKTRm7Oy4yWEUbj9DB+hYW1yplb0/O47gzMbvgjwt0DvDhjlhBK
	4hxUmFB8v/FZfKHjVsUMnYvx1xEDK8YWIz1GYK3BLSFN2md732g7qDvK0xpTcGYu1oCL
	6JO+NkWl8jDcV/v63Ncvktkh2vrDRAcnWfVQWtKKXwXzghXt3rIRtklVM38PaE8o27nl
	17qQksOk9RiGMLL4limfVXUJHT4PQWcU8oT9PwL27S/Pt3tFtuO18sewGPF19agQe1VU
	AvevluOSxOB2OgRH1RzYRCPhgMrGsXfO2GTv584nkoshSJ3vvMnk/mZLAV6WN/fTTTsZ
	oLRA==
X-Gm-Message-State: ALoCoQkIdFmr27SgfUN0Yxcw8nZJ4EqXIQ0Ki7W7t9r9gmpy4q+SJ3VJnPYvoNtzgq7ffVBMXxn9
X-Received: by 10.180.38.35 with SMTP id d3mr7798696wik.2.1386171487293;
	Wed, 04 Dec 2013 07:38:07 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fj8sm117355wib.1.2013.12.04.07.38.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 07:38:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 15:38:01 +0000
Message-Id: <1386171481-7713-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] freetype: upgrade to 2.5.1
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
X-List-Received-Date: Wed, 04 Dec 2013 15:38:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../freetype/{freetype_2.5.0.1.bb => freetype_2.5.1.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.5.0.1.bb => freetype_2.5.1.bb} (91%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.5.0.1.bb b/meta/recipes-graphics/freetype/freetype_2.5.1.bb
similarity index 91%
rename from meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.5.1.bb
index 0b69af9..8e59840 100644
--- a/meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.1.bb
@@ -16,8 +16,8 @@ SECTION = "libs"
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "c72e9010b1d986d556fc0b2b5fcbf31a"
-SRC_URI[sha256sum] = "57bce5b37989577aa8b4a588426839f6bf39bcc3869748cb18f6827df251f4e5"
+SRC_URI[md5sum] = "93eba7854094f46d7d98a9a2370af4d6"
+SRC_URI[sha256sum] = "d715faa92b37980280c857ce9d356fff4361c5a7bd9b5c3f867fc24f598d8f45"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.10.4


