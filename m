Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 48AF474C42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:45:25 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c21-v6so10955233plz.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+yXxtA14G8F1HTEGI7owr0BDr2kn6rrUWIVnwYecnvc=;
	b=mBaNW1ZNC3gRegFscEJUnma6/t6dF9WVz0sRm+7MKbpY8N0tBXxpyn/9tesB7WpzAT
	xgFnuLHEann2bHF8oFRaYP9u+jcaXtbZR4GZLCV/x0oaV/1u6WpUL5juJsUIH+YcFamN
	6Z7R6Yzv9uRQ+alL6rT6VhQdKykWgwU7PMEksBVHntMwbtMqGLOwRwehgGlYOBMtsD6t
	QhyhHFWfIcqT55zuEDNRfSUf3Mzev4U9znKdxaY6NRxfyyxG2sgViuxEjcV1XJ+CSBr/
	Z1BapJpSp9a73/SElGC4syd6ivMp3UknaVuqeXL7IxJsvyKEOC6Tv7FoFZLlwZd3oFdJ
	eQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+yXxtA14G8F1HTEGI7owr0BDr2kn6rrUWIVnwYecnvc=;
	b=PpmaX4cBbocHlW0rx8E55S5Uzj5ICVLn2SQzmAqNXkhGWsVRri6DnkY4pK2oUb4vIw
	/WqPcqn+5QwvPRAlPAaPBT9wdrJf3PBR/PVN9xB8g3j14c9466PCo+S+GZdJmF9ZpXJx
	B+mjCcnJIyHagE/rhx4opQjEoZpCFB1mYMLfV0L+I1Qok5Lc6AdVsKNspOR0JooRgMB8
	d0Q7JMY9wN8s9sOXQ6YoqmCdEiul98Y3HdcxrHc4bBGahkVwGATOhdCaz4Bv0b3AUeti
	DFqkEjonWgnwwMs0yRXO3Fv0rCB4H8zlUD9jzp8CECumvbTxqIMjCKMvedq8oOzd9/sc
	IKrQ==
X-Gm-Message-State: AElRT7FPSte94kJSZ5mE76rnQjsW15Qh1cBzNck6PHWo91KvEwdqDxJk
	Et7YsM0LdCwrkLEtn1hnyBMouA==
X-Google-Smtp-Source: AIpwx489hshjRsMEVHkJ1iwXduK78PmmAGSPgDVudRdif8JeZOeyqJ484T2GbFgQIR2Wje4ne7v9CA==
X-Received: by 10.99.155.2 with SMTP id r2mr12559690pgd.450.1522856726776;
	Wed, 04 Apr 2018 08:45:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	c201sm11161707pfb.30.2018.04.04.08.45.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 08:45:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 08:45:18 -0700
Message-Id: <cover.1522856627.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
Subject: [PATCH 0/2] Upgrade llvm to 6.0
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
X-List-Received-Date: Wed, 04 Apr 2018 15:45:26 -0000

llvm 6.0 is released few months ago, this updates the llvm to 6.0.0 release
adjusts mesa to use it as well

The following changes since commit c168f6fe35ada66f7d6d6b5151fa248230c38676:

  systemd: fix typo in sulogin-path setting (2018-04-04 08:50:49 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/llvm-6.0
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/llvm-6.0

Khem Raj (2):
  llvm: Upgrade to 6.0 release
  mesa: Require llvm 6.0

 ...etLibraryInfo-Undefine-libc-functions-if-th.patch | 20 ++++++++++----------
 .../0002-llvm-allow-env-override-of-exe-path.patch   |  4 ++--
 meta/recipes-devtools/llvm/llvm_git.bb               | 11 ++++++-----
 meta/recipes-graphics/mesa/mesa.inc                  |  2 +-
 4 files changed, 19 insertions(+), 18 deletions(-)

-- 
2.16.3


