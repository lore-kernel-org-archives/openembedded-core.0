Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485B3CD98DE
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105045.1781424231279525437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hq/gdix3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490c1915793so19611425e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424229; x=1782029029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74o7VNN42Jgjhrd+FMd+GYSfFBo+VO3bUsOuOeQX0H0=;
        b=Hq/gdix3Gwxc4k9XvEoMJdDA0R6l8aOWNQkrkUh8mlR+Crf+bJ9NMI5DTQcrhP+2Iq
         RRTp0+lqRvNqCApS2QgKK6l5ahHhBsaMBFGaGQDuZpllN1qcChpsT1OS2p1Ppa5Jv5CI
         KhfdqX4Ni+axO7cwTE4qvSRzXEokpqUT9TvQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424229; x=1782029029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=74o7VNN42Jgjhrd+FMd+GYSfFBo+VO3bUsOuOeQX0H0=;
        b=p8qX6WOYmGIDmXUQmQ9yHoZpQ1B70MQSlNJdqDGBbJzAMfULWUxLK/M8c1OFFUneBN
         pqlmqgldj2HZvCYVz/y+xZtchWjCHSWxc8sdTsToUMkeXtRzL6XQnA7rAshMcqejZ7d1
         aPg8vn3yUPsSj52T9RVBj2BvxS/TAQdrBg5/mq442OVJ7NE0v3WvZ3eJyiukiTqVlfmG
         PQ051X/4CppqREECeF2Ihc57n6PADWs7r+1voYbGRm3NbnByimLoCaLo3PRtGAvouqHd
         aXPHIjkPNIjYSlUlKoAW+ww0Qrp2n4LFas/ml7UPykhc3vShle+hIS5/YNnp+k5eaDF0
         fJjg==
X-Gm-Message-State: AOJu0YzoGkgpEcxPiuS8xjBf43T2u8O1RBO07DtL1NBtokDynPpVLlpk
	x/VoTzEe3HKlHv3dU/5DycxvJT3gEUPDLAuIBKIm8FRjrI9mL7p3X7sVTbUUQmuafevnCRw6Z0X
	uxwfm
X-Gm-Gg: Acq92OFHbhvhdWlGgI+9m2u4gGg/3sy3zxyueID1XK/ZgN+JyAC0aGsRjUc2TMt07Rv
	djfSbpd6hxYdCl898ygGRLuU5lfnADzctYjZQSEAN0gdLCdTyLKpClG/YQ58hjUY9hh5b/OxpW8
	XmL3vgpNxo5/yhIbppvjl6nKwVNDocfOPcbUlkYdUDMO2SFuqrQ1xuat4Ct3OZ0ssJ1v+6rqnLW
	yonJYMKazNbKuElZztw26iN6BaTMidx62yyqrNeOe78v37OqxqBmejL1LrK6g59ERFto2XNRMji
	DOoi9zDP+1sRPeyUruXiNN797ZZH7ONk6foWSn+ZpAV49dkbfFNZUebQ+1ZlJbDBRs96x5KVm89
	JdPA65MUn5OOLHl0GO326+jxX5WlblxY6mrbHfmEp7xIJdioNNI6XbP3rJnZNpz1uv6cshoZLTk
	vdPxZfI6GzP7huBsrQXE3muhxe7jCWV8sSY8mXBiBoJH6rsUWnytFA
X-Received: by 2002:a05:600d:8443:20b0:490:601f:d776 with SMTP id 5b1f17b1804b1-490ec4c5bc4mr86034645e9.3.1781424229490;
        Sun, 14 Jun 2026 01:03:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/56] python3-click: upgrade 8.3.3 -> 8.4.1
Date: Sun, 14 Jun 2026 09:02:36 +0100
Message-ID: <20260614080307.4017177-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238709

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-click_8.3.3.bb => python3-click_8.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.3.3.bb => python3-click_8.4.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.3.bb b/meta/recipes-devtools/python/python3-click_8.4.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.3.3.bb
rename to meta/recipes-devtools/python/python3-click_8.4.1.bb
index 12fd3cbfbdd..0669cc65108 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.3.bb
+++ b/meta/recipes-devtools/python/python3-click_8.4.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
+SRC_URI[sha256sum] = "918b5633eddf6b41c32d4f454bf0de810065c74e3f7dbf8ee5452f8be88d3e96"
 
 inherit pypi python_flit_core ptest-python-pytest
 

