Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 26A876FF6B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:35:47 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id fl4so401584pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uF7R7xypCyFzNX57y6Ksdb/mn6C5LW/ANzF+h8D8pG8=;
	b=pFu6XrYA1SgvmDFjPJjy1q7pa1XqMcDkizRNzrfabSjW4MyMtygiwVPPbn5RiJ5k3S
	aoTyqNzTH1d/SBrbYPwIZBZlh3Pi3aSTMCrtBzt+cJv1JoAMaNPtwAvepbOA3M/JURWB
	0zabfWNk8pjMw4vGZFj4REUzJrKmSdQYKqz068f4WphxkWbNrsKYBTDZmMFZiKy8Y5tV
	UMmoqJ5EHTMYD5OTBay5Ecj2dSowJ4tL0Lvl81NhP69djzZaWjvkHtOyn3DxLkXnHdAG
	i+3sKyExP1AjEGFSek/eKJoRUcLCa7ix+gfPB/xQgOSyLdZBof+Jg3enQTmduanIArQv
	f3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uF7R7xypCyFzNX57y6Ksdb/mn6C5LW/ANzF+h8D8pG8=;
	b=agNUeL+gpEn4JhoyoF/62VosWtJF9Yb3CUzqd6d8KfsMBN9HM1EqmYIobQk/kKgf1T
	GiFjAQh5/jyutryRiYXlgkhob0S2i76kamBRnAGq2QGimlzbMl8Hy1ivm302OTyCsI1N
	uTOrM2lIrvAk63nnofUUcjgVMMpgk6Is999LTC30xOstL7TGCcSMpUkD+XxizXyMqnz5
	2Trk2oGy6IRcOmTYWg0cjJEcg2HLdX2cmR6sYdiCgPEm9+yBex9SHZWr+1fAMgEb0dDt
	RfS0OWMqIOvAR4b5gUCQf63u3q9tH3aWDm9h+oNdjeZWFOusaGc0aofoZPxF7u3dOOoD
	DPoA==
X-Gm-Message-State: AG10YOQ+KFMlLlFzbATPq/GBAhDj4Ja6BDJpNjO3JeyzUJR0UnAy4V04FVNYBwAnTmoWfg==
X-Received: by 10.66.142.168 with SMTP id rx8mr44264091pab.16.1454960148432;
	Mon, 08 Feb 2016 11:35:48 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	70sm32085872pfs.78.2016.02.08.11.35.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 11:35:47 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 11:35:39 -0800
Message-Id: <1454960141-18350-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] gdb: MIPS plus musl build fix + minor cleanup
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
X-List-Received-Date: Mon, 08 Feb 2016 19:35:48 -0000

Andre McCurdy (2):
  gdb: build fix for MIPS + musl libc
  gdb: drop unnecessary CC_FOR_BUILD etc exports

 meta/recipes-devtools/gdb/gdb-common.inc           |  7 +----
 meta/recipes-devtools/gdb/gdb.inc                  |  1 +
 .../gdb/gdb/0001-use-asm-sgidefs.h.patch           | 35 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch

-- 
1.9.1


