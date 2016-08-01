Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 41B216FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 12:32:59 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id j124so11848070ith.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=rmA/u7IEZlgnyZF9SvYT9FLz7o+hu0YPnogEjIgPmvA=;
	b=zIyf6lGgdBdcUHxBUCw462d7JO/1HfPjAMOngimQsSFNomeGnmo3HYwuEf/s5oF80l
	/lL7GebG8rkjJJaNgMsC+U1ASNskxJl7bwwJbonV/TIGJDdOiUQ3hmRW08Q50rwyXHcH
	cw8FI+BDUUD4z+eQ0ARvyyEEBs1tf/9f7QOKhyegrypyZSP+68kC0adDnhElJr83kTip
	TQH9KgKuQlV0SvHEcoI156L9JIhmDso/1OSsAnBK4aRaoXryftNbv8FGt3Uj8U26WJU9
	BFeLla/qeHGWKXUS69ttgvzye7dCBsS6xjOddwG6xDbPu+m1muAMpEPcDi1Lo7WL3U2Y
	rtxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rmA/u7IEZlgnyZF9SvYT9FLz7o+hu0YPnogEjIgPmvA=;
	b=kBf0l/kIlbUAc6ETu2lNAsMlrD4E2QtGakTBcYEPm9qjVDa9LFhFgut9Uze1uNKkvI
	9z2LZ7Kaig0SI1pBeiHpk9/qMqmr84LGwCo2+XTyx1zgLuHcK40p7vfWo1G0Y5gk29t6
	fK3VJZyhwg666I0pKIzCusQcqhIJJgyjbDSFWuW0zboO2bce7wRPcUV8384cGhSWtckf
	j6AdQssocC+7mg40FGbqYYotGicyaDhWMo046jPJFmqmzhNFfsgvHEj7j4p3A63kLAK9
	SaWFII/81zZA7PeuCUUmAsdhLJYLSa8RJEJ27ehhfRLoFxv7mhwUWmWps+SCMCmLzebw
	P5tQ==
X-Gm-Message-State: AEkoouuJNdzXaq6LnuqFMepFJHqtgEVfuuH0vUxmgTNGkS1azH5hUtdRL6uLvoAHWvFSMQ==
X-Received: by 10.36.206.129 with SMTP id v123mr13593026itg.11.1470054780394; 
	Mon, 01 Aug 2016 05:33:00 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	t68sm7701653ita.1.2016.08.01.05.32.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Aug 2016 05:32:59 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 08:32:53 -0400
Message-Id: <20160801123253.9292-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Mon, 01 Aug 2016 12:33:00 -0000

If the initramfs image is type lzo, then a native lzop is needed.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fa76a14..db42744 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base kernel-module-split
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native lzop-native"
 
 S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/build"
-- 
2.9.2


