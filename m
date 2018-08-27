Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 770C678741
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 06:51:22 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a4-v6so3721867plm.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 23:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=v4IsG56bTH1w8fBG01EQP0nDuoT9bkgWPpOnzuQZgI8=;
	b=YKpvNaq8GEYwhoaeWpZ57ZFXplaJdsTQb/5WsMLJFf4SJ29e2N3Q3sbanL6A/MjSmS
	5Ejkq8dZAjhLl3bErRJ/wZf3sHf/1vziNoxLpfdTMT9hRRDFTiPHEu09mJKk1H+2gLzS
	3KNOILNtD8IoAI7gyIvQQ+gw8SF2xVSSLLWD4p6g3nXtrZKQOea0Mb/vbLD3EncLErRL
	1QID4pyik0CMIw057Ajdv54dStuwNNradqXnYh5rm7QguF9FlwBcjzq6B3U2RvWBqRbW
	ZWf/o3ruToBt3mTcXDTVJ9MWXgCKvvwJfV00sVqbt707B2YOwpcX+lhwn1IhCuDfEH4P
	PJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v4IsG56bTH1w8fBG01EQP0nDuoT9bkgWPpOnzuQZgI8=;
	b=LuI5E/05wSpRsWwvWfw/5/HBvSZlJTLG0ZdFCeh9MW9/Zmk9QBvCUqxd+HQ7mm+dvX
	Thulgd40GAQjSRu4qnmv7zj5jOfdBcOIfuB28d6fOGD8Wpk5RujfPWBXnfUHX8PkddDt
	pVJZ6Z7pvCDaGPOTc3FjsyAfgmimVp51yrke+9YV9srrEnQnVLS/CrdpMCXvnXZmBJZt
	Pl8E8utI4gqwGc3QXocs3V5yuUb7CfioPUTVXJfxZcXcXYp3PkuSpw4vjcVrGZEjLFpL
	Ghr0k4UjbnSB8jkfxq3Ndlz+smgbwAP6K4qBOzrMYAtYOijLoe2AK00a+MnyGc+B9AeC
	P3PQ==
X-Gm-Message-State: APzg51AcSOys8R7N5lEO/hctrPDMVIDxGt2w9x81IGsHQywjugpKH+Qh
	lNWN3PX4fJh7pJE5GUgwENnehCiM
X-Google-Smtp-Source: ANB0Vdb7dohFX13JClZdaxIuQFWCeM/odlnwMsoa+YZFIIP74aa05Kz8qIyfS/4Q6h/UFsXpujfGHg==
X-Received: by 2002:a17:902:1e7:: with SMTP id
	b94-v6mr11857164plb.139.1535352683091; 
	Sun, 26 Aug 2018 23:51:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	f6-v6sm23447238pff.29.2018.08.26.23.51.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Aug 2018 23:51:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Aug 2018 23:51:13 -0700
Message-Id: <cover.1535352523.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 0/3] Misc Fixes
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
X-List-Received-Date: Mon, 27 Aug 2018 06:51:22 -0000

Musl has some important fixes
distutils fix is taking care of some missed flags
for C/C++ plugins, helps builds with PIE/PIC
Systemd patch fix is found out by clang

The following changes since commit 0791c4d39edbedaa493a9fc6aa6e7415f14980bb:

  utils.bbclass: fix KeyError exception (2018-08-24 07:53:09 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (3):
  distutils-common-base.bbclass: Define commonly used compiler variables
  systemd: Fix qsort_r patch for function return mismatch
  musl: Update to latest

 meta/classes/distutils-common-base.bbclass       | 12 ++++++++++++
 meta/recipes-core/musl/musl_git.bb               |  2 +-
 .../0002-don-t-use-glibc-specific-qsort_r.patch  | 16 ++++++++--------
 3 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.18.0


