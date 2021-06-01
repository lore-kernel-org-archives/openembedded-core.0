Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.58266.1622557126944658386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=z43c7W7+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so1494640pjz.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4YfHGKT8cXgQ5nOWELD+nOk761BlmD23oXCBwWUIsEw=;
        b=z43c7W7+h7UzZmX55xC6NJf3ZZPhZxNEPrWLw2luPLuiYHX2R7Y3hfXe6zcf6Bl23Y
         3nT/vrZ/E/48kkE/ZVi8KwwyVYv3vA33Zp7SuEn8tBsrG4LQ84FUnDTJ0XfPrGqFIwTb
         egjUEaEBqPsOKGCHbl13mc70gDB11isqaVYG+qglhzzSyvoleChrpNclwKLhInXC9M/a
         ou7iLAkXGBvQJ4024H8zTcHpkfSCtvPaG3wFZALCT2c2tgKl7BDUlU8C3Vkpastk+ZyN
         13VY9JWiovwaZHfSLGrfhTzXj1x3kVf91tMtU8WSf3g7SJFBXqUfnWSFrXLXpOSyFavm
         cX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4YfHGKT8cXgQ5nOWELD+nOk761BlmD23oXCBwWUIsEw=;
        b=oq7IlmQi0MDNuPEOilArtD1r7JEy8URnqOShpltBU7MDpV9binpQ/dk4aXC83UrCRD
         pPxuOl4Wr/WRqiyVy7qtLz+f9gZ+KNJeW1gM/OIEtgxBIG7sNVTUupwSottSQcloFEPM
         MTRvgDtWmGabitQOTsFBd/P0KuMHjYkUTGHzqoNEb+0NEn5vGQ3+CGudhfPm+bn8Lr62
         fSSjMcfL9BVUXx3rnmPcEeJvCUinrISlfO52pTtJnlZ/NDbZvp9aJYNMyQSUV13HJL2e
         dWmL+RvvXwTFNrlK+tb6VWXO8SLQZCkqm+szyQGYeBGc3fVkcoTVHdCWsCD8FZM9Dyse
         yAyA==
X-Gm-Message-State: AOAM5326DXuCLlroJU6NjoUbLK6MN3qKhf3LkvSXIFJ40ZMbh71nBVtY
	8DLjLKgjUFn1e5e/JgQjh5h4dLzojLAtGpU9EtQ=
X-Google-Smtp-Source: ABdhPJxPSbT7XmsZuPwoq7kb8daV6SQ2KZAoxST6c7miqb3egwr/mU5K92zZIAqlecWAD4hJtzuxOw==
X-Received: by 2002:a17:902:b687:b029:eb:6491:b3f7 with SMTP id c7-20020a170902b687b02900eb6491b3f7mr26099185pls.38.1622557126043;
        Tue, 01 Jun 2021 07:18:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/26] cve-extra-exclusions.inc: Clean up merged CPE updates
Date: Tue,  1 Jun 2021 04:17:55 -1000
Message-Id: <be30d2754a23ce195e9685872e0e476e1ca42052.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2ba6d58e77430cceeca9db61fdb06882a92e1e7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index b2816c3dd5..cf07acce1d 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -53,21 +53,6 @@ CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
 # so from 1.17 onwards. Reported to the database for update by RP 2021/5/9. Update accepted 2021/5/10.
 #CVE_CHECK_WHITELIST += "CVE-2000-0803"
 
-# grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865
-# Looks like grub-set-bootflag is patched in by Fedora/RHEL:
-# https://src.fedoraproject.org/rpms/grub2/blob/498ea7003b4dd8079fc075fad7e19e0b190d0f97/f/0133-Add-grub-set-bootflag-utility.patch
-# Does not exist in upstream grub2:
-# https://git.savannah.gnu.org/cgit/grub.git/tree/util
-# Reported to the database for update by RP 2021/5/9 Update accepted 2021/5/12
-#CVE_CHECK_WHITELIST += "CVE-2019-14865"
-
-# tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
-# https://bugzilla.redhat.com/show_bug.cgi?id=280961 - issue affects paxutils included in tar
-# http://cvs.savannah.gnu.org/viewvc/paxutils/paxutils/paxlib/names.c?r1=1.2&r2=1.4 was the fix
-# included in tar 1.19 and later
-# CPE update sent, may or may not exclude for us
-#CVE_CHECK_WHITELIST += "CVE-2007-4476"
-
 
 
 #### Upstream still working on ####
-- 
2.25.1

