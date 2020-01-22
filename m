Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7111791437
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:21 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id q8so2780773pfh.7
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BFzLKiHRuIWHvlpN4N+I+eny5NCz8TqFvgc2LtCitbg=;
	b=twoF4PI3Rbx4fTBOHlLGw9zQ/rJaZ7JkLGW5XtUtSB/Oba4b0CRhzHER4G+SsO9RWn
	+ZsDEIySpmaieHj8ValvH+Ef7CdyvV9nrcBGxfe97u2mKlmtnDxBMz7/7DZf0Lo+BBRF
	66pVfg6m4rOOK5Be23iKiB4NeXK06Fl+pFy9FZ9e7jTkjiaXPmTzMlXLW1cYHMsQd5dW
	VFsXu6dCpshjn+eTXILEmgJSJxF2UyEPEabJnd7w/MQ6bBvAF8CIXn8IOr+bNPJ7BLGf
	82UCwSC368ogz1wrL/d8nGH3Zi2vJsozpvEb60BebmlhaZwMcbgc5H9hSQJo29svDLOu
	z9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BFzLKiHRuIWHvlpN4N+I+eny5NCz8TqFvgc2LtCitbg=;
	b=j6973YfM9oJCLyXkqD0xT37SZHvaC+MT25zuWzSFyBx2qbke3odduWn5++zqiOc17l
	f+SDFfySHdbYu69SYCmfDRM9wnGYBxSkhNiXI2rNYo+zNqsPwh3pUM78M+zJhQteOCjC
	MAxyhWTu9rDmXERhmg4ezyf4auzL/3wBHMXa7TFEd4L8CwkG0YVuJA3K2uXC5yi3yLVN
	4xEOttmHKgUQsJo0UOUmTt27zYWTGQ8+TIu2axmMqkJI5yGTyi1NPVQE+ETzfLT0L0Nl
	cigxXLIfs54WXrMpcHWN8pj4YMjK4Jdjw/zL6+6/Huzyc2PxovlXwDKeY3EU0ZVmUhnG
	XMEA==
X-Gm-Message-State: APjAAAWRYi6EJTop5/mhKwWGtua4Q9ubnTul8ccv4E3tx6KA7ePoaoVl
	bwBJkABn4jbnyc3B+LOBjz0FP+yw
