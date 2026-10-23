Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5976.1792759214229631146
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 05:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fhEdTkyo;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso6322485e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 05:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792759212; x=1793364012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IW72HW0liUABHPUkAPkpLZ5J7aQXTzFm50GZ3hm4x0E=;
        b=fhEdTkyoTVxCDF+V2DUZXNjdu6g8RjQLThI9OrEFM1t40Wr24bk8kRVw/hjCNKfic0
         p5YYi8FymtsC5Gmpi/+hI89YDBdhDEN+p/QAVPAOrDxOB2yyrQlOD+LNLfAA2eckxdgF
         QnfEkFLDMe4lU1K254bcfl1ATddVWuo83tF4JkrHGAhUXBL9k8IthoB5o2ME1T65IvKG
         AXA5e768lS259hGvaWzV3bftAA165IzVyAUQ8nUYvwC1Ozxsms7OUG4IFGf9DC5DTnH5
         dJsIERO7oAudpHIkC+97RkurDXjjI+DUrcl5VPB7Ur3oSjYVXX81DhgmXSqTrExn9L/i
         +4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759212; x=1793364012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IW72HW0liUABHPUkAPkpLZ5J7aQXTzFm50GZ3hm4x0E=;
        b=u2+TVYz5KQ3+R048TL67iSVfSeNjiGA06VBqnN274A6/STcu+DSSZ+qAiOO/qGRWdM
         M4ZQzfv2Dm9xBr0vdfRVctYVzDDJazX+GgWHRW9HEChG1pMeSlE4WHiZRzxAd3qehY3i
         dJsI28ROwH7hfidxTnfqJWMr5P1H12AB8Nt8LWwkHe9b+Qgi4ivNQ+sTKwLF7RUjw4IH
         b2o4avNNxwMA/rgkkLwlU8ZkCTIgi8KrJlK7UB3H1iOP8eYU7+sGqleTbOSJcxKWLdev
         OYJPkgowwzX0fx4JqvIiWfSwjH7veyKUpmoYvgh/lqbwRmM10Huopky6NjAE5lHvyCge
         Y1NQ==
X-Gm-Message-State: AFq9FYIauhrAkygbEHaMu1QLVxMPYFWsSQ6LIBhdcvr5r7yn8jSulbLX
	bVr+084vpdRvOpEUI5oR2qSwu4pRq6zwFSBr7xxeKDowyBb6xBsmv1hbotNn/krR
X-Gm-Gg: AYBFou3f02ji4lUx4QK5PYRRcWyu3ud53Kn/iOH+GWTmOtFb+bfe3N8FQCETnPmZRsC
	VUaKPo/ZauHPmzWnROT0+0llA50vLViZNcIn550lgUI3w2WnRhVJcQ7upQLs2/3SGO+/RirzGVW
	EGHij2fOWs28c/aRC6saljs+Cf4nGlsyaGbUXuwu6IIGDpAztpKVsnJE8LeC8m54vmggIH5WSfU
	7jjuQK5GXqCY6GNTsvpfVq0PcgEHf8xXmc9Q2mXXgJYOdKXiJo8+W1tIn4p9bgxOVqDL8C9s42N
	alru056EqvI4vQJ5R/McJfb73p0KZGL5Zumww0JHnI8qxNYH+ghqjDm9LSfRqMzBnRykHK91oFO
	7aIICZUcE9psKw1EjirJfcM4NmSOCREzIHdbuX6qeDdYGPyP4XHByqnu+ShSoDStZxxjo8FVBAP
	HM+pdDzPKpxAEtstWRreVR2joRIxy9U5tztSO2ptU6XZWZI0d3UyWVjGLXDxAEN8qKMWjIE01bM
	f1CoG+4G7E1ARu9EbUh0mENcx+L/rKXIHFh7rMHv0hoRuU64gEonSVzwORF
X-Received: by 2002:a05:600c:34c5:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4a2148bced7mr27742145e9.8.1792759212099;
        Fri, 23 Oct 2026 05:40:12 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([2a01:4b00:d036:ae00:f611:57de:f069:23be])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a2b062a277sm1558675e9.7.2026.10.23.05.40.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:40:10 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: create the clock group for udev
Date: Fri, 23 Oct 2026 13:40:04 +0100
Message-ID: <20261023124009.2538616-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 12:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248551
Content-Type: text/plain; charset="utf-8"

From: Luca Boccassi <luca.boccassi@gmail.com>

Since systemd v258 the default udev rules assign RTC and PTP devices
to the "clock" group. Create it alongside "render" to avoid errors like:
"Failed to resolve group 'clock', ignoring: Unknown group".

Signed-off-by: Luca Boccassi <luca.boccassi@gmail.com>
---
 meta/recipes-core/systemd/systemd_262.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core/systemd/systemd_262.bb
index d70053182f..71a90a0903 100644
--- a/meta/recipes-core/systemd/systemd_262.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -449,7 +449,8 @@ USERADD_PACKAGES = "${PN} \
 "
 GROUPADD_PARAM:${PN} = "-r systemd-journal;"
 GROUPADD_PARAM:${PN} += "-r empower;"
-GROUPADD_PARAM:udev = "-r render"
+GROUPADD_PARAM:udev = "-r render;"
+GROUPADD_PARAM:udev += "-r clock;"
 GROUPADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM:${PN}-networkd = "--system -d / -M --shell /sbin/nologin systemd-network"
-- 
2.47.3

