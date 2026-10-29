Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4564.1793245507455727893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MktdLV+E;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c73c63116so16901266d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793245506; x=1793850306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EIR/l4g4fqfwofGOUUtRV5LzClmio+KDhP9AQO5HCn0=;
        b=MktdLV+ET0hkqI8nNNbm8eARGvhs9DoqEgdjJxihmiyQlRTsmTP+gM5cWJr2YDZXuD
         GA925sO4VqQbvVEcNyumyAbFOoFYVQ1q/dPaI7YDIz2tzDHV1OVIe0NHAUBJWkroyXo0
         hbjX0HL4TqkHLT9yh5xOostwlKfC+DeogkYbA5G4rwjmIGQExgxbrSfCUlvAooA7YAb2
         vtVJLs6yfnavygW7TI7sBsl9i9VlTwIbgliZbs3LNJOC78l3bSACgcOi5+kXsUwtrb2Y
         IcWAOA1u/lhcPbArnQztvZ+Z/dpahdrKb2Rn+jOFmCZKJaROeIxSJ40v5eNv9XYJWfzQ
         tyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245506; x=1793850306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EIR/l4g4fqfwofGOUUtRV5LzClmio+KDhP9AQO5HCn0=;
        b=k9Eoj1VRdjDATIAEzqfJ2gWP5lS8JpEVzEa51LOm/So8IrwrY50iZQgZYBg2xWmNzv
         ikrNB3Yd4ZtUDiMecCO6oyjr4rRcU19JoNiXsshfJxIcP/rjAScnkMGFCCeTOsb3harI
         KbWgFdNC2Jj4bvIOEnttoGNXcmosCvWPH93rvvrENT9z1W3r7agn9TIlSPjRCgoQyd/B
         ApsI1ZDDF3z3tZlLgtLIepcJSWP5orrAEjL9a+3pvB1ivvvRkaUS4EJHAiFI0UAn/BQD
         M3Tbdf/VnQOE3pzLDwvNMLrz/2Xqs7nfRcz8LzytYHb9Njv8QYUdFhCW9xz+1KAPow8J
         IPZA==
X-Gm-Message-State: AFq9FYLnItbqVndeUKhdKcgjHVX+wmtMNhmRYz3YBrqd/X6h53Gtmpeb
	0BhP/Z4f3qFIM2PS8zlkk4Xs4ZQdyinsUuCZabvtRzk+C/NqwQuIZ3/WIi462fVX
X-Gm-Gg: AYBFou3c8rwIhLhcOxh/whOKWa0DyMl5FiUUwM6OXkYgPZQcUZC9O/pluLlf4AJN5if
	34CBxgY8wVna0VJuTH2h2Old73H99Vhe2NYbXKIDoYLT+Zs7OwCaeO8EJuFjMgI2kbl7QOC+0S4
	6VkIdUdV6qv8i4XzoAaFlfy2zgH0+T5PBH2CIvPZF66JKXfAS5UOeCtMPTp3fQ4I+mgg6wkNXWN
	EsBUVNkDLHkycqj7GgSSGffPGAvHf1TBob7FeSPkXZMBaM1+jtC40f5Y3obDnuuDs//O1JL+BbE
	9JCPsWOOktB0EHYqpN3pdN4WHUqjHl2cwFWIWD6AmJM256HTVD/Wey2lUrkx2DbQgB0U60/P8Tu
	VVljUFsqzx3pCUyac/8tGIn44tGRHaDbKllH4muyzrTrcPJsrRpd7tODqq8X8khZ5MVmCLPrzIG
	p3kbHf7B+KHBeLKfBr1yfU3z0ZT5/I3GcMWpxsZ5LZEfDLrcfGujkVA+2f6BXsMIqvOBQdY4XFp
	pbu9T88++UPGU/FNxQ/v12LqLtDc+fLJhdf/6sOf9sYrZNzoHO37+nC075zW+lsKZVjp9sswBSL
	JC6ZK+O1RXERtckU1Bk3bYkb+THKINzjFtpz43JufY8DpkWdH3m6atVzd2ZyLOzaemYYq+XhPLX
	/dG1HQG4hSSMzNgl/ri1Y7ex0Ih7XjKjLVMp8/w90Vj9X38lkCugB3TI9f3ymISGFtHl0RE1jY8
	x2LSqVIi9gmHdzQUhnQAk9ERyvbZsDUntBc+/abwcMU67PHg==
X-Received: by 2002:a05:6214:48b:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-91c7d1cc182mr70689616d6.46.1793245506084;
        Wed, 28 Oct 2026 20:45:06 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c16569sm147542096d6.18.2026.10.28.20.45.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:45:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 0/7] linux-yocto/6.6: -stable updates and aufs refresh
Date: Wed, 28 Oct 2026 23:44:56 -0400
Message-ID: <20261029034503.3153661-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248876
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Yoann,

Here's the next set of -stable updates for scarthgap (v6.6.156 ->
v6.6.160), along with a refresh of aufs to upstream aufs6.6.84 and the
matching reference BSP SRCREV updates (I think you may have some
of these pending already, so feel free to ignore / drop any of
mine that you need to).

It includes (and replaces) the v6.6.156 and v6.6.157 updates that I
sent earlier.

On the lttng ptest failures that you reported against the 6.6.156/157
updates: I wasn't able to reproduce them. I built and booted
core-image-ptest-lttng-tools on qemux86-64 with the 6.6.159 kernel and
ran the full lttng-tools ptest suite manually. All 765 tests passed,
including the save/load, rotation and MI XML validation tests that
failed on the autobuilder.

Since most of those failures are XML/XSD validation, they don't look
kernel related to me. If they show up again with this series, send me
the details and I'll dig in further.

Bruce

poky (7):
  linux-yocto/6.6: update to v6.6.156
  linux-yocto/6.6: update to v6.6.157
  linux-yocto/6.6: update to v6.6.159
  linux-yocto/6.6: update to v6.6.160
  linux-yocto/6.6: aufs: refresh to upstream aufs6.6.84
  yocto-bsps: update to v6.6.159
  yocto-bsps: update to v6.6.160

 poky:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend | 12 ++++++------
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb              |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb            |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_6.6.bb                 | 28 ++++++++++++++--------------
 4 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.43.0
