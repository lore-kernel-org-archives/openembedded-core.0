Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5473C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 12:33:02 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.16856.1708259580119781844
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 04:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=Q/ayNI/y;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 0D3B9240104
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 13:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708259578; bh=RuxJ1oL0dX9PQ0CqwxJneqiSrhs7lmYsZCRwEoAD5Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Q/ayNI/ysYbT2blzIrDEtnaGmt7yQJt7QGuAxcJZ0lxvHxrlLXcOKe0f8lr2dN2lf
	 noDhGTt4kNXqcs0+QkxYMPiDZxCp6Tg5G+WEU9pmbX1U2cF5hmnIjADfDdnvdueVdY
	 xgxgshSJ1vF8FEtu6HHirxMpt6Jer+D2XOCdqasKt5Fchz31PbcwygkBrTQodaleke
	 DZOpg0Hi87PuSZMm3r60HyDWjvlPcn0hiiRbzupH27ucLkS5/bC2Xj92XGznwBg9Dd
	 8kBlHi0OiBrpIEOJ6Ffqwl58UQQfSW0JLvLwpwPrdnwbrkXXV5kC8zfZf7xVyvWoZs
	 IhnqwR9pKQjYw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Td4nj1Rp5z9rxK;
	Sun, 18 Feb 2024 13:32:57 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] vim: upgrade 9.0.2130 -> 9.0.2142
Date: Sun, 18 Feb 2024 12:32:50 +0000
Message-Id: <20240218123250.1516996-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 12:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195828

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Changes:
https://github.com/vim/vim/compare/v9.0.2130...v9.0.2142

This fixes CVE-2024-22667

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-support/vim/vim.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index 6b440d8947..84af72472a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,7 +19,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
            file://no-path-adjust.patch \
            "
=20
-PV .=3D ".2130"
+PV .=3D ".2142"
 SRCREV =3D "075ad7047457debfeef13442c01e74088b461092"
=20
 # Do not consider .z in x.y.z, as that is updated with every commit
--=20
2.39.2


