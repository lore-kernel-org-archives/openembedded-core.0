Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 49FBD71998
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 13:44:20 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id r144so175606348wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lrPnWy0ixSe0jR7x69QVhJB6EboA2k7c3CiZf42XFVg=;
	b=yv8KM9zTAdecUitAutgCibfKAe09xeLObtG9Wa1WoUGNxF5SUZct1Tn5Foffu+g68g
	nlZwCyMjD4bEjiAC1LmcfeMkstEj3kQq1FsCWUf2MLupjyl6HbtGZL/M/tSUwECZ0B8W
	UhIdiR6glO+NguO3h7GcCkWgGVWTgdtemm6n6VGBb6qMow6WAUutMdGYRxZQ8wgicSbo
	tFAwcc3YNAqsqs5Xs8k6vJ68CjY2tGnnr6iGITbP9af2sTMUfFsiorXSCvYOJFjBo77o
	tqLT2X6j3+96OzjrRtaVgDNTxZ1gfCZS2v0MuFYOW0LGgE2VILc97F34eeggWK5AC19j
	SteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lrPnWy0ixSe0jR7x69QVhJB6EboA2k7c3CiZf42XFVg=;
	b=BRE5TPamlll9NBmBcjLyTqBlocyT/3xgRtpI5T6FQ18pj+tZ/od+fu+HFT9qrygYx0
	beOCBqJps+wecWffbJNDL/SvOMBrkFl2bZrePLNDGpo1m7lbo51/GohplCq6h55CniTD
	BuOLmgCGnS3V5UWUScQanmu8yKuUUMsGfXQvvv5m7YO80HDZC4HzSX4cAm6bHJftuCiT
	LIsOsFjcbOqmgbKAaFglkLCd/cqtYdiYDDSXwJz6Tf2qcm7ml2Z5Bd7H7QPL1Xz5C/MX
	Ov6tnquMHBOaRFBZc0onvnKdzQ6q+gIsZx8au0xCy2W9JpX1kM3H9rI1+BR0LmbEShsL
	sgfA==
X-Gm-Message-State: AIkVDXIhjbCbHyAmVtc1d4b2loyxBVCgQG0RfmaWuyTLj1HI9u7W6PPqLLyXq5RoNmLEM9VZ
X-Received: by 10.223.133.132 with SMTP id 4mr26917604wrt.136.1484574260844;
	Mon, 16 Jan 2017 05:44:20 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l67sm21925064wmf.1.2017.01.16.05.44.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Jan 2017 05:44:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 13:44:13 +0000
Message-Id: <1484574253-30817-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1484574253-30817-1-git-send-email-ross.burton@intel.com>
References: <1484574253-30817-1-git-send-email-ross.burton@intel.com>
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 2/2] perf: add PACKAGECONFIG for systemtap
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
X-List-Received-Date: Mon, 16 Jan 2017 13:44:21 -0000

Otherwise it's possible to race with systemtap headers being present during the autodetection and disappearing during the build:

tests/sdt.c:14:21: fatal error: sys/sdt.h: No such file or directory
 #include <sys/sdt.h>
                     ^
Signed-off-by: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 8b5028e..acbb1d9 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -20,6 +20,7 @@ PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python"
 PACKAGECONFIG[tui] = ",NO_NEWT=1,libnewt slang"
 PACKAGECONFIG[libunwind] = ",NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1,libunwind"
 PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
+PACKAGECONFIG[systemtap] = ",NO_SDT=1,systemtap"
 
 DEPENDS = " \
     virtual/${MLPREFIX}libc \
-- 
2.8.1


