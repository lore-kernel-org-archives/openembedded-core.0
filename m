Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29840.1793868251334589684
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=J70n6OJb;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so14565705e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868249; x=1794473049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=60+1FBrRI7HoA1zB+sUEvKEaMcydjW2JSXzgO0hRuLY=;
        b=J70n6OJbWtMsKf7IyTpMQ+gpjqPnVT7pE4Xvq+BQpWMUSmtLSNGnd1wqC3dG2GnpaV
         G/x1Q6ttUx2/t8Lovctvg5JSQYK58ct8hUXmVL9a0Rjge9DO3LK32khob0TxVYa02FWY
         UOQXNEbm8S9hpDyQh1xrW6FFIXcfp+HUIH+vrN0gWyJFyNe7Vw7pK/mc6VletMyujGka
         vN1+mHA9sb89W+cHXDECt8nxT0Gksz1oh/QdghjLZCuEZwi7hMj9/MtdkQkQYl4DpZz2
         R2h59kXdOCeHqdz7hG8Rb708cnplXXQz23nP1aGAa+Ue2xjhHwHmWcMQ03pExD0roXiB
         FZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868249; x=1794473049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=60+1FBrRI7HoA1zB+sUEvKEaMcydjW2JSXzgO0hRuLY=;
        b=o0BIHH/CFpJpCGJOUfvgnP617EoV3to/F3fvr/adhzkgLXC2eNBZ2OXEU4zFK3lnx6
         Y5SSATI9vTYgSZ5KW8wT/4jh0Re0lW1dMLG4GyNN7mf2ocIfR2I8MyeKuwXD9pa9hrtp
         JV34NZK5hFbAP86iX3qg2nVMmN3qHZ2J3p7R2Z36yC5bYJLOjYWfZepnqXPbdS7+VBzA
         TNFNcaRGBeKfdqzqdxJNpHY7ZMd4eESBhYQBLFT11nlR7A3iMuWddE9h2x9IPnQZY1HL
         itS0rxS8PLramqltFeMhwI2wtodGFaPpbQgoV5VHKgHk4g5BSlNvz5z8y4oKKF1nR9k6
         BIJA==
X-Gm-Message-State: APuU4Z8MD+Appw6dP5Amr5kkQE6X2/Nq+ucCemwQrcOcEkZsB4Ad0t/R
	3dzNXki0KLMV2ye2UdUBs0DKLq0QBOOGyC1KBQoNxRFgkQzFalLbAkYNVYC18ciRANNoMhdbBTN
	O95GmmFI=
X-Gm-Gg: AYBFou0b8rdzQs3Jw2YC6fo8PHo51cR532ZwKSq3T5zRwm57SYiYrhIAzBChKKxq+T3
	JBN90gTWTNgbzfmwzg7BU9HKau7ka6KezIfajy9O2bmxx6SzfjBW4dl5++Q/f8vWULvcWEwppeb
	cE3pxS187eHbv7VMlPzEh8fUW/d/LRO2P38u0r3yDR0Vx2+s6RC8LzXjg+7jHirkhWTwd+vNx4O
	CqGzpC8HmhUZgFzkD5fRnmAwm5X3p8GRDn/cETIbbXUVAZlOyfhMYv08NTcp5A6LrGCQVb9sCVb
	8biR0GioexpcCYCZQjVoM5xQwzxda8LMMycULI6/fY8lzAIJW6tu61PU8onZugMyviUmFPVnfS+
	dNYehHLgnoSq51YrJFCwHBwTjK98K63OVlrPLPV3JCSHFwnss45y7/M1ATlD/2arBc5VF+MJA5N
	I4qcQe2hrNaw8+XVp4S/oNl4FHI5DRkHy7pmocpebEtmLI/gt5hloz9uM36GGYQ0MeDlRfgCXmT
	DivdyHg1WjjED3iqqHDbRCG5hmQNJqdpaDVBuaDBw5mV+obnuXaL+tMJ5nYaTlosYzFxJczD9ac
	fEs/fhVDxiaia907KGIPMO96ehW+lOhIwKWMZRPMf6lBPidwjQOP0nlBmuBqN/d4w8yuTyFFJvc
	wn4V0C0IUMaqM33HYcKMgAYCFLXBG
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr401308245e9.2.1793868249477;
        Thu, 05 Nov 2026 00:44:09 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 60/60] insane: fix unimplemented-ptest error handling
Date: Thu,  5 Nov 2026 09:43:19 +0100
Message-ID: <31745aa71547d4559dad9bf41c96a143d15fa4cc.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249519
Content-Type: text/plain; charset="utf-8"

From: Maxin John <maxin.john@gehealthcare.com>

Avoid TypeError when the unimplemented-ptest check encounters
a FileNotFoundError.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b62d5e681741394ad90501a83a1c66b0e3ab7ce3)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index a4d17ccd2ad..721088a8f58 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1301,7 +1301,7 @@ python do_qa_patch() {
         except FileNotFoundError:
             # pathlib.Path.glob() might throw this when file/directory
             # disappear while scanning.
-            bb.note("unimplemented-ptest: FileNotFoundError exception while scanning (disappearing file while scanning?). Check was ignored." % d.getVar('PN'))
+            bb.note("Recipe %s QA: unimplemented-ptest: FileNotFoundError exception while scanning (disappearing file while scanning?). Check was ignored." % d.getVar('PN'))
             pass
         return False
 
