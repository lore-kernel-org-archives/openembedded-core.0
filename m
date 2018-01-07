Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2C16878924
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 18:49:07 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id i5so4084481pgq.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 10:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ZOqK8G7W7PC3YhDa3yJ+9ADkkKRoJ4pvvqJQFTpwFEI=;
	b=XSbL4M4qIlQnsZ+YdvcXix3M58vcrX+ghuz37h97c2iF+JFRsEn6oPnnIq7Ea3G3XS
	G5eb9zF1lcFo8vz4yaMhC1a69bCI+9Q5sfeppotyZFIDdXG/x1pT6ONXC6ufmjzIQK40
	NyxD3RonfCAhfrHey2ufJPllBNcGfYMBEBcyzW3Pdl7nEIXvth+YRV03510XLUXpbEca
	JmqyzI35hy3g9vpbsRCu058U0NOjjZb8ksInBvoXRjldUV3Vk+1zJXhmN17Ns0+9WSjA
	230t9gdLZG6Bf2uDmQIGwjD9tv66uzUjPu8exiBRk+qbKH1UeCVuLOHgvQnO9PlBDwYC
	bavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZOqK8G7W7PC3YhDa3yJ+9ADkkKRoJ4pvvqJQFTpwFEI=;
	b=pJXhGXDgZokGo8vd14XG7K7DlaLyo/UCHkQ8H+ZYy42V5KWbGsSz5C16/58tbj7/Sb
	+bNsgoJRR1Q3Fhyu3KxBFhCmbSijlvlawcIwZg/ve6iGZu4LEn1gRsmSX8kjvXgoLK6k
	wbk8Qm3D5M5Z3QrFk+GbDSUo2Cqc55QSBVBfS/YiIuzhQLvUUjo34alhenU9nqDyF52q
	Dgw84ooZARfE5MWFozyo9W9bBj0tbAyhyyWux4aVaaYsyi6U9wlV1zKykKdQz/inGJSp
	EeL6DaSYxy00G4mf4D5NNxyGNK9Ym17G6PViGzqtUny4uT8uyhEpMqQoK01YRblNZAgq
	fZyQ==
X-Gm-Message-State: AKGB3mLnnf4HVEK5tH1ozNGkdEx67rKdOzsyPgJFrpMjeEiP1EWkbPfD
	CGiNdjy9sj4HtzAWczd0O8U=
X-Google-Smtp-Source: ACJfBosHbCLhOBJDQ+DVvfA8O7OTh1CANZyDOQHrOh4qLqDbNrBmS4Y/WbHq+8vi41XlQI4Cb0w0+g==
X-Received: by 10.84.253.129 with SMTP id a1mr5819490plm.218.1515350948613;
	Sun, 07 Jan 2018 10:49:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:d3a:c846:b190:ee80])
	by smtp.gmail.com with ESMTPSA id
	r77sm23618823pfa.78.2018.01.07.10.49.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Jan 2018 10:49:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun,  7 Jan 2018 10:48:57 -0800
Message-Id: <1515350939-18246-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [ROCKO][PATCH 0/2] Update to version in master
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
X-List-Received-Date: Sun, 07 Jan 2018 18:49:07 -0000

The main reason for the backport to Rocko is to pick up two CVE's:
CVE-2017-13080 and CVE-2017-13081

Otavio Salvador (1):
  linux-firmware: Bump to bf04291 revision

Saul Wold (1):
  linux-firmware: Split out the QAT firmware

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
2.7.4


