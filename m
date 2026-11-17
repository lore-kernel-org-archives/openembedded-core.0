Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15019.1794912319785361079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=x9R7r43i;
 spf=pass (domain: geanix.com, ip: 79.135.106.113, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794912317; x=1795171517;
	bh=FyeofL1baPHZT+jrIV0PzkCYsD0+ohmLw+9Dkln3J7c=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=x9R7r43ihkgKkvq+ULBvc2ahv63NuGxtMs30FvO/EUwI+F1zhd+/azpb3ttWNJ+kG
	 9wxAgSc6iDgkk+PUV8I65Of67T6AhZPJtJaw8MdPANA+hioXkpXY77QNmB20av+1GW
	 LxJqjg/f90KXcFy7Y33R9jsS67vQRbwrMuONAp3VMZ+XLfIzJZ7d9hHUF4Wpb/GdUz
	 ZEvlTPksfP5R0fM8QJdfwqan7+lu5ttlhltyrBR9Oy5xjEQU7Mm5yuBNbSI+zbqnjZ
	 6skA9KuK1SQLhx5JpseZFklkE/ZHVYFB6OOq1/aFy80f4/zVYKbt8TX/wrDvVsCjuH
	 gKtkYwUAdEh7w==
X-Pm-Submission-Id: 4jTLwW6sG1z2ScMt
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH] gstreamer1.0-plugins-bad: add pango/cairo deps to analytics PACKAGECONFIG
Date: Tue, 17 Nov 2026 11:45:10 +0100
Message-ID: <20261117104510.3873679-1-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250422
Content-Type: text/plain; charset="utf-8"

The analytics PACKAGECONFIG is enabled by default and analyticsoverlay
requires pangocairo, but only the ttml PACKAGECONFIG declared pango and
cairo. Removing ttml therefore broke analytics. Add the dependencies to
analytics as well.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.28.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
8.9.bb
index 493acacb26..7b4873675d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.b=
b
@@ -37,7 +37,7 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'rsvg', d)} \
 "
=20
-PACKAGECONFIG[analytics]       =3D "-Danalyticsoverlay=3Denabled,-Danaly=
ticsoverlay=3Ddisabled,"
+PACKAGECONFIG[analytics]       =3D "-Danalyticsoverlay=3Denabled,-Danaly=
ticsoverlay=3Ddisabled,pango cairo"
 PACKAGECONFIG[aom]             =3D "-Daom=3Denabled,-Daom=3Ddisabled,aom=
"
 PACKAGECONFIG[assrender]       =3D "-Dassrender=3Denabled,-Dassrender=3D=
disabled,libass"
 PACKAGECONFIG[avtp]            =3D "-Davtp=3Denabled,-Davtp=3Ddisabled,l=
ibavtp"
--=20
2.56.0

