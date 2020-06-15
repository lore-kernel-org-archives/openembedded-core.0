Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.26569.1592249816867929295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VUyjSF2Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id u8so266510pje.4
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3+L6pGtE83vk0/GaRXNmUuV+r4O0pU8h5NlpjUxIB5w=;
        b=VUyjSF2ZU4EwGLJC69Ec7B/es/SJRsukS83X0VHX00k3QoRCqrWy+SxXYo1h/9g0Lp
         PHPWBPtcjKdC4qcsKOR/NZuoUVevGyFfGlnt5WSK3z95nTnPcGbJ4476XSiwKjnYXzVu
         Vqo13EPr9hJH4PTRiaUFXKWBB1Nm50oLmyZRFZ3DGS5EBPzjzVlx2bn+Gmsmrvw2b5Ft
         I51Q61uCo07Kx7MLvSIbLEpnPwBnUQzTer4MNfxTXMNDoHdA3+zhU7Dbl4jaEnBDqJMP
         WvuuVS0SBoEklFqMouqS4CXUPgrCqtANeRzHvmBSge/4cs9q2oJXK4F90y6GdZHT8iez
         k4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3+L6pGtE83vk0/GaRXNmUuV+r4O0pU8h5NlpjUxIB5w=;
        b=kyv3dQ0am4I0T9w6XroEmdgyokw4Tlzm3VOES3tc0+9hJQokgdl/P/OjzYtlE+GXYe
         JLl2bgEijCdEV+6LMM3JHfWdXxqiQB6ih2rYmT/4sy9V1uJ1eg06iBmffZ/x9pzlqQxl
         7VA8PpXICAP/fHZbB1v/UgKeCKIumzsWFv5TUQFmJaf2+NjBqh6Fa4OIB0S/v7swKpXo
         soK8FMUu3EYipFE6grx+xMakByasj2p4bJ2z0OdMuwc1ylKji+mywhaKgyPWltXaw4R5
         CowvxzDanv8AMuiw/WHaEXdNJAFDy9B+fYZu6Yh+yKzb5EwrSlP/c0mM9gh+yW+pdjno
         WyHw==
X-Gm-Message-State: AOAM5338TJi7n7BriYFCpMclKDBYLu1Y+QCMhmMwlnGVghXp+BANY/c6
	IEFOR7TVA0GnYWBAHgL/0Rt57YzjSSk=
X-Google-Smtp-Source: ABdhPJwtAll0IeCrvcFBcFrrs+xHMonmHG6URyPQyciRbmvhKA8O9W5SmhSOuWzZZBmJYifOQpIQ5g==
X-Received: by 2002:a17:90b:283:: with SMTP id az3mr827302pjb.232.1592249815910;
        Mon, 15 Jun 2020 12:36:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/21] vim: _FORTIFY_SOURCE=2 be gone
Date: Mon, 15 Jun 2020 09:35:40 -1000
Message-Id: <2ae280e5e99c4ee119a587af878994e0fbdcdf3c.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Joe Slater <joe.slater@windriver.com>

vim will abort in many places with this setting.  Replace
it with the benign _FORTIFY_SOURCE=1.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18129cbaeddb3278efe9963718556e3765f06c1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim_8.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
index 60946a181f..709b6ddb55 100644
--- a/meta/recipes-support/vim/vim_8.2.bb
+++ b/meta/recipes-support/vim/vim_8.2.bb
@@ -8,3 +8,8 @@ BBCLASSEXTEND = "native"
 ALTERNATIVE_${PN}_append = " xxd"
 ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
 ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
+
+# We override the default in security_flags.inc because vim (not vim-tiny!) will abort
+# in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
+#
+lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
-- 
2.17.1

