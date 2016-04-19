Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 806B76013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 23:51:06 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id fs9so11407848pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8cvZ0+z4cVFjrjJO5LH3oVRIKuQbvGgA26j1jrXFHfc=;
	b=rnW8iCM7q7CUskJktYtD23X1F7iKA3YGkkgnti4AXB+/GHEsDwWb+MZUfcAtTYWJGg
	l6APbpzAOx+klnj0sOowhmJSwy/jvaJh3NQEJ9h6ZDGQemuyzbasToB8z78zPkeVwwnj
	/K53RFdxAIdZrLNiDEu1ONBlJGqCPs5LnkAIxJ6K2DX+3+vSD5xQ839u2HWRnhiR0osj
	PdIMOHp2+z+xfi41vFmRZqx5pMX2YA9LafvdGxLuvdwdonrvL6t9EbaBpcSJOeFPK8UP
	OXQs4YQM0eu0h+oERmToKFzxOw9GH8qIaL5XY5/EduLhBrfo0EwuFZQbpqsQz2GhHJQw
	ll8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8cvZ0+z4cVFjrjJO5LH3oVRIKuQbvGgA26j1jrXFHfc=;
	b=cOsygDzJ1AebL/A8sbpjpVoprfG5pVyKgqUosZhUE8oZZAX4KxZ7khBVfiDAFdtGNH
	v/j60/qDt1EvBeYbApeGR6yIBlpP8tljo8ZSzMrKdiX0LSLRF8EKBJ79msp3OeMEq1Rc
	GdOj/EmcJd5V9foc7cpdC87BBpweqdbt9opYXXDrtZK3O2XucotB4hHmsostqaMlaGSU
	Fa+LK+CcvLznXH6Lhuy2+d+PptDTWkAZ5cU6WEOSzFcJWWLWyYUuGPwW6lJV1yhI63+t
	Hzs7SF9xn5/mbd/1cFKOM0nuiOhBfyM5rSj/7ui4hKlfN+XBHJ1/1YhYF/7kQJfTH7fa
	Z5pw==
X-Gm-Message-State: AOPr4FXMgmdNpCrxSpcPTQCJYeCT9FgEn8+4h06mUWeCcDz5vnRtfNXxaEdO2InoerBHYA==
X-Received: by 10.66.254.74 with SMTP id ag10mr8004828pad.106.1461109866694;
	Tue, 19 Apr 2016 16:51:06 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	d2sm53393632pfd.80.2016.04.19.16.51.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 16:51:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Tue, 19 Apr 2016 16:51:02 -0700
Message-Id: <1461109862-23840-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1461109862-23840-1-git-send-email-akuster808@gmail.com>
References: <1461109862-23840-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH][master][krogoth][jethro][fido 2/2] tzdata: update to 2016d
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
X-List-Received-Date: Tue, 19 Apr 2016 23:51:07 -0000

From: Armin Kuster <akuster@mvista.com>

Changes affecting future time stamps

America/Caracas switches from -0430 to -04 on 2016-05-01 at 02:30.
(Thanks to Alexander Krivenyshev for the heads-up.)

Asia/Magadan switches from +10 to +11 on 2016-04-24 at 02:00.
(Thanks to Alexander Krivenyshev and Matt Johnson.)

New zone Asia/Tomsk, split off from Asia/Novosibirsk. It covers
Tomsk Oblast, Russia, which switches from +06 to +07 on 2016-05-29
at 02:00.  (Thanks to Stepan Golosunov.)

Changes affecting past time stamps

New zone Europe/Kirov, split off from Europe/Volgograd.  It covers
Kirov Oblast, Russia, which switched from +04/+05 to +03/+04 on
1989-03-26 at 02:00, roughly a year after Europe/Volgograd made
the same change.  (Thanks to Stepan Golosunov.)

Russia and nearby locations had daylight-saving transitions on
1992-03-29 at 02:00 and 1992-09-27 at 03:00, instead of on
1992-03-28 at 23:00 and 1992-09-26 at 23:00.  (Thanks to Stepan
Golosunov.)

Many corrections to historical time in Kazakhstan from 1991
through 2005.  (Thanks to Stepan Golosunov.)  Replace Kazakhstan's
invented time zone abbreviations with numeric abbreviations.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016c.bb => tzdata_2016d.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016c.bb => tzdata_2016d.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016c.bb b/meta/recipes-extended/tzdata/tzdata_2016d.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2016c.bb
rename to meta/recipes-extended/tzdata/tzdata_2016d.bb
index 5eb85b7..627a31a 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016c.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016d.bb
@@ -8,8 +8,8 @@ DEPENDS = "tzcode-native"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "0330ccd16140d3b6438a18dae9b34b93"
-SRC_URI[tzdata.sha256sum] = "8700d981e6f2007ac037dabb5d2b12f390e8629bbc30e564bc21cf0c069a2d48"
+SRC_URI[tzdata.md5sum] = "14bf84b6c2cdab0a9428991e0150ebe6"
+SRC_URI[tzdata.sha256sum] = "d9554dfba0efd76053582bd89e8c7036ef12eee14fdd506675b08a5b59f0a1b4"
 
 inherit allarch
 
-- 
2.3.5


