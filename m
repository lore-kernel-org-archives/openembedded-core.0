Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 05AF57F745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id 03002A345A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756378; bh=SF12jUJyOuR/l/u
	BuSTrFA7TFOBhBixkyMdtpMj6FKo=; b=LK/dxPhYWh3ddyx+EJuwJPqB8eZ59ws
	/ylInZu77aw785O2zWczRdn6rVCC4P4T78RkULlDoLHhTVs/agNqZztmUoXYeC06
	H6tLxKnctGVQzSZ6wUgPUW6NgmEakl71K4s8YfYXdf9BWrqhNfjSyYUJbAMGxmRz
	dD8wFBaFxSGe9so3PdWJJHhblCcU/rdmQYg8heS4Rk5zYGZGcbxbmwJzyeU0/KV0
	qIlp7taWGZXSamtrXpCeD/LNvVDGArQmdqKOlMGlUSvBFEE2W0NF36mu2YKFOYVG
	Oz8jteCZdoJRSUjdzMbSHjDBfRfCwvWodjmP7t69hSILCM9U1dYfVSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=OQuckCwoExf8zb/nwfzX6BOZC8b8FsWtNR0wtxNxOTk=;
	b=vzoOYd1si/QC+FQiI5ial6M4b5WcV5eybgQXE0GqmQF0x+1CoKYu79n1HHamG4lky0senq
	fpPcB7v1iAJswdrQTnp6r6Une/cbFiAaFKT/KurTP5KgNMp63zUJtUdzB55k+rclMVgAki
	0wiyHHf9j+PFjQXk2LqZm2x9Ea2eOWvqT3l3AdcMRfqJuNP5KSWd69KtU4K1Ma8eIltKPz
	7hKCDvS/kWEzM9z8zg6RN8Z8SLfup3Z8HTyETiExL7i163EOHxVpWI7ATBxgbsxIkDfzOx
	WUKk+xDpSym/cWaeJU/otWaisRbE4Nouk6uq82v0I1jjR3Y89WyImnW/U7lzVQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030) with ESMTP id dvY1MN3vIfYY
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:38 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:19 +0200
Message-Id: <20191022145927.1241-4-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 04/12] gstreamer1.0-plugins-bad: upgrade to version 1.16.1
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
 ...ugins-bad_1.16.0.bb => gstreamer1.0-plugins-bad_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.0.bb => gstreamer1.0-plugins-bad_1.16.1.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
index f9289e92d2..4330c797a2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
@@ -8,8 +8,8 @@ SRC_URI = " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "e9e562d86c1527c44d904500dd35e326"
-SRC_URI[sha256sum] = "22139de35626ada6090bdfa3423b27b7fc15a0198331d25c95e6b12cb1072b05"
+SRC_URI[md5sum] = "24d4d30ecc67d5cbc77c0475bcea1210"
+SRC_URI[sha256sum] = "56481c95339b8985af13bac19b18bc8da7118c2a7d9440ed70e7dcd799c2adb5"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.17.1


