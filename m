Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 179EA7C041
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:36 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z5so23204798wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eI5QkjwbXwyfbKLWjUDk71LDmKlr9z3nWpylilySvuw=;
	b=KbMpr/HhZ8fy87LjwRXl1WgbMXOUulis70F3oJjlT4EL0SM3X8HW9bp7pF5isfaup5
	Pqoxx3yc3Zcoxr85N0dBcLnwjPO7e30Nfs65qLzr3n4rVylVyahtmvfXCwMzxPa8SGZB
	TGNbfOe624g02banJyo0qfyHwYy8wxRJHNZ7jEOUadQiOT/14xt4nPdv7SSECLj6Mg3I
	E3yKI72HBN7salXxNZQO2Vp8ZZb4T5M+C3ACeN7VN4xlAym7MQuCNf5TX0eUNrdkQPsH
	qowce8iXZgvwXDFiBJtVCW01iqhZs6JUEmV1GraUPbN2RfoXNI+/jPAEFj94zL4Yx29R
	KdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eI5QkjwbXwyfbKLWjUDk71LDmKlr9z3nWpylilySvuw=;
	b=oSBVnp+ncJ2TGN/0ig4ooNdP1eoCRP0QWIcidY5vcsvDWkljxpo5c9FK/LEz/lD6JJ
	2wDkIcYI+9t3MBjAeTdbSYO0eoO0n44Bgk72DVTKIjt+36O52Ar9007CfktAymXNRere
	Ifr8091bLHp70ynV0RNfG4s5saKKlW7EOAIX7fPoCscjQp0Xi+lT+dpBiX8Mw2bD1a92
	7gA1rvYJuo8ocgM5j+NHqqfuC2utaCFM+eYLU5NqiQgyC/2rpx5t5u2OKjFxrWsWx9w9
	6yHbdq+uF4+li56/AqnolsljZB2ins+PqODCuyC9kQt1HaOb+EPHJcx4EOAAi0++ooTs
	19xw==
X-Gm-Message-State: AJcUukd1NdrCV1/hPCuWUKq+rRI27o2FGYgibi//sfxW5jPCGN90by/E
	uHdoepBHGJcinJy+aSJX3CwnNF+a
X-Google-Smtp-Source: ALg8bN59MchAWi1fDXLsO8JMPIMCNAyPajO4YEuwZ3LWJ7aocPgWIHOSWHTFh9dG/8m170MnmwrFcA==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr26086983wrr.67.1547478216535; 
	Mon, 14 Jan 2019 07:03:36 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:08 +0100
Message-Id: <55c6e394f9668f9b1bd5b426d557d39581c0ff42.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 12/23] mesa-gl: do not enable nativesdk variant to avoid clashes with main mesa recipe
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:36 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
index 73267eb4f0d..030db6c1440 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
@@ -7,3 +7,5 @@ PROVIDES = "virtual/libgl virtual/mesa"
 S = "${WORKDIR}/mesa-${PV}"
 
 PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+
+BBCLASSEXTEND_remove = "nativesdk"
-- 
2.17.1


