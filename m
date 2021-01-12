Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.15943.1610484222348037326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 12:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DUzpP3wh;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id jx16so5370703ejb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 12:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z+Nb2/JyZd04eedIH1lpTNXqiYMnOXzCuwJVVheAQ8w=;
        b=DUzpP3wh3UqJwHJxlNS46bzGbsweqjn3KF/QIiZotwtZ6Ws7x+9iVyHJqjiuHcKufr
         yf6WS32XxLROAjt/pZJTTYzBwTe2jE19z7AlCH0gwmIF4E12ceilTD3XrbdlTEc0TlaA
         VhWrDLJbjqCOfJDn6vHJkvvbv6vA9mTo3nrNHSUkMyEi7MuinmqkZ7HFByoHZjeuNire
         UjsZnkzX8z607p/CQiuYJLb4CcAyJNzYp12GiMzAVWlzVc3Q0YsSpJKMTlcrBDYZS+/Y
         Oy82oUuiZsYktKuuEuiaXbbpC82e5ef8e1LzUMFnXiTQ4Z5ftEeBbFe7BygJiJlEL0tQ
         lbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z+Nb2/JyZd04eedIH1lpTNXqiYMnOXzCuwJVVheAQ8w=;
        b=pGvtBx/mvJZF0XFmQSt0+N7YrFilnne146yLxFVP8ezMJKbmDBeMJRfbLuoot9X5SR
         URL51D0MvXvo/b/q4bqc3ym3kQcahk7TOuvqireO1lk5uywAgik+DpIrVCRi1+bJRHqm
         fUEpvlro327r7gAIW9rGdWUdkhscsXuqRRs1u05mSoez3XtTG19KNkoMIOG2hoglhptc
         ByExfjgZxj1+Q4IR2UYA+HI8iGGmYtcS8CRFBNUMDF4TCPLnfO5yiXRfzfA61OEynGYE
         +snxBxFuDQuFLOIjqyg2Ak93OSum8JhAXdDhNM5heyGx7FzFViREADn22lYIHhLe/jb3
         mRCQ==
X-Gm-Message-State: AOAM532/OG1pmhQjM/fDDCH4I17hS8Ji+zHucscNC/HhNFDRzmZmi2xn
	fYuhxf3oiq3my214UlRaAzg4XO/B7EF2DA==
X-Google-Smtp-Source: ABdhPJzZ+JiO7/6sVE+wrfBuPYvzpw1hREOrwl2gw2d1YzP1QKC/9uD9g+hxAharweTw+pv9k+AKDg==
X-Received: by 2002:a17:906:b0d2:: with SMTP id bk18mr420161ejb.508.1610484220771;
        Tue, 12 Jan 2021 12:43:40 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0538793397820a7f9846fa.dip0.t-ipconnect.de. [2003:f0:7f05:3879:3397:820a:7f98:46fa])
        by smtp.gmail.com with ESMTPSA id w17sm1935437edu.90.2021.01.12.12.43.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 12:43:39 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libpam: remove entries for pam_tally and pam_tally2
Date: Tue, 12 Jan 2021 21:43:32 +0100
Message-Id: <20210112204332.3506294-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both were removed in 1.5.0 and one should use pam_faillock [1]

[1] https://github.com/linux-pam/linux-pam/releases/tag/v1.5.0

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.5.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
index 8c008a9701..f2f4fd91d6 100644
--- a/meta/recipes-extended/pam/libpam_1.5.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
@@ -118,8 +118,6 @@ python populate_packages_prepend () {
                       'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='')
     pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_chkpwd')
     pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_update')
-    pam_plugin_append_file('%spam-plugin-tally' % mlprefix, pam_sbindir, 'pam_tally')
-    pam_plugin_append_file('%spam-plugin-tally2' % mlprefix, pam_sbindir, 'pam_tally2')
     pam_plugin_append_file('%spam-plugin-timestamp' % mlprefix, pam_sbindir, 'pam_timestamp_check')
     pam_plugin_append_file('%spam-plugin-mkhomedir' % mlprefix, pam_sbindir, 'mkhomedir_helper')
     pam_plugin_append_file('%spam-plugin-console' % mlprefix, pam_sbindir, 'pam_console_apply')
-- 
2.26.2

