Return-Path: <crg7475@mailbox.org>
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
	by mail.openembedded.org (Postfix) with ESMTP id AA0727C7A9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 11:06:51 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx1.mailbox.org (Postfix) with ESMTPS id 9A5874FCEB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1558868808; bh=uSqdY/wxkizouEh
	ChjIXSXCayM3VfQLyhPAZBWGTCSg=; b=GHDL12r49brhLmf6vcdbK9Wd6lKnxbP
	RXG5fQ0ksnta+MOx1cfoqINsaK6TNoJ1hXMb3Vg0rZFoCqkfp1wUxuIeyRkNPVcl
	J0FtZTkGZPetBwWPWvRm5dZAb89/8UpFmV6OMUhZ2V2qv+tJwesS8yuMfjlwG1K5
	Ur4OtKJUEQgx3z9lTWIc425kThrz8w5JEj5T6YUc8IP9kbO9ypQ9JzH4Jlv+nHlo
	u3Gifr9M1dTJf/+GpGn386AdBNInifGEQQzzFNqywRtuUGlI4UDJ2sOVYQ+Y4fA7
	aLUA0OIHLo/RK9RmCOQLUtvaESDj3PWu0/XUkjGMoJidCxQ51QlCtWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1558868812; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=vFa14X6qmT1wZKHwrrkyByaj4cHSVybC01jrClqfHK8=;
	b=KTL0nr6oQIjsL9/x7f0NGGM8zl9tr4zjF9eK8e/67CtsGGP2O3jNpl9FkVppBih/1jhQSK
	zLyWnXBYk80rfZOt3gGKDNqAx5ZGxizwkfwj5NtsT1kwV0NWX98wFCOofgEi+DYolsZmZF
	T1Ag+LadL9j/hhlXlzPC8hOhYkIoY1x3JpS+D4pZ4fyLMRCA4kTIdsjZHthaiSkP1pJajt
	sIJEixLs3mTyUrB9f3cN7Mj5b9BrvulzOos1PPbRMGZn1CFT/WSZ7u4EzXZkXSpFDjkVug
	j45gqtm7kNL/FiFadEICDrABBP5nHC9wEDgw8taMyGuka9cnZp86bOLzmtLFgA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
	[80.241.56.123]) (amavisd-new, port 10030) with ESMTP id OmW6NdH3LXCv
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:48 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2019 13:06:36 +0200
Message-Id: <20190526110642.5341-5-crg7475@mailbox.org>
In-Reply-To: <20190526110642.5341-1-crg7475@mailbox.org>
References: <20190526110642.5341-1-crg7475@mailbox.org>
Subject: [PATCH 05/11] gstreamer1.0-plugins-ugly: upgrade to version 1.16.0
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
X-List-Received-Date: Sun, 26 May 2019 11:06:51 -0000

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...ins-ugly_1.14.4.bb => gstreamer1.0-plugins-ugly_1.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.14.4.bb => gstreamer1.0-plugins-ugly_1.16.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
index 168e64d84c..11a0e790ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
             http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
-SRC_URI[md5sum] = "90768a0074db071175ce980064d9a1ac"
-SRC_URI[sha256sum] = "ac02d837f166c35ff6ce0738e281680d0b90052cfb1f0255dcf6aaca5f0f6d23"
+SRC_URI[md5sum] = "1ec343c58d4b17d682f7befa8453c11c"
+SRC_URI[sha256sum] = "e30964c5f031c32289e0b25e176c3c95a5737f2052dfc81d0f7427ef0233a4c2"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.17.1


