Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4D75E7DD44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 19:34:16 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id q12so303972iog.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 12:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MlRExbvL+7L0L3f/XGkJ8co5V3iBtQMVGJApA1tcO4Y=;
	b=tRq/4zzUln28ai+GMO2OpoqniGmnzX3787zyIAcNiH1Th5EYAVZFth09dwv2pmXjuR
	2RFMDBQGZvoMCqSp0dTIBkj0brUyyEpGgW/y80rbCb7+50rMkXux6RhDOGaSqOj/+B32
	z36+jJK3TizXoL5Gt+MbwMM5E3GQ/aYTENwM1gMYTkDsoo8MzeC9SWa6d9418Uts/fRr
	Jtyv2E+T5M2gk81ajwEVvYG+cSIZcqJhSVjQIZUq0O2vL7uxcpxgcT7NUNCbUNOIYm4Z
	J5t2w0ahF/5E4Gqcne7QobhdXfYxYtWapmiYHni3W2BtiAZ3osde3bT4wgjKf9NzoTAI
	4bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MlRExbvL+7L0L3f/XGkJ8co5V3iBtQMVGJApA1tcO4Y=;
	b=EpngkXssq6/cOA/MmFHRa7D07IKyoM4Vy+Mil57jo30jUvhkvyWGdEb3Wg6M7Pw0Xi
	spLhzbwVXiQtbw6KF9jdQb+ZIb/Mbw/oqbRcycUy3oh0ktmGdUJxoo3lYxn3FTsGrm+l
	FgFsPDFBSx+ooFF/Jpt8C+016XJFbJ6Vrb2DdHoR+qUD1wsNQp57fVSsorI3RIUI8OtH
	RQTAtGKg87u4kVbSQqZ3G/SrSDQl+2diSSU9rbY0f5aPsW+MZZ4usc+9JP7fK6LqZXy7
	WTEGm3j9hT99JQ65aToOorExvHtdNuFP8sHG9pjSVFC9JnF4B33fkxKFmyPCxn4uRQOq
	3KHQ==
X-Gm-Message-State: APjAAAXt9P7e/TAUF+qEuN7LNoRODuYyuFKtmq0IFk/VohNlNWtuEKPA
	LT+w/99ozSkqilHvg9xBuv09WvxT
X-Google-Smtp-Source: APXvYqxKbPoV2lJB6rVxExMiGqi5Wd3pmPz810vSUNhh5xRZk64oqtWG+ldwPxExXW1UO8oLZymFJA==
X-Received: by 2002:a5d:9d49:: with SMTP id k9mr33587833iok.106.1566934456821; 
	Tue, 27 Aug 2019 12:34:16 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 8sm47288ion.26.2019.08.27.12.34.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 12:34:15 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 14:33:44 -0500
Message-Id: <20190827193349.23254-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/5] Enable Reproducible OEQA Tests
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
X-List-Received-Date: Tue, 27 Aug 2019 19:34:16 -0000
Content-Transfer-Encoding: 8bit

Enables the OEQA test for reproducible builds, and reporting of the
results using resulttool

[YOCTO #13323]

Joshua Watt (5):
  oeqa: reproducible: Cleanup reproducible build
  oeqa: reproducible: Use subTest for packages
  oeqa: Set LD_LIBRARY_PATH when executing native commands
  oeqa: reproducible: Record packages in test results
  oeqa: Enable reproducible build test

 meta/lib/oeqa/selftest/cases/reproducible.py | 43 ++++++++++++++------
 meta/lib/oeqa/utils/commands.py              |  3 ++
 2 files changed, 33 insertions(+), 13 deletions(-)

-- 
2.21.0


