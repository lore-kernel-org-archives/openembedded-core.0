Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA657FD96
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u2so4279362wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XOktZE3fHDN85+4NIIcAbrHjiNW8TwNE+Pwai1dBsJU=;
	b=Uv6HIKa8xwDDuXA4HJfzegvRHV7yapPkl/Uc5WnnoLj16ZTwDSQQB1o5StB9/hdpaQ
	oasp4D7G+2WzwqGKEfAZabyfpEAxUVWSMvE5CJFNoEi+OclWwOJROTiKZHaXsv+1XORI
	jRGwqpREqowx124DcHtVEvn5s0APjcdb3BttXIzfGHQEfEuSaUz9Ocd5qOocwuTH3+0H
	UI6QOAKB8MzY3MmRJwbwwx6fr0DYYWEzsV7JeUf1M46bGfsRNITDbJ2pU2Q7LJkwNcSC
	C7FcvzohPIzyggvx+C0Qn2x5KUQmgLuYq56ZRZxgsmvxJ/pdt8GdzIV3rpGQCt79+TU7
	71ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XOktZE3fHDN85+4NIIcAbrHjiNW8TwNE+Pwai1dBsJU=;
	b=ocITgdpPSqdD0kisrO+6jwAK5xhgKl3RWfQERWBWp0Ib5qhF+ZvvH6pKUgxz9KoN+H
	h07g9CN0ZYjSuVsXv69BmLy9+pqLMXy/FG9UvCCeBhDnEaA3EuMl5F++QAQaa5yDRwAu
	SvsyHO0zybTgVF1TeFtBNptMQElNaswAJXwT2hZAiplWiXWV1XBIITfrnj7XSnOZsmOD
	BsNmCtzxI+pGa74VHTvv9THYnovD5m6UrsvXXY/4CopZuiggzTOG3A+UAh6SqxFM7Bm2
	xnZnsabFHzd3J4hkwixCQfsFEpFxG9h0pQKid6zpHUSoCg0fNUkM++8nx5wMNSuQBoxZ
	GJ5Q==
X-Gm-Message-State: APjAAAVp3tFEbpt3AoAsDbBCV+vHbqzt8uO0bixotKNZR2DCL7Ddph8t
	3VopGwgmz/l/d/Y33j0Vh9NzKNn/2JE=
X-Google-Smtp-Source: APXvYqzLaQAiBA4gYvHP32Ti6ujP/wKuKe03iNHYWbsbfft/VODTyU9XZjtwdQuplW42wJ16cVmTEg==
X-Received: by 2002:a05:600c:21ce:: with SMTP id
	x14mr6431878wmj.120.1578601596935; 
	Thu, 09 Jan 2020 12:26:36 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:16 +0100
Message-Id: <20200109202623.28936-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/11] bitbake.conf: add variables 'mimedir' and 'desktopdir'
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mimedir:
   This is the path all mime information is stored at and
   update-mime-database works with
desktopdir:
   All application .desktop files are stored here

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/conf/bitbake.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 263d8aea4f..6fb4072f1b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -34,6 +34,8 @@ export datadir = "${prefix}/share"
 export infodir = "${datadir}/info"
 export mandir = "${datadir}/man"
 export docdir = "${datadir}/doc"
+export mimedir = "${datadir}/mime"
+export desktopdir = "${datadir}/applications"
 export systemd_unitdir = "${nonarch_base_libdir}/systemd"
 export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
 export nonarch_libdir = "${exec_prefix}/lib"
@@ -300,7 +302,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
             ${base_prefix}/lib/udev ${prefix}/lib/udev \
             ${base_libdir}/udev ${libdir}/udev \
             ${datadir}/${BPN} ${libdir}/${BPN}/* \
-            ${datadir}/pixmaps ${datadir}/applications \
+            ${datadir}/pixmaps ${desktopdir} \
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
             ${libdir}/bonobo/servers"
 
-- 
2.21.0


