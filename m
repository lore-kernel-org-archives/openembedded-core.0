Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id E4A3A60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 22:32:46 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id i123so16466445pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 15:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=iS6fpI7zCyBX84zvxIcoc0ou9jKlO705QWv/31HxWtE=;
	b=QWc1UOWmVabPE3a3+NQ/4Rgz71bjMnmksyfMOHx7UlhNGScGn6a1LOYGGKqmliZ8m0
	v5YLEz1DSw1Ns9OdDjR/KmTgc94GZYh79f6sI8T+bIAajd5OpRvhgJbqSjPy5G7+J44l
	u0KCm4zzJU0h49nbiqGeFaGMLlGtpyvRXNmR0rWuWYjQ66F/Q8tFMY8SYOW0zJHRFO5X
	rCdfROXy6W/PYexuuhRJ+014H/asBOEEoM82J4ogOvMJsDqorpLmrqxraJMPDG8+KEP3
	ST7be4laxGJ+3ZFrGu64R4U9VegiOFKbJGaPFyqHdq1T05t2tWDXxoBeV2qC2X7aOpZa
	Pl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iS6fpI7zCyBX84zvxIcoc0ou9jKlO705QWv/31HxWtE=;
	b=DcoZXBi8JlcjqirCfBN708kL7eznerxvMEYNq3GZIEG5Ro/cpc1ux3xh2bqRGVQOIN
	HjVZyweQK0/g7Iy509oNzMYIxEJ+B2GszvDeeiEdL/FnEavA2ljyxNnlPTMTwxpqYrSC
	YB2WfXAwM9g7pnISBge9vcuT3dJxo5DcmHjTs2HRgD0JakrfappDSo8W4l21PVgROZtH
	MVys7iKZdBXkp0lR6RBGIHzLP/TSA6kxUKt6C08Yy6Au+QYxROnIVFZlW1zaCiuZ/tLm
	UlwlLxy6XtsOm3n5DffHUju+uVz/IjoIyJ+wpUEfB7rlml838ZhlMmzfLLJpMqSAfhoN
	DWOA==
X-Gm-Message-State: ALyK8tJhpAfmMWKD/VDxVznKd8brhRKHXkRyORLGcLhDNyryEA7e/UqxrMnYjcW/N+s4Ag==
X-Received: by 10.98.80.134 with SMTP id g6mr13768444pfj.60.1468017167167;
	Fri, 08 Jul 2016 15:32:47 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	jh3sm7221416pac.14.2016.07.08.15.32.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jul 2016 15:32:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Fri,  8 Jul 2016 15:32:32 -0700
Message-Id: <1468017153-31547-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: master][V2][PATCH] gcc: CVE-2016-4490
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
X-List-Received-Date: Fri, 08 Jul 2016 22:32:47 -0000

missed changes needed to get patch applied. 
forgot to git add

Armin Kuster (1):
  gcc: CVE-2016-4490

 meta/recipes-devtools/gcc/gcc-6.1.inc              |   1 +
 .../gcc/gcc-6.1/CVE-2016-4490.patch                | 290 +++++++++++++++++++++
 2 files changed, 291 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/CVE-2016-4490.patch

-- 
2.3.5


