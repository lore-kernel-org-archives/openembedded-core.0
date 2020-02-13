Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id A6E1360BD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:22:02 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id k29so2674014pfp.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lLIsO6+VajFIKlyCjkC0glybaIczrYa5G5aHljZpAG0=;
	b=FlUCvMhDXFCB65NTCJ3vDUMXtAndpnXh+qaHw7J59UjSmhzAnGJdlAgL6x5O7H8+0O
	Ie+N4iITHNt0WZOCHpjyxi1+OsqQh57eLNFLv1t4tJCYsXFLpPgcJwQU9n+QAodGflTI
	992pUGDRvnRw/fdO19NRNiuPbNRtYLXKGIiE+LXlpmYk6Cz7EKJHyrYbJNG6KquVxCLu
	IyOac7o88UJsPi7eQW8WPjORqlp7Qba/rVOUkSBpc8x4ooqL9vK6YwSOcx7huFhuFOch
	Vqw/KfCqAyVoXrJOYjvwHg/YoQUXuyFRE0LQjEKqBKGqdYRdgR9tWlCEAjk4X7co2j5K
	/l6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lLIsO6+VajFIKlyCjkC0glybaIczrYa5G5aHljZpAG0=;
	b=nK9+wiYMfslT8Hy17d6XtO/OF2ZTxEwLIFuQ68WlwpSVFIQVeSQi+Dl1jgMk/UBQBI
	swpxfSpz9hmJq4Y5y3/SYTrA7JiZ7g2SA6BHCgj4PzRuqXW2xtzbnAXEyYYrYNY6VdZr
	4JZH4iiq90m1CuoA8IXzuR/8wQJolADHDpuc6f6V8JIGsehO11MdFvMCsoDAGHXMxB9Z
	opvotlEvwRtBVCVeOH6fDVED5lXyDVVTINO/UdF8LXGE79anV8O7IcDCK0U13YbQ0Htq
	UOzqq9af4L6HFVuDdDuaj0td+Lk7cYqLVpB2K+XZERTVSRxiDT0aqD5WkcZQZyYA1orV
	fVsg==
X-Gm-Message-State: APjAAAU+gaAnAN7idXRbfTs4syt6En5UvS0gSrM/p7gxtxgvH6v8DnYa
	8jS12uqAju0rac/M2amZYHmO/vTtYLM=
X-Google-Smtp-Source: APXvYqyEYPGiC22XuiimILxmmtBC1QjlJs8jVeaT4hfKVcJBHnMs7Rl2NmQNuEePndZg0Gcy/y9BFg==
X-Received: by 2002:aa7:8181:: with SMTP id g1mr16177804pfi.215.1581582123323; 
	Thu, 13 Feb 2020 00:22:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	f127sm1958085pfa.112.2020.02.13.00.22.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:22:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 00:21:54 -0800
Message-Id: <8002e94e6b5f865feb0a17a2454d53b7f748e965.1581580428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581580428.git.raj.khem@gmail.com>
References: <cover.1581580428.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] musl: Update to latest tip
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
X-List-Received-Date: Thu, 13 Feb 2020 08:22:02 -0000
Content-Transfer-Encoding: 8bit

Detailed changelog is here [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=e6093b5a870a38ebfb3e54382acd48c698bde15d..a662220df547e5c2446518e74440a7d834f9ebe6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index f4853b4f2e..b6ec6fe9af 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "e6093b5a870a38ebfb3e54382acd48c698bde15d"
+SRCREV = "a662220df547e5c2446518e74440a7d834f9ebe6"
 
 BASEVER = "1.1.24"
 
-- 
2.25.0


