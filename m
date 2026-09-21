Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932D6C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:20 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43671.1789974431439972763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N0XwB7II;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso35697235e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974430; x=1790579230; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/unR+YgTT3p9wb9h0XHsXzbGZxYNVk8Fzg6B8woU8gY=;
        b=N0XwB7IIz5W3l0GntHOa8Ztl23bisaZuwtEVXoGxqCsAs/oawpVlbVcMcW6dKa4Pfh
         bdZtN4tl5xnIDBAXlwdHGhyxQL6W6oPyLU1rwWNdOcNdS7wUejiPCceal8HZKYCzEmRV
         FAsWM1t2WP23vJ7L3+vq5DXDeLm6eH2WDCc/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974430; x=1790579230;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/unR+YgTT3p9wb9h0XHsXzbGZxYNVk8Fzg6B8woU8gY=;
        b=TTMCtC19stQUUDhXK5FeJviEwJVSAKOMDhsNZIHpQd5k/EyVEzqZ1oUosW01VDGihN
         ABR9wABD2ee65s+ZsbzuT2A6nV1s+ZTDIqSqGWrH+af9mkES90PLjGyajFyi/iaglYdP
         Vq5IYeX4ovGyRuwait58VZ10DaK7jYxNTJiVlw450lUIkOL8ls24zHeiNau0skeRyYsR
         F5tm5yIeOWP9KB8Qg1/UxPnz4NpOfURKpg5CFLJmmJ41KObIImYjGnQY0o04fGYKbehA
         zLL0Dpats1cyUHGi8qhqtMzLBvRuIZ/KCoKpMqKSb/ski4OucgQWl7q4yOko+ctIFiVo
         nMVg==
X-Gm-Message-State: AFuF++nWL4xuZLd9Pwtt4XC85pp9f3CclWVIF7742aRwdTzt1lA6rhOq
	0sl+Ln2e2W6Y4oVz8X7J/YPMgGcbcyA7BbyIoiCrrlnMmq5ZvOe/61gIy4po0mmeGTZhvaTbjPn
	82D0pqmc=
X-Gm-Gg: AYBFou1141Kk9vCeakITsConkeWCwJd0rH2dWNCR5FU3u5wtXR5ltMnQFPXk5SOnFEF
	03jdULHO26zgkQ+RFtn43Ao4jJWA1hb19xwN2IIKKmWrNy5Rbt07EQINLtnlEanPc7oXdv5Kwq4
	A59+xfxWEr4lAOl78STt4Jp+4Z+Zye1jIxuj9YdjpUaYSCiEgoCIfDpHIhpX4AimYG4SEMzPcNc
	w8/H1hrDWzPZ0Mp+aswb5yRPMn0sTbq0Daq3i6YchdQ3RTEdGECdWUhzCI1jzgHqTGmr4ayLwZU
	+NNQZwF20YRuIKRnN7I9lJCrtO8mk48y50T+vqjLOtOPmmbKjSwy4C2avzeV9WBeDTvWTSS2euI
	ytq1H5C4h/llQ+h2UYvD+4yktd8xUSLsjMApRI5ZkzDyXCCcAObkR12EjWaPoDsIrGknAq2xALW
	MT+LLSqGrTBKWu2s4MxfH+Wu75555f6wbSNfAdq0x/id2uJdy5pdzEqe+Qb28orPndhKRH0fFUm
	0g17YTulePORk4Js4e1Ov4iGNc=
X-Received: by 2002:a05:600c:4ecf:b0:49f:bd3c:bc27 with SMTP id 5b1f17b1804b1-49fc574f074mr129828015e9.34.1789974429689;
        Mon, 21 Sep 2026 00:07:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/20] python3-wcwidth: upgrade 0.8.3 -> 0.8.4
Date: Mon, 21 Sep 2026 08:06:45 +0100
Message-ID: <20260921070656.521680-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246296

0.8.4 *2026-09-17*
  * **Bugfix** `clip()`_ hangs with OSC 8 hyperlinks in some conditions, `PR #252`_.
  * **Bugfix** width of ITU T.416 colon-format SGR color parameters, `PR #243`_.
  * **Bugfix** width of OSC 66 text sizing sequences without a text field, `PR #246`_.
  * **Bugfix** `width()`_, `ljust()`_, `rjust()`_, `center()`_, `clip()`_ and `strip_sequences()`_
    treated ``ESC ( LF`` as text instead of a character set designation (rare), `PR #259`_.
  * **Bugfix** `clip()`_ painter's algorithm and "tab expansion" should be spaces, `PR #259`_.
  * **Changed** `iter_graphemes()`_ clustering rule GB9c for Unicode 18.0, `PR #238`_.
  * **Changed** ``ambiguous_width`` arguments are now clamped to allowed range (1, 2), `PR #246`_.
  * **Changed** `wrap()`_ now raises ``ValueError`` for a width of zero or less, matching stdlib
    ``textwrap``.  Previously ``wrap('女', 0)`` returned ``['女']``, `PR #246`_.
  * **Changed** `clip()`_ arguments ``start=0`` and ``end=-1`` become optional, `PR #250`_.
  * **Updated** tables for Unicode version 18.0, `PR #238`_.
  * **Updated** ``ucs-detect`` data files used in some automatic tests are no longer
    distributed, `PR #253`_.

A typo meant the original do_install_ptest append wasn't used. The bin files aren't
helpful in the tests anyway, they'd generate data but have dependency and network
access challenges.

Therefore drop that append but add one to ensure pyproject.toml is installed
since one test accesses it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-wcwidth_0.8.3.bb => python3-wcwidth_0.8.4.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.8.3.bb => python3-wcwidth_0.8.4.bb} (65%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb b/meta/recipes-devtools/python/python3-wcwidth_0.8.4.bb
similarity index 65%
rename from meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.8.4.bb
index 3ba5b5b29b1..8ac99afc3ec 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.8.4.bb
@@ -4,13 +4,12 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "d128512515fbf4612e0ff21fd6380399210318b7b54a9af59dff8454cf9730eb"
+SRC_URI[sha256sum] = "2dae09efa25253ae2874188e86d6861af3b1652aef4118cdf3f0bda288a957fb"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-do_install_ptest:aapend() {
-      install -d ${D}${PTEST_PATH}/bin
-      cp -rf ${S}/bin/* ${D}${PTEST_PATH}/bin/
+do_install_ptest:append() {
+      cp ${S}/pyproject.toml ${D}${PTEST_PATH}/
 }
 
 BBCLASSEXTEND = "native nativesdk"

