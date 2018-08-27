Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6F7727937E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 06:51:37 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id s15-v6so6964917pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 23:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2k053/w+qqu8N/fFRanPuVTrsmwGHPQTXhmU/FRT8Rw=;
	b=Uzg+ZEQebfr8sGEYcMSL5G53RjW0gSItMy/vP2bAQpAh+2Kd2AAywisljZZjSv6PoO
	Ab5fYfDEf+9+JYKBh/Iuksdqb/w+a/BHj9EexgRJSrfQS+2DTtPpKywHywRAZ0YsehEM
	uSwitwfQ2Vlgc7t0l/VDzgKGE4l2nfuoKrs72YXASiZSq07pief2rvqnKVl0YbHFBfAX
	tsUf/McKcjPCzFK4cH1Tv0UMfd60xfBzkK41YhNk7mEeVvkwpXm2petSA5E8XisGKEfj
	TSPP2aMyGE72igXk419+w0+z/OXr+ri5vRuFpcC/ENBNTBakaxfEE0i+YxwnQ3BnByZd
	9XBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2k053/w+qqu8N/fFRanPuVTrsmwGHPQTXhmU/FRT8Rw=;
	b=Xw3ElZustiNsHvcyBL32tSPg0umsZEjdNGkT1svk7RIrPAW4rsr0qb2KEyEJYrOXOP
	csaBmUS9yljzw6MXZtJcrwFpEJCRO7DDMXJ5g1SZLrChPNgIEvghIviI14L8vbPRj4vu
	CXlx6CRJb2W9yJ2oO50zcL+kIMyISf07Xsmn6ODHqE10/8/PCDs+lA9WEX52Moj93qHZ
	AjgDavZWmus1bNTxw7ir1fc4mi4wIj4KPCh1N7aPjhibHpBGuRF38tBWUDdXvRVZ0ckP
	Yof7cwHFaXuynszhAh7k7wHOR94CleZyT4PxxqNIo1eM+mdFVdEU2oPMJ5QPfWfWg+6B
	OcLA==
X-Gm-Message-State: APzg51D/G4ltfLJAmCXtA9r1HOs3zgkqKwz0BMGWcoNhFVXfJwYZq9BB
	T34x49J9bSBZXq1PEvNsx3x/8Pn0
X-Google-Smtp-Source: ANB0VdbWs6mIX/G6vjfg9VqY6XSws5MkG2lgGuHMhp08WhZ17vPv5NdBoG7w0dhYDfa0k6MsaL9mQw==
X-Received: by 2002:a65:448c:: with SMTP id
	l12-v6mr11305808pgq.277.1535352698257; 
	Sun, 26 Aug 2018 23:51:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	l84-v6sm27437315pfg.3.2018.08.26.23.51.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Aug 2018 23:51:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Aug 2018 23:51:27 -0700
Message-Id: <4c3b9bb967d67a38f6418f028cf0b34e78b60d05.1535352523.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535352523.git.raj.khem@gmail.com>
References: <cover.1535352523.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] musl: Update to latest
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
X-List-Received-Date: Mon, 27 Aug 2018 06:51:37 -0000

Important regression fixes for mips and pthreads

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=1ad8138819ced49851e618c9c063aa0ffc86718c..767f7a1091af3a3dcee2f7a49d0713359a81961c

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index c13371014a..f4f156042a 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "1ad8138819ced49851e618c9c063aa0ffc86718c"
+SRCREV = "767f7a1091af3a3dcee2f7a49d0713359a81961c"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.18.0


