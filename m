Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2212E6079F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 15:28:22 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id k2so6292471iog.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 07:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ch8uiYM9YWOOHDhsSslEAW9wgaaDx8soAul6Zfrob+I=;
	b=m2OsldeG5TAJWkK/nFl9L9RxKnEqc1eYLSqJSGGO2G0vLxWoGJ7Tlog/Jhb8uHv79o
	esK+xtHd0Wpl/+2ETwsGBJ/+lwl0YYWHqbJFnub2y2zOq3N5pcw+oWo11qWJC1NKd6xc
	+3rxJK0mb4mcxgEZsuT0EB65MLeoxk6ygpQ/GwIp14pAchNRKdFp8cZO6q9A/7P1SyQE
	ou8vMchOfDTHj7uhalmKbrJ86OeZzV65so2wF94bQYCo5abCp+B4Lkc7VznF/9EJR5zu
	2mQ3q4COAI8qNQouzs4CbbFusj3XjWwT38t0wrUPBFaXlN+CMNnrgKr6ZtyGiS5hUkJ3
	EuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ch8uiYM9YWOOHDhsSslEAW9wgaaDx8soAul6Zfrob+I=;
	b=ZbFK4Dhol6hmd12LM94XLhE/iD5/mpJ3iRYy/6dHmQdxKxDAqtrx6j6kO89wacAXyY
	UZGolB/HH8/bVCl2AabFYtH8vkAMmEGwx6AaLKI7kKvxlO8peH88GwVE+2KxXmMnWPoc
	DaH59LdxXGi4R4n8bp2vkNPiM0cG0Jiet0J8kmLunTS7NyJWS+JpgO0xMCdBlRUpckAN
	U3lkQYa6IVIEC7WEHOWZrNrNIdbEt4lISMabyX5MB0cQ0/dXST//HDbeFYRxV8WlqPVa
	Z6k+FGIwC482sg6DcWdAw7+xDqmMH58phEh77JvUBKok/UwwoAuFLjHWujxJM3MYSdlk
	mpuw==
X-Gm-Message-State: AJcUukcOZXRC+Z2itPo0uIc1QGiMQgopHX1/uVe6NW3T8vLAQLUS3WJV
	EVWHbv6bLyJnncUPHyCQdMSOrT+PUgo=
X-Google-Smtp-Source: ALg8bN6WPphnGSUYWl1dBQJc21//BPoOON4FQzxSDvaKQqXYao79zG+HmeOSbKS8EfmgjYLgy8Nwkw==
X-Received: by 2002:a6b:4e14:: with SMTP id c20mr3876961iob.65.1547047703654; 
	Wed, 09 Jan 2019 07:28:23 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	b18sm15809828ioh.28.2019.01.09.07.28.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 Jan 2019 07:28:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2019 09:28:17 -0600
Message-Id: <20190109152820.16845-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Icecream fixes for multilib
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
X-List-Received-Date: Wed, 09 Jan 2019 15:28:23 -0000
Content-Transfer-Encoding: 8bit

Using Icecream to build recipes with multilib enabled has been broken
for some time, as has using Icecream in an SDK with multilib.

Joshua Watt (3):
  classes/icecc: Check blacklist for BPN
  classes/icecc: Remove trailing whitespace
  nativesdk-icecc-toolchain: Use TARGET_PREFIX in post-relocate

 meta/classes/icecc.bbclass                          | 13 ++++++++++---
 .../icecc-toolchain/icecc-toolchain/icecc-env.sh    |  4 ++--
 .../icecc-toolchain/icecc-toolchain/icecc-setup.sh  |  6 +++---
 .../nativesdk-icecc-toolchain_0.1.bb                |  6 +++---
 4 files changed, 18 insertions(+), 11 deletions(-)

-- 
2.20.1


