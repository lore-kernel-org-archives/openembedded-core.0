Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EB0C77B7C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 16:42:38 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.1046.1751474543598974422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 09:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=1984.ea087b header.b=JbDVzfeT;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id ECF87240027
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Jul 2025 18:42:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.com;
	s=1984.ea087b; t=1751474541;
	bh=yGHeGKmWeurdh7MWXTNWYLlFcm15XecvtM0fstVJX9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=JbDVzfeTY4/bnrSPSkVFIaYNLYfNp0q0yd1rlrfrxTJNahi4vO7ckpkcDAxoSqNy6
	 Mn7bWjpg1878MjnY3euHgO7lSyX/NqEvRBgJi+O0TfKJBX+7tb4jlCNvyqvr1rtUxl
	 y57Y7lzRQDwSedMMM7CKh7MKxGZzEzp7ixgGX0Jd4ylWHpk8IafAz8YVveEPECXHu9
	 8GaqaNchRGmho8jpaY+Z4IFxKRwTgUsFeLRPIXyOkTmuhawb2LojzuiVbIvfNgGSYa
	 4AIB7UfKHs+huYeBSRqWWQypsW2INU3fZlU8+C67rJO2wUTanGkaGiU1rHBVDfZZs1
	 RHkI6UeTwDG+FJ5TwxxMIto6Z97xHmMWy8qvBcQghpeu1lkdychpXHn1qRjraJaRBU
	 NsBrzEHWXS7bittw9ZU7rkW+ni7PkWzmyMrlaAtbdczMqYvzP+Shzq0G91KacATHoE
	 PDuUq6AWro6kcwqEGeOjmIbOCEHF8fnLLs0YmAuoq8hwDhubYMt
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bXQfg59wbz9rxL;
	Wed,  2 Jul 2025 18:42:19 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] libadwaita: upgrade 1.7.4 -> 1.7.5
Date: Wed,  2 Jul 2025 16:42:12 +0000
Message-Id: <20250702164212.11123-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 16:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219850

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Changelog:
- AdwAboutDialog/AdwAboutWindow
  - Fix a leak
- AdwAvatar
  - Fix custom image size with GTK 4.19.2
- AdwStyleManager
  - Fix loading font names when debug variables are set
- AdwTabOverview
  - Update window radius
- AdwToastOverlay
  - Fix a critical when showing a toast while hiding it
- Tests
  - Fix a leak

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../libadwaita/{libadwaita_1.7.4.bb =3D> libadwaita_1.7.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.7.4.bb =3D> libadwait=
a_1.7.5.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.7.4.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.7.5.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.7.4.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb
index e2bfb0984e..e8a8d21f02 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.7.4.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "a012bef97ac0d726b969b18099f75fc5eee9e92c=
012af9672b827350d53ae970"
+SRC_URI[archive.sha256sum] =3D "c2c1813c967d45c0f49e907f8c26e66f68fe49de=
c6436e2d3349350ac9efbd2e"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.39.5


