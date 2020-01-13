Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1F99B7FCA6
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:41 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 195so5021622pfw.11
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sMr7JLmUkgSgNr+DoauJEtLlBp4nZcZeJuVSbAy3nQ8=;
	b=BKbTlUj78Q2EPELqQtalc45Z5zE9WnA5JPOsxh2lp2JGsnv2YMuktrR20YhokHSDuj
	AC5Thbgqc9HuhPWGZQ4kXBxFiQ4RZuurnxCX1bBq5jucArWBzQfmzvpHC3VRSYeSN+ZW
	8ZCb9pQomacdlii04R4oRKdW0D509pU0ZNxAu7CpTV5ttYz28j96I9+OsMzeD7dkLpXO
	+6Cb+ZvXOszP41fB9C+qqSoFy8nWOCFhGrxOf8ANqmmgmQV+BIvcLckYkVwnidI7kDMx
	t9ajR+H42fCGin56En7byzSxnaRYoQ1tL48wkBpyc+0KK8zUnbtuHhfF4oU12ad77q6w
	zsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sMr7JLmUkgSgNr+DoauJEtLlBp4nZcZeJuVSbAy3nQ8=;
	b=qBW9aUXA8BlRBhbebgt4JgX/nkR1S2ntMPGh07Dby6hOHaYsyMTTX9cfxLIvR0K8wt
	fJlZlVDl9mFnL5YeJhjbTNkP49eRZ1nB3zaIdHQzynZ1sF+JzCPYov5TY6oshSuB2nhm
	uy2dspATksYixcFG7viik+xGStxwvK3KLnJ6UuXlGft7cwLdJkNuPChXeDEEAis/JkoA
	9nw+IdN4jivHWOpI/BrP5vCS1YYClvAqYd874QiFX9ZQNlnHHzz+1RBxJw2W8oLee278
	F//Wi+U1wD3YXtW4VTf7+0EVQ6lmwc73pNUWVrOhnoZlGnCZbq+6LeHy/ci9MSxkgmW/
	ZWtw==
X-Gm-Message-State: APjAAAUDz2BLxz/SGLTCZnlfWNWpjvgDTQpm+Bc41gml33rXVQymjHum
	fkxf8QesvTlVYyPw4kSgqbCdKpVX
X-Google-Smtp-Source: APXvYqznZzCInXpiqYDCh+IXfQwNPuRANWyvFrTjQwkbtIMdhkr8vF4CGc/lCugLeXnOSqbyFY+dOA==
X-Received: by 2002:a63:5b59:: with SMTP id l25mr21861186pgm.382.1578929441669;
	Mon, 13 Jan 2020 07:30:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:08 -0800
Message-Id: <583990fc583a96dbf0655bff1630b2ebe199021d.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 09/28] libsndfile1: whitelist CVE-2018-13419
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:41 -0000

From: Ross Burton <ross.burton@intel.com>

This is a memory leak that nobody else can replicate and has been rejected by
upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 77393db847..6044bf09c7 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -38,3 +38,6 @@ do_configure_prepend_arm() {
 	export ac_cv_sys_file_offset_bits=64
 }
 
+# This can't be replicated and is just a memory leak.
+# https://github.com/erikd/libsndfile/issues/398
+CVE_CHECK_WHITELIST += "CVE-2018-13419"
-- 
2.17.1


