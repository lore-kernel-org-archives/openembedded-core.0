Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 91AC37D19E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 12:39:28 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id g17so8401439wro.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 04:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zPQ2kZ/QUwOiLbtQywzSVocCUvYtsX/ieRiZC7bYyhM=;
	b=Nl+YdgVjvBEe3TfM7ZeyQnTvUCuP0359LDVtcn/JlI51zUBRFPAOA4o0WwCPc1USAt
	lKYa8iTOkIlnf+ic7itZ+eEjtSi1mQxeQQt8pxz/4tR90+sbTRlFI43jLuKyt96ZIgYF
	4+R6JvjC1ADCm19oVyXLle007h6F5L4R9/L4sgLP2KC45YDFTr4PsITNGhTSOPxvgscr
	rcpEOT3HUY9DbOO+2PUkbtknRRSafUQm+qsOJyCm2ccq9rTgdtiYq3+IRTtfuAbhBmcs
	CD3ALzyN2nFAwoAJyiqvFrQ92JN2wz9XodXIOBF/gD1GjJzQOrHb2cbTmzBFQ4DnCg6O
	6q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zPQ2kZ/QUwOiLbtQywzSVocCUvYtsX/ieRiZC7bYyhM=;
	b=MQGLruHrS92f+kZgbkA2EGWqpjqMTXOQ4iN27rMdkXUQINBk890lny8kX1xVuy0p5z
	hXKwwX7iIXNQNA0C1b8Uja9aq6CMbLI782OgSnYiF+MvpU7+qFhLDMSK5hjQfTzvqS7N
	lEi3e9aWlN6MZrjBrSwpVcdLwI1iwLHGRfZUxJ5T6XupsgyHwgNDpiNjI9IMz7iYDi/3
	6x3RHh1k1txfogpWaV334VxsG9reEjI973UtBFhnWBnlJl19W+5UPboPYbKCdx5mtqVB
	owdUahsWtXfxBiL07yNHzwaOGLJLIwnBy/d75fJNTQcIaljdnHiebAYxcRXkAGoJlBnI
	XFzw==
X-Gm-Message-State: APjAAAXJlF51EzZ+qpQj5mk46R5UxrWq9QqNcgGaoAxS7F/rRY43an7f
	SCPUpbmtQeic3Z8L9NL/oMFa6HphWOI=
X-Google-Smtp-Source: APXvYqz592RzalRzInSZ+F21iLy2xnlKI5HSL+MJ5ewZkBdOEOX7KnJwDfnal4FZkxHv8k0U/zmKtQ==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr17399699wrk.53.1578919168989; 
	Mon, 13 Jan 2020 04:39:28 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r6sm15254299wrq.92.2020.01.13.04.39.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 04:39:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 12:39:23 +0000
Message-Id: <20200113123924.27277-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] systemd: add missing Upstream-Status
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
X-List-Received-Date: Mon, 13 Jan 2020 12:39:28 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...22-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
index 76a1c7364d4..8d97374cb75 100644
--- a/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
+++ b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
@@ -9,6 +9,7 @@ event after 68 years of uptime, should be good for all practical
 purposes
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 ---
  src/basic/time-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.20.1


