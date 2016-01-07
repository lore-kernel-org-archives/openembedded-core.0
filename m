Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id B5324607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 22:29:24 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id ho8so9541611pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 14:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oCrejw7ZWEKs6ktU+DVUdq1H5y+Jxpr1W9eNsMxROL4=;
	b=ZsndKfkpGJ0rC0FSkEB4CZdT3vaK7nPVhXaKk+SBF9C05ySeq85RluhNtSUxQD5fcm
	CiKk9ryn5XPl4+/iTH/lMRJvcD+vc+Mo0L5ejI7q7tOkwJidSFJdSIP030BQ2LqQzQ9Q
	z9vkmsqt8ChobVa5xVMufKo1oJW+zsquhcA1FzDI9RVX4EZ5eGCFN7QfUIV2DU0oLhw+
	9rnDJDiKBgugNohuk09sROsQxDOLC7eJbzUKfE9RETmZ/JfnMBfauy5QnCxJTCnbT7lo
	HHWJH09XMLYesvKqmiz7wG4voVy5qLQr3JTbWo8nRtwEy4P2tYjbrTICKMTakqMYknYN
	LNHg==
X-Received: by 10.66.66.42 with SMTP id c10mr2130487pat.99.1452205764862;
	Thu, 07 Jan 2016 14:29:24 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wa17sm93819672pac.38.2016.01.07.14.29.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 14:29:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 14:29:08 -0800
Message-Id: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/4] fixup armv7a over-rides for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 22:29:28 -0000

The _armv7a over-ride is no longer enabled for machines based on
tune-cortexa7.inc and tune-cortexa15.inc. These machines now enable
the _armv7ve over-ride instead.

The preferred solution is to remove the need for any armv7a over-rides,
but where that isn't possible then duplicate armv7a over-rides for
armv7ve.

Note that the qemu.inc change has been dropped from this v2 patch set
since the function of the over-ride and the best approach for armv7ve
isn't clear (QEMU_EXTRAOPTIONS is related to packaging). Since fixing
gcc and valgrind for cortexa15 are much more critical (at least for
me), focus on getting those patches merged first.

Andre McCurdy (4):
  valgrind: don't restrict to armv7a
  gcc-configure-common.inc: duplicate armv7a over-ride for armv7ve
  libav.inc: duplicate armv7a over-rides for armv7ve
  libpostproc: duplicate armv7a over-rides for armv7ve

 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  | 8 +++++---
 meta/recipes-multimedia/libav/libav.inc            | 2 ++
 meta/recipes-multimedia/libav/libpostproc_git.bb   | 2 ++
 4 files changed, 10 insertions(+), 3 deletions(-)

-- 
1.9.1


