Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8D20F7E95A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:25:01 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d18so3414082wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AaW8hASMsWphRH4oACE+lG0IGMtPowwfauA9IPqoNH4=;
	b=JeATPLrKzIaCVfaonmuiwXOdzoHlq22NpwyJIw1Wcy26yyvEmMJvyojR+AE2elQ2zn
	1QYryPY5ntOFY9BlIv/zkbLHatwgTVChIKqVgnTuKGeOucoNOiPwiQd77+/TnFVZhw00
	AJyRrqE51LvcY3W+YWIJxAwBqPInaKsPufcU0/rDQyjZnq5EuUGT2nPbMBQxWT1UTQPk
	w/yjPkmpIh/CTkwAF9rG9/+m/D4RvBSVngYid8SdULhJmHcOYA71RRtcuiSp1j9toIaL
	TcXxHcJ+eBNjPAtHtBA63DAZtlmc6MwogCKydZCTcqaRqHefommR4Q6UscFwbyEkA+4J
	iq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AaW8hASMsWphRH4oACE+lG0IGMtPowwfauA9IPqoNH4=;
	b=Ly15ixCSaxXMbiT9+6NnMuF84Xq3zQX3vaUI5lw86oB/ffiY6IT/IIEE2a/UVBR4lG
	rE6m6KpNyccG2JYpoeZ9j4GP64VtkvLiewWb6BR2rv/OHqZQ9uiNTVNPYgGa72S/S2LS
	/qhdjJ80/3+fYFbmdO4uq58DdXTbD/C3tWa6RBeeY9iZdAuvOHSXG0zGGU9kJO3vXQI6
	l/vq6B/KmwTWM9yq7iWmmuGPCRM9vWkcRGukC//hPWK8iWaeKjF/BuZYCj0jXOKb3GwT
	FxpjJHaKtObfBEMzhGfaMzHELBRl7jhrpo4NykA0Ri56cko5z1Q8XlgHkJMTcB19sBDi
	DFbw==
X-Gm-Message-State: APjAAAXgG81VgEZTBp5zWQcIlYf/NQbtbHopZZB0MTYHBN872RogTHTE
	j95//4FsHCihigd8cR5tTlfk2SMPUAY=
X-Google-Smtp-Source: APXvYqzyFB9j58jElLruLjY80hfxWTB/kC1q1CM5BaHala8xNAvfksjFw0h6e3fxLQjFQgk9txEEpA==
X-Received: by 2002:adf:f909:: with SMTP id b9mr55116472wrr.119.1560950702139; 
	Wed, 19 Jun 2019 06:25:02 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q1sm1588953wmq.25.2019.06.19.06.25.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 06:25:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:24:45 +0200
Message-Id: <20190619132450.130226-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619132450.130226-1-alex.kanavin@gmail.com>
References: <20190619132450.130226-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/9] libmodulemd: upgrade 2.4.0 -> 2.5.0
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
X-List-Received-Date: Wed, 19 Jun 2019 13:25:01 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index d4ffd281b5f..7e8aea7be3a 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
            file://0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch \
            "
 
-PV = "2.4.0"
-SRCREV = "d0a3eda45e083e8fe8b329a2310a53abdbf1e4d6"
+PV = "2.5.0"
+SRCREV = "8d9a99ddf037df7c032119cdd3a87238a3cc9090"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


