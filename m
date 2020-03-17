Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id F155C60B22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 07:04:04 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id b1so11200259pgm.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 00:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BjEQ+GfCapkBxZU0w+UPXZu9FyeJUv6Z1EA0LbCeSAY=;
	b=NSpud4xFCPuLkN2Seg7rtubWqcw73Gsx8VB0fUhxKdqEsn0HOyBWTYegV0k32CmOq/
	lK+PBTsFgrVvBu4pUXhWQDKBJlaZCoLAol7mylPHwZzHBht20LtWaNGaaGZd/lSDgMYP
	PrrjxXi88dvUECAshf19KACFUCa7tgMmUxBtskA4zh9KrF6ye27mOS3BSFGEW6UHtH2K
	p7rRaPzsokZsxG1UkmtHfpLVHAkhNu91PPoYZu4CR+b++kxeoRX/wcv0F6galpeGlO2l
	PM6YI3He0BHJnhsVZ8W5gwJy+tuD/dCH/YXQ26TwmgyD2IDHX4Quw+5Cw/ei7x6pjoZG
	aARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BjEQ+GfCapkBxZU0w+UPXZu9FyeJUv6Z1EA0LbCeSAY=;
	b=EItRYY9X1E5fkhS5k+fSYBjhg/TozdlffWWLXrIr9hq5EepGIidB8Ybx6rZBcGDHBJ
	W+BWm7WokvwB1/a/rqX7qgmLKqF0Pfzz612K4uEhZlezBzjXTBDbl/Z+oconWW4o8RFx
	IYwsov0CJi2B0L+ghTAhaXOwWLIksGw1dIT6ZLONmubrnsMlDtQvFiAmzsxZ0Y+mXtHz
	IuJ35RZtMFTEZIuK0D/JpBg78ZYgaYTM4gVWdAscDllHZDKRg8kKKmx3ncyFwFznvT5K
	kRs23jGmi7nbFXIAYL5+l/kwwZgY1zqG3gylptjPaXE20HnqvaOVVAIgx8G5nA4hQdpW
	9V+g==
X-Gm-Message-State: ANhLgQ2Z69vheBH0DTeRIei8geZltqJqH/fKsz0EXFe79Urb6ZyhHerS
	cT2CFAUVe66XK3DSsXQTPRuZAojc61g=
X-Google-Smtp-Source: ADFU+vsT5J6LR9HhN8ZYQ2W8uhGbsPkjrejZnfxX2hlRR8P9AQPMg67trC/h9yiWOklPhFJOnQIsdw==
X-Received: by 2002:aa7:8bd1:: with SMTP id s17mr3593678pfd.225.1584428645243; 
	Tue, 17 Mar 2020 00:04:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::593])
	by smtp.gmail.com with ESMTPSA id
	jz19sm1754331pjb.48.2020.03.17.00.04.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 00:04:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 00:04:15 -0700
Message-Id: <20200317070417.1250936-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Add multilib support to musl systems
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
X-List-Received-Date: Tue, 17 Mar 2020 07:04:05 -0000
Content-Transfer-Encoding: 8bit

This has been outstanding issue for few releases, this patchset ensures
that we can build multilib images with musl too

Khem Raj (2):
  linuxloader: Add get_musl_loader_arch function
  musl: Add support for multilib

 meta/classes/linuxloader.bbclass   | 29 +++++++++++++++++------------
 meta/recipes-core/musl/musl_git.bb | 10 +++++++---
 2 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.25.1


