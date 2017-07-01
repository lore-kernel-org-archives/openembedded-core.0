Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9283878286
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:40 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id s66so20427982pfs.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=am+R9xClg4AvwRAZyaU+yMll9yRPDavyUR9PrHdGUhY=;
	b=ARxYkhKw5XbjabdO+k08AxWO7tsR8EZFPPayh2wTMcvAIsK8MnVLwEIvdgn11rr6JP
	dnW/GWX/ftM/rqlg0o82GrD/2Knk1QlY85KOeQCv7G/6ShPC6QKt/LFCOzy2bnMmxFRZ
	ya81vyFZOHKja9bXfAANDKoY7lFlfwjUH1QLc3EgQPRNZJasdVVsjY2jRCRLcySDCHHY
	fTyDwOs4+NhsD8pAOlBHmoONyyGPIqp09SEmyB1y4he5ig/H7bhdoCQ4/Hj0KNOMyDeg
	1ClwlcFmjfY9LzUi6K94skpSEUfRtEFFIFs0gx7Z1640w3yJEEG9AR8WLsuE0J6KetR3
	GaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=am+R9xClg4AvwRAZyaU+yMll9yRPDavyUR9PrHdGUhY=;
	b=QjeHiNig34KH6+JWqhDD3vAy95ZDEQ/+PT3CwaJM04Eo7EHDE/oN2chGkddOi07hKn
	QlZZf9L41bgYMiJNAIMPl7KBrZz0A+zvmF345w/7W+rwqG8XpqjM3hdW6qkuRqvvUTKj
	TAF4HHnNK2llyd3qQwpUN7jYgpV+fvgeWRBlLYVp9w47t/t2aj98Xx3EMXedJXGtSYIe
	wAE0Id6YUlp+FMcZsfwiqC40SHM68ZU77VbFqxvk+oC7V6wY6IwU8DK63PQyZ9RRjcy0
	weJehGB/3XWyq6kUfr8bzqKFt8Lqi/MSaqFkVz9h5seCkwKitj/5wT7t7Z4zqTw3PrCD
	4Ywg==
X-Gm-Message-State: AIVw113u9ZnXNVjZlSVqXtHisIty4HlGJ1tG8mlFZtArzq4XQhHN6yJg
	W1+TLnQ6sRq3kRmn
X-Received: by 10.101.73.72 with SMTP id q8mr1034654pgs.219.1498919021433;
	Sat, 01 Jul 2017 07:23:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:05 -0700
Message-Id: <8cf75474555e2d5e23d225f229ff2546cc897359.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 02/19] glibc: Drop obsoleted bits/string.h from multilibbing
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:40 -0000

glibc 2.26 has dropped bits/string.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 645be694b5..0281251bee 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -135,7 +135,7 @@ do_install_armmultilib () {
 
 	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
 	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
-	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/string.h bits/typesizes.h
+	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
 
-- 
2.13.2


