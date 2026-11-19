Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93.1795101874478807504
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=g2+WrsLJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb61185057so18861345e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101873; x=1795706673; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EWOti2cMiHNdPJXZCnxuZTnstmDASCw6spN0LL8rGg=;
        b=g2+WrsLJZG+hVzDXBreORAE+dx3wxlVYG+g1JKsILmq/IuQ6er6+Hz0d1iK8ZZmP/k
         8xJcgqSmbYyS687FafSYirQB8l1ywugRnLILdNvaw5CrYPYzwe/zIKpynCaw5RGmJLcZ
         4KIDh8uLknZdhHK8e8HGFDyQ5/CDv8LEDDlQHqZgKXf4HTWgsb4IRobgNy/A5sDfmBzM
         X7GFJMFa+4vZ+Y6DeKlRyZLvaJgsaa6aQBv27YXbrYBf2ieMKOSNXMd0Hf8JpVb6iPzC
         j38D3tG0h8voqWB6ef7H600FEfsNo2NEB4WhhTh/fREOV6O+psTqxNUXGEOYExqdmRH2
         DZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101873; x=1795706673;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EWOti2cMiHNdPJXZCnxuZTnstmDASCw6spN0LL8rGg=;
        b=aZAKdUX3yWXzJejndO67b7Q7IqSZFNgV7I90mGhEcQFnjUvai58tXn2DaXL9bBIkOw
         MSUFqfSQD0WcghQ+FLMk3E8fQVEFaI6auHtEc3ORiccfwqCTmXaUienieDaXBX/kVNXq
         sFsrKVLHaK6SxQgcO6H6lPA1FFIm0IzcwQlNQ5eV6xj6+Nxwy0O/4Bc0+eq6Mg3f4REN
         lKQCEYlC/oLoT4x2xEl8d1JATmLPkiXy0vzazmBcTGpt35tIKY8Cnu6pMZoNrgPlo7Lt
         5TZxXPB/0lCoU95Hqpg/TBbs8spNZNLbKs/tLbMFIMtGNTlyvha63TuhU67YC8W2tg+r
         FIjg==
X-Gm-Message-State: APuU4Z/+SRaS96qgK6Mdiwc/BrBYL5tZaiOr1E3x65hymgHfjkUYSsiO
	lYntBzv3cc/Uqnea8sa8llmchibQCBImvATREi3giJkpHqTSehqr/8MbFVP54+aLhOf+VXst8+l
	n2Az6RqE=
X-Gm-Gg: AYBFou1T/CD4R+xZm5oiha8HEilUl2Sh7zXwlrwj74cLo4SpCXiVzx2ALi5R2fv1Of7
	rDq3QU4GGbOweeekbvzw87PBoesS0wpGGF4b6t84vKyILrkr9S8XiJ23puoDXlHyRfaSNi56PLC
	TRmQLqhEz1uzoGXLTnSH6cW162aKz55c1QVIQRvsQLecS+7gZmiOGwd3NlJXF/klq6PqAME0/++
	uKpWhPF87gmnHvrMynkQVrlJHVK9lE7bh3fHEdvsPcCTcIlM4DnykiMlX1rJKU53Xh2RNm1XNbW
	Y3DZDfPBRDFKPZRTOTZSlBGBCkb4etNpWqTi3RnQwNLgvBXXU0nUD/0RKx73EJWKqjmCfZaeJ76
	tadzG7R1oxsKa9pFcohGPBFaWvb3QtgdzmootCSr45nZjLxwxSHhQd13moIvmlHTfR62LOmTG9F
	aH8IHVhZ9o/9moUGALBh2IdjP2P3hIsy238JIPxMkMLAXf7a8fJ0djQND82UQdf54P/qOXomd9w
	BOvs+yCcrVgu7lVjYWktk82w9pjIYwgR2fNUgBTVQVP4IcBOMNLryJYtlrnInlHTvqAm7wXAe5K
	gEbeH5rcWU9x1U+kAt7uwp5Owonnso2qXAL9KiszFg/gPWbB7Jy6qQnVlBNeFKGZ9svxo80o/gQ
	lGhSBDJQk9QDJGZmUBEVlmFrIex0xfe8cOSD3KAFIkkG5fNKlWv5OsMQ=
X-Received: by 2002:a05:600c:8b83:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb7da55745mr120767585e9.27.1795101872521;
        Thu, 19 Nov 2026 07:24:32 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:31 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/19] gcc: patch CVE-2026-102010
Date: Thu, 19 Nov 2026 16:22:43 +0100
Message-ID: <2da3a6a83d74b323967e0c10151908d6c6f82aa1.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250700
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/gcc/gcc-13.5.inc        |  1 +
 .../gcc/gcc/0028-CVE-2026-102010.patch        | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-CVE-2026-102010.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.5.inc b/meta/recipes-devtools/gcc/gcc-13.5.inc
index 13fbfa5a98..2de17a4177 100644
--- a/meta/recipes-devtools/gcc/gcc-13.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.5.inc
@@ -66,6 +66,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0027-Fix-gcc-vect-module-testcases.patch \
+           file://0028-CVE-2026-102010.patch \
 "
 SRC_URI[sha256sum] = "ec3df0015ed01411f91f9a9cd5b4da3070eb1222b02fadf4133c30c090399855"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0028-CVE-2026-102010.patch b/meta/recipes-devtools/gcc/gcc/0028-CVE-2026-102010.patch
new file mode 100644
index 0000000000..3bd1afeee3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-CVE-2026-102010.patch
@@ -0,0 +1,68 @@
+From aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Fri, 25 Sep 2026 18:14:34 +0100
+Subject: [PATCH] libstdc++: Fix use-after-free in pbds binary heap
+ (CVE-2026-102010) [PR127656]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+After reallocating the storage the m_a_entries pointer is left dangling
+and the new storage is leaked.
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/127656
+	* include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+	(erase_if): Update m_a_entries after reallocation.
+	* testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc:
+	New test.
+
+Reviewed-by: Tomasz Kamiński <tkaminsk@redhat.com>
+
+CVE: CVE-2026-102010
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ .../detail/binary_heap_/erase_fn_imps.hpp     |  1 +
+ .../regression/priority_queues_erase_if.cc    | 19 +++++++++++++++++++
+ 2 files changed, 20 insertions(+)
+ create mode 100644 libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc
+
+diff --git a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+index 2e70ed5c663..80d2cccbbf0 100644
+--- a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
++++ b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+@@ -121,6 +121,7 @@ erase_if(Pred pred)
+       entry_pointer new_entries = s_entry_allocator.allocate(new_size);
+       std::copy(m_a_entries, m_a_entries + left, new_entries);
+       s_entry_allocator.deallocate(m_a_entries, m_actual_size);
++      m_a_entries = new_entries;
+       m_actual_size = new_size;
+       resize_policy::notify_arbitrary(m_actual_size);
+     }
+diff --git a/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc b/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc
+new file mode 100644
+index 00000000000..30b8452eff9
+--- /dev/null
++++ b/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc
+@@ -0,0 +1,19 @@
++// { dg-do run }
++
++// CVE-2026-201020 use-after-free in binary heap erase_if
++
++#include <ext/pb_ds/priority_queue.hpp>
++
++bool is_odd(int v) { return v & 1; }
++
++int main()
++{
++  using __gnu_pbds::priority_queue;
++  using __gnu_pbds::binary_heap_tag;
++  priority_queue<int, std::less<int>, binary_heap_tag> q;
++  q.push(1);
++  q.push(2);
++  q.push(3);
++  q.erase_if(&is_odd);
++  q.clear();
++}
