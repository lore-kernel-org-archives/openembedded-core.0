Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0ED78961
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 16:00:46 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g21so5462237wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jan 2018 08:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OTdu5aTuckGxGElWyd5Qun9Nki8efxLG1LZ7GmGW89I=;
	b=DggojiafQzpCdJN8xIrg0j2MABbr4UGiO3wPV86UWrEe6af4hOQm7RaHrEIAzFortK
	ATP4Pr6erlIhhvdNQrfdGCZxzo9DYa6NaS/Tz5+adwtkC1bIU+ryySTgKq8HVekmES/S
	I6FmHlxrH1LL9smtcIRUR/AYE6zwvzBFeYsKfurwtWuyjmyz60aStj2I4F0qjuQ6+8vd
	e/YNCt7l9bGUrM+SWDET6mTsq5pbE+PmmP1McLSwxmL4WpDZ6N3tIFxrSmRkMZuVhgH4
	oFh3pICS/LaZsBKMd5Ym36y0FsePFqL5DnmvnNMsbiKYohF93txzzxoAI+5F8Q+i9gOk
	rYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OTdu5aTuckGxGElWyd5Qun9Nki8efxLG1LZ7GmGW89I=;
	b=LDo4ggDHh0+0DsyphApcR08gA0UaHjSQ80w1xC9cTog+bo/q5DQE/siJzBQjslSpGC
	JfR2bieDROr5hUFjsy1bX28Q7bezi6u36TRxk21bwd7lNeHJx5BLVrf2vbLlXYBuTGOK
	gihtP2RioktjjhIrJ1UZoDwCWwjWRWZ2S1DaXhQU77TGRi4DMcnd+VDydfJfVVGidomo
	HnZ0x1hmF9K5ZG5TE+gQf6rzr5NPOBK/mO1f5PsZudqnK0xRQQMESeAsYcnf5Oz/k0he
	+kHIGNKPkrpPDnFIMtXyNj+ic0orIuS8CQwQj67XtIP0vd5SBKaWHaqCR+OdIHQMaciU
	ezJA==
X-Gm-Message-State: AKGB3mLwpUMEi+QgzSCsCFdgFVMgB2a6Po/qu+4oedjqmW9KPZTZsvfq
	H7J6TRWctEIquP7W+JcoRo51ZdOl
X-Google-Smtp-Source: ACJfBosMRIEGxZDcQbYVaRzBpodB8KAbDGOwy/rZRQB13orwi0TcNjWRjqclin3hmiC5nHRTQuw1AQ==
X-Received: by 10.223.192.76 with SMTP id c12mr10166781wrf.260.1515427247148; 
	Mon, 08 Jan 2018 08:00:47 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b15sm11386658wrh.5.2018.01.08.08.00.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 08:00:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 16:00:16 +0000
Message-Id: <20180108160021.4715-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180108160021.4715-1-ross.burton@intel.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
Subject: [PATCH 4/9] pango: don't wipe EXTRA_AUTORECONF
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
X-List-Received-Date: Mon, 08 Jan 2018 16:00:47 -0000

This was added in 2007 to solve unspecified build errors, but the autotools
support has improved a lot since then and nothing breaks with it removed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango_1.40.12.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango_1.40.12.bb b/meta/recipes-graphics/pango/pango_1.40.12.bb
index 951afbe991c..cbad9a9a28a 100644
--- a/meta/recipes-graphics/pango/pango_1.40.12.bb
+++ b/meta/recipes-graphics/pango/pango_1.40.12.bb
@@ -25,8 +25,6 @@ DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo h
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"
 
-EXTRA_AUTORECONF = ""
-
 EXTRA_OECONF = " \
 	        --disable-debug \
 	        "
-- 
2.11.0


