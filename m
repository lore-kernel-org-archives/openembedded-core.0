Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 10FA97D167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:16:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p10so19565524wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tbaNDN4//bl+lYuFKraVYGYVQETw8RWQvSnO7HZbuzk=;
	b=RypiOGg8Km9jCd52ur1ti350FZg5isb9y+godl34ofyHo94FwEKAy2ld93nvAaff44
	X3yNqk/tt0pia1709CK6mRWvvDpMp6y4i6hdnbdnAbOCPgTJtxBbWOH9KPVkcKlBnxBq
	313MZ00oyShgwYQOZgOTs70GeYjz/iHdmPGNBlAQb10lQn8GHAhWS5UDsNFJ7hjpqtak
	TfhOdRqDkQd9GbYmlzyz0d6VmFZmy4bwgnYjAbbsJuNfuSXBZFdRnqVq1axOlSpRaIRA
	pAqKbAgKPAXT2ZQ2epH7oBZNAeF0MhY8aoaD7eCNWGwgaHNdyV9fs+KWQD8/couzNMW5
	oq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tbaNDN4//bl+lYuFKraVYGYVQETw8RWQvSnO7HZbuzk=;
	b=GqlXnqlBEv5B4oQ7oBCJSaw3KRlh4YiQpOdZGsp6fS1OjfdrTcJPtD9tzx9YIKLRPR
	nWUZwOMiIbIBLHrUp0bbb114qtk9G+lk0QP6afKUACDG4yGZ5zxNWJradFQJ95/O/YcN
	fj/7ER3KWmdtuGIc1mIGHMzjnOddQXSUjdfnry08JNq21NSa1uThPO/dzIaBiBm4xB8U
	zWMKblkxmgYzixlnt8DGcnPAgGSMH2tgDMw0AUWMHal1Klp/+oKf9KsBYewhq2seLXa9
	pXatNvXKKBURzhk1qecU8PT6DzBfnIVeMxptMZ8cQmm9szqNv+dyLo3mtrrBzsRgMo/C
	SBoA==
X-Gm-Message-State: APjAAAWWFfNDVXpl1o1w97arppi4MvDreoTazZcc6gJeqVUnb7xor9bc
	SLI/5huW5xJIE9ImTdJoU92fNA3Tpio=
X-Google-Smtp-Source: APXvYqz+MmkoY3e8D+xGRDQRR9TDCooq/Sd51ub3cyDQa81DYXbzjoaq0DHgp2BA/SC+4mQ02w5w6A==
X-Received: by 2002:a05:6000:5:: with SMTP id
	h5mr23349558wrx.271.1553707007717; 
	Wed, 27 Mar 2019 10:16:47 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id x84sm873848wmg.13.2019.03.27.10.16.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 10:16:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 18:16:33 +0100
Message-Id: <20190327171633.34697-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327171633.34697-1-alex.kanavin@gmail.com>
References: <20190327171633.34697-1-alex.kanavin@gmail.com>
Subject: [PATCH 8/8] local.conf.sample: remove support for building against host libsdl
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
X-List-Received-Date: Wed, 27 Mar 2019 17:16:47 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index 2775e15d748..00795ae6a3f 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -239,12 +239,8 @@ BB_DISKMON_DIRS ??= "\
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
 # seen. The two lines below enable the SDL and Gtk UI frontends as well.
-#
-# By default libsdl2-native will be built, if you want to use your host's libSDL instead
-# of the minimal libsdl built by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
 PACKAGECONFIG_append_pn-qemu-system-native = " sdl gtk+"
 PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl gtk+"
-#ASSUME_PROVIDED += "libsdl2-native"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
-- 
2.17.1


