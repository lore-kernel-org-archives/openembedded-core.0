Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5BBAE7C346
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 01:26:16 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q10so27756101pfs.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 17:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2XIJAOKQT4GIqCgWQdcmKih1guCFlLr+Ce3wuxtg7yY=;
	b=UtugnZswojCKvkL4cA8/TfWnvfQg3Y7hxvDbXBbV7fdx1fN0EuzolzYiktj1Xq8LiE
	u7vd9XE/hOZBdQgpw0FhnnSS1YXNQAy7UQmDQhZBwUUiYGmirWR4UMPLD+eLN6vIKarE
	IZJViruAJ1mkDsYSPHREZ1nKIAI64zOFWXQA5PEzEx+VNP/FPf312XxpxnqcthBkppRI
	CpGJGrWZewm5Qx/QP2gsSZ/uNqzPwsO6W+jVEB2pVJirZV6pIU+Ku4xzbG6X8LjN0EEW
	Ort3rlAeTbPLbI0y11tVFX5MOyV/LOrzUp3v1x5P0NpRxx8RyMC4xkBJ5fphGp1Prz7k
	yUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2XIJAOKQT4GIqCgWQdcmKih1guCFlLr+Ce3wuxtg7yY=;
	b=pEkWYqI4VeqIw76iNDbp4PiDRfuBoS2DRRgk3TjfeLV2r9jswS4aQww24qH5vzFzcC
	mkr15QidL5P5wblLTtkO3tC43pFanjU/SDg4tqsb24JRpWJLkXJ6r/y4p1zW+13EOT8D
	bxoZkwFtWGaaqwJQYmaAc75+9h9YpsBgwvGDuDu9Jnda6+ezH1XdohxSDWeRiJ/O9SxS
	zvV3EfuUQhkGbQ0suCrPVRuukNrVB6iz1UIDNS0EkV8IgmL20UNtJWh0pkhy/hKXfL/V
	WpIkormMAsP8Kk4gm+Vq3qM6kOwAHrH6TIsMZnQaVYugfOd2oQNAO57Wa9XJiLV1Z7cH
	KJAQ==
X-Gm-Message-State: APjAAAVTxWG28d/ApwCZDDNJC0cofOvnUlzSkL5WY8Cv1P5GvnIW4nKZ
	alHEG8SPXp8063qyZtKZs/bclaJh/X4=
X-Google-Smtp-Source: APXvYqyNyEowzPTZu8kHu++kL9cOCItFa1O4lkgUQzQ+cZuw/cbOsOhoCAA+u/YzAz52AnCsaJ2TZg==
X-Received: by 2002:a62:aa03:: with SMTP id e3mr104284012pff.61.1578360377546; 
	Mon, 06 Jan 2020 17:26:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id
	d21sm25390267pjs.25.2020.01.06.17.26.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 17:26:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 17:26:10 -0800
Message-Id: <cover.1578360245.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Revert "tclibc-musl: Add -D__USE_TIME_BITS64 to c/c++ flags"
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
X-List-Received-Date: Tue, 07 Jan 2020 01:26:17 -0000
Content-Transfer-Encoding: 8bit

-D__USE_TIME_BITS64 is already added to musl internally now
so its not needed to be added externally to compiler cmdline

The following changes since commit 9ac151b744d9305f777430f08e871ea6cba75efc:

  runqemu: add virtio block device (2020-01-06 23:54:39 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/misc

Khem Raj (1):
  Revert "tclibc-musl: Add -D__USE_TIME_BITS64 to c/c++ flags"

 meta/conf/distro/include/tclibc-musl.inc | 1 -
 1 file changed, 1 deletion(-)

-- 
2.24.1


