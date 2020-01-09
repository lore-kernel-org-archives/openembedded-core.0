Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id B637E7FE5C
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:49:54 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id x17so2045891pln.1
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=59XBNay+BGeZPnlZpE3sKlMbnpSWt9q3hoWV3MTOfZA=;
	b=Xqog6fDIWyyPuv2/G+CeLvFkXj6YJF9X5htH2rfvr4jUn3YmISQTmwesfKtMzOlVZ7
	5Gpk8Qdtvv7nDcZofRBd7ywHFHLGVrIN5dWgtSR3jsggc26JDr/fOaESVuvG6eybAQS+
	jZgaXnhPPpLq6Qqd3PneQhzivRpts4PjDJY9+kahK/HKjkmm1yQkPMQ2xdiiWFQbDjwV
	RZDZJsDLh0MF+82uTbWgXrki4cDZdZ4JUiTk+OlgXUfHr5d8jKCvZukhdfQqHQkifNrE
	cBvPUeXrC/lPCOxCAfZwE9mgRc6IbPmTEJKeLp8gb/XG5BVuKnIvEILvLVdl8c3XPPZe
	rM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=59XBNay+BGeZPnlZpE3sKlMbnpSWt9q3hoWV3MTOfZA=;
	b=Pd887B7TmQvb3LTa1SR7WXueerd3A9037AXsIrwozPA/KCV1BeXUcRKLPRv1pebnlO
	fBAI5/yXHoNngPiRW9laq9u0mwjFWkb1ULtg5GFfI05KASenPkh1w0GvN0kgKcOUDXbs
	AFwi45NHTB4mrwqfDE/IzArhhPMtVoh5hUgC0F1pKBr2xmY8+6YvaNXk4NXm8l43b6RS
	OvhWpv0TZbosdfCaAuITcOIcobuIhe1o/NODu1spj+JXBG/5tV6Camlgu2ia8SlrMaOK
	4j6qM9iZMRR5JZiVQ/1ON3tDKDGnHVPt2CaxY30BWj3uZ0B00+wUTP/g+O1ujOr6ifh2
	5m/g==
X-Gm-Message-State: APjAAAUq+PexbI6RvGj8SYCbIikIsDOc7rADI6GX9KV/UHy6m88T0aQN
	8fv84jAfTL8KIIO9F9+NlLTgGKJo
X-Google-Smtp-Source: APXvYqzmF7z3KidsqR0IL1AGhQGQBf3YvAI2c+FAUYtDCGjQ6dDkTNAfMDlesZY4oCZ5PHSuCyuwCg==
X-Received: by 2002:a17:90a:98d:: with SMTP id
	13mr2993297pjo.102.1578545395671; 
	Wed, 08 Jan 2020 20:49:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.49.55
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:49:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:23 -0800
Message-Id: <7ce42a30a7508e8fcb496ba05cf6967dc04a988e.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 04/28] sstate: Ensure target sstate directory exists if unihash changes
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
X-List-Received-Date: Thu, 09 Jan 2020 04:49:54 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The previous patches meant the mkdir might no longer match the final target
directory. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0af4dae84099e8632a9ea6a4afdbea2f232bb170)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a46dd2e210..79ae392116 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -613,10 +613,8 @@ def sstate_package(ss, d):
 
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
     d.appendVar('SSTATE_PKG', '_'+ ss['task'] + ".tgz")
-    sstatepkg = d.getVar('SSTATE_PKG')
     bb.utils.remove(sstatebuild, recurse=True)
     bb.utils.mkdirhier(sstatebuild)
-    bb.utils.mkdirhier(os.path.dirname(sstatepkg))
     for state in ss['dirs']:
         if not os.path.exists(state[1]):
             continue
@@ -756,6 +754,8 @@ sstate_create_package () {
 		return
 	fi
 
+        mkdir -p `dirname ${SSTATE_PKG}`
+
         # Use pigz if available
         OPT="-czS"
         if [ -x "$(command -v pigz)" ]; then
-- 
2.17.1


