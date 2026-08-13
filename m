Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7147DC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:44 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21619.1786634554279240712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HaYJUr7w;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so2086443f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634552; x=1787239352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m1aEXbAOYqbzHB3zWWEW5zSDoDHcrutmZMBC1Y0LS+A=;
        b=HaYJUr7wxHwcCHjeUI8BNJbYnimH7eyYvTSBtVyxEOKcoCdKccYDF2eacrKUrInjGN
         WF7chgb/+9x48Um7Dfz8RsxQcrNDHxQtZhQgnSsuCNFme9CW4ohf5pw4z4SaH2auAjf/
         zL990B5Q0MakvJHLuqqngU366lnC5fMDQ8OBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634552; x=1787239352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m1aEXbAOYqbzHB3zWWEW5zSDoDHcrutmZMBC1Y0LS+A=;
        b=FyOmJRAKnFURieKsw9J0I/Pwbns7EEkG1BhZ7CcH19tJNr1RE67L/4HufJbf8xIhNL
         0o+K+hyTmWnbrJ1zQA98BZLCQysFFtHymHSuuSJvwqkbS0XgtNI/A/ML8qEVwpn9NmE9
         LCXCG6S/bGbCc767xiq3xsZItdE1p3UgGhX31sdG0xHLsOoj9headvyiX1sjm/4VaU0V
         TNFry3uOsevXGO1yuGB+RRktgI+GQyICpoJcCgj6kQvbzjl02M3zzoJ653lOUa+oTmPY
         4k7Vu/DrEkKbnHTXOHVEag+KQx0VbYgmLoS7MSmrdHLku+8xMDekBl5UV+45M72GD1gy
         5D8g==
X-Gm-Message-State: AOJu0YzA1AVDrmnNEvh9g6XmMIK/SvBcewcIkS8lb6xwqjwDw2u1ZTVP
	mz0JjjGRRADsAeDQ8bwX990jypkV7gS9F+X7/aJMKgo+pPUVxGcBrxNCfkkzMaX2jYSWA+5oDDG
	o/5xU5ulZBg==
X-Gm-Gg: AR+sD12LaE4GjzmposgaF6dklpXB1L3deMZm63FuFeXNJcDVIybWP1vWRYqSVRY8Ylw
	zU4UAy3c8J2kOJZYI4AOiW5/FZ/39dYp0oX0WG/ciCgNejZ/AzTGMgd1QfOoqGcnLxtEmwYJYlV
	eCIcI1SuY7Sx6OyQ2yrVjZJGIGF2bi2SnpboeX5dGM9kDG6IGr5uyhCSnou0oMUvckjbD4F5t3g
	XvW217QRmJOaMoaL8IObIeWqIN9d34oSnDNHww2ObQ3iWkcFE2g90fBPHwzgkIdUvuZw+sJrTc7
	05IwT7KcpSpkQSQm+g1P8EtKBRTioWBOTjjTuXqTlBkuI6RaEo8okZOHSl5LarVyG2njgwasdiK
	j6JpHMUc5SFz83cejG0QREGqczF32wjy3EQkZTtTJAW827zGv2FiFEmLxsbAzfU8qhaWwhAx+ot
	OsEL1jb2ppKNQQBpMzfY9TlOoetYh1ZWcBnDaQJOUv6h7yo0nLekZUB/JzRz0/UNlTEUs8whbhi
	H+k1Gryoeru3SyOPihTtqRzkYDuaeCnUaMY46JNTFK4mi3qiO3rXm0KynTVNlxb8DSAnGaNys3y
	/Mga9XTsQ3kPbOZQl5973f9kPPyR6eFh9vHyR3t2
X-Received: by 2002:a5d:59c8:0:b0:47f:c648:e265 with SMTP id ffacd0b85a97d-48159fe3e16mr9651984f8f.17.1786634552476;
        Thu, 13 Aug 2026 08:22:32 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:32 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/17] python3-pip: set CVE_PRODUCT
Date: Thu, 13 Aug 2026 17:22:02 +0200
Message-ID: <dacdef54fc3ec3ac7daf07d2f6423b6daae1f893.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243369

From: Himanshu Jadon <hjadon@cisco.com>

CVE_PRODUCT is not set for python3-pip, so cve-check can miss or
misreport pip CVEs. CVE-2026-8643 is reported in NVD with pypa:pip.

Add CVE_PRODUCT to match the NVD product name and report this CVE
correctly.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a486abd4889ad03e1a8ddd5311595f3ece7d61b6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-pip_26.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_26.0.1.bb b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
index 28af8f7ec7..9640bc926a 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -28,6 +28,8 @@ SRC_URI += "file://no_shebang_mangling.patch"
 
 SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"
 
+CVE_PRODUCT = "pypa:pip"
+
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
 	# Keep them only when building for a Windows (mingw) host.

