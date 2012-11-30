Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXi-000664-IW
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:18 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so413161lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=43phPfghXA9Ti7ESjfrqD9PK4kn8vpMhIw8ohPdg6aA=;
	b=HynrblGslKLdjshmwcpWSYcm9JpYVwRS9XvUEa5Q/0DkZqbitRyp2BMM1OpcMJlWXY
	ZxupWoDVBBQauvgu6Y5IlcX7XR92zRkbbN3k4bA014EehwYzSzaoh+3CRtSuOGIkCvI3
	TDMcraB8rhoumIlShWsETwVrUnmyt4E5SxS/Lzg1YDOLsUaDgNYqyIAx8cWC4lvNhLsJ
	q04HXEGB6Lqwr23zZjgS/9e43GFfbw0dsTtD9wngjbgqOCjwFx2zo+mZIZvYGUwPw9ze
	XrSc2qVieBYYd2o1Gs0Mtc+DQFFXDdV8r2j0jV7krJXys4/93Ms7AgU+i1g+Gvo+ZaPH
	haAQ==
Received: by 10.112.104.67 with SMTP id gc3mr985677lbb.48.1354288563594;
	Fri, 30 Nov 2012 07:16:03 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id b7sm2205723lbk.17.2012.11.30.07.16.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:16:03 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeSJr-000321-Np; Fri, 30 Nov 2012 17:15:59 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:43 +0200
Message-Id: <1354288544-10778-10-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354288544-10778-9-git-send-email-cazfi74@gmail.com>
References: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-2-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-3-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-4-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-5-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-6-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-7-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-8-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-9-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 09/10] pong-clock: fix license segment md5sum boundary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 15:30:18 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. This change has no effect on
md5sum as license segments from the beginning of the file.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
index d352d87..360f312 100644
--- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
+++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "virtual/libx11 xdmcp xau"
 
 SRC_URI = "file://pong-clock-no-flicker.c"
 
-LIC_FILES_CHKSUM = "file://pong-clock-no-flicker.c;startline=0;endline=23;md5=dd248d50f73f746d1ee78586b0b2ebd3"
+LIC_FILES_CHKSUM = "file://pong-clock-no-flicker.c;beginline=1;endline=23;md5=dd248d50f73f746d1ee78586b0b2ebd3"
 
 S = "${WORKDIR}"
 
-- 
1.7.10.4



