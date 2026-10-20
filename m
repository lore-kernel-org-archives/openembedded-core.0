Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4766.1792538578004965234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=wtkOp5tQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so830055e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538576; x=1793143376; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUyMZ3BcIu4yyboe/ZjkC6js6wQrv8uhCTe4FIuD51U=;
        b=wtkOp5tQ+50lpt2T+Xek6rxDPodOWBe1UvLhfM63wTLJ/WJEJyME3Tw9gIdK6YUnvY
         Ya3a4Zj5LKZ6lGEirSi0Vq5/TK4y2TcpbeP++i85Dr8Gk935ynlgYXXgaydX26+Kqw5K
         lpuPIXJU7G3KPFGCXOC/hKUxThSuQffEc4wCG/yXgQbOd7FLTvYysllghFz8ONBvmtG1
         fRg18nUOFQJ431to/GxdTxfWUJuT4LkN3D/kaumrIizWQPNSygVkBGfKU3LUXUtPGhUQ
         iz6CKu6LtiDFN23PlLL88Uwk5WPcYGON8jkwWbWBxzaTHCbAOidkIM8ABwS2u76FcOaN
         JRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538576; x=1793143376;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUyMZ3BcIu4yyboe/ZjkC6js6wQrv8uhCTe4FIuD51U=;
        b=Uh/idwTtzNrW8/rS713OLFw00tbKw9FCc2yDx8LU4gD01baJv+NAAQFtddltID8ZfD
         MlOOEPbBe8bHv+tYCmNtGxI5XtfMZ4mIKmm5IWv7TomCD5ddtKylx7VvuBV8wcbpTK0w
         9NRCXRAL/nLU11H400EF5ZnNKP5TvQBECULgcnJ2r4ZXgS0Bv48KWhcuXo8IwYOmu56n
         3JrFL2bnlwwtn+UWkhjSir/YGBMNNYBKDo/CvBqU/dOz0ZB1zjtNULi4YlQ4LxjKAYdw
         IVC5O97Q7I0gzyXzarr6vbnMK2remrK9JHJGeEizStOfuI3ejWVw71fqeI/s1Hez2gcQ
         uWpA==
X-Gm-Message-State: AFq9FYKuH4obK74jueK3mbXcg7VKiVrl/654snPs3NO0WP/gEq409kYs
	f905eCW56t5ucHpZJCDhfaFy1uAeNFGdceFeL3ezERxJg4gf8DLKU5w3mdmS27rUKTzf7FJxJP9
	y/1InhPk=
X-Gm-Gg: AYBFou1DahG/tbgmIVinOku1+emGddLZnLbO72s+aJKDRfAn/oNYaxkSmPx/XiEJOI/
	b1odeGnCe0m6LLBHrKDDuludye+/93Myvs4udPdBGmjZUTqqY7+Hck1La7fau85Bh0Y9QwcNuKx
	tF4dzfqEOxuv+zG2l4WV3xvHZDXwmb+gbUEQcnbMl71PFp2QToAJID18TWqTnf/4giLY6av/io5
	5bpLoiE9bl8qaveMJD6Z/Z5GkeENwZu/fVIqBtS/GFy8RRP4rSxiwUN0YsuDCq3SATTHFJ8zyuT
	pYDaSY97DAb9iZjAKBdACwSky4gcIAeWtgj5/N0zQ6PjoOxbnoOaJXxogwIZqKSQov7wToPmb2G
	K9hTaC6o+Un+TdgrQrA7eZMFhbXE5M0pKamvfgyFSQdgcRWKBXzKVyRWm8Jse5dUjNYRZICXHyI
	fUKlgxkqpDyJUR5Z/ar+Y1bQR0JxfHde4hozUAFgG3S0ESEB31hyVgnzjFMOKdsoL93mHO4NEtn
	IQwyq3qfEuzMDlszkRuWvph96+c7taAoRvgH6N0ujQ3qbUsrVTamdyqQNmrbyWW3Ww5b4Mjow==
X-Received: by 2002:a05:600c:3b82:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a1fdaf7464mr4500645e9.7.1792538576109;
        Tue, 20 Oct 2026 16:22:56 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/25] gcc: Fix for CVE-2026-102010
Date: Wed, 21 Oct 2026 01:22:18 +0200
Message-ID: <a98523e3c9a18cb9087ae850c5ae548365d9244d.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248327
Content-Type: text/plain; charset="utf-8"

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

PR 127656 use-after-free in libstdc++ pbds binary heap erase_if

After reallocating the storage the m_a_entries pointer is left dangling
and the new storage is leaked. Update m_a_entries after reallocation

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-102010
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127656
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit afc275bd17dea41c2ea6a5c73c697052c2df4e38)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: deindented the commit message]
---
 meta/recipes-devtools/gcc/gcc-15.3.inc        |  1 +
 .../gcc/gcc/0029-CVE-2026-102010.patch        | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0029-CVE-2026-102010.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.3.inc b/meta/recipes-devtools/gcc/gcc-15.3.inc
index 2f743510850..ed719197bc3 100644
--- a/meta/recipes-devtools/gcc/gcc-15.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.3.inc
@@ -75,6 +75,7 @@ SRC_URI = "${BASEURI} \
            file://0028-fix-gcc-libitm-false-postives-02.patch \
 	    file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
+	   file://0029-CVE-2026-102010.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-102010.patch b/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-102010.patch
new file mode 100644
index 00000000000..5eed94ab5a3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-102010.patch
@@ -0,0 +1,73 @@
+From 29e51a820d76c766ae417fcba912714337b0eb17 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Fri, 25 Sep 2026 18:14:34 +0100
+Subject: libstdc++: Fix use-after-free in pbds binary heap (CVE-2026-102010)
+ [PR127656]
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
+CVE: CVE-2026-102010
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6]
+
+Reviewed-by: Tomasz Kamiński <tkaminsk@redhat.com>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+(cherry picked from commit aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6)
+---
+ .../ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp   |  1 +
+ .../ext/pb_ds/regression/priority_queues_erase_if.cc  | 19 +++++++++++++++++++
+ 2 files changed, 20 insertions(+)
+ create mode 100644 libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc
+
+diff --git a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+index 752688bb8e94..1eec3c9fb334 100644
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
+index 000000000000..30b8452eff96
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
+-- 
+cgit 
+