X-Google-Smtp-Source: APXvYqyLTMDMxv2HLajyIEMoS0VklhpdYGsuHUcgZ1qaDjwCX52NOHBHNKHOwUGcSfG9pFmW9hl72Q==
X-Received: by 2002:a62:f207:: with SMTP id m7mr1103836pfh.223.1579672102397; 
	Tue, 21 Jan 2020 21:48:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.21
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:09 -0800
Message-Id: <c41f1c7f33a8a13ed8e6fd86b494cf460328a9e4.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579672034.git.akuster808@gmail.com>
References: <cover.1579672034.git.akuster808@gmail.com>
Subject: [zeus 04/11] licenses.conf: Remove the SRC_DISTRIBUTE_LICENSES variable
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:21 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The SRC_DISTRIBUTE_LICENSES variable and its static list of licenses
has been replaced by AVAILABLE_LICENSES, which automatically contains
all available licenses.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64daaf29e2c12c8b587bafdebf9409433187ddf7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/licenses.conf | 43 -----------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 7b01c57632..1c586a3bc6 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -1,44 +1,3 @@
-# These aren't actually used anywhere that I can tell
-# They may be in the future (or are used by someone else
-# For completion sake, I've updated them
-SRC_DISTRIBUTE_LICENSES += "AAL Adobe AFL-1.2 AFL-2.0 AFL-2.1 AFL-3.0"
-SRC_DISTRIBUTE_LICENSES += "AGPL-3.0 ANTLR-PD Apache-1.0 Apache-1.1 Apache-2.0"
-SRC_DISTRIBUTE_LICENSES += "APL-1.0 APSL-1.0 APSL-1.1 APSL-1.2 APSL-2.0"
-SRC_DISTRIBUTE_LICENSES += "Artistic-1.0 Artistic-2.0 BitstreamVera BSD"
-SRC_DISTRIBUTE_LICENSES += "BSD-2-Clause BSD-3-Clause BSD-4-Clause BSL-1.0"
-SRC_DISTRIBUTE_LICENSES += "CATOSL-1.1 CC0-1.0 CC-BY-1.0 CC-BY-2.0 CC-BY-2.5"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-3.0 CC-BY-NC-1.0 CC-BY-NC-2.0 CC-BY-NC-2.5"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-NC-3.0 CC-BY-NC-ND-1.0 CC-BY-NC-ND-2.0"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-NC-ND-2.5 CC-BY-NC-ND-3.0 CC-BY-NC-SA-1.0"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-NC-SA-2.0 CC-BY-NC-SA-2.5 CC-BY-NC-SA-3.0"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-ND-1.0 CC-BY-ND-2.0 CC-BY-ND-2.5 CC-BY-ND-3.0"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5 CC-BY-SA-3.0 CC-BY-SA-4.0"
-SRC_DISTRIBUTE_LICENSES += "CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B CECILL-C"
-SRC_DISTRIBUTE_LICENSES += "ClArtistic CPAL-1.0 CPL-1.0 CUA-OPL-1.0 DSSSL"
-SRC_DISTRIBUTE_LICENSES += "ECL-1.0 ECL-2.0 eCos-2.0 EDL-1.0 EFL-1.0 EFL-2.0"
-SRC_DISTRIBUTE_LICENSES += "Entessa EPL-1.0 EPL-2.0 ErlPL-1.1"
-SRC_DISTRIBUTE_LICENSES += "EUDatagrid EUPL-1.0 EUPL-1.1 Fair Frameworx-1.0"
-SRC_DISTRIBUTE_LICENSES += "FreeType GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-1.0"
-SRC_DISTRIBUTE_LICENSES += "GPL-2.0 GPL-2.0-with-autoconf-exception"
-SRC_DISTRIBUTE_LICENSES += "GPL-2.0-with-classpath-exception"
-SRC_DISTRIBUTE_LICENSES += "GPL-2.0-with-font-exception"
-SRC_DISTRIBUTE_LICENSES += "GPL-2.0-with-GCC-exception"
-SRC_DISTRIBUTE_LICENSES += "GPL-2-with-bison-exception GPL-3.0"
-SRC_DISTRIBUTE_LICENSES += "GPL-3.0-with-autoconf-exception"
-SRC_DISTRIBUTE_LICENSES += "GPL-3.0-with-GCC-exception"
-SRC_DISTRIBUTE_LICENSES += "gSOAP-1 gSOAP-1.3b HPND IPA IPL-1.0 ISC LGPL-2.0"
-SRC_DISTRIBUTE_LICENSES += "LGPL-2.1 LGPL-3.0 Libpng LPL-1.02 LPPL-1.0 LPPL-1.1"
-SRC_DISTRIBUTE_LICENSES += "LPPL-1.2 LPPL-1.3c MirOS MIT Motosoto MPL-1.0"
-SRC_DISTRIBUTE_LICENSES += "MPL-1.1 MS-PL MS-RL Multics NASA-1.3 Nauman NCSA"
-SRC_DISTRIBUTE_LICENSES += "NGPL Nokia NPOSL-3.0 NTP OASIS OCLC-2.0 ODbL-1.0"
-SRC_DISTRIBUTE_LICENSES += "OFL-1.1 OGTSL OLDAP-2.8 OpenSSL OSL-1.0 OSL-2.0"
-SRC_DISTRIBUTE_LICENSES += "OSL-3.0 PD PHP-3.0 PostgreSQL Proprietary"
-SRC_DISTRIBUTE_LICENSES += "Python-2.0 QPL-1.0 RHeCos-1 RHeCos-1.1 RPL-1.5"
-SRC_DISTRIBUTE_LICENSES += "RPSL-1.0 RSCPL Ruby SAX-PD SGI-1 Simple-2.0 Sleepycat"
-SRC_DISTRIBUTE_LICENSES += "SPL-1.0 SugarCRM-1 SugarCRM-1.1.3 UCB VSL-1.0 W3C"
-SRC_DISTRIBUTE_LICENSES += "Watcom-1.0 WXwindows XFree86-1.0 XFree86-1.1 Xnet XSL YPL-1.1"
-SRC_DISTRIBUTE_LICENSES += "Zimbra-1.3 Zlib ZPL-1.1 ZPL-2.0 ZPL-2.1"
-
 # Standards are great! Everyone has their own. In an effort to standardize licensing
 # names, common-licenses will use the SPDX standard license names. In order to not
 # break the non-standardized license names that we find in LICENSE, we'll set
@@ -188,5 +147,3 @@ FOSS_BASE_URL = "http://localhost/repo/?mod=spdx_license_once"
 FOSS_SERVER = "${FOSS_BASE_URL}&fullSPDXFlag=${FOSS_FULL_SPDX}&noCopyright=${FOSS_NO_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}"
 
 FOSS_WGET_FLAGS = "-qO - --no-check-certificate --timeout=0"
-
-
-- 
2.17.1


