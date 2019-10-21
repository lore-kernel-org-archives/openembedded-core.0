Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id ADBF27F574
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 20:16:28 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id r5so23191530qtd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=u/Nd+I6b7mcHdVecxDpWGbviDaWRGZ5zZKbdYW+U5rg=;
	b=oCYlWulwqzg7aTKgw7FIrvs8mjwW2L+SfncYxbF51SKACxKzDVCVpYWwU7GLYpQ+6r
	yUSuUODvPMNoRCw4wnB/eYz8KicIc0WN1K7x+gRYwMurKOmQguNr8+CHiObeEPuZg20E
	QX9fHHpO/fjQw9QXe3vM+FFMyrNXxgiA1NpLf45UOxEnYXMnajH4pk7awTkUyUn/VYv7
	SE795Ru2UGCDSOrFJxl+tDnMWAPO6EB+Xt/f8auNRvwqnHgN+p4DU7Z0PCvaV5d/dqzz
	7otn7AFUGm/Nm0AN15zvbO2kzZhOfjAvjTT0aFv9REq/IkHnWfoyw1fmuQ/bNIx9XqoJ
	Lpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=u/Nd+I6b7mcHdVecxDpWGbviDaWRGZ5zZKbdYW+U5rg=;
	b=C0QMTBqB9KR+IL2nwd4CpLJL1yeVi4rTpbdO3KMTypjEwKnPGfYx3j5hb0evUCjekC
	o8bUC7d3dQRNnRiKAdjHTjSZr+IU7+2QYygBdOatJkQcGWsDmFURNfHWpzuKN0VkrFor
	K5vMtJJoP6dTF0QQH5bsYoGHwTHxm8HjOezVXBudmQmG0roAB1UlafN/cGpwNih21E3j
	cBVE7AIfZz3qlGmoQ533+vZCNnzsMHlfsT321Dr9yjM7mrbef7gDvpKY+O6RRlNQ6Mzb
	0Di071IHI7mna/KTsxVDaZTJAIdk6/nNOhcaPz9OgwSQAL2fjCGD/s7OaJj4MaU9Wc7N
	4NKg==
X-Gm-Message-State: APjAAAUu38xkY7473Mg9RK2BG1XAoqWoi5smF2ifq3s9siaVHZjJhEBj
	66rhGZn5rsA0meHx2kgB9l7IzFmFfexjTA==
X-Google-Smtp-Source: APXvYqxXod35fRXA3i2FYYU4Mw0j30ZQTMkrTG6VXGI3co4LqdvTWJiiBHtyHQdROiVCugUZFavphw==
X-Received: by 2002:ad4:42a2:: with SMTP id e2mr24652303qvr.189.1571688989353; 
	Mon, 21 Oct 2019 13:16:29 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	o12sm4666903qkk.54.2019.10.21.13.16.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 13:16:28 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon, 21 Oct 2019 16:16:18 -0400
Message-Id: <eb27cbf9e4e86187a79967546674a0156d722c16.1571688520.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571688520.git.bruce.ashfield@gmail.com>
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] perf: drop 'include' copy
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
X-List-Received-Date: Mon, 21 Oct 2019 20:16:29 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The copy of the kernel's top level include directory is not
required to build perf. We have both the linux-libc-headers and
perf's captured/copied headers for what it requires.

The copy of the kernel's headers is leading us to multiple smaller
fixes to ensure that the various .h files are in sync. We can
remove the copy and all of the sync checks, and perf still builds
and executes correctly.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 191305969c..5f0ba7c180 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -106,7 +106,6 @@ EXTRA_OEMAKE += "\
 EXTRA_OEMAKE_append_task-configure = " JOBS=1"
 
 PERF_SRC ?= "Makefile \
-             include \
              tools/arch \
              tools/build \
              tools/include \
@@ -248,14 +247,6 @@ do_configure_prepend () {
     # so we copy it from the sysroot unistd.h to the perf unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/uapi/asm-generic/unistd.h
-
-    # bits.h can have the same issue as unistd.h, so we make the tools variant take precedence
-    [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
-
-    [ -e ${S}/tools/perf/util/include/linux/ctype.h ] && install -D -m0644 ${S}/include/linux/ctype.h ${S}/tools/perf/util/include/linux/ctype.h
-
-    [ -e ${S}/include/uapi/linux/kvm.h ] && install -D -m0644 ${S}/include/uapi/linux/kvm.h  ${S}/tools/include/uapi/linux/kvm.h
-    [ -e ${S}/include/uapi/linux/sched.h ] && install -D -m0644 ${S}/include/uapi/linux/sched.h  ${S}/tools/include/uapi/linux/sched.h
 }
 
 python do_package_prepend() {
-- 
2.19.1


