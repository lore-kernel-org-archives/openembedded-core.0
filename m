Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id D1AD077300
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 23:04:24 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id n128so57023475pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sGdwUfSdhM1us+wGFnQrE+0D2fbExa3Hq+qnWoxFl5Y=;
	b=0KBDiOwk7mpIltVZVPo/X5bfJsU3JQvqJ4hTI8n1Lqh1AcipvyRQ9eGp3kjmNsYKkG
	dY7r+VSw+zdANu22yJtQPUWNlLVkCC89vTtmzK6J+pjmp5UjEzrFqogLhNj40QAracOo
	SfX89FZz6jSIJEUSFnHW1GEpf4ruunVf1gFAazGVw9Bgl8bNn1TydGKM5uRYR5qN0upy
	ZQ7eFyZfWvkJFaIgGZNe9IMgTPrL4BjS0T74slLyxOFh3ErMRNJ64Yw90HoEMlCoXt4J
	4qLxoGUG+9c4SwbViP/KGVlPA5WmA0BuFGHGyR2uH0OSG6L4m0+ElaCmUaUHZ51xfU5G
	ALMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sGdwUfSdhM1us+wGFnQrE+0D2fbExa3Hq+qnWoxFl5Y=;
	b=UEQiouhFRPwwWcH3nVaLg+l0WPTDWrdS0atHeXZ5ZKCHg09m27ODc2Llm/RRAuBI6B
	VJGt5MB5VUlNPhW45KevyNTMEx/UJP4Uk79BBAJGGcxfGGrTTB4XqO+SiOezEe+X6kPl
	n7W/xmmYUiyB4wftoKaCymyl/T21SdVCBHHsJuWY/cEZAgUY0BpLHRnruBwfF58mzvID
	6lmV65xbfr+511fdil9xsm6h0WwT0o9RlhqKlmmJjpCq2MPIO3aQBd4FlVxlq4hbVg1Q
	yMjZVM3rRSQopadiHk3rX22cpVZcVYM9F9rCZY6ANaRLOijmfpmwhlbbHeVPvK1cVFBl
	XbyQ==
X-Gm-Message-State: AG10YOQG4a+P1bTJ6o3ar2DqJJJBMSAXZwo97swDeArtaUP304bKvD4nUwhdwDpuF0iI/Q==
X-Received: by 10.98.42.74 with SMTP id q71mr14921378pfq.18.1454627065402;
	Thu, 04 Feb 2016 15:04:25 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	76sm19535589pft.44.2016.02.04.15.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 15:04:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 15:04:13 -0800
Message-Id: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/5] gstreamer1.0: musl fixes + updates for git recipes
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
X-List-Received-Date: Thu, 04 Feb 2016 23:04:27 -0000

Andre McCurdy (5):
  gstreamer1.0_git: avoid including <sys/poll.h> directly
  gstreamer1.0-plugins-good_git: avoid including <sys/poll.h> directly
  gstreamer1.0-plugins-bad_git: avoid including <sys/poll.h> directly
  gstreamer1.0-plugins-base_git: update to git master 1.7.1-79-g6414289
  gstreamer1.0-plugins-base_git: drop obsolete dependency on freetype

 .../avoid-including-sys-poll.h-directly.patch      | 30 +++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  1 +
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     | 11 +++++-
 .../avoid-including-sys-poll.h-directly.patch      | 44 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  1 +
 .../gstreamer/gstreamer1.0_git.bb                  |  3 ++
 6 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch

-- 
1.9.1


