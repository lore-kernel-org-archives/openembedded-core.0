Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id E81276BDE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 14:59:08 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id q64so16933457ljb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 07:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sEGg9Sj1BP/bFt75GPjmKhLqV5N9tjB1lEizwnDJxJE=;
	b=i6s7rL8q2wVEYb8w4AEwu1kUqvwj8DNEZWbw5avAM4at+Io8vRecCNwOMNcX6urlhc
	9Odlukaw8aTGWNF0T5s9NwJdzSwGOH7ocEzmHHP+6F8o5oh2c8h7+c2WfCWRrnyrNUDD
	KloMZNUzWPmm4wMjxgTyJm/eizsoGo0dyFqWt54qQ+3gJVkeYqxlxtUlAYtWRP0KnKyu
	rgiFSdSpaL0WsrSydA38fkhuqYnLCVN3J92Sr/W7V/2mc3OFSsZVcPwoTIUJW8j4q1el
	9cOf6f2sxRQbqd13B0JBfd4fFOeUxoU3mGKVoajgeYpTX1WjS3RBUT3JRDOYJ/KlF9pv
	+sAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sEGg9Sj1BP/bFt75GPjmKhLqV5N9tjB1lEizwnDJxJE=;
	b=J10doaxMHWxTIDZBZ5nZlKctx23Vk8WAw5l5Nexac4dBFi1G+4+dnFJOsoq5eO0Urd
	ZHzigc6o1wU2hMnVqUOJkB+z2xCKwV/N4cKfBohV8Nuz9r9yTRt8n56/wqU/Cy7UN4r2
	sP3YZU8uJXE6YWu6/ihZCp9n4J9cZjDDJCdlUvjQ5JXke+ZBNMJD0gNdtzZD2OtLIXIn
	+Qsmkprw1fV2MZ0VxxG2djUxfiM1Fh3xejhlsOLQ1XpUWLC+Z/4sOnVlTQhqXnqbmQno
	14ZIaIeW95Rv56shnlPeI1GRvhCzMeDbCVKEzyKuMNBYQL0hM8ZC7Jmz4FZUw6ocsU+Z
	rWNg==
X-Gm-Message-State: APjAAAWD1Oce3kfMdFITAPHWl27tRPeV0j371B0pGZ/rfu7E2l9KBBKq
	2Vyav9gdjIZqMW63GlHNPUdBKWFloUM=
X-Google-Smtp-Source: APXvYqyOrDZa76b4k5QxmRPsyYavgDs0TaHIP+9YIeE92570o0BQq6v8++ci2DF3PVDfxZVBVvs27w==
X-Received: by 2002:a2e:b4f7:: with SMTP id s23mr17883216ljm.111.1571065148660;
	Mon, 14 Oct 2019 07:59:08 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.62])
	by smtp.gmail.com with ESMTPSA id
	m10sm4195961lfo.69.2019.10.14.07.59.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 07:59:07 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 17:58:50 +0300
Message-Id: <20191014145850.9097-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <dec79a88-8071-8398-aa76-d8cf07011df8@windriver.com>
References: <dec79a88-8071-8398-aa76-d8cf07011df8@windriver.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH] multilib.conf: add systemd-boot to non-multilib recipes list
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
X-List-Received-Date: Mon, 14 Oct 2019 14:59:09 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Add systemd-boot to NON_MULTILIB_RECIPES so that it won't be built for multilib targets.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index cfed3fbbd07f..c734a121e12d 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -29,4 +29,4 @@ PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkg
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf"
+NON_MULTILIB_RECIPES = "grub grub-efi systemd-boot make-mod-scripts ovmf"
-- 
2.23.0


