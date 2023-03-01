Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84D7C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 15:14:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.24930.1677683637664143895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 07:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hm3+tXpj;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d7so14498960qtr.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 07:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXeVISV+2NNcGruYeTPkuIw98gIeL2L9lnkLbU4nm/s=;
        b=hm3+tXpjKxv7hpXa/kczGLahrKl7RmGsUtoCrkca8gk6cQ0YfcovrEwnD3HhOnLZxC
         a14u0a6KRu9xYxZLyhPyiSWevpyK1QZCN9jLC4Fn9NQGYrfw74PXdKQTo9daZadV81rz
         lGWxAjla3xEOkxFH4l0yT304Z4W+NbgeUUlkQj2pJb0JX/5t2mp+9BqM8pOjb1t3DR2P
         ieT2oBBiP/Q3AUCwhJ9ztZpvIz4N2lgQXD8toDmMFvoRt6ZAaC2NnNW4jnrn8BW1hjEx
         5VuM7ZcoVzRHso+zAROXHAfhlu3sumHcJS4EVCuoCf7qk5vzuvRk04+Ebt19BfkXnN3Y
         gZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXeVISV+2NNcGruYeTPkuIw98gIeL2L9lnkLbU4nm/s=;
        b=ZXepIC7Pp6YBwjnVCOIbkIKI20+odvrdLfxiPdDZAl2pShogU1XGf2B9BVE1ISfhs2
         fp5GzKEMUevSzdWDTHUQ0SoukRpwFHQOFZTSARH+a53EYdLp+M0qbpNLOSq5y/UJM0lP
         IrsYrqYa11DgM19tFt/ukDEWlZnpxkIQJu21fA81VwmfWMRN2PyQ2w8RCpHZ8Uqbf2JW
         g8HjXZ1boph1LTNEXoN3+1hdwyA/PSOljOLi/YRgs4iWL5qS4oBqjmKluhTaIGMoVWZt
         pRP3i+nvd69yNTblaYqQsRVyLgGLlCOtqhUOopi/dzQlMkT3KvtTIThHXkPeAXTVZkmG
         oYCg==
X-Gm-Message-State: AO0yUKX0qhhDWznWZjimv33NX+eqKu3gwPnKxoO+ND5SZVBBFiFKc7tv
	TTyxqMWE06SLViKOwYQtqTw7gasPh0XaMg==
X-Google-Smtp-Source: AK7set/lw6V8plFXPPSN5j/ZuNp10N39+pE7Kl6gjohVt1LQRh6UnFMtFlBcsUpbVboI3ScTgpEBQQ==
X-Received: by 2002:ac8:5e10:0:b0:3b8:6c8e:4f85 with SMTP id h16-20020ac85e10000000b003b86c8e4f85mr13064487qtx.43.1677683640107;
        Wed, 01 Mar 2023 07:14:00 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x2-20020ac86b42000000b003b635a5d56csm8472323qts.30.2023.03.01.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:13:59 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto-rt/5.15: update to -rt59
Date: Wed,  1 Mar 2023 10:13:46 -0500
Message-Id: <d93697b00bbd9d46e131032ad133ae176cebc0ad.1677683523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677683523.git.bruce.ashfield@gmail.com>
References: <cover.1677683523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 15:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177943

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    4d335265c101 'Linux 5.15.94-rt59'
    c3b4464f5d2b 'Linux 5.15.93-rt58'
    c67bd325f576 'Linux 5.15.92-rt57'
    48e551ae0f55 'Linux 5.15.86-rt56'
    977a63a270ad 'Linux 5.15.85-rt55'
    adaa1d9e19a5 'Linux 5.15.79-rt54'
    ff3c61c5ead1 'Linux 5.15.76-rt53'
    e17260e8d340 'Linux 5.15.73-rt52'
    c83f436b7981 'Linux 5.15.71-rt51'
    e01c9e3ba82d 'Linux 5.15.70-rt50'
    debedeb4264e mm/memcg: Only perform the debug checks on !PREEMPT_RT
    1ef2cd0b8676 mm/memcg: Add a comment regarding the release `obj'.
    f8d153e08d42 mm/memcg: Add missing counter index which are not update in interrupt.
    11624404f67a mm/memcg: Disable migration instead of preemption in drain_all_stock().
    0a1f4de6ed4f mm/memcg: Protect memcg_stock with a local_lock_t
    3f15202f27da mm/memcg: Opencode the inner part of obj_cgroup_uncharge_pages() in drain_obj_stock()
    40dbbd2f9773 mm/memcg: Protect per-CPU counter by disabling preemption on PREEMPT_RT where needed.
    6269831106f5 mm/memcg: Disable threshold event handlers on PREEMPT_RT
    8da0e71b7b7d mm/memcg: Revert ("mm/memcg: optimize user context object stock access")

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index caa5e5197f..0f557ba2c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c69881f9ba51496f0930cd39bd67f9dfb8d3a612"
+SRCREV_machine ?= "4d335265c1010cdf45dc0169b1b79638323a5109"
 SRCREV_meta ?= "509f4b9d68337f103633d48b621c1c9aa0dc975d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.34.1


