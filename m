Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 31C647F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:16 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id s64so24794248pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=59XBNay+BGeZPnlZpE3sKlMbnpSWt9q3hoWV3MTOfZA=;
	b=cr6n/gKM7/Sz8ciY7V7iuTLFApiaXo8QuebXYLdE7x5DyOTC4dQpqmXmp+uBAwhd/5
	IaA5UfEiF7R0Qu/oIg7HOgkQA46JsGlI6t8ywatdxqY6wL+tEzNKB3vS1cMtwkP0xTTE
	MowjD5xMbI9IiLFswqffEIW71s5Wcn3cMVMpfexHM9mAXexRFdJvTRw6g6EfNnEHBjAH
	uuwJmfGThQQ9qMVhKbuy/riZrWB3ijCpKVC9P50mrra6etj4a6OgdsV+/FBimS47H3Hl
	UtnyEZm3GaTAb5Uvdods5rBogcFc4y4tQUolyOJPZGjCH2MQW6RJTuIcSqvr6/8BFrwX
	5J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=59XBNay+BGeZPnlZpE3sKlMbnpSWt9q3hoWV3MTOfZA=;
	b=P48AAdxeioAeNILDZqpB/jBG5m93DPNseEMWNU6PrEFN3Tdl3K2gLB5Nu8jIhwA/oU
	Td6g+8SSYG5xMTpXpRY/3lYli7aSig2tf1bqnEK6g2lknf4XbQoQUT/FS4HHLQ0mRh+0
	wPraNZpS1aESEaCFbalYpWLmbY8e5yQQojZYMiw1L+m52UtooNN8dRJBlUICwxnSmB9z
	B+j1+zWb1o1qeBEuxW75njwmLv5qSDpqHYN4QT1KHC+3tSMnSx8T6ZOkE6uXtH7cNhk/
	QHzQnwCma8edyRS4vz5HyCe183k3+b4TeQ7kWLqWI7A2L586jHLcuGTEii+RjRIKeNr/
	Phww==
X-Gm-Message-State: APjAAAV9XM4QddBaAH6Z1VS0+s6aB0RBb0ddpsxso6XMPEmXyTeg0WuO
	zUgqjRbSkyv1qUwltt4gk0bgH61Kask=
X-Google-Smtp-Source: APXvYqyWkVp366F+g7EnaxFZyVRdsZgmZyXhkV/fxFDOHZgmfgU/YyWYPWfe56WecFhSdSrqPiWZ+g==
X-Received: by 2002:a63:604:: with SMTP id 4mr106065652pgg.406.1578155177170; 
	Sat, 04 Jan 2020 08:26:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:45 -0800
Message-Id: <7ce42a30a7508e8fcb496ba05cf6967dc04a988e.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 04/29] sstate: Ensure target sstate directory exists if unihash changes
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:16 -0000

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


