Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 01EF87F73D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id C9BA8A356C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756379; bh=4iC82nJTVXcRYhu
	S2gCNBABKFwfZ+IqMdrHRBuJ3y08=; b=k1GuLRXRjCbBEuT+iXz5NEeUhXXSX+l
	BomN5ORHWhl6slzJybpG80OyduvnCMejsIocZkVHTNaZGudyrIKsc3P6mTDxcWsh
	i1YNmQQdCa9oYO7/8iKQzl/41LAeyFTjIYoLOTq7m+d99sKkDTuYfSFxRYQAT0TA
	rWyZ6aVZQbeYJq0keZXJgdox5sqFyZrMb2T6c/MlBFFunySxr2SQoqoxU0CoWxR1
	duBh5X0P7Xz0R33+DL7cw5/XyRw9nCs1u2KUUGknPYoxrGDNFzovoaLcTxhjyNWu
	tTZZ/Hk3rNId/vsDrXnNWLm7i/F3ny6HHnfpl8JdcrrueZLMNN+Za/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=jiGnJzRMj5ifvCqqCe0G/Ahtkp08wUKZbE5bQXn2+JY=;
	b=H3q0abZtLrmyfXVDrklP8H0atfZpefA0mPLKFVtupZpLqx1rMcKDuDKrkA9qQxMIP2YpFj
	LbUoWubXTVT3QPpKVPbblLpCa8CczJA1H2mf3qnkoQ1WE93UsS0eOB/xvNVbWyRQOn0tDC
	mnV9IKMR+MZ2ZBgkX7wfBr1Kj1b5G0hesqKWkHxTC/ctj4ZbRg3pZFuznwZhjNGqUPoKI5
	xH9b3/kyPR/96+dWRrtP8e+UsU9rXF6G2L4b1relA73WyCsXbC4qCRe1a+cngFO2q9xkGc
	E7j48hcM3Renv5WzUKZxAMYTsJC/Ueev9fl8pyyJnuev2L6wqgbrQQLRJi2NyA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030) with ESMTP id MJY3c7L9kclW
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:39 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:22 +0200
Message-Id: <20191022145927.1241-7-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 07/12] gstreamer1.0-vaapi: upgrade to version 1.16.1
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
X-List-Received-Date: Tue, 22 Oct 2019 15:06:27 -0000

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...reamer1.0-vaapi_1.16.0.bb => gstreamer1.0-vaapi_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.0.bb => gstreamer1.0-vaapi_1.16.1.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
index e5dfb61241..61cf705fd8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
 
-SRC_URI[md5sum] = "8c3f9ee3e47cbdb75a94f7183460b721"
-SRC_URI[sha256sum] = "4e7fce626ee0590dca74b5a8341d25bac76307945131a970b414fc5895f5171f"
+SRC_URI[md5sum] = "15b08f76777359d87b0b4a561db05f1f"
+SRC_URI[sha256sum] = "cb570f6f1e78cb364fbe3c4fb8751824ee9db0c942ba61b62380b9b5abb7603a"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.17.1


