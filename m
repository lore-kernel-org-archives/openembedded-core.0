Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 07F93782FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 17:14:30 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id u207so1656298ywc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 10:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2XR4QM866Tvdc1i5qZJ104ZS3FDt53Gl/Phk2TqxbIg=;
	b=VtgGbZ1gOD9BgyBkUGGtvmPwsn4j665kNKCZyqn09BYH8m5uuJtxOWmA9TUKxEe8n9
	jE/uwSqxcaG3WyjgYtdbN9Kbrvf/pCJ05w0ep+V/99m6B9lIBIKOKnqhRGwZwVa3ciDm
	Va6Pt5ATT2MJIw8R+cvu/RZUKCJO/SUZ4X5+ZmuF64aThzA44Wg0wdEO9JIz0VVqNrMb
	mLewwAR4Dca7MNDqiyNTxj2p8URL7pvm3dm+oYJWNLNhr/Qwn3fK11rNf357XwlNp4xa
	gVU3EUZ8hXamuBVQsWqau/fjtkYyo1NsxX+miO171yc5JSEu7eg9QHyLu90X0Z8hXhzk
	FKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2XR4QM866Tvdc1i5qZJ104ZS3FDt53Gl/Phk2TqxbIg=;
	b=i1idktvoURvleOmWYQc4kwPCmOePxgtTNc9KBvUUfulf4UdGz6zGQN9S23hww+4nEy
	bAF97n40M/p8LoBTZAQE2hya5SHnqQmhlsbNXR10Gh7NVxyqrLCGNG+7gSKzHMaqh/A2
	f6kPAbAJwGUpEPbENmbwgTSejeqSw/ghfbn5H3/MNIh140rdwA/JzZ1AK4R8d93Y7rG/
	IPOLWaaHIwjFugvMWizXUEmyGXUdiX68vOUTl4ysnFHPQWg6h6sgkUZZiNtlng7xNu5l
	sdU6SDDBxSzms2MnxGej58eDyvIxVHza85oQbqeVOlgGGQByaf0E9KLE2TLyG0yKg9Gv
	0iGg==
X-Gm-Message-State: AIVw113yrABLuiuXe09WgbRKjIjtEAwIVn8lOqOnqRDlE5XF2GI6q5AG
	huzX+liG3HBAx1Un
X-Received: by 10.129.33.212 with SMTP id h203mr16757047ywh.145.1501607671789; 
	Tue, 01 Aug 2017 10:14:31 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	r64sm10946066ywd.107.2017.08.01.10.14.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Aug 2017 10:14:30 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 19:13:46 +0200
Message-Id: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 0/4] Clean up some do_image_wic redundant code
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
X-List-Received-Date: Tue, 01 Aug 2017 17:14:31 -0000

From: Ming Liu <liu.ming50@gmail.com>

Ming Liu (4):
  wic-image-minimal: drop WKS_FILE_DEPENDS definition
  image_types_wic.bbclass: deal with dependencies only with
    WKS_FILE_DEPENDS_DEFAULT
  qemux86.conf: drop do_image_wic task dependencies
  qemux86-64.conf: drop do_image_wic task dependencies

 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 --
 meta/classes/image_types_wic.bbclass                   | 3 +--
 meta/conf/machine/qemux86-64.conf                      | 1 -
 meta/conf/machine/qemux86.conf                         | 1 -
 4 files changed, 1 insertion(+), 6 deletions(-)

-- 
2.7.4


