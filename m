Return-Path: <akuster808@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id B2D74786B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 23:08:45 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id z11so25267707qtm.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 15:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Fz4YWBZD27Mrd5wFqpOWrKjoO6LVIH9iKdmK3UBuEEo=;
	b=QGUen1/lhR2oK2IjykCBAo47699Jm31MReOsNqY92+a7OqHG0yVpTq4Gd0RLoigH2h
	sqYw957hOhKm/lsOrlH+ZY7TuAh+woNtD4x8A3P2HN7BQgLynBUf4vo+IS3Go1RFxZj1
	B66gZupKyvwk65WsrDGpMibJZn4xuw7IttxVQbCU9l3doO5ZTsmxzK8kE/OxqTFqpx0D
	R1jBu4MLVfv4B+zRuMyj6IATzn3g5G62cUkL8V2ZdY+O12oTJtKw/hfRfzBmoza0XKC3
	T8rx7Il/vDKoT3fIi+KCcqk7meVgmPSEOxlXpV839ERhO78bebaz9i61tq9S+y2nv0Pr
	tLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Fz4YWBZD27Mrd5wFqpOWrKjoO6LVIH9iKdmK3UBuEEo=;
	b=NTJRTzN6rH4CcBbR9S78gC74+Pfv+8UbGbcM+jVidDXOfE9lbS4g+Xmr9VEbTkuHpm
	NtDBjY6LZgMNo1xUlwhTaDUPuoTGJHl30HqYU+Mqo/aF7e+ZlXGafYYQND7vzWnyVQx+
	CrAHpkfTQiQxYih8vV0HTrrGjHZrEioAniUgpssLse00lyrbY5KqqNL/XGVf6OgzC6wP
	Nqpa5nSLm2+fby26hNUVkOh93Wcfq2MfFDGIPG785HnypbLkU7rXNiXNqNn0oIQ8qkkc
	LFXcXupGQNJWxdIfvpnbuqwcDBNVvTod/X4IA7buqcs4rDfwFLqeaMZ9PMEAXoXbK7z6
	ByaQ==
X-Gm-Message-State: AKwxytew1xXKqpEnGpfbGya2npNMKiKandaVtPDBmY7n4oEAlmasiTS6
	p+p1ONdmj/rKDQrQjdZL6QCV+w==
X-Google-Smtp-Source: AH8x226l0RFqDKDd8TwRhOXPBH1x3BRxGCE49wlyZqQd0nVtcyoKavc1kEVgA4x2ivM7pVmVtR0g/Q==
X-Received: by 10.237.52.226 with SMTP id x89mr799683qtd.114.1516662527210;
	Mon, 22 Jan 2018 15:08:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:c85d:e2c0:793e:901c])
	by smtp.gmail.com with ESMTPSA id
	a27sm11212357qkj.94.2018.01.22.15.08.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Jan 2018 15:08:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 15:08:41 -0800
Message-Id: <1516662521-18942-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516662521-18942-1-git-send-email-akuster808@gmail.com>
References: <1516662521-18942-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/3] nspr: update to 4.18
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
X-List-Received-Date: Mon, 22 Jan 2018 23:08:46 -0000

NSPR 4.18 contains the following changes:
- removed HP-UX DCE threads support
- improvements for the Windows implementation of PR_SetCurrentThreadName
- fixes for the Windows implementation of TCP Fast Open

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/nspr/{nspr_4.17.bb => nspr_4.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.17.bb => nspr_4.18.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.17.bb b/meta/recipes-support/nspr/nspr_4.18.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.17.bb
rename to meta/recipes-support/nspr/nspr_4.18.bb
index 21768c7..cd7ae8c 100644
--- a/meta/recipes-support/nspr/nspr_4.17.bb
+++ b/meta/recipes-support/nspr/nspr_4.18.bb
@@ -23,8 +23,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "0534d9ac45dca251655b9b240670eab4"
-SRC_URI[sha256sum] = "590a0aea29412ae22d7728038c21ef2ab42646e48172a47d2e4bb782846d1095"
+SRC_URI[md5sum] = "2a558f9aeb109bfb16d78bdc42033a1e"
+SRC_URI[sha256sum] = "b89657c09bf88707d06ac238b8930d3ae08de68cb3edccfdc2e3dc97f9c8fb34"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.7.4


