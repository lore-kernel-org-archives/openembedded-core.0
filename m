Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6916FEF5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Apr 2016 00:00:05 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id g8so4682549igr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5Q4rZW9xH04KwRJ0vSgLYemCzm75U18PFWuhD7sIwtQ=;
	b=uz0pkbg2c1ZqAQ2nEbh/92groOsQ/Kj6A0O0AT5/SYsoawL4KzBQ7w5tZi3mNzoCC5
	ezLhWbU/1FRX1SwhcE7pjnybQKYODI28NlsSHQNkDg9kLx/xkZdzsKdbIAiLsk3kObIR
	27x+QFWmXjOqublAgXPmbZNFsU5H77Mv+Ovbyg4wU+481g2m4A/VHRBDAQ+Pgagpyb3H
	eY89A1naLjiZBvHqLd4HjPKnwUdg3DP7rog7fYMiQCQaRHMRcNvK9+VlHN6USgJLj7HK
	Peub2FbDWYPL4ACrA/v1wul0rwXlir5bpIQUt4OX2OCbUKZaxLlBkllkd4/1E9UOImp5
	R/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5Q4rZW9xH04KwRJ0vSgLYemCzm75U18PFWuhD7sIwtQ=;
	b=V4kNkN4tlCalo9CX+yaJ112+/Cj3c44bmij2KzbQB41FaOYmCKA3r9+kOqiZ0/mAFE
	9f5R84zK4GLmorpNFVVumXrFLcn8R25m0u2JD2kFmvD98HQkF4VvSAE8/e/HUzvRFdcB
	Pp5b0aEDPTcn/QNFMzfO8ePJQ1FlYtP1CuWE7RaqIK909AxgG+72q2uzglZth5x73oKS
	Vt0jeps//6k+4eztGc+T65RNFWNdCDGZzy6FzuqA1/Y7k8CWDelFf2wWjRoxpnAQXSS3
	T0fx2ow7Nk1Cjx1CvJDpkZKL8WEdIWT9ME5TZKPPA0vaqV1hQIIK65emFmeC4cbod9RL
	D7Kw==
X-Gm-Message-State: AOPr4FUUf2GLXKWIDitJzUPrU4EFFsmQ90dsWM0nAXUspkrqDTx+6WLu5xOK/lkL0BDWaw==
X-Received: by 10.50.46.197 with SMTP id x5mr6435565igm.3.1460764806172;
	Fri, 15 Apr 2016 17:00:06 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	a75sm30569006ioj.36.2016.04.15.17.00.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 17:00:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 16:59:51 -0700
Message-Id: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [2.2][PATCH 0/7] misc recipe updates
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
X-List-Received-Date: Sat, 16 Apr 2016 00:00:06 -0000

In anticipation of master being opened up for recipe updates...

Although sqlite 3.11.1 is no longer the latest version, it contains a
small set of minor fixes for 3.11.0, so may be useful for people who
want to cherry-pick into OE 2.1.

Andre McCurdy (7):
  sqlite3: update 3.11.0 -> 3.11.1
  pixman: update 0.32.8 -> 0.34.0
  gnutls: update 3.4.9 -> 3.4.10
  gnutls: update 3.4.10 -> 3.4.11
  harfbuzz: update 1.2.3 -> 1.2.4
  harfbuzz: update 1.2.4 -> 1.2.5
  harfbuzz: update 1.2.5 -> 1.2.6

 .../{harfbuzz_1.2.3.bb => harfbuzz_1.2.6.bb}       |   4 +-
 ...lated-workarounds-in-cpu-features-detecti.patch | 144 ---------------------
 ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |  65 ----------
 .../xorg-lib/pixman/mips-export-revert.patch       |  22 ----
 .../{pixman_0.32.8.bb => pixman_0.34.0.bb}         |   7 +-
 .../gnutls/{gnutls_3.4.9.bb => gnutls_3.4.11.bb}   |   4 +-
 .../{sqlite3_3.11.0.bb => sqlite3_3.11.1.bb}       |   4 +-
 7 files changed, 8 insertions(+), 242 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.2.3.bb => harfbuzz_1.2.6.bb} (88%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.8.bb => pixman_0.34.0.bb} (80%)
 rename meta/recipes-support/gnutls/{gnutls_3.4.9.bb => gnutls_3.4.11.bb} (60%)
 rename meta/recipes-support/sqlite/{sqlite3_3.11.0.bb => sqlite3_3.11.1.bb} (64%)

-- 
1.9.1


