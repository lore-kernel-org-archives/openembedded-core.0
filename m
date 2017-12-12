Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id C905C7889F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:23:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id f12so13856235pgo.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ju77SGLQhbRdYlSQBWQ2GVKh+kwM04uIkJFkWW7J640=;
	b=c3qIituEysRTOsaxo4qgfvPyskN35BN6ICI9cDDC9yxth9DVPu78qTqDnpDp+tYojy
	svQkeMrX77S48+aB2xLlk7R9wcQbrPsSb/m9y9UvSYQA35FtX4aaXIsJLGShgatsiL5u
	XCAS9atPWtt/PMFmFpruGhDV3p0TtjvctPQXwyAc0Ev0fjAWJou2qzOWBokZFnmVu5lx
	ZOIitRTKN/N46zvxj0qlk+kqZMIrrQiDIKj7RHvgNnoCYX3meyxe/D09Ez2Fwh6GYtLq
	8FzHzdbyhXWy9poLltmFztEzgmgHFROKqvknyYcnDQSlbWOGfUWdlkQdCopGGzvedTtt
	Ahdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ju77SGLQhbRdYlSQBWQ2GVKh+kwM04uIkJFkWW7J640=;
	b=cTw/Tk7HVpmOl+EvdVeGvpVAEx+Y3N/gLVLuk2W4pk3HWaOGusxz/gydExFzzQzK1f
	gzVSJTpqaZJSkstOaFzQx8VEYqT4MQTKC33j+Lr4jm/HNPDGRU54ckEdLn1WmwLiye7H
	74E3QWnSUSssl9MPUteA0xpgbtLQbZEF72qV1lnX02Badb+HAfgIzBFbqxiFTFelq6hK
	FNpqNjY90oMVRn6HRr1PVP1Df9EYwV3RyLRW43t7GZZwH9rSPDgR3Zxk3T0qbBB7oYFr
	rf0nRG0MF7jKn+RzS9FbfxKS8+u3XdxL29E14SkilIr68w7uUrzk7SatPrX3V96cVmgl
	yL0g==
X-Gm-Message-State: AKGB3mKldltcg+zdGzgzQd65HJufj9sVYwekP0PcA9VOweF6oabCc4R5
	s3tgJo+5Zrt2nSOffOrFWVOdGg==
X-Google-Smtp-Source: ACJfBotYtuc2JQp5sEiusEGk1jUO8pjSTsuMZSNZguFdRkFGTPr6tmRwaA5LbDIb1vxXXCYFFY1TNg==
X-Received: by 10.99.186.70 with SMTP id l6mr2620518pgu.253.1513099411771;
	Tue, 12 Dec 2017 09:23:31 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id
	k197sm18790329pga.42.2017.12.12.09.23.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:23:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 09:23:14 -0800
Message-Id: <20171212172317.601-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171212172317.601-1-raj.khem@gmail.com>
References: <20171212172317.601-1-raj.khem@gmail.com>
Subject: [PATCH 6/9] musl: Update to latest
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
X-List-Received-Date: Tue, 12 Dec 2017 17:23:31 -0000

These commits are added
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=eb03bde2f24582874cb72b56c7811bf51da0c817..4000b0107ddd7fe733fa31d4f078c6fcd35851d6

Key fix for malloc
https://git.musl-libc.org/cgit/musl/commit/?id=a71b46cfd289aa0ff829fc9a436c59c398f8326d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 932c9a27a0..edfaa07eee 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "eb03bde2f24582874cb72b56c7811bf51da0c817"
+SRCREV = "4000b0107ddd7fe733fa31d4f078c6fcd35851d6"
 
 PV = "1.1.18+git${SRCPV}"
 
-- 
2.15.1


