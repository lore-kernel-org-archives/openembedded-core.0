Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6D777E92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 21:37:27 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id q9so1482110wre.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 13:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=calDuAJhTcVU/qlo/xTHitI9Ro1AmqkawszHZMQIjMA=;
	b=ZQ13SGabkAAJbbMoZm5WC4rkMX8nlBXcPzicC/+jAxTDsxZGw2qGJu+Fxp+A8+JBhH
	n898ebqeA0srOvYogpovNF2nrRJjWXtpUs3PmFFTuxZkwBY5pLf0gBCIofutTFhJ8tT+
	YJEdYgCMdnyE9cSmnzPZI0IrosGkxMhkrPTNRJSAHH4bSprgZTfPdJVsvo9E2WjYVF7f
	0e0w7i7NsYZI8TDGKNOaG42yDIhHTseMNmPYSuolibUVxRWlbsc7pyhuRU/Pt2zNubBS
	C1mv0ozLmpX0uBvRqR9LvfRf8V83UJ8kZTaKIZ2rxQKsJ2ApAFxuREJhW22HNV2ijzw8
	u2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=calDuAJhTcVU/qlo/xTHitI9Ro1AmqkawszHZMQIjMA=;
	b=KDy5x+wqk1LAQCJDiLkZ7AzSmuo7RTbGiudHJuLnIOgqjE40X/KUpIdds5Ce7QErBV
	Kf+jQthwebZXwj/rrqRJXHkFpIvZM2bXRzubksRsqHehodm1wmyY7ZqSSLMcIsEO0ruE
	HJWFfEU/rmekHMswxY/BTQto0YhcN6xvPzUGzTcJjc185tFEVvflvWa+ZvHrBkCxrl6z
	4hT33CjzIFUHHIS8+9Fks3z200k4or5f1yJ9zMh9mHH7Ul1bFx2PLdBKeKED0P6vaMGK
	b9a2BmaVDNDG+msI6ThrxsPnvnkMkGntF5FZBJNgJE40/WrUWgLY3ucxltiyqJ5TLIwE
	DstA==
X-Gm-Message-State: AJaThX6JvNSDL8DlQqNR3uAvrmAdJ0N9DfmVCQI0rrhtX13h0drO+PlL
	1S1AjUvEOaz4hQq8ErMbg0CeEbps
X-Google-Smtp-Source: AGs4zMYqAXZj23kPJ9Q0f+nSj5O/2BAH+qGmTcwQtdbrrMxKs71u3llaENbgVPvq9JW2YMK/d+A3qQ==
X-Received: by 10.223.189.11 with SMTP id j11mr415935wrh.265.1511905048651;
	Tue, 28 Nov 2017 13:37:28 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id c54sm276284wra.84.2017.11.28.13.37.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 13:37:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Nov 2017 21:37:25 +0000
Message-Id: <20171128213725.18657-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] nettle: remove aclocal/acinclude dance
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
X-List-Received-Date: Tue, 28 Nov 2017 21:37:28 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/nettle/nettle.inc | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/nettle/nettle.inc b/meta/recipes-support/nettle/nettle.inc
index af51fb6c779..cc040271c6e 100644
--- a/meta/recipes-support/nettle/nettle.inc
+++ b/meta/recipes-support/nettle/nettle.inc
@@ -13,13 +13,9 @@ UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools ptest
 
-EXTRA_OECONF = "--disable-openssl"
+EXTRA_AUTORECONF += "--exclude=aclocal"
 
-do_configure_prepend() {
-       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
-               cp ${S}/aclocal.m4 ${S}/acinclude.m4
-       fi
-}
+EXTRA_OECONF = "--disable-openssl"
 
 do_compile_ptest() {
         oe_runmake buildtest
-- 
2.11.0


