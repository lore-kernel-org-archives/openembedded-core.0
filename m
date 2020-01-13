Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 952587FD42
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:31:05 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id q127so4870216pga.4
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1uv0pRZRRzGkLeLmRBRVSgzmq0HSvsM34XHFcu2bJOg=;
	b=MajX5pWZ9fQM7s+8LHbJDyKhHOQ9n+JAgf7Q17RTDp1EadeglusqRhjk4l0ycdN7TJ
	gr9AQGxJl4G1wZcysLyMiDAj/Hsuh0uAP6gyyzd6XBGZdFlRHIYhsGtrfvSeMr54CFiI
	KEgC5Wn4wMHWHjE3rFxtDPvsK19DiglLdKS6toITCizv7fmoyJd0n9NsaXd2EFYf/AXS
	DsD7CTlGgxqqbndfD13gzHq5c/5HFcGUj01pQjfIXLOlwlSgcWcWJ920SlM0jHyWy0xl
	xzlCzm8SzoB4kqDidohdQJrxwNuHMr+wc9Twavv6w8OTbCojJbtr3JC9mzjsWOYwVZWv
	O4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1uv0pRZRRzGkLeLmRBRVSgzmq0HSvsM34XHFcu2bJOg=;
	b=SYGjN2UfZQj1I7DzXy2BAsGKugXOX0bdkvYNAR8PG6Xh1/IA1wPos9sc4ycH34T/cg
	ERO5KtGL1/+Y/xUtuOurOTBnLMlfwtW4kO9YHB7uNEMsiqxLaawiQtN36ThtQTJChYEE
	cYUTaNhh+lHH2CNos/xtYA7XGJN9fpz8wXmGM1bxpHEywxuge5/rBW4wRO8fTY3JoDes
	T2VURU6eTvnXzI6whRx7fCrYyqmDq/NcGfrOprVEYCuzAxh87H265iRbKpI/jde9O5mW
	o/WGLJGWISJFBe2UQFH2EaLWDEjODaQjrh1ORknW5P1raMFFTUcWzcSlriNb/AaMqDei
	Vaow==
X-Gm-Message-State: APjAAAWKTTKt5lJ76B6hzfBimxJ/WoBXLz/tQy1uKG2uBWplwI1roZHc
	Qy90ee/5rm055SQt5d0PUcMDxmB0
X-Google-Smtp-Source: APXvYqzzK58KkQi+j2WBg5W0fnn6d9JJ5VWuJ+6S/ArDTECGvXPofSv+d5fMZZi4t9+9dP4b0Zf3Rw==
X-Received: by 2002:a63:7045:: with SMTP id a5mr21929270pgn.49.1578929466393; 
	Mon, 13 Jan 2020 07:31:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.31.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:31:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:27 -0800
Message-Id: <279c4da2e5f46dccfeff0c898c2205940be9e174.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 28/28] stress: update SRC_URI
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
X-List-Received-Date: Mon, 13 Jan 2020 15:31:05 -0000

Fixes:
WARNING: stress-1.0.4-r0 do_fetch: Failed to fetch URL http://people.seas.harvard.edu/~apw/stress/stress-1.0.4.tar.gz, attempting MIRRORS if available

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/stress/stress_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress/stress_1.0.4.bb b/meta/recipes-extended/stress/stress_1.0.4.bb
index e9179d3e19..42046d5bf4 100644
--- a/meta/recipes-extended/stress/stress_1.0.4.bb
+++ b/meta/recipes-extended/stress/stress_1.0.4.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://people.seas.harvard.edu/~apw/${BPN}/${BP}.tar.gz \
+SRC_URI = "https://fossies.org/linux/privat/${BP}.tar.gz \
            file://texinfo.patch \
            "
 
-- 
2.17.1


