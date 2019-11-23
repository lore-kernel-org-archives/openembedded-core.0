Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 35EC07FCD9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:18:48 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 207so4950662pge.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cGz+I40OhU3eBw3cXQNwtSezOFj2xOrJynffXUkRH1o=;
	b=rM/fCh8eBeEd47D+R6UzFxrujvw6ZOt3ruO2xypFCj1hPq3dCD+WXSkfeWUwoqvM59
	3zqGnHIecf6czY7TX8GbuBP+DSLmAF69GF6kQjOseTdnohEebUoo6VAxmKdkUnUx3S8k
	WToJpt+ZCDRxSZdbU+sZ15npHr+ywt/bKRQUSR5OT3p86+unHAK1WP822LbQmtHHLAQD
	Pwe1A4EOf3WlvOfVVr9tAeuoam+lultsjqO8qVT0PE1qJAyKP9S5/LcLB4QFSNwMwknE
	1brY+X72CripPZ1p4MkJu6NfOtf5rkc0rKsvG+K/yrHBXyuOHTPde6BporhjO/zcAhzz
	0haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cGz+I40OhU3eBw3cXQNwtSezOFj2xOrJynffXUkRH1o=;
	b=ntIef+Izj9rT1Qj5Uyw4s/cNu4Z4+dtmuaWFA/MlPzZrjwrskSRIrXf5Km7vRo9Fu7
	H/P7BFUw2r/Bhk75UjWpO9u54ZrTID5mvmntLQTg4Q5Twz5GIRsVdbaf93tEPGVhQmfy
	+4nj3QVFzcMxWUZRqfUpa/krsWcT9X+ya4zdZkj97L6mJZj1pLOjFeozxeq6kagKwttc
	fsvSjaBTj5OSedHOJJyNcPZ+xPRX7fdj8xZvtnHsbWorEj9Vii3iprtYUBe8h8TWcGfi
	sAQteSWPoE9HCtVFgQ4lslVYC+HuCI1hIH7vCEHcxCEPY9B4q4KMtSAqvQsEn0ZH2Ok9
	4j4Q==
X-Gm-Message-State: APjAAAXzuK8c7SeAhfxtpboIZpOcTJ4jGhERc/P1pJu8jiTONKv2n8My
	bRwhgMTc3eZ9FUJhGzTBDUTcEOwS
X-Google-Smtp-Source: APXvYqyKaYHq+oAYQjltGEnzDSvyevc/tLNKpafODwIBenCbhC+2yk+wSaGePgtEHdkVT+I8DQ0/kQ==
X-Received: by 2002:a62:2902:: with SMTP id p2mr23476185pfp.160.1574525928952; 
	Sat, 23 Nov 2019 08:18:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id u7sm2647804pjx.19.2019.11.23.08.18.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:18:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:18:40 -0800
Message-Id: <1574525924-20765-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
References: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 3/7] core-image-full-cmdline: Add less
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
X-List-Received-Date: Sat, 23 Nov 2019 16:18:48 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Less was coming from busybox in these images, add the full version.

[YOCTO #13630]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 2d96d1b..15a8e6d 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -81,6 +81,7 @@ RDEPENDS_packagegroup-core-full-cmdline-utils = "\
     gawk \
     gmp \
     grep \
+    less \
     makedevs \
     mc \
     mc-fish \
-- 
2.7.4


