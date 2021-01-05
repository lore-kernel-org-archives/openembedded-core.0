Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.5836.1609856662140350883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wc7HWdpW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id t6so16452710plq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GOpNKbEkRGSQeyjTKzFBpmc2EDczygPTEm36JsMnHmc=;
        b=wc7HWdpW7hAQuzfEIYc89DDqEmopRKCvy2FrLdxBHyT34K+epUdIPiuhFXS6fBdpd4
         q6RK/l41fIEzC0qzdFXejimTOI7CIky8gBbZA91TbaKsdRnUaCHFxcE8SgXgmOlf4roB
         9Ep1DmlpOUPq6t7hnUPj7jGNpMO+A8IjVclloFbyE16cZy1xrUbf9Fmt10hBv1ul2HF8
         6qpbscY+p8ogwKaJD80vjmlgsfgFcEz41yjEa1Qep/DIfyzpqYIqinn7kUGyVrZFWglf
         q7cg2YhBW7SoIzG367fPhXNjgT3CdmnYs05KPaMRCvNwzaMO7rdFawsoJMQpxUikfy25
         qrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GOpNKbEkRGSQeyjTKzFBpmc2EDczygPTEm36JsMnHmc=;
        b=GS7xJYeu4KCOxEygdMcG35UzBX4kckuPvprfk04kPXfCrmLcq8RwXHzXiLW5MlaR7o
         9UnxqHvwYlLf7Z7rwfi40oWX8qAMhqM7n8pBr2hwpFx2opdGwbqnsFBngM9Fj5LpVv/C
         PVAwxcd/83iyl8Kz15zhwE1nC0Nuiiace+qE7i+dVRnLUZX+X6vhbUWvf84phABiviby
         QHaAEYu16qv0tCMWutvDAlOlX+kfI4BEens3TYvPn2Orh23CgmJ8yQPf0DTgdq4P3ywu
         S21W7Q9hzBDtbxWqKzk+rHF+6sU0WtVxoyITKdbPfw3abDHYq5ql/n2fTPCiU33S4V2g
         z0JQ==
X-Gm-Message-State: AOAM5313a6XU3nPODYwphn9xkDRnF6zE7YNusgD4/K6NrF8W3s1U3xQH
	JUnwhN2m7fpcQW/xY5Y0NcQnk8MOkhL+olf3jrI=
X-Google-Smtp-Source: ABdhPJxu2oFru/7wYFoxzYHYLBNW0AH4OSXMl9wXBLArsndtMBYXKsB6EDVmv3rBI4+R8P2mcakKYA==
X-Received: by 2002:a17:902:aa07:b029:dc:240a:8a71 with SMTP id be7-20020a170902aa07b02900dc240a8a71mr142plb.32.1609856661175;
        Tue, 05 Jan 2021 06:24:21 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:24:20 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/30] ncurses: Make ncurses-tools depend on ncurses-terminfo-base
Date: Tue,  5 Jan 2021 04:23:28 -1000
Message-Id: <c172e9c27c4504c7b1c941693ab9af5e86dea64f.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Robert Yang <liezhi.yang@windriver.com>

Fixed when ncurses-terminfo-base is not installed:
$ infocmp
infocmp: couldn't open terminfo file linux.

The required file is in ncurses-terminfo-base

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3e0a6bf1b7d9009c253e3f97df8736ecf3aa79b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 4156bf4f7d..8c68f61d99 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -306,7 +306,7 @@ FILES_${PN}-tools = "\
 "
 
 # 'reset' is a symlink to 'tset' which is in the 'ncurses' package
-RDEPENDS_${PN}-tools = "${PN}"
+RDEPENDS_${PN}-tools = "${PN} ${PN}-terminfo-base"
 
 FILES_${PN}-terminfo = "\
   ${datadir}/terminfo \
-- 
2.17.1

