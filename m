Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF1673219
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:58:45 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id q21so33905474iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FAhagTlRg06o00gGnGWsQeOmpF5vbsx6u3dvcaxDWmE=;
	b=ofGul4nx0ohKqHm2F68nmX5FaGl+q+8iZ6Ia/9zRTGbsYoOxuTQSbTC/dXsqnOkXUW
	EMnLHZYkoOyY94ZnbN48ZtPZ6ln0D1F6N2gJ7n8Nq5eLpqjgBxpHl7KiXzHzlAy8tNNh
	p5yCYcU0f4oLqB3/Vt7LZks8PATBsPiyMtAosj3MzjLLUZl5iKKBXagcDHJ4MakIHgUt
	r3PsA5QI9gfJJ38cabYB0VHEEkBYGm9u9PNCsayz2izqfaJh+ZYH1qYwYm+wdk6FOpVv
	25bI1xWKtac9vXJUx22+WOS92cyg4gyyAjPtwOaE0PwyRptppKCjBP8E85zNAfHJAOLY
	lgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FAhagTlRg06o00gGnGWsQeOmpF5vbsx6u3dvcaxDWmE=;
	b=AuzYWkmFQoeZUXtMIVmqmyQDsRrCIvxxcy34q21oAHlY42QKifCOxBnoUYWmx1hkxx
	8i5yLcj9y/zZznWMacgoqdhb14iQ5jDltOZ9LE9sQcB7+RqHa+/mksZH+V1CqW4xZE40
	TzxgSD/WGMoIVeTchP3su+s4WLHVBnAWL49g7+XOxapkh1DHB/jx5TWZDa9mA90v0ZDj
	/Ea7XkfiFKEKzQ1obC7h2XH6sEl88weJsDKzvIVdoiKQnon2p2y9jm8jrIgxOyv0SxR0
	NcFcR7qVpLLSDwnyMRLevLRtTYKf74LreomcrzymXrLhVF5gKK6Hd63/1Li0LizWKWg4
	lJpA==
X-Gm-Message-State: ALoCoQmxmpFVJnWuuzDYH5Ij8S1P3Yyv0g1VYHx89UxnwF1susMTwmRrG72LrSi9pqoE4XK9qZcK1SOFI/HPzDCTr9USNU8ctQ==
X-Received: by 10.107.18.219 with SMTP id 88mr6517615ios.130.1452805126261;
	Thu, 14 Jan 2016 12:58:46 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	204sm3203278iob.44.2016.01.14.12.58.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 12:58:45 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:56:37 -0600
Message-Id: <1452804997-20926-10-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 9/9] gstreamer1.0: use bash-completion.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jan 2016 20:58:45 -0000

Use bash-completion.bbclass to package bash completions.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index c10f66f..5688b5e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -7,7 +7,7 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native libcap"
 
-inherit autotools pkgconfig gettext upstream-version-is-even
+inherit autotools pkgconfig gettext upstream-version-is-even bash-completion
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[check] = "--enable-check,--disable-check"
@@ -26,6 +26,3 @@ CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
 
 FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
-FILES_${PN}-bash-completion += " ${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
-
-PACKAGES += " ${PN}-bash-completion"
-- 
2.4.5


