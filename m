Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1DA7F89A
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:53 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id g6so8465236plt.2
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XKPji6M0rhJQkrhg0efpBpgvZ8XAe34bP83Dj8zwtoY=;
	b=E3dqVjbhYYtAcFQno2neabdIAAY7fSBE/iHSzDzixFDJG+8ybW36rBZxlaBo9NN+nd
	okYM0ZLbvnLOsFVtBKrjdqy+W/7kWd9Ac3aTUu3LJEJIcKlarLNeXTEFcKlYjnJ0W/JO
	C8pyVfWlPGux8zRZYh12OHBDl3pnKmnpHtxTtsQ+8Z8zac8n9qOZXip7J+6DsgaEr3G7
	NwMUDUD7iA8qNQ9j9erMsGkjVhu5E/P60IVJSWgdU5Yy9RnyKTEufmd/8XGUEhnglmC6
	IDcRUWHZYsFI6j7M2Q7/r61fjVK8Q9/gDNaVFyjs/YDk2nlXm8m8zdABcRrN3MVb1EPK
	UAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XKPji6M0rhJQkrhg0efpBpgvZ8XAe34bP83Dj8zwtoY=;
	b=qaxHbvZ8OAguxumgRVpzzKVfSshONKAwcEV+kFfusG2Zx6YFfSy7XHMwz4JjSAuGBS
	m+FjZyROb93N9nB2pf9pdHhUr7Nj6k8hzIuZsQd5u7bdQiuZCeng9mnLuYbLV+kZdwN9
	gyc0C3SjoXhHKal8godbpfDD04RN7jR348koDG2MZopk84HwiLr7Zhgum7pTXne53CF0
	GXSM7kiXFFgSDISQssakgGz6eahbT+7RUxGWgTOUF4Z+rFCSMrMqh1rDZ2iT8dzUJsFv
	sxtWMgn9CfM90c5EaCnWjF6Jw/2x8Cp8W+m8nCz1tAOlY0qw4t8IPvpDX2gRWnGc9tPZ
	69Aw==
X-Gm-Message-State: APjAAAWg8Ro6UT3OfPhwtJmmk52C6ZWyRDtrohb983ah8WErvpFPrJGN
	9zeaY+Xul6rNodwIS7GRHpoqwQio
X-Google-Smtp-Source: APXvYqz1Drm0yP1c1s4cTY2eFK+HzoNKY5yKiW83APUEowAgsYbGCfBWYa8eFCMYhqwdT5yiqCTWDQ==
X-Received: by 2002:a17:902:be0c:: with SMTP id
	r12mr38961770pls.148.1579188053879; 
	Thu, 16 Jan 2020 07:20:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.53
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:18 -0800
Message-Id: <154e286042c289cbd225ba82aaf1247714aee857.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 09/32] ed: set CVE vendor to avoid false positives
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:53 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/ed/ed_1.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ed/ed_1.15.bb b/meta/recipes-extended/ed/ed_1.15.bb
index c79310325f..886c3ddcab 100644
--- a/meta/recipes-extended/ed/ed_1.15.bb
+++ b/meta/recipes-extended/ed/ed_1.15.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
 
 SECTION = "base"
 
+CVE_PRODUCT = "gnu:ed"
+
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
-- 
2.17.1


