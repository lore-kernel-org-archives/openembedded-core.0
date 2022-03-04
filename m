Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00906C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.7806.1646406305814916345
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eHEIEiDq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so8061112pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8eVtFaYM04HQQ5bsWx8VRjhFLQn7ij6XsrFWcgZg/1s=;
        b=eHEIEiDqhixf2y9sBuWZW61fsEyZ2lINXZjrFEr/GCwRj7tE+onST09RPVKR2LpIak
         xKqBacYfROW/tKWI7+6Fv1sNjzfnkKQRC116FiwmOWHsCDrH0vXVzWgwlfzOjph43Xta
         HqEj4hqCCuRMyIIQqRzimxdCWKVUBilAm6AQTRzr0dObpujIMldl1DeRbcxA2FGUGUb8
         Cu62IUWjcr+CGBYjJcFTOlPAZTF/sUfwf5e1Rke/M09TdvOzm/OB52XQsIMXihjBm9ed
         QjXEphtSV8F5NG5yr5BB7b/tMHYWj/ChOM53XHzt7ljMOlGgJrfKFnXeTS5iwG4HOIXe
         V2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8eVtFaYM04HQQ5bsWx8VRjhFLQn7ij6XsrFWcgZg/1s=;
        b=3dzi962fcyqRNDEGWF4Z+qAhxrHHvGk0zUAyahPFaZ2hM2cEgX7uARarLzKGggGKGR
         BDXV1Z++LsQfICVlLaD+siR7WAHMqmp62cUuDFJujCAteN1LmuFYfVDOSAa47mVYJyX5
         XrV4S6F6PR2mHGWrBRgs3ob6S66C5zduJYjAskx1w8SyIreU2tO2W/fbShJ2PdXRMl2l
         vs1pgOnS4aBvdtvuTCaXmZEN2kytRoz4ZyTzE9l65JOuPCGCniwUHkLOC7GmNh2ilzL9
         2unOcdIRYJVuTTEm1G+ETHP7xl7vWEAZmKR+OcylOlmYHe1jjhr3DVJyy+4CnZyfmr3h
         0dww==
X-Gm-Message-State: AOAM531QcZi2WHmaCemhJVOXNoHlc5KA5OL76Z+BRaiV22tKA5BvH3pa
	pQHpJNNGndOsVXdoSvIIOPAV9iUUviE64VK2VWo=
X-Google-Smtp-Source: 
 ABdhPJwoMMEvy2hjoMtTN67/lmhM3tClNyR0O0fuDXQOxqRYm3FbIIehWjNoZNAAeGkYhjHBHKvh8w==
X-Received: by 2002:a17:902:6f0f:b0:151:3f2d:8b21 with SMTP id
 w15-20020a1709026f0f00b001513f2d8b21mr35973167plk.123.1646406304795;
        Fri, 04 Mar 2022 07:05:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/18] coreutils: remove obsolete ignored CVE list
Date: Fri,  4 Mar 2022 05:04:17 -1000
Message-Id: 
 <c50688e1d0839d71e05a0d15dd948113d2ef83f6.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162728

From: Ross Burton <ross@burtonini.com>

Three CVEs were meant to be ignored via CVE_WHITELIST, but that wasn't
the correct variable name.

The CPEs for those CVEs mean that they don't get picked up in our report,
so just remove the assignment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dea00faf30ec7c19b6b5ed4651b430ba3faf69ff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index aabeee882c..3d569881e8 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -206,6 +206,3 @@ do_install_ptest () {
 }
 
 FILES_${PN}-ptest += "${bindir}/getlimits"
-
-# These are specific to Opensuse
-CVE_WHITELIST += "CVE-2013-0221 CVE-2013-0222 CVE-2013-0223"
-- 
2.25.1


