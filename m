Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 3C7307F736
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:26 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id BA258A35EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756380; bh=No8vmjOwWniOTtG
	kR/Q8vFwAsyUUHgMx0kc6s0DhkgA=; b=ndZGeNSMvSQ59tBa8+PlXUPX7Rl0ZFz
	ieOLIl2n/t/wlnhQuclUH7+PRI1mQBpvd+E8wkkjBcWy/lRBKwK+Ob91RHNwaCAU
	w4+TGo+VdTxTt8b8pxjbPqAocXmtOuI7wBImEf5/we80XBdEhkHJz/Y159cmqBl7
	DI3YuP71TyaxuKuXGuOPx5vu/iLuF58osw4s1aw1KcXeUFpU2r/2n4WHqAXwgPBM
	qtQvVF/2VmqGEYOghx3tvIi6xLKJcqRYYv1ZcXvfd0MlbvS0B19FLxNaTY65CEyU
	NhD5yqIZb5JMyGywx1IVggQS6RWhLt8lEp11UL3UYWvKbYCn7iywQYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=cJBJZ0FRYOj77nzD3CJjhg70bnxZMkX4fGEdzKmmhQw=;
	b=d1p3zi9Q+yigPu6cTQIXyFWb8RU9hxbKuWOOCiuii5EaozJeyuphQrjPV55ovvwOvQH2V7
	1IXziDOuwI0LS+gKaFvUgsRUpvNZ4mPLz1fPtyEDmYAC6hOtUYIQCmQZymI4ayGXzOOTZl
	oFTLQQrAUdfA1kc6jamaxR1MNVmoER93uw0BbXASKf58YdReDNHlnnQTJQrf1AcZyDCLpD
	kl7h/AZEiw1sEOF1KfFnRSiDbJcgI8cLrc7QrY96v0uKZ0DQfUQz2ApGe7mxfLyw1yyOgz
	lxWa9J7cQ/krxqlpn/Q1XE5dZioaeiC0K9nAD1tIhn//BMcGYq5lTpzgLl0r6A==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id BNSy_tkjIMCM
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:40 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:26 +0200
Message-Id: <20191022145927.1241-11-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 11/12] gst-validate: upgrade to version 1.16.1
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
X-List-Received-Date: Tue, 22 Oct 2019 15:06:26 -0000

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../{gst-validate_1.16.0.bb => gst-validate_1.16.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.0.bb => gst-validate_1.16.1.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
index 1f4370619c..7d602eabc6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "c5c57f3325a2e62aae4a8ec4931f7711"
-SRC_URI[sha256sum] = "9331ae48a173a048243539730cc7a88607777762dea4aebbc3ab55981e68d6c9"
+SRC_URI[md5sum] = "793e75f4717f718ad204c554d577b160"
+SRC_URI[sha256sum] = "7f079b9b2a127604b98e297037dc8847ef50f4ce2b508aa2df0cac5b77562899"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.17.1


