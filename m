Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id F01C476C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 00:23:46 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id tr5so12173592obc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Y9b8whV7ssfUI9zzrHd4XvTLQdZWz+jtYJNSACdQzks=;
	b=x61GneBTLgBypxAoD/7+QNZNV0jey2Bcw6SoBVKWwTTKoNnb1yIPKlQilobasP0xAJ
	x9w1ydB5pW1SFK3dX1s2SY6ZY088PIWvZ3tPK2/pcDVL/wMnbKlIB7+A5aIPJgXwMKy5
	nlqy7u0WyAGKI/AHIoUgXlXVg+gK7ZB/IrA3LrOth0gGxfw/q+RjGL4+Z8KmuRTSqHE0
	Yxip0jcWE916wLQCWIjokflXxaYW+2uPO6XB5v1RSIBM5oZVxRbF+Zu2poa+fSQnmLSi
	8anuAiL+/Y6CvjL9IX8xqN6CKgFXv0A5gdWwLYKAhf87NGJvMitvDL3TJyDbOdDi2kxn
	3K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y9b8whV7ssfUI9zzrHd4XvTLQdZWz+jtYJNSACdQzks=;
	b=bDLezjW36CMT+g+/TQTEwH43RTlTCexM06ZAHswL+ZFCid1ED42ycqRWJvgPr1G+sR
	eoUeKWiZgXOf0A8LxTY8c+fZrA5tK0u9yqPmw7IfbS+BFJIHTUfBFvrsAxWSzb+EZRaP
	e+tUJHye3JZ12/LOFmTBItTqccROgyAVETaJ0iI6t7dkaCr8Kyj4l8OKTxA9DeeT8cxn
	HzZTefsUKF+UpFefs4S0JJ1bArrkwzMcGBz/sm9ISMxjh82dCmRQS+hJfx02hvxoyqhT
	u0nB6DYQJt8RwgvHcIbgfxE4mTZaSneHCB9yDAZ96KDnvRIEDtWR1rnuUXIJDeLfXnID
	yomw==
X-Gm-Message-State: AG10YOQOdRVgLLGd+N7phGc/Z0nbmqDY5EfDGkrPzIJl3Wme37Z16/41O/XqAJv2YoJ0hQ==
X-Received: by 10.60.94.82 with SMTP id da18mr19766644oeb.40.1453854227178;
	Tue, 26 Jan 2016 16:23:47 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id e4sm1790827oic.1.2016.01.26.16.23.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 16:23:46 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 16:23:30 -0800
Message-Id: <1453854212-8496-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] fix -Os compiler warnings in 1.7.1 gstreamer1.0 plugins
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
X-List-Received-Date: Wed, 27 Jan 2016 00:23:49 -0000

Building with -Os generates a few compiler warnings, which
get treated as errors and cause build failures.

Andre McCurdy (2):
  gstreamer1.0-plugins-good: fix compiler warnings with -Os in 1.7.1
  gstreamer1.0-plugins-bad: fix compiler warnings with -Os in 1.7.1

 ...itialized-warnings-when-compiling-with-Os.patch | 28 +++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  1 +
 ...itialized-warnings-when-compiling-with-Os.patch | 41 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  1 +
 4 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch

-- 
1.9.1


