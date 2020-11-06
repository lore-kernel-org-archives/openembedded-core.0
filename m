Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.12287.1604673404640902124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qqsgzBSD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id v12so1479025pfm.13
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=C4Ax1rOnERYD2jsAYGPVvNRVL22N5lwEUc5t0qzfFa4=;
        b=qqsgzBSDZRyzH/MxEs3bnNZv+1u3wp1BlYMqjzys5jzx1zbaROU7/wpL9u9bTVECR0
         91G9teJ9tDoYKJKOGvCcKtsUfywlAI/5t0YdmExSB889zYOnOrc9vRXclup10XPC3k8B
         uygUY2fn2V43kbiZB2XZmvJTe/yMaZyTrsyhmSa4gSfjRo38JTpXSfEwfMCz+91iKRFj
         PalaIwq0s0VaE0vXDNAz752vPwky+qrErRAtDS/cijCKpc+LQV//w77060qh+09Rimnu
         nKAY1FOlk06d2e9B76/iWXHqsn7BhqV1dke2aASh0NeeF1CpFxooD0Dr4Yru2YvJ3/Aj
         4o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=C4Ax1rOnERYD2jsAYGPVvNRVL22N5lwEUc5t0qzfFa4=;
        b=JT/UhYhtW/n5Aqr1n6TnuLST0Aa6QNcf17+nvmhjB6pBtk0G+1vsY99b3Ems9uTvJI
         g3d98eN7IoCn4vtWrWSyBYdt6foDZEwroFIk4+5GYPMXkju+8JuWsahJ/1NvPjmXMYVG
         EC5HK/OaXvy2T/maw8x0/sUolubvmRzHcA7riMdMKKrzc5QDY3D9pl4XdP9UWQhFsNdp
         26wAA2aat5EaJYTCnNXiYrqAzd+a2jhwoKYrNMfY6vnO16qPGRUY6WFvi2uD4VkGIC9c
         TFlrOfouSuI3++m9pJx2NU9N9fQ2omIaPeThyxZBvANdC4Jrn3cNK7E9Ew2udfGLJI4B
         JRTg==
X-Gm-Message-State: AOAM533Sm64uZ2UuuM+5NWLylCkTdFyXt0RkH9vzc5wZ36u1Dk9vy9Fg
	aMIwrZSQZa5Uc6MIIAwUqevXXMymM2KEIVX7
X-Google-Smtp-Source: ABdhPJzdl3FQOEO1NPhjqyN7aZW1PchKEWXFPpgKj8iBRKg7Xdu8swUqWleiJesLWp4DcUCMW5r/lQ==
X-Received: by 2002:a62:6107:0:b029:18b:8e8d:917b with SMTP id v7-20020a6261070000b029018b8e8d917bmr2135666pfb.70.1604673403739;
        Fri, 06 Nov 2020 06:36:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:43 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/20] insane: add GitLab /archive/ tests
Date: Fri,  6 Nov 2020 04:35:24 -1000
Message-Id: <72f2c45880afbba1745e5e0cbd841d7fd666f374.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Andrey Zhizhikin <andrey.z@gmail.com>

Archives produced by GitLab should be avoided in the same way as those
produced by GitHub.

Extend SRC_URI check to include GitLab and inform user that recipe
should be converted to use git protocol.

Link: https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg73109.html
Link: https://lists.openembedded.org/g/openembedded-core/message/144035
Cc: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d76b33c6a8489378a1f5500554367127199ae19d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 601b6b65bf..b5c6b2186f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -975,8 +975,8 @@ def package_qa_check_src_uri(pn, d, messages):
         package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
 
     for url in d.getVar("SRC_URI").split():
-        if re.search(r"github\.com/.+/.+/archive/.+", url):
-            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub archives" % pn, d)
+        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
+            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
 
 QARECIPETEST[unhandled-features-check] = "package_qa_check_unhandled_features_check"
 def package_qa_check_unhandled_features_check(pn, d, messages):
-- 
2.17.1

