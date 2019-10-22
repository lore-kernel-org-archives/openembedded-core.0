Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 172CB7F731
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id 62F5CA35A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756379; bh=7KMIahJIl426viY
	c+l+H1hyk9hJoPFkiiTTD3+qopUo=; b=YEVHGZrpptHasa2XsUiWzq2GOSzU3Me
	HHZ9Q7IyyqUQo1jb2HR4+6MRJoOjR88g0ePpfJ6emlIBFpDpxENUaGA2P28INw23
	jYykgpR5zIdvUJ8jGfuEYYr3jTsbSVlJ3blN1WjlboCSiwEofU6A4DFsM7hpzOBr
	gTYaTcEsTLPGr4r2o5/2pyiZn1zaCPLnXJkPPqFc8xtdRGMSNRpbg/Zw8woGQZnq
	p0M4dyFwLbNMRdz1oQa0KMyyG514ojxSDZlEDJBlWG3Y4atXoblI0nMQU48DTzXF
	FzD9V1b5CzWHZkPLmB3usTXK0IshZaQguQ3lD19QI9X7P6r+EczOo1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=EuK7HS7lSsOGL5nj2fNjMa0cAnzkGrqVS4CycDEo6AM=;
	b=urOYQDXXAjTEQ3vDwKjfrpPVV2EbvVeNqIjUi2DeTd8j1IWtxkC6CMzoIDNXwB7g+BPp0y
	voVVnSDo5yhDzVxiJZGq9KtVi/Ln25IlFOhEQwLu4KTQnOlpI2xBZgRURHfsQokKSstmJq
	KEXPDH7TLqi3yx0sktDyq1cnmlskKhA9T/qeoeGCeCd4L88HLw1zOlZOkd4tWiS6axEz4q
	WRWY3FTHfmc4z1Yf43545f3RZIRudeQhsF8i0IXi6M2hH8QyhkCOc0Me1gNWlnbp0xLTeZ
	BX0Ln+Oc3Czptm9zMhYpaduD5PR32HYBYTIDkNt4YMOW9q1KxTIllWRBrAcB+g==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030) with ESMTP id icYozZDIeKCT
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:39 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:24 +0200
Message-Id: <20191022145927.1241-9-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 09/12] gstreamer1.0-python: upgrade to version 1.16.1
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
 ...amer1.0-python_1.16.0.bb => gstreamer1.0-python_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.0.bb => gstreamer1.0-python_1.16.1.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
index 0f3aac1906..52ed150482 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
@@ -6,8 +6,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "877b2ed2aaffdb62e63f38ea9469b70f"
-SRC_URI[sha256sum] = "55dc7aaed1855565f9b9ef842d93e93bfc5cb2b376faef6af5b463e1774e2d38"
+SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
+SRC_URI[sha256sum] = "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.17.1


