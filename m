Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D6FC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:19:12 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.2211.1667359144727143617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n6d/VSYp;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id g129so15124755pgc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVH/+AfNLUN0iTIwOJtZNxsuecFi3yizFjiH/Rl6cvY=;
        b=n6d/VSYp3cjhavOkoFQ3b9fQgvZUIT0OOJc1R5EM79iWFK5Fc9/bwXF1QzV+SWU3DB
         KjfdUreJnZUNG31qX/oCvGNelggeKhD5dFwZ/VU3VMDzO/EyHojsVfumWwzpHdHsoeyU
         UDQXVHMuk7w1gY3gXxUWPj0C91i81maGQkWlAPDzOsoYBovYPu+hecS5jUkDlCZfFj77
         WvGn/hsTRLG8bukoVLjIrkuKPJK3NYixcUZBXwB0NspxwHPWlnOv3quXgr3iYtO2gPY3
         WFRoJzaE053voNUFK8iqxRw0KxCgCLABZ+v9hFLfNaZ84YB+BqADvzWI/iok6aIzdztv
         ey7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVH/+AfNLUN0iTIwOJtZNxsuecFi3yizFjiH/Rl6cvY=;
        b=EGpg00Rnk2dOClH3Fl+DSRUzfCa5s4K+yxUEFIg0Iu74SnxDRJ9pUMrhA8Fy231xr4
         RqUSilfmlHPoku5fYmV4QqqWVSUtlO3F3lc8iyf9Lu//qCocEFOgLLIelOtohHCERMAD
         7R0gO97D6mZkGjo1Ik5D6z/56LOOgc5QGpUNM2XnCQ+Swh9NwUJsUIV5Fi+gglHf0H1D
         zqPk+oxLxSwVaCMcjurN8b3+kjAsFLvRWZO+cYh2mKyiYG/LsBvRcvtGeaXf0OJ+L7TO
         wylHg506mLsxGEDE65JDLRFbiFVPyrR1EkUtm7UeloVd6ersY9U2VEz3pXZ3zUa3QCef
         UQTg==
X-Gm-Message-State: ACrzQf2LAyQi5HhVUG55f/PbaxWEWSrn03ET6MyTqBDiqelsKWa8hMZ3
	pjiv1Cc8nQ92NKXYqLtk3soWdE5Q/H5Dsg==
X-Google-Smtp-Source: AMsMyM7OPr7HgTymV8Z7Y+zqA2g2JHArEMpCGrxsino5bGEWalab1lOh39/DCe/feaAtM9cv++GViw==
X-Received: by 2002:a63:106:0:b0:460:64ce:51c4 with SMTP id 6-20020a630106000000b0046064ce51c4mr19624302pgb.17.1667359143586;
        Tue, 01 Nov 2022 20:19:03 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a16d600b002139459e121sm269644pje.27.2022.11.01.20.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:19:03 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 11/11] python3-sphinx: upgrade 5.2.3 -> 5.3.0
Date: Tue,  1 Nov 2022 20:18:30 -0700
Message-Id: <20221102031830.3606777-11-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102031830.3606777-1-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172573

https://www.sphinx-doc.org/en/master/changes.html#release-5-3-0-released-oct-16-2022

Release 5.3.0 (released Oct 16, 2022)

* #10759: LaTeX: add latex_table_style and support the 'booktabs',
	  'borderless', and 'colorrows' styles. (thanks to Stefan
          Wiehler for initial pull requests #6666, #6671)

* #10840: One can cross-reference including an option value like
	  `--module=foobar`, `--module[=foobar]` or `--module foobar`.
          Patch by Martin Liska.

* #10881: autosectionlabel: Record the generated section label to the
	  debug log.

* #10268: Correctly URI-escape image filenames.

* #10887: domains: Allow sections in all the content of all object
	  description directives (e.g. py:function). Patch by Adam
          Turner

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-sphinx_5.2.3.bb => python3-sphinx_5.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_5.2.3.bb => python3-sphinx_5.3.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb b/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_5.2.3.bb
rename to meta/recipes-devtools/python/python3-sphinx_5.3.0.bb
index 957bd17fc07..70b4e23def1 100644
--- a/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "5b10cb1022dac8c035f75767799c39217a05fc0fe2d6fe5597560d38e44f0363"
+SRC_URI[sha256sum] = "51026de0a9ff9fc13c05d74913ad66047e104f56a129ff73e174eb5c3ee794b5"
 
 inherit python_flit_core pypi
 
-- 
2.34.1


