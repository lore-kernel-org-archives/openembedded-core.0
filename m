Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.354.1611586363963703642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=U0Saq90+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id u11so7713574plg.13
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zuKHxFyAZxWN/7CElGhpS1D69I8Pk17xALDjZz4IAEY=;
        b=U0Saq90+RQp4U2G9YwpIMM0BoKQW2Ljq61p9jaYXUUfDfRBAnK9RNhgFdKHjsLPMIy
         gJk9ElkvI2/3gUD+b+CPUq7Fj4Fnofo998SvjAU3CLRa4Ph51LT3Q48CPqz109ykEntZ
         GyynD+02ImookKfwmIuatQM+zwoh8llqVaNwqsjAN8RyftM7f3enb5usnHFgDLirUiya
         72YhYX8QGxGcW9YQ1Ui10XQQ3CJ38UVA7PwC4uWtNgW4XJmCli5wa8FrVeSWs3e7MRSj
         98LnU2mYhDuAcu45j06Hhrbsw+4GEwpNU9XoQubmH+0dwmZQZSvEvS/1YYD9pzADIeFM
         NJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zuKHxFyAZxWN/7CElGhpS1D69I8Pk17xALDjZz4IAEY=;
        b=BnRhFxzxwanKLSE6cmyDPvw1nWFFwqhT0uWSbESpXGfHkml9EoZsuJlhA4rcdi6q3f
         eHnm+z5TXdp1KOXZuycNKSqOSywYGKZK0yi6jkoESIbRez2W/Oqj61pq1oIW9pqNjlvt
         OydBkWMYaTaWmd+ik8AlGEfoj8V7yXOdoSpxnx4I7aHamRYVG59bJcBkXgnhkDNTAePR
         GO7XPYNI0Ki2inUV6TiDiDUCY9Gxw4wBU5CqcDyb7wX51JU25a0ixFHn+SsXfGmn1Ftf
         lYP+9UyAjKWXc9aMXm1Gt5piFdl1IMleQ/148ivZ6PRLrM+dP8bEvgSXvpI2W1tsFSBO
         uiIQ==
X-Gm-Message-State: AOAM531EMMcyGN8bLdpqy/5JGbuEh+Rp39P7PYHg7Mt7L7vNI3oN13at
	g65unTFnwQ3CeSayUQ4X/MNsNsAfKNcyG9OdV6E=
X-Google-Smtp-Source: ABdhPJw5Fbw381MOqEmQm8WKmmdqi5KYO7ps98ahi6OpRWcHNgO7ykwoS5f3jfpEnPi4YykljWqx2w==
X-Received: by 2002:a17:90a:2f83:: with SMTP id t3mr594903pjd.128.1611586363132;
        Mon, 25 Jan 2021 06:52:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:42 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/47] pseudo: Upgrade to include mkostemp64 wrapper
Date: Mon, 25 Jan 2021 04:50:54 -1000
Message-Id: <43650360851d4c1dcd54044c2670c18f8dfb5c61.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Newer systems are using this currently unwrapped glibc function,
add it.

[YOCTO #14080]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cba4f51f0166e2c20e854ee0344be0c58769eaca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9b7ee1c18c..2e13fec540 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "07141f919dc8582460f984ed1d2fb73e05f82ef3"
+SRCREV = "cca0d7f15b7197095cd587420d31b187620c3093"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

