Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2A66E788AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:32:11 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id r19so6271451pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 20:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ivfTfNk0dewXpE6/QxsH4XG9P/7CQ6dmsDylpmSrldI=;
	b=Cwm8d+dhe7Fzn/gVQPFyg3m1DcvUF7pNdzTDJ+PC1clpCdmOa6uwlQgG8iqh4m3+kX
	coO39bADIGjcW5/aSRHQqGMCS5j8GKk/aPiYjxFCHi3PfWkV05rjTQQL3v6TZjvQFa9O
	szED/RHSs/K81+6jumiOP/Nz649VdyIGp4YLYcSNVl1EOLI7mAVLanJdrqp/jTBqbtGW
	TESIieF7pn4LeO43J9ujZTHw03CUCJ5tFKw/GP9Jye7xTWfxrdUewSaVTeCHGx5Kjeyw
	g3HjqaWzi6ljzkF8Eqrl/Jvi9yIWcdomeIllYWmEa3wkeKt65nau/wCwi0BHZNbDBIlX
	Y1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ivfTfNk0dewXpE6/QxsH4XG9P/7CQ6dmsDylpmSrldI=;
	b=n/CrsR/MoUByN7XcdqqNL3gwLAm83DkvvPAL4nNMcOh4vPW/hHGTFKFR/YbadtATOZ
	UWVIZ7g7T/p5kslrtj36pj9rqaPZNxXqnkae4JYBpdX3jsit6Vf3Ge1WtgyTyKFc/KBX
	5CMImB7J3HfUg+GFpyi73mH+c0QeXjePSKTdCuz/cFpx/FLmi9hWDWLQlnF2Uh5nU4iv
	rzWeNrcLsly2HVuoHsScCn+kmWyrawC2krYj2qrfacZ0ClomeOrB2einG0m4MKEXWZYP
	n7tTc/1rIIHnf2LhdnEBE61VMzQlaimcUPgqNmFkhXZkl0gKPJqz5zZ2HdNiHMEC0I9U
	7Ccw==
X-Gm-Message-State: AKwxytdelG38uD3qqYYfWqwYmgcSNetJs7VT/rpnnWI4LtBOjtA5EkQU
	Df8crjehFX0Z5puUlOfqdP7Okg==
X-Google-Smtp-Source: AH8x226NOsbYgORkCLhqUuwBgTj8MyZtYzwmHq4dlQmykWshmKNmXs3nTGMkH+AXwrgU5u69SnLZ5w==
X-Received: by 2002:a17:902:8f87:: with SMTP id
	z7-v6mr23893595plo.242.1517286733100; 
	Mon, 29 Jan 2018 20:32:13 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	u67sm1134233pfd.169.2018.01.29.20.32.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 20:32:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 20:31:55 -0800
Message-Id: <20e7a9c8ace0a49ec783c3d31414ce0bb3fbef22.1517286478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517286478.git.raj.khem@gmail.com>
References: <cover.1517286478.git.raj.khem@gmail.com>
Subject: [PATCH 7/8] musl: Update to latest master
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
X-List-Received-Date: Tue, 30 Jan 2018 04:32:12 -0000

The changes are
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=4000b0107ddd7fe733fa31d4f078c6fcd35851d6..628cf979b249fa76a80962e2eefe05073216a4db

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 04ce5bbb1b..8b2cb4d49d 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "4000b0107ddd7fe733fa31d4f078c6fcd35851d6"
+SRCREV = "628cf979b249fa76a80962e2eefe05073216a4db"
 
 PV = "1.1.18+git${SRCPV}"
 
-- 
2.16.1


