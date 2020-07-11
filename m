Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.2970.1594437817511056218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qf0T2QbI;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id e8so3367305pgc.5
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 20:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IA5LOLrnrAE/pNKNLg8m9sNt/P26+rAyKqFRMF2PbFQ=;
        b=qf0T2QbI0L73yFN6SPRjaajAnb82cC/BxijHw4L8pHvxzFBspdLziFeLl2pYvIGj0n
         NdZZCiy7jpzFa+fPflgN4h0L2jpMne94K1qCirM6O74q4imPLZTMqIUoWt0T7SmBHgz2
         EbTK8tq9nwLJxarP3Qbt6O6VpGiY2d5er1TLYb42XdhjQjLxFaHuiBn/tzeK7/oQ34A/
         cPF+dGB/iG677fDWNOG67dQgDGVH7xBr2dzoALyLSaeJK76EycupkC+AVmCZ5i6yYdIT
         8tzQIRf3VJA1H3FSLXdwZF2S8nqrDKG4d5wXCO82lhWpQi3hnuHT/PMO1ekMpppcxhq1
         dp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IA5LOLrnrAE/pNKNLg8m9sNt/P26+rAyKqFRMF2PbFQ=;
        b=FJJpuem7w7xJxbwjQzec0xVcuAPA6V1Ppe/Qwdc4muwuPrERkEvK77ahwUY9G7HdAX
         2fQuDMcnT6nc7fvvpDmTQCHUMIDrK+E3EwOYlLYLYkxZGTu7QVqHmcHpSJ07GhanuJWt
         TRtP+fSlQrTrZkr8XQQT4O20POMzz864onb5ixHqT2ndL1c45TSFTyuQpwuyJmC8rbtg
         WXsRp7JlUS3dddwqOGZLCWXfPdZEi9LQBYuUhHAACWQWdVNBywuIZpB+DCwy3AIT0/H7
         ZB8M57JT9AnlORszn88TvNKenYe4azYP/CR4L+d5RXfvUwv35QmaUPJO+AwjtvuC3yxH
         Q17g==
X-Gm-Message-State: AOAM530V+wc4l0dYtBMM3Rnhz58hNtFmCLCRNu7guo58yVRT9xV6bShp
	bsqV8htZK1K0slMGkhE9YGemSJY0
X-Google-Smtp-Source: ABdhPJyZculRd6cGisRTeQe/Mk3RLLCNAdaoNyE3TbbCWPOWYoYT+Kfq2brks7dh/eRufkpDBUfw4w==
X-Received: by 2002:a63:6fcd:: with SMTP id k196mr38793632pgc.251.1594437816774;
        Fri, 10 Jul 2020 20:23:36 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:8846:99f4:e279:5146])
        by smtp.gmail.com with ESMTPSA id y17sm7235788pfe.30.2020.07.10.20.23.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 20:23:36 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lib/oe/recipeutils.py: add AUTHOR; BBCLASSEXTEND
Date: Fri, 10 Jul 2020 20:23:15 -0700
Message-Id: <82f82b9e01a0beb0b145954f876acea99208f4e8.1594437521.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1594437521.git.timothy.t.orling@linux.intel.com>
References: <cover.1594437521.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

If you try to create a plugin for recipetool that
adds the AUTHOR field, it is impossible to put it
in the recommended position [1] without adding to the
recipe_progression variable.

While we are at it, also add BBCLASSEXTEND at the
end, as also recommended by [1].

[1] http://www.openembedded.org/wiki/Styleguide

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 29473a98825..36427eec918 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -24,7 +24,7 @@ from collections import OrderedDict, defaultdict
 from bb.utils import vercmp_string
 
 # Help us to find places to insert values
-recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()']
+recipe_progression = ['SUMMARY', 'DESCRIPTION', 'AUTHOR', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
 # Variables that sometimes are a bit long but shouldn't be wrapped
 nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', r'SRC_URI\[(.+\.)?md5sum\]', r'SRC_URI\[(.+\.)?sha256sum\]']
 list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
-- 
2.25.0

