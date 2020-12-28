Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.4077.1609193805444709747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=B8iPoBQ+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id q4so6256067plr.7
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Px4qVlJFQyyPJFqgrq+aSZzUnWsdawFuJFH1tm2QcqM=;
        b=B8iPoBQ+HRhOVZjM9ZCJ0nDyzaLNk4iT91bwK98ga79LIaIWsZqz7F36rgLmHlOhTv
         2h2aYvfCjdtMlTA3AfAA7GN190YJwnTnOnarBkTKmf5swz4sUYokpjh+KN77cOJD1MAh
         Crn7ydXQ4ZEu4hcPbsGmDcRcj00d6O0O4j11ctC9yzMR6xFqBsCSh20EWnYU0HRrLE9F
         ETjUbiTgKB9qvNyaQVPcur+kJRJ5U9u72TrwWbj81e0CjtuXZUQPHIrcUfcA+wSU6MoF
         GEJ/YqIqiK3oC/he+/jzBse/wilbq0oHMTUxnHZ086xON40dxohy/UPKrGOC2rdI429n
         wbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Px4qVlJFQyyPJFqgrq+aSZzUnWsdawFuJFH1tm2QcqM=;
        b=LDjbKeh8j/+sgOBPQPEuMLvJhJsR02KwTcnyN6NL5hDvGMLlgxYxQgpf8T1NMjBnsH
         agzEUPKHrdPdsAv0pMY69hPWoIqla/UZG/G1cNpt6FUUY/VMP3M9y7e7Fl9f2CnZI/s5
         YznGfYI6pp5xHkF/QR9XI6JocFBVqmDjFIKTVdQI7kN0cQoPZd5rxxJl7KmrhutX9eyW
         HB4bousYxrB8/d44nqmnKbuFZ8GHLVteIBtnOMiKetwtLRUxBJKP2WisLVhtNIpM0+PL
         95Wn/3fDJPx0QydFvsmZz8zgM6pJmJBCxH8IXuagwkD6sAEhyLkwq1AogJ3KhocIW4TC
         dDFQ==
X-Gm-Message-State: AOAM532bZYf/qLie+nJyu2PEfpuO9a1z1By0+WaY2WmRUPVFuyqbF7dF
	qYyFUVQg7gmeDZi7HTtcRC6GXwmiTwmriKQFPAk=
X-Google-Smtp-Source: ABdhPJwMzLsG8rPgoHfu5g2ZNBe7+7dB76U3iquwQ40rxGsRGiEnu/p1GuRBzJ+tC5APqI6ev3cGmQ==
X-Received: by 2002:a17:902:a401:b029:dc:3e1d:234a with SMTP id p1-20020a170902a401b02900dc3e1d234amr24868891plq.48.1609193804655;
        Mon, 28 Dec 2020 14:16:44 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:43 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/17] cups: Mark CVE-2009-0032 as a non-issue
Date: Mon, 28 Dec 2020 12:15:52 -1000
Message-Id: <1d2022bcaa15f6f56ffcb10872126db2ac0336e7.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE was against a cups plugin which is obsolete and we don't include.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f7cb9f6ec4b14f992d265b8c67a9f5589f9b842)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 9b4b2a9b13..509c80c313 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -18,6 +18,8 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
 UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
 
+# Issue affects pdfdistiller plugin used with but not part of cups
+CVE_CHECK_WHITELIST += "CVE-2009-0032"
 # This is an Ubuntu only issue.
 CVE_CHECK_WHITELIST += "CVE-2018-6553"
 
-- 
2.17.1

