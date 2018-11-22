Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id BB9C56C5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:42:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id q26so9496668wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CxxwGB1AQvVryYdvcMxdiXv1qZAN4uQOfv41WSR6+iY=;
	b=HihG8GW3uqPNwwK6qkpHgg80PQmkbpBJwbaAA8tZgFgWZCCpwqaRewhPW+VGBniP8v
	xZy3hWyOBpGzYLg45HzfM9jRLlq3I2EBRpMFqBoFEksaYMhHtPOgHQP/YXW9bbysFpz6
	2cjDbivM2LdVwClud/3OpFAJdTYyr3jhMB6QydmDQZ9KopHYWD74gQJQLD1D0i4BQoC7
	r9G2YKlWTFfOHU2KvRPmC/KZsDjHFVfYytTQVYGtHO/09I97t42GdfocD2y4HoMyFHl5
	ME2K845D3tTpDIC0a8fVMOrqrTbx9XPobudWliSkkNRFT3QEH5d49VwDeRyTer424ZLL
	kqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CxxwGB1AQvVryYdvcMxdiXv1qZAN4uQOfv41WSR6+iY=;
	b=M3SUBhgzPX9pbKcdx7VQ/CtsXxV+CFz+nm8GwxDfzSS/wo29aY5/Qr35QqnssLrR4Z
	0DIUrosCF4mdJbTSEHKk6MLAzbn/L7BKSezkACez2Bf2CMdPNZAmIyiKFfgq92bNLLxm
	TeG2a/1wSrNPermiB4yTtOocTMBLTgWx4ClMmbJQsmgqLaoNJIBfMYlyuFVZHOMh0oMg
	7UFjQAWOKbAgGoyS9LpzGgcCoXoK/Vs24PqSHumtQxkzztw5BLuKi8Ozld9Eg1g37Byr
	BfGtYsgMiw9+SggBO1NIhScplDdGQF/T9q5hDLD6P1vJulBpoIRbE7hY7CFszMSpxZr8
	ShGg==
X-Gm-Message-State: AGRZ1gKNZd1B04a+IIjpltBZO9C9nzhYsmwkYBFOZ+kpG0xldwxN/HAF
	jnyBI3rXt8/F5s21s7OZhX0IGnrn
X-Google-Smtp-Source: AFSGD/UADPNG7KnosQxzGLIJnHUBrmjbkfhoL2kkitYb6XDCbOmkB4hzusgHO/6CmMGs0+bgzeE1qw==
X-Received: by 2002:a1c:ad43:: with SMTP id w64mr9806161wme.32.1542901324043; 
	Thu, 22 Nov 2018 07:42:04 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.42.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:42:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:35 +0100
Message-Id: <20181122154136.121480-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/16] libdnf: update to 0.22.3
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
X-List-Received-Date: Thu, 22 Nov 2018 15:42:04 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/{libdnf_0.22.0.bb => libdnf_0.22.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.22.0.bb => libdnf_0.22.3.bb} (95%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.22.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.22.3.bb
similarity index 95%
rename from meta/recipes-devtools/libdnf/libdnf_0.22.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.22.3.bb
index 61ebcd821cc..d0cb01f0ea8 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.22.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.22.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-Add-WITH_TESTS-option.patch \
            "
 
-SRCREV = "fe14ad928f60890fa28b412639c88cd47889635e"
+SRCREV = "5c198ea2357c5779cf83050e5291646c3b186446"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


