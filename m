Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id F3D1A7D8DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 14:52:20 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id r18so3197605ioh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vb+aSBHxciNOXNCOePjoOzbpiJt9sVyxcY9IIpNNQUg=;
	b=n1LzrXMp36Hm1szyYw5WIl/z//wJIRvtDNio9R2kI6oSsF5YE6h4KFAODQgrksM24O
	bfv/pRqjfxvNvOTSM5O3ixIe+FKNcr6MFj6Ubtsd9dOqBQg94XVq3J6xKKADAsLUlx23
	4SAR9kUxTNYuQ5dmY1HrFVScdxFU2IytZ6RQZW9bM9epUmzN4VMR7n1axO08QxY1Q6oK
	Ws8wYW8DkeY2V6lIlK7I5LnpcT1WdS2OKBsIgMSIPwxcyivBNVaTssW0Iy9E2O/X2pFH
	7beA0LeN5Gx3Xuh1O2hnFXz2+aHmP9OG42jc9t6t9eWI1+TJKQHK37jGMCjz595TkojS
	CdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vb+aSBHxciNOXNCOePjoOzbpiJt9sVyxcY9IIpNNQUg=;
	b=nESY9Zgjk+nptOHJpgQz2muax7/vj579izKxhROAhK5WJ9wBNIpWjt0DnayZDId5Xp
	/nbXxXRS+qQPcBLlMdD5pAspbvIX++TSY9Y5Cw0M0CR5CzAGz2quMxgJ83bETStRowsK
	4O2dpnSSF9tjhiEYJWnbr+QfJ9pmuxhketJoDcSVu9QJSbOYQdXGV1ezpFDft6JPBsbi
	Gj9Vf4ra8rq09EgSg0qcXZG60eRuWD/dKpwKlfK+KVQiU+LyVgwyIvm3i0HO5o8r7d66
	gsn8BPMGO2oKOcvDIwYMCvMbB/ykUGLHqS1LSawZh1yZOWsJLrQhL0V9oJxC+5IfFN4e
	IhlA==
X-Gm-Message-State: APjAAAUP7hNV4gd+UEwJcHSWus0U7m1AVffHVe/R8nBWUa8r1WTWEXwV
	j+42Q5YTjxqr/sVucx7ann4=
X-Google-Smtp-Source: APXvYqx1F3st4+QUyCBQlFwWnRKvtQzAURb2QGHa1aH648Y+7ho/KC11S+zTFJSdORvUU1JBYFN+Lg==
X-Received: by 2002:a5d:8757:: with SMTP id k23mr13691577iol.68.1556290341688; 
	Fri, 26 Apr 2019 07:52:21 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id t24sm4625947ioc.1.2019.04.26.07.52.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Apr 2019 07:52:20 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 26 Apr 2019 10:52:15 -0400
Message-Id: <61178b6423c08ebdffa2970e19dbb7decdecd7bc.1556289910.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1556289910.git.bruce.ashfield@gmail.com>
References: <cover.1556289910.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto-rt/4.19: fix merge conflict in lru_drain
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
X-List-Received-Date: Fri, 26 Apr 2019 14:52:21 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Paul Gortmaker sent along the following fixup for 4.19-rt:

[
  Author: Paul Gortmaker <paul.gortmaker@windriver.com>
  Date:   Mon Apr 15 12:01:31 2019 -0400

    Revert "mm: handle lru_add_drain_all for UP properly"

    This reverts commit e6e9d6e290028b0a6b83b563fad9fafa7f1d515e.

    It was a 4.19.31 backport of commit 6ea183d60c46 ("mm: handle
    lru_add_drain_all for UP properly").  In summary, what that did
    was to fix a possible harmless WARN_ON on non-SMP, introduced at
    commit 4d43d395fed1 ("workqueue: Try to catch flush_work() without
    INIT_WORK().") by adding non-SMP variants of lru functions.

    The combination of that, with the -rt commit 473f14a9f234 ("mm:
    perform lru_add_drain_all() remotely") at the merge of the two
    results in the following build failure:

      mm/swap.c:736:2: error: #endif without #if

    since the -rt change wants RT specific lru and the stable backport
    wants non-SMP specific lru, and a chunk of the backport with
    an #ifdef CONFIG_SMP is missing.

    However, before we add a four way cluster of ifdeffery to handle all
    cases, we note 4d43d395fed1 was added to the v5.1 release, and it
    was not (currently) backported to any 4.19.x stable release - so it is
    unclear to me why this commit was ever backported to 4.19.31 at all.

    Further, we note this change was to mm/swap.c -- and by definition,
    any preempt-rt deployment that uses swap for anything other than a
    failure contingency mitigation is broken by design.

    Given all that, I decided that the best path forward was to revert
    the two of the three chunks of the backport that remain in the -rt
    branch, and return us to the pre-4.19.31 merge behaviour for -rt.

    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
]

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index cdba9d210a..834b8fc03c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b0ea9ef736c8ab8695bdfba61cd121ce5aa47e49"
+SRCREV_machine ?= "c279a81f1e654023c4cc78afa9f14350ee5f836f"
 SRCREV_meta ?= "9bda6190bfc9e7858c2f7588109a0ec966f37a09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


