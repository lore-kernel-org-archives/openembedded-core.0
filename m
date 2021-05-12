Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web09.8179.1620831524674002464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bl8D5Bec;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.48, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f48.google.com with SMTP id t17-20020a4a3e110000b02901fab2f46a48so5008200oot.6
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MlyjT2FBgZNLbtIAcZtKQgg6EQjOcBR6i5bpOP+J9TI=;
        b=bl8D5BecgmTLm7Mp/9bLJ+MSRXeSeLpB9KeHLpa2nBz0H3+uMwrvyvQjzKEEk9WeZ4
         yd5PZ7KCM0bIDyxGnN4ORNGHUH9xjMvLE5ZEF6SUPwAEH8xfLzSEzWzTjWUeLC/d+PMD
         egPrO4Zbml5JMQVHgPlWGBvyFHEz8LlnOzqeq5NIeLeacgzims5uAxwX1Lrb307S62MM
         Aco7BIdkhiyNQZJmDcYOr4qko1odWmPZyQ9/KuSpyvjUhSGek78exmp0YIlWweaX8PWr
         tIYxfdnHoE5JWDzEZC+O9TvatUy1Vi2tKhJAd8+wVzUdGBYSUWaVf3s+uELxK25mJWeR
         JjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MlyjT2FBgZNLbtIAcZtKQgg6EQjOcBR6i5bpOP+J9TI=;
        b=BnLXWJikeE0+mDHCPue55hhCpCjXVPph3bFzJ7DHwnYyfD3HvBTT2FXEhI2oef2lLs
         Gm/A5IHbs4VITdAjK9//qBZLv/bol45YFc5+s2DijAtk317rikLpNNdZgRWIgGIZAPh+
         Vt7X8b615rT0Im1KhuobagDdPIKUUddLd1smt17/N9tm5XZ2Idm1gXCKXKFhb08MZ46X
         iDUZk1nZStJeJ48tl34Y+AkjK77xqNskuW6QL2DvypQlv9QAN+cnToUjI6ZGxoPuKVwz
         XE7Mu2SSALByqox6K7lBRNd5WIHtmlwVGgqgGl/dFAbxttwkmhCY1biFTUNBJybLYaAu
         5kqA==
X-Gm-Message-State: AOAM531yHAsVqq45hcHnw68Wvn+gYkti8oPthT87chcF1ovlYgWNvhRm
	wRZaDbtgagY+pe5KnLK/YbJWbbMK75zYNl9dr4s=
X-Google-Smtp-Source: ABdhPJwVYwkcDkDN+WQffMVfhlOELx8ZXob9vVB2JA+yAVyTyCkxQm1SB/xKA5ebe1ATsyIenzujXw==
X-Received: by 2002:a4a:ab83:: with SMTP id m3mr14600054oon.2.1620831523610;
        Wed, 12 May 2021 07:58:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/22] logrotate: Exclude CVE-2011-1548,1549,1550 from cve-check
Date: Wed, 12 May 2021 04:56:52 -1000
Message-Id: <7222f10e99e5a345c68feb254d309e55024ef4aa.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These CVEs apply to the way logrotate was installed on Gentoo, Debian
and SUSE, exclude from cve-check as they don't apply to OE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23643016f3b8794db772e333ff0b8f598571b628)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/logrotate/logrotate_3.15.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.15.1.bb b/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
index 503a0622b1..7c1b77add8 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
@@ -22,6 +22,9 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
 SRC_URI[md5sum] = "afe109afea749c306ff489203fde6beb"
 SRC_URI[sha256sum] = "491fec9e89f1372f02a0ab66579aa2e9d63cac5178dfa672c204c88e693a908b"
 
+# These CVEs are debian, gentoo or SUSE specific on the way logrotate was installed/used
+CVE_CHECK_WHITELIST += "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
+
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
 PACKAGECONFIG[acl] = ",,acl"
-- 
2.25.1

