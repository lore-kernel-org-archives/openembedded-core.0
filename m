Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 74D1D7DF46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:09 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d9so1840309wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JwFvjQ39cG8RQTRao1mfkM/IXiB6okM5u41ABHs8JUA=;
	b=V7YRVf2TgrRiqNSUii4NB0M5m59XsfKR1/d2dJpQ/frTLwH6+GNrwyyWUl4PfQOJwT
	epJg+TwgufSzb1+hhmnlfPnWlyHCRrfZoBGtnCa7VEuaD/2V/0dInyaEx/Rip+OlAObo
	R8BY8HNNwNjjWr3OOR3vyJAYrev13vyfNtyBJy/CdB9H1prbv55qIKARC2FwT0n++vIN
	DZB4RjDq6nw2iV+mKeugta7O8J5tl8641br9N+AuPUsFT2oCQfsglP9/+6c10IV7OamR
	NF/2sWecApN4wy04NofsihOL+plSL6Pmv/2eyWCPAFe64TLv6DFa0C10II3LrlFnawW+
	THEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JwFvjQ39cG8RQTRao1mfkM/IXiB6okM5u41ABHs8JUA=;
	b=nrH0NmMID6ahxLUqaJRuWOZBnfEdS9f49jdY7/+HH7osc+AMElc/YNEPfy2MzmGRwI
	lVYVnRuzlDIn9jdZ9uN87fKZpIxBCK0D+twao9K66eIP2Ru5ZK17vD5zXd53Bf9khLw/
	5zZwgH/A5xatu27QFQ7nKHqo+swu9VZPjBbOQsq1lsg7nGf1vOgpAatBfYf6jUJa0hJd
	VayRdAOVEUG7dqNzvicThZhna5rKCkdIsFbrSA9uNOJ/VmMYDltLb9h8xQrOFg1eU7km
	b9o34iP1k1fFv1zqUV6aJL2iqC8GSQM6sxUPQBtmEMdilxII17WeFg190nQsguD19krc
	MIGw==
X-Gm-Message-State: APjAAAUIJ95MCE1T2jijAgH0hhLqHZM8RnyXyG81BJXqahc3U+J+wHBj
	EoifD+ndCzceboyoWpQHt+SuuN+w
X-Google-Smtp-Source: APXvYqz5Wv57CxNgeXEqjVyD+d3iTexGTMBbTT7wgSXT1gHAo2XVCYUBFoGXOWSWTChNdiVOgF9IUw==
X-Received: by 2002:adf:e850:: with SMTP id d16mr31832871wrn.269.1558361530225;
	Mon, 20 May 2019 07:12:10 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:21 +0200
Message-Id: <20190520141125.10805-38-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 38/42] gnu-config: Update to latest SHA
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
X-List-Received-Date: Mon, 20 May 2019 14:12:09 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index e597ebedbc1..1630c128235 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "058639be227bbe8f03cc39f79f7ce84918012143"
-PV = "20181128+git${SRCPV}"
+SRCREV = "b98424c249119b79d3f709e26eb86f2fd4d5e5f3"
+PV = "20190501+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.17.1


