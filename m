Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C30E7DE90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 18:40:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m3so434464wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 11:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MlbUE161WhrudfO5pVmfpramT6giB3aGM+9Pc0iDaFs=;
	b=Una5/Axp+XafDp1WxUm+OH3FUXLh0AqYZYHgllDi1uRY73bKAHP6Bt3IAZdhPNZVF4
	uB6xZFY67JGn3OHryifonRP1s5mczheVFyFTM7m1q/mEzKAsgZc6eLQ/R+kbQebGg7QB
	TB5NyhMCvkZE/FMJUNJzaxB9us2iCN4d3OLRBJKLQ1u3lk+TVcYI8WmBdVxduSRgqLVN
	Qz+49jHtwxF0sPJB4cos72TsdcqSjdvztib/WRq9KKV9uEjm70aUXcsMvUCbo2KkXLp9
	0Acn8Y3vrqgQk02ae86iTQdz0xFwLl+mMUN/vVuZZXwnJe3vFWm414SOfdmLLgjIZI3l
	Qhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MlbUE161WhrudfO5pVmfpramT6giB3aGM+9Pc0iDaFs=;
	b=mymqj7gJTK3LXbYVMlKJsBOK2S0oA5TUh6iREjafOJqG/hd91Uhc5+zHjn1Hmk4t4C
	Ty1hpna5IQT2ocZcjQNrJT0wF74+10LpWuHTc1xlcNyJcw+l79Z9hq02+FzqNlosBpQz
	hAUBiSbVr9Hc1d1+I9BxStaGg0u5goOq0nLVo3zkqYyOd0VYbZut7WPs9Z8Hq0/cuNlV
	eYEMDEYg2v82dqERZHR/SmEtMTQ4RoRStFO/UvRg615bWppzpDqHRn7UVXyCfvnfP4AL
	+794RnzUjEKZkZg9PMqRcqsl44O4v+tTNfV6GVv5OSjGrcQAFh0Ms7z1galAn7hkWUPA
	EOJg==
X-Gm-Message-State: APjAAAVONTLmfRhdrzGu/EWvlLmxio29LAoTtvh+ySvmEWvkheb5llps
	p00yt5JTaplow8CBc7vJAOslN3TZ
X-Google-Smtp-Source: APXvYqwpfA9NoRz6A0Mnn0BnHvg5W/bcR8j9E89UOCko/0KkHwTpIsrpZfOCKf57QQOb+6F6zJRUBw==
X-Received: by 2002:a5d:4d4d:: with SMTP id a13mr11102395wru.18.1557945608912; 
	Wed, 15 May 2019 11:40:08 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 6sm3681278wrd.51.2019.05.15.11.40.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 May 2019 11:40:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2019 18:40:04 +0000
Message-Id: <20190515184004.20564-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190515184004.20564-1-Martin.Jansa@gmail.com>
References: <20190515184004.20564-1-Martin.Jansa@gmail.com>
Subject: [warrior][PATCH 2/2] perf: make sure that the tools/include/uapi/asm-generic directory exists
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
X-List-Received-Date: Wed, 15 May 2019 18:40:08 -0000

* before trying to copy unistd.h into it

* older kernels don't have uapi in tools/include and do_configure fails
  with:
  DEBUG: Executing shell function do_configure
  cp: cannot create regular file '.../perf/1.0-r9/perf-1.0/tools/include/uapi/asm-generic/unistd.h':
  No such file or directory
  WARNING: exit code 1 from a shell command.

* tools/include/uapi was added in kernel 4.8 with
  https://github.com/torvalds/linux/commit/c4b6014e8bb0c8d47fe5c71ebc604f31091e5d3f
  tools: Add copy of perf_event.h to tools/include/linux/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 546076f84b..4e603f1a32 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -238,7 +238,7 @@ do_configure_prepend () {
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
     # so we copy it from the sysroot unistd.h to the perf unistd.h
-    cp ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
+    install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
 }
 
 python do_package_prepend() {
-- 
2.17.1


