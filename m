Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA3279BA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 11:04:31 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j125so1569487wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 03:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ll03CWz52NXbDzn1zMnxMk+T5RjKhDKbVmczxQXihak=;
	b=xOGsZNdMkaKoxQwYDsfmBmXLYv1YFSPh+zpXFMFJN0WfqXomnWWw8HEMS3ocgVo9HX
	NcIttB94PEgO2XrR+co1eJqqNYSMuRVw2zixRFkbD/lnnJ8Ekq750z9yFHmD6ZaiTbvh
	nszyR4OxaJNURBxt6xIsc/cd1wle83W1DSPZOARTzqmQqaFP9NndoGFkZ1kXBo9YALtM
	MmRgH6i3PCRHAOdK4dWzo8BZeqDpVJ8jTsqOCQZzGDXwdqQVCkTJXpUHwdv+iyhRjpxi
	RyRhbJpYnLkHcf77bk+8+E0Nvwth5HDua0AlSnBHTjcL4O3noNuewFldmXjKHkGAnJ8p
	t6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ll03CWz52NXbDzn1zMnxMk+T5RjKhDKbVmczxQXihak=;
	b=ERv5hd+XbqgeJZcXSTDrUVZGVv688KiuomMHPENzIQNUocDRu5AW4uxzhjmErq53ep
	YcD4W0bBJ9ZMFDryIp2615fp+yQxJz0tp14TpCr45IOjeo99cT0dF0okOL97esFMHf3k
	WCfuSmXzB/m6Kq9z6WXqxl5g6LdSLpVFF7PPbvtN5peCTXdQeXI2b+2bDEg5Zy52UgFl
	l3RqpfZNWFWkNf3TS3UzAHT1kJkKvAqHUsjDi/X813hcw4DlcObBFZf4H1Bn+y2ak6it
	1SdMhyIei4W8Bt5KeR+DH674+EM2vq5gRUVtm5I945BwTHhekRgX7BIBgMk8RtMBP436
	SmoQ==
X-Gm-Message-State: AHQUAuZCgMrc2NVTUOihbuJ1G3XPTbuPvcf4YfZQ8ZkVSSiMOZdus8k2
	3KOUfH0K/XOjW3lZD94/Un9hTHmIpsc=
X-Google-Smtp-Source: AHgI3IaLKeeR8mIB1r6CAapVqaqJObB830oY8fDHHkcSo0vkmP+g/PZrc2mur9OSWWQ9ydesog/WQg==
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr9591549wmk.44.1549883071923;
	Mon, 11 Feb 2019 03:04:31 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j33sm18215321wre.91.2019.02.11.03.04.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 03:04:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 11:04:24 +0000
Message-Id: <20190211110425.11105-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190211110425.11105-1-ross.burton@intel.com>
References: <20190211110425.11105-1-ross.burton@intel.com>
Subject: [PATCH 3/4] poky-floating-revisions: remove deleted tests
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
X-List-Received-Date: Mon, 11 Feb 2019 11:04:31 -0000

These tests are very old, unmaintained, and there are better benchmarking
systems available now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-poky/conf/distro/include/poky-floating-revisions.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-poky/conf/distro/include/poky-floating-revisions.inc b/meta-poky/conf/distro/include/poky-floating-revisions.inc
index a3da043d9d5..1fc50459206 100644
--- a/meta-poky/conf/distro/include/poky-floating-revisions.inc
+++ b/meta-poky/conf/distro/include/poky-floating-revisions.inc
@@ -26,8 +26,6 @@ SRCREV_pn-sato-icon-theme ?= "${AUTOREV}"
 SRCREV_pn-matchbox-desktop-sato ?= "${AUTOREV}"
 SRCREV_pn-oh-puzzles ?= "${AUTOREV}"
 SRCREV_pn-libowl ?= "${AUTOREV}"
-SRCREV_pn-fstests ?= "${AUTOREV}"
-SRCREV_pn-xvideo-tests ?= "${AUTOREV}"
 SRCREV_pn-clutter ?= "${AUTOREV}"
 SRCREV_pn-clutter-gst ?= "${AUTOREV}"
 SRCREV_pn-libmatchbox ?= "${AUTOREV}"
-- 
2.11.0


