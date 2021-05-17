Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.19362.1621260880137358378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TiwvCjYJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so2953872pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mNGRT0b3i1lL8h1jxlnSl92Rn6/rUi9fUjIXuZgm9j0=;
        b=TiwvCjYJXHO7Vqh7UOmWTPmmVZRYBawBTGEQbkVBm94AnA4dYeXK2XhPS+AONST+QT
         rKAQKKU4Et4FzeH/5AuqcckCFntR1HU39sy2MLSaNzE0VR+xKg/WEza+hqZYAUvMn6Wr
         IBsxSfU/WHOwJWQIjNmFwrn6v1sgiV8GGSGxqEBYApHc6YZ9ivAPE6NLn5FXIZH8pNYF
         uq8LJHA4FqVaIie5xKU2jE1pFMMJeZRTls2TAMgyqKjEcJQ9kP13/jNnrkPt56V3JjTi
         y1DPBmsF3rBpEI3TYoCrUdzescaU9ji7tg5H9+vOCiy4TgsEqtSjrFnKFLJc7i2ejAG6
         ewkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mNGRT0b3i1lL8h1jxlnSl92Rn6/rUi9fUjIXuZgm9j0=;
        b=oer7yZejZ17Fh4ehrUXSmrsnMpdkmDhbYAgBbNhW4BGxQ/Gdt1KzMcYi/RQZipadhq
         kjzK0fhGVjHVd7sOCm/C0O8ia2nfRfNyLqqRbbNnZNZw9ovDy0BlmtX8BxmfXcdAJK6G
         dxuhw8mqiICFJaHBBCzAqKW2u2UPvS8KTvDdcBWy+JZBIIXVco+fENNh0rRoOmhK+Mze
         W6AIs8qBYKaVzMOvvbMbKsmfh0cLJEDwzYg0uWgBUKvfxQAdFS8dQCQ9+yxNsleEQL7T
         zxDnY6ayc/QR9T/qzfXebL/mWbrF7PKDoYf6TyAgmlSFAwf80IbcTDmu9cJORV6U/6rs
         lrRw==
X-Gm-Message-State: AOAM5328EZ9rU4voqOR/k6z8Du2V5Z7CjsAnChUzxrMCRbTGl8qwpPN+
	UyM8UZlsKBALXAgJsoT94+CSw9PRytiY840+EqQ=
X-Google-Smtp-Source: ABdhPJzsa663v3gZuWl85NlLyr7Vl1AKsZR2vzzaAN/mwPVB1085zuxSposuYdlLkXxxpYDUATMMOg==
X-Received: by 2002:a17:902:e84f:b029:f0:d23a:90a8 with SMTP id t15-20020a170902e84fb02900f0d23a90a8mr9098315plg.73.1621260879311;
        Mon, 17 May 2021 07:14:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/35] ghostscript: Exclude CVE-2013-6629 from cve-check
Date: Mon, 17 May 2021 04:13:24 -1000
Message-Id: <829296767ecfbd443d738367b7146a91506e25f2.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE is in the jpeg sources included with ghostscript. We use our own
external jpeg library so this doesn't affect us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8556d6a6722f21af5e6f97589bec3cbd31da206c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.52.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index 65135f5821..32346e6811 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -19,6 +19,10 @@ DEPENDS_class-native = "libpng-native"
 UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
+# The jpeg issue in the CVE is present in the gs jpeg sources
+# however we use an external jpeg which doesn't have the issue.
+CVE_CHECK_WHITELIST += "CVE-2013-6629"
+
 def gs_verdir(v):
     return "".join(v.split("."))
 
-- 
2.25.1

