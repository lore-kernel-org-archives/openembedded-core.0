Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE577E323
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:16 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c6so10777985pfa.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MuX7omvtKjwfRjY8llkk0gEtDPMeYlpGCldHLs2C1hw=;
	b=E3CG0X30+sAnxghAgULh3IY1+Uj9zVPR0eygPZq9cpPiU3/x82W4kWjqTrFZUL1pFk
	4bu0Jrjcj+uEa1JeV/AiJoy2D1nHivlnBHXjtLIJ53KqDq7lIYKiKzENa1+JD7Ig3iUh
	f6Um/1E0g4V0n1BMtkga8mkzUWNKSLkdR+7bVgwdw0LQETIyzVOUgrZOfu/ZiM6hZAPT
	oQWvugMnkoNey3sULp0/IPngvOsmKwU8keVablHQ5Bcsxdp1eK2kIE/1qZOG3Fnef/9u
	QO7EqzVtlr1JGCbnU/NauOGxJzrRr11ASapqaXiGPysh8ImCDIxLWCPd6HAyjZx4YfVg
	ynUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MuX7omvtKjwfRjY8llkk0gEtDPMeYlpGCldHLs2C1hw=;
	b=oz+oMQj6PI8RrxTlHa3p04olSK22JIXWur6Y6CsmRazgPvz2yva6pWy3mYIfDln+YM
	U1QwiOxE3d+h8PKkIA+1XbxRGBk0NkxQhcUJzqPUbXem4tPXu3NL67r1aLbm3JkykVWR
	9/wbjL8tS7c0GYG5rTbmBZYm8jhCuQv8B0Uq9n36F+Ya3WapVud8iQDOXQjMaDKqyVDg
	JlOtR0vb8sjFvU6fwsAbgDhWkRJi87xWlJ5KWamyERHUPfJ2XB/bZegRJ6kuAcjJkvBU
	A0VTwbfq24kpXya/1tm6+ZINfmpT30VE8geAWnOujZs42PU53ARzSjCjssD1no0i4CLi
	QRAA==
X-Gm-Message-State: APjAAAUr+PtfBsrEu+e8nEKCClM0tpQixsZA50xbT2/171O5WTMDtu0T
	EaO9kv013Gu2A5ONGC+b0BFirvM6
X-Google-Smtp-Source: APXvYqwXi4EEsJkoBqb6BUiTP58IMeAWkdh/oso5TfRBiKTItn20AsGb8S3h3GHT1/ANvDwphQWmBw==
X-Received: by 2002:a62:ae16:: with SMTP id q22mr17441157pff.164.1559574437464;
	Mon, 03 Jun 2019 08:07:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:53 -0700
Message-Id: <3301846b009818f3d2150ae045dd6878f1f8c586.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 10/21] glib-2.0: add missing libgcc dependency to glib-2.0-ptest
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:16 -0000

From: Ross Burton <ross.burton@intel.com>

The thread tests need libgcc for pthread_cancel to work.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 574bb38..9ee0e63 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -144,6 +144,7 @@ CODEGEN_PYTHON_RDEPENDS_mingw32 = ""
 RDEPENDS_${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
 RDEPENDS_${PN}-ptest += "\
+            libgcc \
             dbus \
             gnome-desktop-testing \
             tzdata \
-- 
2.7.4


