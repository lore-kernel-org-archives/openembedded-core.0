Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id AB6D878984
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:23 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id y22-v6so50382wma.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VNDLMyt53TjcXh7cqfaLGzdA70gzWc+QsMoRr9KLdX4=;
	b=xIy+NqmUs0+mAl2rIaT2x1jYt4S70ITB5rYLfZaqwVrPWZUooWoJucQd7+aiFa1V0M
	ucPH8zn6Y75mx4v2n6yWmn7zFeQTzcnmRSu7RCKAi1S7a30edNIfiBAlAXqNezun/q5V
	dBo0lj/CwRXPw0kPRKpJ1VzNPnhFPBWxZ+bNO3hNPTYV7GAK3LqfHsw+2r2bM/J5DwpU
	DBZRuGIoAUAY8RuyQ8n1KoUfdJeaEvBl76Nv9fISkHhPc4/EZybvC3ONEFda4/lmVFZu
	TnS3meX8/yIhH794mvFO/VN5oCdO5BI05z1KsE3N17ZDMsbtobyuVls6+XxZ3Y4azIu6
	oWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VNDLMyt53TjcXh7cqfaLGzdA70gzWc+QsMoRr9KLdX4=;
	b=I1tGYwP5cYYbLvxzVUHuE7C8h6Dz4kwa7CThQ8azrsxdmyFlIqUJQ0ydERLGXbwCvy
	AlplL1woxzTH8hpP8+WWYkcVYp4MBBHjGUgQcEW480ZAPAuUoNJtCzqMIE5GiT644ONQ
	7JQctx9cHWFZiOAmbeF2JJVWzl1iQUqTFUoWrjoV+8cr0/Fu1vr/NPOQhMaR5VfKLMZi
	Ua07xa9JAcd/xW5FvY4Ety8YtOn1c5ua133tI56AN1KViUyprLvvjlU8g7Iy5DRtEW5M
	+DnR+3R4qa+rp1cw+/VCOnN717Z9X1IWBgyaEget1HvzUPQEhNLEzFLXIECT0DX1bxmw
	Q8OA==
X-Gm-Message-State: AOUpUlGVhaLfy1v+kWP4sByiiYlNQznkSaDbifEkVCRiEtaUXXV9C3ft
	VlRZnw0OAdULv8hnNQCRUfgWEm60
X-Google-Smtp-Source: AAOMgpc7LLULP8XvOW2eT/WOj4mNdUOFAev8j24eBLjSsqvubMFcDmQcd3WNFGResTYgSS19bYkY8g==
X-Received: by 2002:a1c:81c5:: with SMTP id
	c188-v6mr1720553wmd.122.1531845564050; 
	Tue, 17 Jul 2018 09:39:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:03 +0100
Message-Id: <20180717163910.3196-8-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 08/15] xz: upgrade 5.2.3 -> 5.2.4
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:24 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/xz/{xz_5.2.3.bb => xz_5.2.4.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.2.3.bb => xz_5.2.4.bb} (84%)

diff --git a/meta/recipes-extended/xz/xz_5.2.3.bb b/meta/recipes-extended/xz/xz_5.2.4.bb
similarity index 84%
rename from meta/recipes-extended/xz/xz_5.2.3.bb
rename to meta/recipes-extended/xz/xz_5.2.4.bb
index 8d7f0f19943..791746e1cf2 100644
--- a/meta/recipes-extended/xz/xz_5.2.3.bb
+++ b/meta/recipes-extended/xz/xz_5.2.4.bb
@@ -15,15 +15,16 @@ LICENSE_${PN}-dbg = "GPLv2+"
 LICENSE_${PN}-locale = "GPLv2+"
 LICENSE_liblzma = "PD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
+LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
+                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
+                    "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[md5sum] = "ef68674fb47a8b8e741b34e429d86e9d"
-SRC_URI[sha256sum] = "71928b357d0a09a12a4b4c5fafca8c31c19b0e7d3b8ebb19622e96f26dbf28cb"
+SRC_URI[md5sum] = "5ace3264bdd00c65eeec2891346f65e6"
+SRC_URI[sha256sum] = "b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d39d47ce5f4177145"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools gettext
-- 
2.11.0


