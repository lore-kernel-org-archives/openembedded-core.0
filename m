Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3746.1793405764574616932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=eGp/xIrA;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so7643485e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405763; x=1794010563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IPEdGzyjjEvwhu2TIQJcT9CPJui5LN71e1AbOGjHfAU=;
        b=eGp/xIrAlV2Ng8Xa4wEuojceE6mF4OfTVZ2ZglProbYl67d9Di0E5gkFMCmg/9hRsz
         MKyQA/VHIe2f07dUT9Y931G4mtjjawso3cQHY04T4k22GzKoETk1/I5ch/F4Ep7cPc4X
         8XMRIwQ8cD77ft0qYvzgNgHZ+qT3qVPtvuIwxgqvOruLVKIdzonqy56cyX3iDfEymdoL
         gQio686I773jstf6wUHjrry8ij6wS/zgGeqhqpxWmfpESZKbI4cQb9xPWGckwTMk3BT/
         FfJq4ConUe+yYF3YfSW2m9kYZTLbfy8MCoEdAlYolbNXz7BGoJXaeCYjgl4UxwruJ55x
         KQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405763; x=1794010563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IPEdGzyjjEvwhu2TIQJcT9CPJui5LN71e1AbOGjHfAU=;
        b=rYZy4jMlTwt/whgTsFu+peMy42piD64Zf8LAp5dYMayE7v9GjxlsgyJwsPTQiK5Tt9
         7XrSX7GcSVYYB6EABmVKo2JqfVumjGOXo56BV/G7FdBjeZnIds5HmlTIwpzNCuXQtDo7
         2D7IscylBSlOoN6ejwnurT0YW0Rbhsul2OhKmMbXJ3zu2etdJz8p83OM0gJuq+9F28sr
         CVMVT+63+BjXpuKzc2wpHCUnobCnEHHrID0lrPUYrfIjsP7B5lr8p0/g8mFoHh6nd0t9
         xfRsxNDQIs26IAMATZLq5z9fD6/z+Q4amP+/ssltuU8BybeD+dRX9JTGl3JaalVO2qPC
         VTbQ==
X-Gm-Message-State: AFq9FYI7PT+qJZeKq7qf4Jt/4CbyUkKnvXPtQeTd8epqaEJb3+hGhGrt
	SPd+Q2P0OUWaPCj457xea3o6M8S3MGyWfgqWdSu2ZbZQv/e3gj+jBgq4mtouEcRrnJEdH/fsuWz
	qEoKUAy0=
X-Gm-Gg: AYBFou1deKP1bN/vuq20N8GMB7WlL8RslOaqtY9O5O2wEqB/ROp7MBFBGNWThdj/WJm
	wz+fEIZKMm/4VVyu+2BJrQNeK7g/ahYtEl1Q6bpY0tjKMelz9x3QZKEzcnleT8nWZyafQCXZhGj
	zAjymx9iRk1RIlUqAykf/f9hFfbV0gDI6avng8/UJllTlf2JjLXq7SM47d/cw3sS4eS7il4SGn3
	GobW+XLOh4m1D6RoG0LAf1MNRAwuled82xMfpuUqmSyQrk0xiN92yG5JwKN9UmtVU9IhHBE0UuC
	KpG9SKSb/bMtaqO9R8mBffkhdJV2NetBFZ0BXRHZaw1OQxB1Y05JsLiTyYltv48vBVkuD58D5YR
	AKKhniZRq9+QwX3xnpkW9qjHhsLKVOUNZ1u6s/dkPIFZ7BC7GhroZVcLBi1NjsL4Y01lK6ZaNSL
	zbbOYDNjU++nMJOhMJatMB0N8OhtehScpEfItTRQYmNbG9LvE+crcOQzZKwcDnRt4CMunY16n/z
	jJBwD8Ku+kr/xHtI4jJ4JmO8hbgL31UE6ABnCZhvE3uPhBFFLSbjBTLjJ9ThAfUOHx1L2dxaAyG
	V4dtXEa/ABU5yRj/FyE+sjrtd02lwlX5DmfKCaFQVbd7LrXTFO/h234Pq0vcBPrbULfoIjvTdAE
	OkpJpHwcxoYOhotv+G3oHO4oWwE6cdQ==
X-Received: by 2002:a05:600c:e543:b0:4ac:ab43:b50b with SMTP id 5b1f17b1804b1-4acab43b5f3mr53302635e9.26.1793405762850;
        Fri, 30 Oct 2026 17:16:02 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 34/55] glibc: stable 2.39 branch updates to b7a0de2c8f
Date: Sat, 31 Oct 2026 01:14:55 +0100
Message-ID: <77cd6c551efab4e73b765421cdb4650bcdfeab0a.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249109
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Update SRCREV to pull the latest fixes from the upstream
release/2.39/master branch. This branch does not seem to receive
security fixes anymore, but still got two new commits during last
months.

Commits between the old SRCREV (be1e627cd7) and the new SRCREV (b7a0de2c8f):

b7a0de2c8f powerpc: Fix off-by-one in AT_HWCAP4 loop in _dl_procinfo
d9eaad3515 rtld: cache cpuid results on the stack for intel

Testing Results:
(note that the comparison is done against yocto-20.0.21, so includes
testing of last 14 CVE patches)

+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 4933   | 4941   | +8   |
| FAIL         | 221    | 223    | +2   |
| XFAIL        | 16     | 16     |  0   |
| XPASS        | 4      | 4      |  0   |
| UNSUPPORTED  | 227    | 227    |  0   |
+--------------+--------+--------+------+

Changes in testcases:                   Before  After  Source
(no change in already existing tests, flaky test filtered by 3 runs)
elf/tst-dl-path-normalize                ---    PASS   CVE-2026-86805/CVE-2026-95818
elf/tst-tunables-enable_secure           ---    PASS   CVE-2026-86805/CVE-2026-95818 test harness
iconvdata/tst-jisx0213-progress          ---    PASS   CVE-2026-77117/CVE-2026-80489
libio/bug-wgenops-bz33998.test-result    ---    PASS   CVE-2026-5928
libio/tst-fopen-ccs-empty                ---    PASS   CVE-2026-18374
posix/tst-wordexp-append                 ---    PASS   CVE-2026-6368
stdio-common/tst-vfscanf-bz34008         ---    PASS   CVE-2026-5450
stdlib/tst-strfmon-bug34510              ---    PASS   CVE-2026-19499
elf/tst-origin-secure                    ---    FAIL   CVE-2026-86805/CVE-2026-95818
posix/tst-wordexp-tilde                  ---    FAIL   CVE-2026-6791

The two new tests which do not pass when running glibc-testsuite will
pass under following conditions:
* FAIL -> UNSUPPORTED: removing patch 0022 fixes these tests
  this fixes 41 FAIL -> 6 PASS + 35 UNSUPPORTED and can be sent as
  separate patch if requested
  see OE-Core rev: 5eb80f3c562f6e395562c52df67fab60ae0ff32b
* UNSUPPORTED -> PASS: running natively
  qemu-user doesn't support the call test-container makes to create its
  isolated environment (unshare(CLONE_NEWUSER))
  running natively is possible when target arch equals to host arch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 2.44 -> 2.39 typo in branch name]
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 5d57dafed0a..1f4f372c13b 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "be1e627cd72db31161a3b4ce1c8114674f0895eb"
+SRCREV_glibc ?= "b7a0de2c8f68722cfdfc735b8358a3a6559ec0eb"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
