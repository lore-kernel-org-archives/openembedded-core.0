Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 161277FCE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 04:41:24 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 5so8084455qtz.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 20:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lUJeZ3Hj/Njultp9PsUxOY3UFBUdu1WoWdem8fTPyW0=;
	b=jRcDnJYc/oEaMbKWnXdfP8Q7ik2qXaPMtNenw7/P+WpptMDnhMqX8jleHjxaejoHcQ
	XQHRSPahlZTlu4skfG8AhQpgCQPem5SqhKRm9Jxnqg1HCD3XB4HB9KLAyW7lO8E7QMDN
	iYOJiO7btCj2cicH9aWHdW2bRJKFdvT/XB/t78N94Kp024f5KRBapof9peP1NLi5MWdj
	PUYzT/CRapTKDlJBACCNnkip0uA6tr6iwWOeWk52ixqy+ajBZ8PJdk5iuuamexbq0IHk
	iOcWyp3feJkQJtJvxG83cTLScEvgbYEr/UANUhmDo+94UvYU2dkNT0yHieGZlebN2rU+
	BUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lUJeZ3Hj/Njultp9PsUxOY3UFBUdu1WoWdem8fTPyW0=;
	b=Atr+BBP5C/n8TvMBCeSzWwDmedgxpZJrK1goXDpn76ZbgBKujJZHSLHTTY8KotIK7u
	hHm6n0AXtQXNMZuaW7cNVb4Dw0R8q0k9sZeL12n92VsY20OKK9Vc3upu+1j12qOlx5il
	x5iF7XkLSFA37pjdGv2cALvFuQpVQWh/TXGNpEXfhI3ejF/PtTHhpycKGfgC8GBEFjfd
	1aJiZFo/rw1fR9NIHhod4D1dutsORPlsuT/JUPytqmB2N7YF/G/RHERYg6bt2jT6nm8w
	Avt40Qvgj814onim3di8jcTf2EQHgdTW3DzQNxk7bWs1h6o63nMqoOwBs4TbWrV3lbZZ
	oyHA==
X-Gm-Message-State: APjAAAXL8N0G3KS1SnqWDSjiLJCVnAOLRZt29oEISWv3XjDtTxrmXijM
	1MRXqR8EAuwaE3zlmTFXtiM=
X-Google-Smtp-Source: APXvYqwEAi0sbgyLqWy8CQY+amMVAgF74COdP+9xp2DCtXuQysPOX81GBB7dNS1r562s2VbtXxvsQg==
X-Received: by 2002:ac8:2ffa:: with SMTP id m55mr8781315qta.189.1578890485877; 
	Sun, 12 Jan 2020 20:41:25 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	s20sm4472974qkg.131.2020.01.12.20.41.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jan 2020 20:41:25 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 12 Jan 2020 23:41:21 -0500
Message-Id: <cover.1578890313.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: v5.4 and v5.5 -prep
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
X-List-Received-Date: Mon, 13 Jan 2020 04:41:25 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

As part of the v5.4 LTS reference kernel work, and v5.5 prep I ran into
a perf build failure with v5.5+.

Rather than sit on the issues that I find with v5.4 and v5.5, I'll send
patches as I go along. With these tweaks, I'm building and booting
v5.5 on linux-yocto-dev.

Cheers,

Bruce

The following changes since commit 4e85a7a0ccf20a005df7349cabe75faa49fe05b7:

  poky: Switch to post release name/version (2020-01-07 12:43:28 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto-dev: bump to v5-5-rcX
  perf: fix build for v5.5+

 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 meta/recipes-kernel/perf/perf.bb             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.19.1


