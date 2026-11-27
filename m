Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1535.1795801784424049121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=SrzCNx0w;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5707609f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801783; x=1796406583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TquP3LS4C9Y+uC3J8C+p63AmpZstWe8gvcKOq5CzlPI=;
        b=SrzCNx0w9Vl7eeRAKoINLNrFoOGBIi2gd4hj/mQZC/T4Z6iw4+bd4aNJJ34Yq4YDHO
         P22TGv64D+jzeuZmN9jJZxBJUx6L6VIdEeuxnPk19z8+tJBdRZxAjbHYCFIeSwbjPShj
         38pUUIOSUzcf8FGHwEO7pI6kOQk2cXVXUR8zS9UwrsLZ6PSeb6WvZI+m5nLJV5PLbeaN
         KKo6Svi2CgA9SRLSIK++dRccTcA38VUiA/br5w6EtD6rp4WorXQ9L6VYvNFKzJt7HvZR
         44X7Oci7/JX7ejJncGi+uVuw0+LWtQlW0Xcx3ckL2AAgGXpJ4hJTsWfokv83Eo2cnIA+
         8OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801783; x=1796406583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TquP3LS4C9Y+uC3J8C+p63AmpZstWe8gvcKOq5CzlPI=;
        b=u7V4v9LILxIw6F3MxVzCyU7IDmY5G1UFlkRXRnQ0ejezbs+qNLaccx/UN4PHLTvUSx
         aP51Lj0OLex2ct5va3BOXy5aBPOZmseFI9nnUzsD4/6j9n6K2vt3xKCPGq8PhPdcuixA
         SZR3WWfiFpwF6tABEpkOLzThJ90or1V+xIONfEfABbpA18Uc1qit/O4Av5cGT0Ys2V0q
         hMnuYnU9/2Vyd1qkwLKOSiyof4WDmHkT4tB8IqvR/k/+qYOYAL7HC2QRMMyzbi701PIo
         CBoeV/mYHfOQwQeZOqLbSmwRJFgJEiPp5EVfTF0fNj3BRwPGw9jzs77kgO4pDqXqQG2U
         gX+g==
X-Gm-Message-State: APuU4Z+i5pzJBBAv3v5hlkCpiN5X/iAy1ibpsEwf4dKrT9Wg/S/Rf2sa
	Sb9+GqXDBktVdf0qhHc4sYETBGfTStDHjrmmBJ9Y/MsGkbNkpjgKeFBge23MP2+zeJ038NX3HQE
	13MaE0/M=
X-Gm-Gg: AZFdTZe911Rlf5z5VhuiO781M3ko9ofEmQku5RhMi7aQkPg9D2A2vmngQVmiG4+CzhG
	wNaB26SYG2bllyqNxg0rxCzpV1fA7AOw7yfzAuW5wzfWEO149zc6vBI4KWGfWoa2qnPgfjHpI+9
	fI592TTM1uBxmKFaHzujURr3J325ZHucXUlZVsivCAj2ZBYxvj6UtCWuL1AU29NYuJGK+F5fpj0
	tDLKmHpTYo1eJHWNnZovhv5DeG0VbJKpDUnAt5MbWcOO6Ja/WYCUkHbA2AvSHnlyuJBrWNXtbpq
	OlXRuSyr2BVw9CQK7dQ5Ugxccg7t5GKL94eYjYv1CQh4v18hrt0rElzE3/33MF9YVLVelwTERRV
	O15cNiLhnJMH6tiyqQ5oZNKid+tMenjl8T6Dii4eIA/wjuy68FhLX5ZmcqqHyegcP3BEUWLZs3q
	RQuS1oxiiMhNWfHoAg1ec3h9lE0h8tHC5h65DhE/ALvRQk4MoMA3JqaxVYuao9UydXSUkO836ib
	6EUz/Yf5TvkSHIkiETHqBNEkjxvVnaco1ilPhcgYB+X07JdXyQwofaQNZ7kIQCNSxExchnceSOy
	Dbez9oT9+7pbffeRmzrUizdLriM+AjygEWaPSJcNOwI/sOSc90nOg1zirdOMW5wI2uOVfAh8Gng
	tmLShHcZs3adSLG2oGOxxApQmLCk1
X-Received: by 2002:a05:6000:461a:b0:491:1e3f:a427 with SMTP id ffacd0b85a97d-4abb4b84d2cmr47537610f8f.42.1795801782694;
        Fri, 27 Nov 2026 09:49:42 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:42 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/37] aspell: upgrade 0.60.8.2 -> 0.60.8.3
Date: Fri, 27 Nov 2026 18:48:58 +0100
Message-ID: <27ff53c5d4a32bea0acca55fde2528137f839af4.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251421
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Fix CVE-2026-75818, CVE-2026-75819, CVE-2026-75820 and CVE-2026-103658.
- Fix various other memory problems.
- Fix various typos in documentation.
- Remove unused MySpell example code.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 05baab915b146a19776cd292962e2cf4edfc6f20)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} (93%)

diff --git a/meta/recipes-support/aspell/aspell_0.60.8.2.bb b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
similarity index 93%
rename from meta/recipes-support/aspell/aspell_0.60.8.2.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.3.bb
index 5b4fab7c354..6ac547887b0 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.2.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
@@ -14,7 +14,7 @@ LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
-SRC_URI[sha256sum] = "57fe4863eae6048f72245a8575b44b718fb85ca14b9f8c0afc41b254dfd76919"
+SRC_URI[sha256sum] = "0534eae11132405120d11e46bf595bd5dd189bc124ba77a5dd6aae861b48a162"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
