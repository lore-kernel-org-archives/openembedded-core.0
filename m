Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.5869.1609856668387613584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hFd1Fm8U;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id v1so1776030pjr.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ItboM1kFx5CXQr4zPpnz4bonfB22RfueZ8PR7Vh9z4s=;
        b=hFd1Fm8UtkJtn4oq+lxcKrwbcMDO/wQzOYCWuHUSdAPnqfLAZFmYetXq3yhjg9G+BB
         vhHHc9gETqBL09sd4UYwqAbUome3TOEopunBuhz1UB/0IBZfr14ijWzB40bPKxD1MVDX
         P5sP2d6OkIQmBX8U7kc9nRxrg+M39RwSnKNAuT+JyAMq4OR8o/VoO3noyEsrvTjE5Tbx
         282aWgPqZkvsiQ6z0HHQ2yfP4bBWqaKDPDqabbVaRv6Y9BAE0fWy+PgGKppRpn+sf38z
         mQfJhQb/G/W5bL+0Y3UI+ndBxYX8skvbmNlqz2yjfjGQwafebclXrQ2zQkhnBWVtdqWS
         2/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ItboM1kFx5CXQr4zPpnz4bonfB22RfueZ8PR7Vh9z4s=;
        b=TJ4GLhPFK8yqRG3cqVuVHOn9K4BsdZ9xF/9KfHWLYI+BOENeSyxWxmdx9ZqywJWd/I
         EhS7ZFuOSmVJZuYwyFXQVcpzCICC5UTKXlCmfN5Y9wY7UDVfivZk6L8X8ljT2c1Zt+55
         jgFQO56goap2l8sHwbOcnVwKFCm6osu3OK5sTJoeQqX0xN/bKFly3fkGepNt6cMZCmva
         7+4MtVpdAvi1lAMbUJpNrzp8wZr39Phy0qb6JqLpYPWjauJSaMdQpfIp0YeFShpbG8Yv
         soVKBvr0HNB9+gLgo9GJ+dMgxerm4UT9jFUAoYGigNGQEadJ8NQFYQqtY8FHCSHxVMHd
         TgvA==
X-Gm-Message-State: AOAM533POT30HD3wXR2RGhdO3QBsDjxfmEmnk49hhtcWAcP09F+7clkj
	rAUs6zo6Jrt7V5tdpTw/fNohjuew0/khAG/GKyY=
X-Google-Smtp-Source: ABdhPJwsYKofjzjjj0OqlNvFP1N7lEOSystCcaGy7mfuAYjG9oN/Sw74ZE2kervTVeOsbTu02FVt2Q==
X-Received: by 2002:a17:90a:fa0c:: with SMTP id cm12mr4364299pjb.87.1609856667608;
        Tue, 05 Jan 2021 06:24:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:24:26 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/30] minicom: RDEPENDS on ncurses-terminfo-base
Date: Tue,  5 Jan 2021 04:23:29 -1000
Message-Id: <ff5c13bb0b8d7e792b0db829d34ee58b332183e5.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Robert Yang <liezhi.yang@windriver.com>

Fixed when ncurses-terminfo-base is not installed:
$ minicom
No termcap database present!

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15198ebe8a0fc58c2d1122b956fca092c66a0d41)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/minicom/minicom_2.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index 6c539c553b..79d06d20f9 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -26,3 +26,5 @@ do_install() {
 }
 
 RRECOMMENDS_${PN} += "lrzsz"
+
+RDEPENDS_${PN} += "ncurses-terminfo-base"
-- 
2.17.1

