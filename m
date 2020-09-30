Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.6495.1601503952600187370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kABYW6lR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id x123so2333138pfc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Ux9ia4is7K+9v6an2KatoA2HjxpBw2tEzITRMgm/4pw=;
        b=kABYW6lRCE1bjRiiJlD00aiPXZoSeJ3l+ipgobTnX+t2/RI9Abn4SYj491EP0kG4FU
         d+0Qkrj11ea/XqAd8UNY9c7tHdpC25F0ld9bBna+gFvAV/vND8oz/16uG3qvTEivd9Bv
         /nTjtDC1wRjVsUDIPwsCHwmBMAPvJV/Qez0jAjDByciGoAuwp0QTqHPq8L3sScXHSID3
         kG3FrUZ/CN2V9RRp+kAlrAZcyQzZlY1bTU9iM3GhB0sU+Z1lwmsYz6Py+4LKwaj0j7b1
         bVDN34vL2CKpTTW+AT+U/qJOstADg5zYaH16kUXAWFqVV/BaK9uLE7lMuUmdmCT7SsDY
         pP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Ux9ia4is7K+9v6an2KatoA2HjxpBw2tEzITRMgm/4pw=;
        b=jkZiwd0rPnZBZDno/x2kyk3HJ4yZPNH8yERKikwvxQOUTQ7rrKsMvP7/xZMiwErwfi
         CDA2DGSYRiPOxc7xB5dhVB9EPme30wBwUAqcrFQNVmA5IqMCkW3pXglYPl7b6AVykzPz
         efzOkQCzvhAoksVlQotSa8aW1Tm+zZBFYlC58OpTLZDmdxa6ksn7dGBozXdp4K9b3WpW
         N4r5Yul2nn2FTzoy8VPM4GYdPGlLfICNfST1mNAAWyGz7C29oyZZh+caIw89ylexprRF
         QUDwOhZF18XXJg19A3YIoS3UpmEesx5MOitinaSW8qE5O8uXFKETP5fDOBTQQr4VYveR
         P+yg==
X-Gm-Message-State: AOAM5338BpI7Sq8hrbK++GtT0fcYhJBatCQFzWz+mxOwHfmAHauxLwUW
	1Y0M++X9lNcpZsBmSrWTl/JPgXx7thncA6TKAUM=
X-Google-Smtp-Source: ABdhPJwmSpR1L+8VZQYYHzQJpPkbZbEfLD8Od+GtUvtz29UnNJh7F48X1ZV2qlCwzws4IIF7onqJIg==
X-Received: by 2002:aa7:85d4:0:b029:142:440b:fcd7 with SMTP id z20-20020aa785d40000b0290142440bfcd7mr4144749pfn.36.1601503951739;
        Wed, 30 Sep 2020 15:12:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/41] alsa-plugins: improve .la removal
Date: Wed, 30 Sep 2020 12:11:14 -1000
Message-Id: <d888a11a372be5886c6894e5b38514e44498934d.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Don't assume that the .la files are installed, because some libtool
alternatives don't install these.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e92b24368b71e4b178f81097b2a8d141c3b65481)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
index 9882e12763..61d394b0f0 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
@@ -52,7 +52,7 @@ FILES_${PN} = ""
 ALLOW_EMPTY_${PN} = "1"
 
 do_install_append() {
-	rm ${D}${libdir}/alsa-lib/*.la
+	rm -f ${D}${libdir}/alsa-lib/*.la
 
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}" = "yes" ]; then
 		# We use the example as is. Upstream installs the file under
-- 
2.17.1

