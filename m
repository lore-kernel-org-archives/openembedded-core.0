Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 933C3700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:25 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 194so5493516pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=BaFTxTBwJCKLKsnQvewqtMXa42h+uSelFiVXzs0hk8Y=;
	b=f02xmazp11wCYccm5qfn77XirfMfcFHklYResiwVbBRpf5kM6ECfmu3LuKbh860je1
	mY78S15ghgWGH+L7lqHVgxsvheILbCIrlTtTMjkVXdPFjKlbuEojQac9HaR4mr2HdGDY
	psxpbk+DGlCQ6W7DruTtQHf+jUEXpOEz3sQV9aKtbavJOFISVMaDAOog8t4lF3oNTMj1
	zytsLGcTCwo+aYdh3sOMg1msQyhsqN0tg2ElzU4cT9wRhCIWatUcCqCZIz1KwC8o070t
	gZv+jUwnpKiZ4hw+SWuXQ87VqiUD4K4iFrVxJkrQXdMN6pAxliYasZ0EVWNFlkzpb9CS
	/5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=BaFTxTBwJCKLKsnQvewqtMXa42h+uSelFiVXzs0hk8Y=;
	b=tFDFEaYpyNwExj8XNY/PUMTo7BdIxAbrPPMucAc+cokpoK0RK44HfOVQbP2SFR9x4q
	NRAE3McyQxnlVUn24SquxRLxyxaroNnva6ykxRJTT4FLmV4UCKGrbFMJct23JjN9YWIP
	csBVoOWRSB5BRePVUlg0oEfimmPL7ISh/sNQ35599MgsrAM2kgyBJDyPbxQHhrBT+fBU
	NgtRn8bfTawqb7ll2aIX5VSHSmUEc6EP/bHbTw6kcwlrawFcQgMqKepgcfv59DNsALy4
	a3tPlf+QLuZVtu/fj43sSW/5agB09jSHUroUyisChCaGIY3FxPHJWT+pfhAW28rJdyWV
	SyXg==
X-Gm-Message-State: AIkVDXJOecs0CqAH0DUBzznFXwiT0z7U7oEWinFg5oVz0ILrMdiLvIdUPhy6l6iVGMeeQA==
X-Received: by 10.84.234.23 with SMTP id m23mr50368351plk.89.1484576246054;
	Mon, 16 Jan 2017 06:17:26 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	t21sm48262880pfa.1.2017.01.16.06.17.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:25 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-21-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 21/30] libgcrypt.inc: Enable nativesdk
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
X-List-Received-Date: Mon, 16 Jan 2017 14:17:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Enable nativesdk on this recipe.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 15805cd436..c8a48623b4 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -46,4 +46,4 @@ FILES_dumpsexp-dev += "${bindir}/dumpsexp"
 
 ARM_INSTRUCTION_SET = "arm"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


