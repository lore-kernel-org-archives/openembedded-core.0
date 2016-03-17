Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A10060116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:19:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l124so500276wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4i5pmfj938jqWBtoW5qAntbfXYmBk4AVi+JkVSLmyc0=;
	b=i8dCb4cEZzmCebViKwGIyd1EfKPCa/q7XHAk+KFkrbeQRVAMzuUdVFCUjzEVRADb/c
	OvZBlPlEG6h/CMoHy1SCa768ZCqsntMWqgqYH9fJJYj9f/nTjAUWSb5/Mh7Hofcd04YC
	1nMZmBdKHtpfDou9VoJ4NZh7sV5CRrKIj1PzcSOcdXebVjdNsx7IMoHSjdro5y2N1L9F
	RIxAHGDnDJslisjwucJAvJ2cfARemU5UH/fMrw4xlpzeKLtJF5T3XFomDYSvDt824Dpl
	pf+39moTYqWxb8cg3bXsb87jBo7uDtBIK/+YncrPxYx4Uii6ofsIyWYR1yf62tGEx/Ii
	sPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4i5pmfj938jqWBtoW5qAntbfXYmBk4AVi+JkVSLmyc0=;
	b=bL6gl4bvtgMcWaMn5T+Tjx4u4DHvSEphcRUexGUgNdSunOPdiZMAwVOfr0R4dOBwh0
	TLsexaY+MUVBGxFLOgRdu9Vggj/4/aWs4x3Gui4qFBtuo+IQ7xGckyDEnWIZcBxjZVlC
	2Hg+1qEMaELc0cQs0P5fUeVM3BqGWYgg3VFUwBvzoyynUp2ZNXi1sbJVU1LG2Qx7/aI4
	R4tRChwiLMMNJJW6ncvBlgxqU3BlCqEW8MzOuCMBHzn2wnHHPt3pIGnWkSYmv5i5XJXO
	XOw/R3n+GiVisJ6LngFgqtPvQYFzZgbx0hbXn5RDFf9HwCbQcBfxgOR8FObn0WiSPadf
	6fPw==
X-Gm-Message-State: AD7BkJKM7BLpqoWKGjQG1FBjWVRX78ma9X+NiwrWFsIVdkqOJZG13G6KDMW71OqjJz78IQ==
X-Received: by 10.194.200.225 with SMTP id jv1mr11429335wjc.49.1458235179657; 
	Thu, 17 Mar 2016 10:19:39 -0700 (PDT)
Received: from localhost.localdomain
	(LPuteaux-656-1-252-235.w82-127.abo.wanadoo.fr. [82.127.113.235])
	by smtp.gmail.com with ESMTPSA id
	e25sm31066139wmi.21.2016.03.17.10.19.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 10:19:39 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 10:19:23 -0700
Message-Id: <1458235169-9267-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/8] default-distrovars.inc: add gobject-introspection-data to DISTRO_FEATURES_DEFAULT
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
X-List-Received-Date: Thu, 17 Mar 2016 17:19:39 -0000

Enable gobject introspection by default for all distros which respect
DISTRO_FEATURES_DEFAULT.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index ce42bde..8c9c5c1 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -9,7 +9,7 @@ ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 
-DISTRO_FEATURES_DEFAULT ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
+DISTRO_FEATURES_DEFAULT ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 gobject-introspection-data"
 DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
 					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
 					libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \
-- 
1.9.1


