Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.6685.1604182137213206343
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 15:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qH5NybIg;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: andrey.z@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id o21so6400814ejb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 15:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oUM4jiyFJABSukseQJX1xoWFMcFJnR4SlVnEAfNwnTQ=;
        b=qH5NybIgL1xYXUPZpssOU76+Y4Jm+JqHmcfFod2w/+CdLnV1qewjRUE9hq+b9tr3jz
         DiMxTIJIOY/3xPs4NleS0GIv2knh74fMNgcV9D0XVlNlsC9aJAhdyHoEH+yQYhNko6Oq
         27GeWJafnDHLrZlOZ/SRnLsunZbdghiuAbJLIWmp3qQqyNjJt54L2yKH3I4DSRcaTKki
         bndYfka+8lJoaM+iBDHc1TZ8CUY0GQ02M+RqR9JvXnZFErM5VtPnDwfLMnkcAdHydON4
         dxRPNtNcJ3rJY87UWbPh9KSOjqUiNYY+U2yAsNuCBRAATzmU7Y0MxaA/RBJdujGUq6aP
         mXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oUM4jiyFJABSukseQJX1xoWFMcFJnR4SlVnEAfNwnTQ=;
        b=Y1iDsV4g3BvsXH79C5J9T4dVMswjKx9H7q/Nc3FOeSWLIMXJ8jr55cRMe0Zl8lnlqO
         BRutvuq2RTirpNcdlonk9Cnq4LC2ryR5Uq8CF9VTZly2WFHKIXC389Gl7bgLi19BxKK6
         1X5nPWyVjq3h7ipSj+9eU0DCm/LE4NY/C1PoyIoXJi3GcDIDmjAwyMSCJdkSSSBtFfyE
         Z3/1WAN5moOiQ2mlkNyPfZquyOeriNwgFT7YTBCS7pUkh2JGG0wOwgJVkqsrnhmfYDOl
         GKG/N/qgdCnv0u/zGUe0UBsyIpkQcR4lrcneRtHGgcSwrOFjMvK1v0gb+Lmlr8JCa3q3
         WRhA==
X-Gm-Message-State: AOAM532O3ye43uGi6wOWpTr7lxP3S1tOA3oiTAcmLyYYnZJ3+JKOWouM
	xp7yesx905XKjumyNbqHJszpzdfW/o/c4Kzd
X-Google-Smtp-Source: ABdhPJwwkL6xf6aFx6BlZYRCukTQiMzmvHo1UO/l2EN69kF9ssC/R3j94vtI/L9CEGOk4K1q5C4gEw==
X-Received: by 2002:a17:906:25cc:: with SMTP id n12mr8434923ejb.488.1604182135204;
        Sat, 31 Oct 2020 15:08:55 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id h24sm5733958ejk.31.2020.10.31.15.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 15:08:54 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
X-Google-Original-From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH v2] insane: add GitLab /archive/ tests
Date: Sat, 31 Oct 2020 22:07:39 +0000
Message-Id: <20201031220739.3176-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201031204709.22065-1-andrey.zhizhikin@leica-geosystems.com>
References: <20201031204709.22065-1-andrey.zhizhikin@leica-geosystems.com>

Archives produced by GitLab should be avoided in the same way as those
produced by GitHub.

Extend SRC_URI check to include GitLab and inform user that recipe
should be converted to use git protocol.

Link: https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg73109.html
Link: https://lists.openembedded.org/g/openembedded-core/message/144035
Cc: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c6dff9659c..cf2165c517 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -976,8 +976,8 @@ def package_qa_check_src_uri(pn, d, messages):
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

