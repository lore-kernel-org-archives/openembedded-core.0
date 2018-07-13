Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 948D178887
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 21:12:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id v15-v6so3282138pff.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 14:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C3Vz1il6atwL0OBcB3mxoO88poi6OwL0Nqfhi6b2pjw=;
	b=JBykG2c1OEJjX0eUbFcWqPJPtNNqHwxeZczqs1Y13vRjVV+qJ9nbno+UvG3hNnQL6S
	EY6kQNhb6EGjx86SpQgGIlGBOya0QPSz672XWPJyFRmO2QQGMD+O68H/vt++yMehFCKx
	YSdjMAtO2eGC1gkimh6Z1B4l/Aq1dTIoTk07OGZUEqmwYw0fN30LFm8hW/MTMGrI3EXr
	ms+P/xo+OHQKZTGy6IBP1nKtvyJsN6gOZmPVWgdA8UU+1J7wSyCYROdCMmSBVRFDYuk7
	k7Zm+EvyRHMXZ9PyGGYZwXyI8pgOKY6cEkVwei2m5l6KusVjUXhgXIpnEg23zE3l32qc
	cgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C3Vz1il6atwL0OBcB3mxoO88poi6OwL0Nqfhi6b2pjw=;
	b=YOjPy4I0KHyXTb4c4U6AbtJYJQ+tqdi+Qt/GcnxwRsU6LcPDTznjYeIJt696UJaihD
	Jwy/Gez9KwO8o05FTbxhjXyn+HUx2Z5wP09Gr2D1aqCe6Z4SoIgRgayVi/Dkvsy/1I/w
	9JsxUhSgv8+qMyMX5GbbvdjUOHZS5XUAX05H7yBZePgikT1JSp9WasCkhyb1eNKXxooY
	yG3wRMkFviCTDmeAOYL10bIsL2dOepYkpTXlH+8NAvAsnshBLc3a+gqYgjFnnO8aEw5X
	Z/ONK6C5ZNW9r46UaaYmFO4fL49cbtgkUpXz/g9oJL2w8wslE5nSgv4tdDeCBxTa5lRT
	EVbw==
X-Gm-Message-State: AOUpUlGwwbgjdqSIP0AsVA+Cg/F7/FsQxo8nCKiimFR0tRNrFlXzI+xx
	ttzawoIasYE4WbXBkRyqBxVqYA==
X-Google-Smtp-Source: AAOMgpfkBw78LRRrM66JHMWdt3QT70pixmLON+kLtMCPKrpEkV06CBRJm5ZhFpLfxx+8ZjhLaXe6iw==
X-Received: by 2002:a63:ad07:: with SMTP id g7-v6mr7424340pgf.19.1531516353659;
	Fri, 13 Jul 2018 14:12:33 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	o12-v6sm24305369pgd.71.2018.07.13.14.12.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jul 2018 14:12:33 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2018 14:12:25 -0700
Message-Id: <1531516345-10287-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531516345-10287-1-git-send-email-armccurdy@gmail.com>
References: <1531516345-10287-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] curl: add PACKAGECONFIG options for brotli, built-in manpages, etc
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
X-List-Received-Date: Fri, 13 Jul 2018 21:12:32 -0000

 - Add PACKAGECONFIG option for brotli (disable by default)
 - Add PACKAGECONFIG option for built-in manpages (disabled by
   default). Embedding a copy of the manpages within the curl binary
   adds approx 60k of gzipped data and duplicates the contents of the
   curl-doc package.
 - Add PACKAGECONFIG option for verbose error messages (enabled by
   default)
 - Disable legacy NTLM http authentication via delegation to the
   external winbind ntlm_auth helper (which isn't going to work
   without a runtime dependency on samba).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/curl_7.61.0.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index a80f926..03d627e 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -15,12 +15,14 @@ SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy threaded-resolver zlib"
-PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver zlib"
-PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver zlib"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy threaded-resolver verbose zlib"
+PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
+PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose zlib"
 
 # 'ares' and 'threaded-resolver' are mutually exclusive
 PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares"
+PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
+PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
 PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
@@ -43,9 +45,11 @@ PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openss
 PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver"
+PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 
 EXTRA_OECONF = " \
+    --disable-ntlm-wb \
     --enable-crypto-auth \
     --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libmetalink \
-- 
1.9.1


