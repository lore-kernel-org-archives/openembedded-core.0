Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C58C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 16:53:13 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.21535.1708275186402780734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 08:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=mFn6Dh9q;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2F242240101
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 17:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708275184; bh=kMnBlp0Xq5s48G35iUtUa2nV0tcb0IYYbvsJbJl+QXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=mFn6Dh9qIdPX1HjhyXqtmDStJG9mKi7LZVd5k/fr3eKbQiDIjwsyzvTAvNH6mzv4u
	 EWutUjYpdg3f57g2cS8/sCuwM5zCncEzi4JxVigb9lHBZEvg3BUYfm/Tu4vrtKSS6A
	 15Kcpt0/IqYE2t8DJbrXvLIdORWXUfGPrOjjn6eCeWoed1sQmYt4lSoBIsBmosF8/E
	 OEl3KRECnYpMK751veRAP/9/2RZl3BLnzH1NDagoP2wKjNx7ZzfFhVHrSXv1e8gqRN
	 b4XbFyA0AjqcOl3DYLgtzH8tFFNXyJD7rm+TPFS41fBzLhHHZe+HsFbR9EfLlFDl8+
	 4VvKVUX1gE1ig==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TdBYq3PwGz6twG;
	Sun, 18 Feb 2024 17:53:03 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] qemu: Set CVE_STATUS for wrong CVEs
Date: Sun, 18 Feb 2024 16:52:56 +0000
Message-Id: <20240218165256.2804353-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 16:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195837

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

All are already fixed in 8.2.1, NVD was informed that cpes are wrong.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 5d953e5ef5..233652fc49 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -68,6 +68,12 @@ CVE_STATUS[CVE-2023-0664] =3D "not-applicable-platform=
: Issue only applies on Wind
 # As per https://bugzilla.redhat.com/show_bug.cgi?id=3D2203387
 CVE_STATUS[CVE-2023-2680] =3D "not-applicable-platform: RHEL specific is=
sue."
=20
+CVE_STATUS[CVE-2023-3019] =3D "cpe-incorrect: Applies against versions >=
 8.2.0 only"
+
+CVE_STATUS[CVE-2023-5088] =3D "cpe-incorrect: Applies against versions >=
=3D 8.2.0 only"
+
+CVE_STATUS[CVE-2023-6693] =3D "cpe-incorrect: Applies against versions >=
=3D 8.2.0 only"
+
 COMPATIBLE_HOST:mipsarchn32 =3D "null"
 COMPATIBLE_HOST:mipsarchn64 =3D "null"
 COMPATIBLE_HOST:riscv32 =3D "null"
--=20
2.39.2


