Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id E82187328A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 23:24:09 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yl2so6424907pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=yeMAe0Qt7nMD1zq2X7ikN/XH8T7qTmrLSwsbLQa4Ohs=;
	b=tXgzTdj8vVKIGV1sCZ0ZlMGVBF0SCS7Rc//ytE8332WiSUJBIGyjAEZqLev0aHmnPa
	CItLlW320syHukAmKEcyr6tY1yX9iUBvpK5/rta40QhMg1lvMiDvxoLZpQ4vrevZ58Mk
	kie4Fl/xfDt87J95GZLqqBzZxjxFNRYP21BiUzaLVfNxWJnjtN53+D2qrb69H1lglVpK
	g2qK9wjf9g9FY0J8TL6+BMeiVpYGeav+6yPW2hD1NfaCE6VLwU9ip+oLXI+loN749gT2
	0yymDGsKSWS4YFWeDXJfAJnSc2JVRG/o3ITo3ajKMlv8ECbhKdAXLp1NtAxDUxib0cta
	qCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=yeMAe0Qt7nMD1zq2X7ikN/XH8T7qTmrLSwsbLQa4Ohs=;
	b=T6OAX7A0pLtEwdOQUAcstP3nodDoJYvrkS9Do0CSIIYNPKx+OQF0KhKfvHKJhYajmM
	fmgPNoth6JQSW3McDfRki8OLS6b2IH+A1iiseNyUMeoNwj4wEeOhI9ObV36Uqcu2D46s
	ugZ9XkwTpUEj6qyULpywOBlP8r/+Yb5msd13V8fMaP25lyNyNxVbw1vP9yB8eULTR6O2
	pQ1n8L8JLHmXxnZT3Uwoz8aRPRgb/K4h45U5TxD1z/UkuuaP1HD6wS8iZ4uwxYWvB3V3
	1ogRDbVTFSlLPq49u8dl69iHp7hyuXm0C9sssOWLZdamzivaKT/CtoMBTZsyKobURGSD
	TzsA==
X-Gm-Message-State: AOPr4FUBUDnhC22KzQpl3/e9fpUBM49+ZwMtQ50BHtYwrm9eirrJJtue4W2y7z0MME83Kw==
X-Received: by 10.66.184.40 with SMTP id er8mr16169143pac.134.1461799450975;
	Wed, 27 Apr 2016 16:24:10 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yl5sm9554679pac.38.2016.04.27.16.24.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 16:24:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 16:24:00 -0700
Message-Id: <c858f377f69d84d2f7393025558d2eab1ba3e1e0.1461790921.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <126ec11f40f6758d062fe7ec7da23ee247752960.1461790921.git.chris_larson@mentor.com>
References: <126ec11f40f6758d062fe7ec7da23ee247752960.1461790921.git.chris_larson@mentor.com>
In-Reply-To: <cover.1461790921.git.chris_larson@mentor.com>
References: <cover.1461790921.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-master][PATCH 3/4] scripts/lib/argparse_oe: simplify options title change
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
X-List-Received-Date: Wed, 27 Apr 2016 23:24:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

There's no need to iterate over the action groups here, as self._optionals and
self._positionals are available.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/argparse_oe.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index 75002d0..2185a66 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -14,6 +14,7 @@ class ArgumentParser(argparse.ArgumentParser):
         kwargs.setdefault('formatter_class', OeHelpFormatter)
         self._subparser_groups = OrderedDict()
         super(ArgumentParser, self).__init__(*args, **kwargs)
+        self._optionals.title = 'options'
 
     def error(self, message):
         """error(message: string)
@@ -93,10 +94,6 @@ class ArgumentSubParser(ArgumentParser):
         if 'order' in kwargs:
             self._order = kwargs.pop('order')
         super(ArgumentSubParser, self).__init__(*args, **kwargs)
-        for agroup in self._action_groups:
-            if agroup.title == 'optional arguments':
-                agroup.title = 'options'
-                break
 
     def parse_known_args(self, args=None, namespace=None):
         # This works around argparse not handling optional positional arguments being
-- 
2.8.0


