Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id EF44E78D48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 07:54:49 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x6-v6so265465pln.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 00:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=WOrCM+M0TTOTcQvHrfo0KHPf+8/xg4tMXLPyzQJfTS0=;
	b=HcCoq+HO5ZyfZQa8AwlNLYRU6TpPnGFtlNTfHN+I1G/l6cxZpQrpeXFl6eWiEYZca+
	00+K1BQcgkgcyoP7PChH9ygmeA5H1EQaLLS7qVGONQIPg1IfQvAcu6tJNsf02PwYX5cN
	verNcigKmBl5veEntCjy3OLyA8vPerw24YWG0t/pAydY9N1IQ5m1HbNpxJ8UIno6jKaf
	za2cOnIwgNBkd3iFggQg82IrqBuXr82vYtOQXI82eJJm6XThStsnEtV5OPUz3HE5PS6P
	SuT3h1Pl/GxVYO46YMRKwdtnwtEUQchZAKF86euXbgYpIJkGKkZztkalavc2yBdxCnTC
	9rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WOrCM+M0TTOTcQvHrfo0KHPf+8/xg4tMXLPyzQJfTS0=;
	b=Gdy8V+pRvzv6tYzgwlO1awV8X0HTrfTZM+sj9qBIrIqCcEmVi4P72Ds6ieUc5vVAen
	/WBotPgt/FleJkeS7WZ9cvCg1faOo4SaIzYBxyFOar1yvEy0QIyzdA4IHbDQqU9CgamQ
	JANRrAxF21ZrCmdycPLF+cgMZ67YHns1U1cUpecdh+qLAYx0i4Q7qYQ29eDPFKxxZVFc
	KkOa4w+xHASNQffRicTjh9zPjL3rJVF49cUwwKW5JQeGpUgFzUOGZSZTVFBMhlJHgzKO
	Hs8iSLZ99ZpEX1T9GUBSxWYya6qBLXP7NMwxQi70wkku5ttSbBl33+mURyynRGts8u4j
	Af+A==
X-Gm-Message-State: AGRZ1gLux2+7/6FzkI5Oan7jSJy5/3tDkCUnXEA5i+UskUqkDIACaQ50
	6tSAqCOknGJ8ThLnn9WhsunA9x3w8NI=
X-Google-Smtp-Source: AJdET5dkNhYtHD7u1zkPW/bFnOLayKOeuVt8HpuIafu5hcrlTx6OfFFd8JbYbeU4yM0TSdaiuT80/g==
X-Received: by 2002:a17:902:d209:: with SMTP id
	t9-v6mr914447ply.15.1540281290617; 
	Tue, 23 Oct 2018 00:54:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([109.144.222.79])
	by smtp.gmail.com with ESMTPSA id
	e193-v6sm866368pfg.127.2018.10.23.00.54.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Oct 2018 00:54:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2018 08:54:45 +0100
Message-Id: <1540281286-26784-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [v2][PATCH 1/2] gnutls: update to 3.6.4
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
X-List-Received-Date: Tue, 23 Oct 2018 07:54:50 -0000

Notable change:

libgnutls: Added the final (RFC8446) version numbering of the TLS1.3 protocol.
see: https://lists.gnupg.org/pipermail/gnutls-help/2018-September/004457.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
[v2]
Fix typo in version in subject
---
 meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.3.bb b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.3.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.4.bb
index 441bbec..6d2a11d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "d3b1b05c2546b80832101a423a80faf8"
-SRC_URI[sha256sum] = "ed642b66a4ecf4851ab2d809cd1475c297b6201d8e8bd14b4d1c08b53ffca993"
+SRC_URI[md5sum] = "63363d1c00601f4d11a5cadc8b5e0799"
+SRC_URI[sha256sum] = "c663a792fbc84349c27c36059181f2ca86c9442e75ee8b0ad72f5f9b35deab3a"
 
 inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
 
-- 
2.7.4


