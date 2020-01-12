Return-Path: <crg7475@mailbox.org>
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	by mail.openembedded.org (Postfix) with ESMTP id 736637FA15
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:00:19 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 47wddw08wwzQl94
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1578837618; bh=6j86naM9jIRjREz
	2YBy7wmKAfPmOEYHBaA5I0U9CNsY=; b=YynVlv+bO/stDzgOXcjLdy+8mVBriY8
	F/Oo7rzxgeGZ62i/PeIhMN1URWHj9y/u0w95huzi1YtxVaC78FCDGh40khLcjvNT
	KmV3bQ7GQ37rwkQ6rN/tmRIZyVskACoBqcPO+QC6w67IGmlZegN8WVCHriMGZazD
	DobM5bSOo2kb02+CI2I9z7xUBCgrEboRiSA1zOotvcMy3bVz9y6hFM5ttD7lM8dY
	xle2tG2r20+C9unxe2HklQm6ewqVArG8s/YiM7Lcs1VhAncSMuugDL5JblZ5HYUg
	VoM/++HAHe1RxL7V/83IRhUjuI0sqMlotil5dzfaDUhmvxOySNn4oPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578837619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=9P5fmDjRdSA8Y/WQxNL93mVeRPLba35ddBM8Hrs+aRw=;
	b=HtXH/XyaKfbeCzUqVqauhSS86TZSCO1Oo5Pljp25B9EUVFPNIwBAyJJaDNBaKjsoIpxfYY
	XAr4JLfWcS8+5nxw1g/8j17WHBHsqF9u/upsJUBedXP48YrFuTe3jurHzsXAOf5WtwhgPy
	UxoceMNu2pYdoHQVbxsbI78bNkCbBnhFNuTWBt8+vFpUTKIsMJKTcksoJ92n4u1Arlyz8b
	cc66WgSW3J8/7uJ3OoSmQiUt+PIGUuUVjOXH8WpZuf+jwqzcEQCST0I9fguqsnjlDJZ7Zu
	xi7xhyWUATYQAgrTgmSBMHmjtdjVNL10CD9n4duQEPQ5e7IxvZ9IFKbmGXX65A==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030) with ESMTP id naWMs0P-bJhB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:18 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:59:53 +0100
Message-Id: <20200112135954.23868-11-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-1-crg7475@mailbox.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
Subject: [PATCH 11/12] gst-validate: Move recipe specific patch to dedicated subdirectory
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
X-List-Received-Date: Sun, 12 Jan 2020 14:00:19 -0000

This does not belong in files/, since that subdirectory is where patches
that aren't recipe specific are located. This patch however is gst-validate
specific.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../0001-connect-has-a-different-signature-on-musl.patch          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{files => gst-validate}/0001-connect-has-a-different-signature-on-musl.patch (100%)

diff --git a/meta/recipes-multimedia/gstreamer/files/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-validate/0001-connect-has-a-different-signature-on-musl.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/files/0001-connect-has-a-different-signature-on-musl.patch
rename to meta/recipes-multimedia/gstreamer/gst-validate/0001-connect-has-a-different-signature-on-musl.patch
-- 
2.17.1


