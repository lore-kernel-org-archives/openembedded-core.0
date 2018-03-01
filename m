Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 65F43782A9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:26:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id h21so13932675wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rP6wdqah3fDcEKd4NBYXmeM0djOMej4Zz1uDvXgkAZU=;
	b=WTJeIV38r0fbFwj7CBF7Od4igB12wXjtkkGjZmournja21PbnvF/pUg/wvanoWhcRs
	czrVPEnIl0WbBDg01rmQfiObm8UNJFyr0cRM5KesCAfJ+Yla3Hh4JrtvlrPPvk0Ix7T4
	oKpwWg5lbdXLb0hrKN/Wh3+a7bTMO5JnTwTXh+fLoqCBy80ujG0l29JSFNvuA5KNJhvI
	UrP0OcgmLtpDlkpremOZ5YUpxIV96Zch+FIVY3hC8ju22FYnQyBeK9gxnsiYv5liGone
	HSA9RIHeHJDG/ukCiwNj4/OFxhj71F/6UwcIn2vHthRXBE5u9h97/7NulHCeKuAILuro
	K/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rP6wdqah3fDcEKd4NBYXmeM0djOMej4Zz1uDvXgkAZU=;
	b=JWsEESkmOc66fECbqQgUdFDco9uLW4hQnht+uWyf/a1+viVBWG2rYUT1SvACUIqrDq
	OfNnrjrNghBn0XoRgUWXTb8puX4P+SdkvRC1Cjja65nKrzwRMztgTG6+d1ncld17I/1I
	LQDEDQ6AFlENckMDuubILBay/rJGSDK4JSYuDW9NZrL4Mz/N4CQ/qMZyvW7IEs/CuKZQ
	aBrhuiuwt8dEuCPue5FubpU9JzIxxeV8HyJZynJuNvBRxBYKabu2oj/uaxeV4XkeP5nF
	+Lew/CDEwUjqYrR3SabzUR9FLHUCZ7kj6iqFz2eqlbgFmhBXoXsjSGz4ifTmLnONkk0X
	HD5g==
X-Gm-Message-State: AElRT7FHYwT7CfMNpkvS68lo0lcULab9sLIWuvUZgYB8Z+2twbyBaYGO
	Upf0bo1aO0kFC7+hkHEJpnQMz3jd
X-Google-Smtp-Source: AG47ELtION3T933h/0D4FVfOPWo6Neh/AGAlBo/rZWfLqc+jP00F0Y129kXvMRJavRKgexakK8vFrA==
X-Received: by 10.28.128.79 with SMTP id b76mr2751818wmd.10.1519928802839;
	Thu, 01 Mar 2018 10:26:42 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h188sm4955285wmf.23.2018.03.01.10.26.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:26:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:26:25 +0000
Message-Id: <20180301182634.20502-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
Subject: [PATCH 02/11] default-distrovars: don't rename locales for nativesdk
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
X-List-Received-Date: Thu, 01 Mar 2018 18:26:42 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 08542a743f9..76d09af7266 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -8,6 +8,7 @@ IMAGE_LINGUAS ?= "en-us en-gb"
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
+LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
 DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
 DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
-- 
2.11.0


