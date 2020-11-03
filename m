Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web09.4224.1604410959329236664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 05:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MfV6gcHv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id e6so1369168wro.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 05:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BIPjFRPLRhtESk9wwTGKx0+1ZZtW+wCCHRjwrsiVTtQ=;
        b=MfV6gcHv+ISKJUC2br52mLCN/+UEkUbVz3qmBuDmQ3A5QbNWKynlPDzOeoLNJ0hOT4
         1JEdWX7Ld9ZwBrV4QdSI+BQgYTWp+GkQWoGI1XiA2Eu4AYrTe+/AP3L9SASmrEdWMKkS
         Qk+6ouGLpUh1x66epTtxiI6PmMWjNhu6sevFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BIPjFRPLRhtESk9wwTGKx0+1ZZtW+wCCHRjwrsiVTtQ=;
        b=MixoMCmd1ruqsKCMz8hjzhei0WJZ1PK7j9UKqz4JpRT0bi8LqbmV1N/VyK6BKYywK3
         /DlxfDNGLUlSVixXWLI0EIHWdOQpi/D/l7O3yarArtotU4ysE+fyS8I6iIc8u11zAGhc
         1p7DAwhROZOxjUxY0A1nI7KxlG7JqmlFN4JSzB13AgPWIFMbaHHIlzTDDszwfM88bDmb
         TxJtZhoFmzs47CMEy7Z5jEmEI7k4kpt8oG5WM07NeA7Dziz2LpsCE2edCvdwzGrs0pP5
         8CmTl57doZ/qqPvCuGDxlRXtsiluRZpxTTg3TAmKz8zxherQANZWl3Iemh2RCMWtqNbU
         BkUA==
X-Gm-Message-State: AOAM5329HCcFEAqguSmnguI8DRU/J9Mk3Tse4c2782gYitQXiv+1tFWI
	mRvhVe5lGcUsstg4DOr1RyRpEQG+QYf7fg==
X-Google-Smtp-Source: ABdhPJwOJif6cbRpfimEyaajzUoUT0Ya5+JhhmAJFke12MktyioB2312g0RGDvHsX0vD69442k9pmw==
X-Received: by 2002:a05:6000:10e:: with SMTP id o14mr26838364wrx.225.1604410957707;
        Tue, 03 Nov 2020 05:42:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id e3sm26426089wrn.32.2020.11.03.05.42.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 05:42:37 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] alsa-utils: Fix license to GPLv2 only
Date: Tue,  3 Nov 2020 13:42:35 +0000
Message-Id: <20201103134235.423940-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103134235.423940-1-richard.purdie@linuxfoundation.org>
References: <20201103134235.423940-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parts of alsa-utils are v2 only, parts are v2 or later. The effect is
the end result is GPLv2 and there seems little value in marking everything
as being a mixture of both. Fix LICENSE to match reality.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/alsa/alsa-utils.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index 87eb55afbe6..c001b29a0cf 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -2,7 +2,8 @@ SUMMARY = "ALSA sound utilities"
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
-LICENSE = "GPLv2+"
+# Some parts are GPLv2+, some are only GPLv2 (e.g. axfer, alsactl) so result is GPLv2
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
-- 
2.25.1

