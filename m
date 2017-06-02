Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E569677E65
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 04:42:02 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f27so11080902pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 21:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0TWqGADUXOk1y/YQQQeSgNypDwx8qk1J4ivwxOSNzIg=;
	b=l0GBUdzdHrqyzO7Zp1imZoWk3ZdHVm72w65AA1amW4+xsCAkQZKR3xSNLlaawOcFlt
	o1xUAoFjZPGeHf8WRXfJKvo84ebz4m6zxjZ7tdKn14346zxGpk17GYBv8O52qvRQuXZC
	JrE8wDJtohKubJ2hj0cOknE11QyfGe5YBtBI7oylKdaD0NwePuaeurUVY3FpES/sCOVV
	lVdw/cIHhmHNqK5TDnYb/j74TIcQr39ntMR7hb2/nTkslAQwaAOHDqWXJW0MNvd+rgE1
	ObV27Tt/J/Bvb8M0o6yK3Mer3w8dKhMfOWr/FFd4NFODJbnNDQFeqUUBbg1y2vzmmsu8
	ZbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0TWqGADUXOk1y/YQQQeSgNypDwx8qk1J4ivwxOSNzIg=;
	b=RCYAlK+C1mag2JIzESP/smnAqlgYFwAh9IBgrpCN1xgYT6z+TxB4J6o0a/58gsyCD9
	NDt+eFOw5SkNMhujJ53CjI75RtH1C4l/YqZnqPtN6g7omK9vlasTbrVgR+iEBphbKQyr
	9c1+bX45G7VUUEW8/T4TE3S0V2Wo/P8qRbU6bEibGymb9VeNJzrrmeBB79BmuK03CpWM
	i4NQCZUUCCbyH+upZg+32vWJBJX5oWyBK+fvbNhTXzY8O2r1GltMkYLwpNLxcVuCpogE
	gJVGWUEMt0vNZ9CD7cu4DNmTMVdOuk3JAyqCkvzz9eoo84fi8zfYgCIaYKFVJyAGCnSO
	83bg==
X-Gm-Message-State: AODbwcDe8dqU9/s+KC+lgxpINSk/II1Ta4JkEP9KM4ewXXN+H8GzVDrD
	mky5nMmTXjyc+biP
X-Received: by 10.98.220.15 with SMTP id t15mr4879033pfg.144.1496378523986;
	Thu, 01 Jun 2017 21:42:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	t66sm37003163pfe.134.2017.06.01.21.42.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 21:42:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 21:41:52 -0700
Message-Id: <20170602044153.9629-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170602044153.9629-1-raj.khem@gmail.com>
References: <20170602044153.9629-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] musl: Update to lates master
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
X-List-Received-Date: Fri, 02 Jun 2017 04:42:03 -0000

- towupper/towlower: fast path for ascii chars
- remove long-obsolete clang workarounds from mips* syscall_arch.h files
- fix fstatat syscall on mips64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index e84bc7531b..67095a30ea 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "f9f686b7721e2cc35e20fa5c6df6da2dc4ac3f50"
+SRCREV = "179766aa2ef06df854bc1d9616bf6f00ce49b7f9"
 
 PV = "1.1.16+git${SRCPV}"
 
-- 
2.13.0


