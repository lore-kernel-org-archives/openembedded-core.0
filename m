Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6CD789FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q6-v6so8791259wrw.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LcOxvFgEr+MFeKuMGDxnND2tARACgnjkZ9bAp1VGzGQ=;
	b=bmzBCkYlaJfrKEWO7D1Nes+79WjKBwza2FKuuSMjPR0PKeqohxUXOGtM2TPY05eaMI
	G1I367APOjmcDzIVbgM0nnPWhSe41qLy8eoEUvZCvvzNfaj62syHeKjEQjejE1M9ye+x
	YzQJ4zn1fqd75fmfnYvqbozajmL++Qe2V08t1zaBrwuXNAryfr9/St1MtkMQ5l/SOdPL
	xoUUqOHzSuxlZt8aWcjjfSfYVHC/w95NuA8qva9n9CNGittJqhOzBs0KUWqMY3RGuJFl
	kG2rxoG7OG3G7wW6qNPikT5NtC7FiImSKqSauKM2rxJT4Cl2mtjHH+II2ofL73n8WIxR
	ZEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LcOxvFgEr+MFeKuMGDxnND2tARACgnjkZ9bAp1VGzGQ=;
	b=XQm1fSVGoNZ6r5cJ4Fazvxr0klhhJaDEWp/BxlQWwd9HIA3ZUymq+AWA+sqqROs16n
	coqygnR3MpTd4KVX+7yy4sfVjTOloNhvK5YvyuUKblYUYOGqsqGxd40k7xIzB7YCOUly
	0rvIt+KFt/coVXF+qewpFSOT04OlXE0/S49+YXkNnB8al0skiQUQ759Guve/9uo60z+X
	kQ5M4DNoBppRQl+JDEAAIkrqRza+PT4TFapmZGVOz3E6ySFdmZA2YxMTaj1MVm1kREdV
	CCzRsyYecwkln7kt4xt2j99srTPrlvZyfdmlDjlj+yhifIOtZFusvwPjWjORnNqbwRX1
	TiHg==
X-Gm-Message-State: AGRZ1gLvjUbDFNlLY9FHYFrR1L2vcoESxLuc1t4nm+kzgCwcOBjRMZqL
	6lfYHo41JyGKWdnhWgUmEHVIil0sk2Y=
X-Google-Smtp-Source: AJdET5d2QI6A7f3ndgTRy05g52bE0X5urErpT5Ij9tj0FsZorD/vzCwmpChoTLxQBRciDfUFOvp4Jg==
X-Received: by 2002:adf:edcf:: with SMTP id v15-v6mr934950wro.47.1540217133752;
	Mon, 22 Oct 2018 07:05:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:07 +0100
Message-Id: <1540217112-24479-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 08/13] libx11: update to 1.6.7 and sytle cleanup
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:33 -0000

refresh Fix-hanging-issue-in-_XReply.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libx11/Fix-hanging-issue-in-_XReply.patch      | 28 ++++++++++------------
 .../xorg-lib/{libx11_1.6.6.bb => libx11_1.6.7.bb}  | 10 ++++----
 2 files changed, 19 insertions(+), 19 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.6.bb => libx11_1.6.7.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
index 897882b..2a723b7 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
@@ -17,19 +17,19 @@ https://patchwork.freedesktop.org/patch/171458/
 
 Signed-off-by: Tatu Frisk <tatu.frisk@ge.com>
 Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
+
+[Refreshed for 1.6.7 update]
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
 ---
  src/xcb_io.c | 19 +++++++------------
  1 file changed, 7 insertions(+), 12 deletions(-)
 
-diff --git a/src/xcb_io.c b/src/xcb_io.c
-index 5987329..c64eb04 100644
---- a/src/xcb_io.c
-+++ b/src/xcb_io.c
-@@ -609,22 +609,17 @@ Status _XReply(Display *dpy, xReply *rep, int extra, Bool discard)
- 		 * letting anyone else process this sequence number, we
- 		 * need to process any events that should have come
- 		 * earlier. */
--
+Index: libX11-1.6.7/src/xcb_io.c
+===================================================================
+--- libX11-1.6.7.orig/src/xcb_io.c
++++ libX11-1.6.7/src/xcb_io.c
+@@ -620,18 +620,14 @@ Status _XReply(Display *dpy, xReply *rep
  		if(dpy->xcb->event_owner == XlibOwnsEventQueue)
  		{
  			xcb_generic_reply_t *event;
@@ -42,6 +42,9 @@ index 5987329..c64eb04 100644
 -			while(dpy->xcb->event_waiter)
 -			{ /* need braces around ConditionWait */
 -				ConditionWait(dpy, dpy->xcb->event_notify);
+-			}
+-			while((event = poll_for_event(dpy, True)))
+-				handle_response(dpy, event, True);
 +
 +			/* Assume event queue is empty if another thread is blocking
 +			 * waiting for event. */
@@ -49,12 +52,7 @@ index 5987329..c64eb04 100644
 +			{
 +				while((event = poll_for_response(dpy)))
 +					handle_response(dpy, event, True);
- 			}
--			while((event = poll_for_event(dpy)))
--				handle_response(dpy, event, True);
++                        }
  		}
  
  		req->reply_waiter = 0;
--- 
-2.10.1
-
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.6.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-lib/libx11_1.6.6.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
index 0fee1a9..f0f1bfd 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
@@ -1,14 +1,16 @@
 require libx11.inc
-inherit gettext
 
-BBCLASSEXTEND = "native nativesdk"
+SRC_URI[md5sum] = "034fdd6cc5393974d88aec6f5bc96162"
+SRC_URI[sha256sum] = "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
 
 SRC_URI += "file://disable_tests.patch \
             file://Fix-hanging-issue-in-_XReply.patch \
            "
+
+inherit gettext
+
 do_configure_append () {
     sed -i -e "/X11_CFLAGS/d" ${B}/src/util/Makefile
 }
 
-SRC_URI[md5sum] = "6b0f83e851b3b469dd660f3a95ac3e42"
-SRC_URI[sha256sum] = "65fe181d40ec77f45417710c6a67431814ab252d21c2e85c75dd1ed568af414f"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


