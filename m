Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 33A0470E5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 12:07:53 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id p9so1248053lbv.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ur8wMOWfR9EfMMpTbjaevgemBzhlkRqYHLn6+ivUdCQ=;
	b=F9UAU2W0kuq+xLftnmmsUqjZmwbsNUM06NhDZ8MNZiFsNe32rYKBNEIbrhBZylmwOs
	zEFfAJrgl+fOU6knj0nS3soLrBAERGq2phlOU/A1IKhjdHuoQnaxdOmQrdumbETk6oLq
	nsX8WQld2ldHHheUHpU0siajIF/g4eMkfx0tZyk+t9dGEkWnhhQw/sL3HZxPx+6powIc
	PkxqMLmUqi26epBiATHSTchNF4FI3OXbEUrXZLY4sHKcLsE3qfqGUaVzYioy6nUhtWgc
	I8aR37AdLCHvicq/W5BGK52nhQJ8WXjGQ/pRu3Hypo8vZ3/HEddMjZRppsffeR8HiPb2
	BnkA==
X-Received: by 10.112.170.138 with SMTP id am10mr13662881lbc.74.1409054873533; 
	Tue, 26 Aug 2014 05:07:53 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	ay15sm1916628lab.41.2014.08.26.05.07.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Aug 2014 05:07:52 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 12:07:47 +0000
Message-Id: <1409054867-10600-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] psmisc: Update patch status
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
X-List-Received-Date: Tue, 26 Aug 2014 12:07:55 -0000

The patch "Include <limits.h> for PATH_MAX" was accepted into the master branch
of psmisc by the maintainer. It should be included in the next release.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch b/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
index d8d1482..c0835e0 100644
--- a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
+++ b/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
@@ -7,7 +7,7 @@ When building against musl libc, PATH_MAX is defined in <limits.h>.
 
 Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
 
-Upstream-status: Pending
+Upstream-status: Accepted (Should be in next release after 22.21)
 ---
  src/pstree.c | 1 +
  1 file changed, 1 insertion(+)
-- 
2.1.0


