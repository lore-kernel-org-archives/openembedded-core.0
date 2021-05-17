Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.19516.1621260871702172648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XCK/bGXg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 27so3442819pgy.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=43hPWeqHCTDotlMfASeVORhEJYu/ORrIfwjdV5Kj160=;
        b=XCK/bGXg+32DPwh/CKiSTK/9FJTj53ZDnjqdPQyVEV+Ov59DwJHmKZKUe6UL+UI6os
         Y0IjVqgUxM1M0L+LU2WlKgTYeKcqrjKUg8XrnY057zswI8lxRiws1b/92YnFfgoYNGQ5
         XY5STuvazTyyOE64mn8YfBPQPdUH9xGzM1+OGM+0mekZXWu9si9knD682ZR5Zh//4ry3
         J6GdY9Gwa4+HVLg3wVx6MwEbOHiumyb/vowicgV5A0Ooi4+MyZMB646RHA344ILW6pGH
         23K+khxFF92iONEuW0Lrw56ShOUJ426L06bFUvc8xNkx9E6MZjcpc1HmddGgGd3JuyMu
         vLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=43hPWeqHCTDotlMfASeVORhEJYu/ORrIfwjdV5Kj160=;
        b=X4Me0pUMcIi51hV2I3w0qIHbeIDHsWox5ibO3022tCGf3g7qRgF8s6yIpGp+7FJzF9
         RIkBPLzD6NoS5DyMwRTTKag7/3BIyFq1qE0vy3Y6+55V6Dj6Nwi6jL0R4rD1fmQW5Gst
         1JwcZUWmJL/w69E02j9NBBthzum/v9VekRprG3FoILI2DwS/N1NrfiK82GIlW+GZyA/s
         etikIUPmvvOC/H1f0TrtIO4RTd3hUzkZMRetcKxx3yNr3bFET1uoyYD0bgYzuYbcXUDZ
         1K2fwvFBksyuhVIB4VLLWgTNlfuXQVp7L2YA+ziMmxxb3B9cZaxFOkq3F6SkwfunItlZ
         0Ngw==
X-Gm-Message-State: AOAM533nTvmXrE/ClpPCoOvl5y+LqUdZnLbrxqyJO9ow7p0wBHqhyBsX
	243hQ+MZxg0fnVFCNdBCxIF4CuRgExz25OAOwuY=
X-Google-Smtp-Source: ABdhPJxM8MIltYzm73aTf/s26UIu/ZnpRlFojlY++I4lcWHF8soR0KbEUSplDk+26qs54Wi4TJFpsA==
X-Received: by 2002:aa7:8a87:0:b029:27d:a1e:bc71 with SMTP id a7-20020aa78a870000b029027d0a1ebc71mr22881898pfc.14.1621260870748;
        Mon, 17 May 2021 07:14:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/35] openssh: Exclude CVE-2007-2768 from cve-check
Date: Mon, 17 May 2021 04:13:20 -1000
Message-Id: <d55474025a4518c674d9781c4c3b1ce5d6389466.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We don't build/use the OPIE PAM module, exclude the CVE from this recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3670be602f2ace24dc49e196407efec577164050)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index fe94f30503..b429fbe96d 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -28,6 +28,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
 SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
 
+# This CVE is specific to OpenSSH with the pam opie which we don't build/use here
+CVE_CHECK_WHITELIST += "CVE-2007-2768"
+
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
 CVE_CHECK_WHITELIST += "CVE-2014-9278"
-- 
2.25.1

