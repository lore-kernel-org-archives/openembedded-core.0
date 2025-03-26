Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A59C3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:52 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.33362.1743020986561243465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IMJG7cq1;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3014678689aso343745a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020986; x=1743625786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UooPfrwCOqek3KLa8hPrgiqlRjMOTB01QfXxv7DFu70=;
        b=IMJG7cq15QFhcqyFxHYo4bqFQOPWG3eA7lJz/FDlG6F7wS2ijBNte+RpX9gq72+U25
         9def0rS2ajaKGSInPSIWO9FM3qEbWmWpB98JF2e5CWhxXexEOzu4hq4GvTGgeZpKn9sH
         jr89MMwImj5S4z1JPI4kNI+bE+beUXeEOeP74hnUOVYnuLIMRUL8OzHwlyLQA7OX7GDH
         PKEc9nCO/bHpp9WMV/bPYIBj5gDiqvyiVaOWT/Zi097Y0fhqduIGAwwRN0hmX5b3O/30
         XftthR0Q3maHeq55Za/+EWJkFStzS2GoMeQV9wUj9wt8tU52nRiG72Fyp4w/9s17hgG9
         8gNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020986; x=1743625786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UooPfrwCOqek3KLa8hPrgiqlRjMOTB01QfXxv7DFu70=;
        b=uc/YJldSjaLN94R6fWk5tHb1meE7LrNrGuCah2EwpCFtYEsUjzj/jXNE1IT9hTrB5V
         6VlI0FWg/ExLk3ConBL+tbgKfHo2kbbn2pjE66UBI1z52IyNwtLMY9CF7vU5QErb+bcm
         y3bzwvDBsZrBZJGrbpcPwxSN/17Z3sAFexFY7DKrixbcs6FZszJlNFF+urrUGGjN6RA4
         841H4cXrNJVSfQ3PFw+sjsrIEdR56jWWxad3esTonvDMYJtJPrjYWiyewZmqJ+94I33H
         sDi2jqnSGKFuupxzpZS6hNW7gCPpevrtRCiFDnGK3EGEYUuLLSQ7B3MU/7am+7kmMNed
         tFFg==
X-Gm-Message-State: AOJu0YwCV65I/f5JPhdkAYrcA6KHBHoRPW/8bHyaynGZuxeFKyqhEUwQ
	BPLnrlZXbiZPe6Z28hhOXW+HoUU07a19VCWaWZv1hYk64gIa9pL/d1rpp4fJ
X-Gm-Gg: ASbGncskKHFgd1tdsIcsOvJjBSeQgX3aET3+W/MwYNoFH8ZaM0btJ8SzX8P3pSEUezN
	S8hc4NEsLRRnqy8Tcvh0O/ayCZQOMiCCwdEkrHqvX8JmX2gsNHRoSRHcGih7vnKBBS0IYF6cl0Q
	/9guDnYrGgCh8dCMqpC7/wjTtl02EIcbGsnBlSlofPFgqeoGPNp4LY0W0BKZLaJu9kg8zwkfDi+
	PwliVGpHfhR1xlcXMtaZsoXr1LGDIV29Z8i0IXftijgnHJ9DFPyVdYZXzcDOlTTO88AB2ce76Uv
	3Aa1q+WvB7gqPm0PsRlj6uNSlHKWO/kyhSVQLFrkcxTYoP0ealy+3c6uRBKp6GIqSjo=
X-Google-Smtp-Source: AGHT+IGtqQRUoqBthDyF32VgtB7/U+ZDJcX8BmzV+0XulQGC6/cLwlvGLVTGSplod8JzId3tQ2sFAQ==
X-Received: by 2002:a17:90b:2b8b:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-303a7f6eb38mr1536953a91.15.1743020985659;
        Wed, 26 Mar 2025 13:29:45 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:45 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 16/31] linux-firmware: upgrade 20241210 -> 20250109
Date: Wed, 26 Mar 2025 17:28:02 -0300
Message-Id: <20250326202817.64437-17-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213676

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The linux-firmware now requires GNU Parallel in order to run parallel
builds. As the GNU Parallel is not a part of oe-core (the recipe is
present in meta-oe) disable parallel builds.

License-Update: additional files

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 16e86b63696177a6f8b8f73b41e55dd6389f9e1c)
---
 ...nux-firmware_20241210.bb => linux-firmware_20250109.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20241210.bb => linux-firmware_20250109.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index d3757b5bbc92..ba66ea407dec 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "0b30c661e226decdac3acd31d83517e0"
+WHENCE_CHKSUM  = "c90a25ccbd027eb8d61b2943ab68447c"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -247,7 +247,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "2bb035708576d076f97d4196a1c22e0a4d33fbb0210d05428d0bf4f243e99af5"
+SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
 
 inherit allarch
 
@@ -259,6 +259,9 @@ PACKAGECONFIG[deduplicate] = ",,rdfind-native"
 # Possible values are "xz" and "zst".
 FIRMWARE_COMPRESSION ?= ""
 
+# Specifying -j requires GNU parallel, which is a part of meta-oe
+PARALLEL_MAKE = ""
+
 def fw_compr_suffix(d):
     compr = d.getVar('FIRMWARE_COMPRESSION')
     if compr == '':
-- 
2.39.5


