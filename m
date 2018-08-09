Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id BAC806010D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 02:32:23 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id d189-v6so7317222oib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 19:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=/9rzaZKXA1BAaUu3fuX4ZiHTnIdTuPGRj+2VwJiYMus=;
	b=c+0ScVS+fL2ZjqNJGoMClnd6krtU9B/FMVq5sYVFtC7P/7znv08O3CP9bzLKw/4kFk
	G64TafN6F4dTpA/MiYJNNdPPjuM/Md3s7RUboMDTpzLsZEmGoobRBqtyR05sr7C/Vctm
	Xz3TaQ9qPHWogiukrk7ZEP54YKL6dW4td+d3qg5OKgH6TsKGY3biu092xmLfr2r4gLOU
	9drW6gyfCQq8Q6kZw09mTrjdLjU40xkbdXFojuIPtMgeit+9BS/kS7oZT1xRlN6WdbnD
	sZ5xGgajsrISkd3b+JhZC/WEs0xEjPNbJT0tqvK7eQZ33a5wECJ7u4KbFnQx2XJnjYv3
	r/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/9rzaZKXA1BAaUu3fuX4ZiHTnIdTuPGRj+2VwJiYMus=;
	b=lR3eo6tvDTORZES4w0lGSbyVJ/ynoBPDSz/fIW4YhMRKrJPnx5qg4usngT3v1UCyAv
	I0uG6f9MsRd2n+yFRF498VAMVuJlA/ptw2x5il3lT0eS7oumZdOqDYH656JL0V+aE4SV
	S41oDpfsjBDDNpzdgg8JoGB1fxN7BR/gxI0223JDHNT9YWfez5sC/Jw3pDjW0sNj4H+h
	GpPgqVXYBWM+eCzw/BebG/DwhrjzurCOaUVvVzVJ5tsbvCCWNeN4zM5qn0iD7tVysGqJ
	ep4W601gUSX4JF3W2zDc61GxEYl87a/vAMrUWFcH5rk0uHIr83i9MbaLzZ23DaVSrgkk
	BdKg==
X-Gm-Message-State: AOUpUlHPFz/6gCiNN4hY+BzVlAlGo5o6PiSiRnUtKHmRa/t1Fuhd60mE
	fyAuEr1bwBlOf6Yf+bAxjPU=
X-Google-Smtp-Source: AA+uWPy2NHu7uDjDvX60rOF8kUWRL6RHBLwnSQ21gUhsDLgfkb3h17GzR0WxHm7mYkWxpGtpo4iTyw==
X-Received: by 2002:aca:438b:: with SMTP id
	q133-v6mr244960oia.234.1533781944669; 
	Wed, 08 Aug 2018 19:32:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	f144-v6sm8886632oib.39.2018.08.08.19.32.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 19:32:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 19:32:22 -0700
Message-Id: <1533781942-1567-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [ROCKO][PATCH] glibc: Update 2.26 to tip
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
X-List-Received-Date: Thu, 09 Aug 2018 02:32:23 -0000

From: Armin Kuster <akuster@mvista.com>

CVES: CVE-2018-11236, CVE-2017-18269,  CVE-2018-11237

LIC_FILES_CHKSUM for LICENSE changed do to removal of
"stdio-common/tst-printf.c is copyright C E Chew" text

changelog:
c9570bd x86: Populate COMMON_CPUID_INDEX_80000001 for Intel CPUs [BZ #23459]
86e0996 x86: Correct index_cpu_LZCNT [BZ #23456]
cf6deb0 conform/conformtest.pl: Escape literal braces in regular expressions
b12bed3 stdio-common/tst-printf.c: Remove part under a non-free license [BZ #23363]
20dc7a9 libio: Add tst-vtables, tst-vtables-interposed
4b10e69 Synchronize support/ infrastructure with master
762e9d6 NEWS: Reorder out-of-order bugs
2781bd5 libio: Disable vtable validation in case of interposition [BZ #23313]
74d16a5 Check length of ifname before copying it into to ifreq structure.
3aaf8bd getifaddrs: Don't return ifa entries with NULL names [BZ #21812]
f958b45 Use _STRUCT_TIMESPEC as guard in <bits/types/struct_timespec.h> [BZ #23349]
81b994b Fix parameter type in C++ version of iseqsig (bug 23171)
7b52c8a libio: Avoid _allocate_buffer, _free_buffer function pointers [BZ #23236]
4df8479 Add NEWS entry for CVE-2018-11236
a5bc5ec Add references to CVE-2018-11236, CVE-2017-18269
58ad5f8 Add a test case for [BZ #23196]
6b4362f Don't write beyond destination in __mempcpy_avx512_no_vzeroupper (bug 23196)
af7519f Fix path length overflow in realpath [BZ #22786]
365722a Fix stack overflow with huge PT_NOTE segment [BZ #20419]
be056fa Fix blocking pthread_join. [BZ #23137]
02f0dd8 Fix signed integer overflow in random_r (bug 17343).
3241353 i386: Fix i386 sigaction sa_restorer initialization (BZ#21269)
677e6d1 [BZ #22342] Fix netgroup cache keys.
71d339c Fix i386 memmove issue (bug 22644).
31e2d15 Fix crash in resolver on memory allocation failure (bug 23005)
1f7c474 getlogin_r: return early when linux sentinel value is set
7e7a5f0 resolv: Fully initialize struct mmsghdr in send_dg [BZ #23037]

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc_2.26.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 9d1e636..a1a4022 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -1,13 +1,13 @@
 require glibc.inc
 
-LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
+LIC_FILES_CHKSUM = "file://LICENSES;md5=ebc14508894997e6daaad1b8ffd53a15\
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "gperf-native bison-native"
 
-SRCREV ?= "d300041c533a3d837c9f37a099bcc95466860e98"
+SRCREV ?= "c9570bd2f54abb68e4e3c767aca3a54e05d2c7f6"
 
 SRCBRANCH ?= "release/${PV}/master"
 
-- 
2.7.4


