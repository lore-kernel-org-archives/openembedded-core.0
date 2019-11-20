Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA657CECE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:45:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l1so7016496wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mfGgkeqHqwY9oa4W2/bg8ERwjG2d0Cfw7fXm85fywYw=;
	b=XBFys1VFu8+ruUMUtQPDLtTV4CDGP/IDYax4H2/bNNgRGUSyJjB7obta5nSVnhyzaR
	JLiPO9vJZVaozssPFQgDqmbM62f7lAJPcoqO6MDldIrBlcULERwf9dMsATme01pnbV7c
	x6x/TrcdQo9Doz0+5n0M/5whBSs4S0GGRsLNL7uW27q0X0n+jeeAYBbkFoQL0xNaXkhm
	rKN7BheS8CDjyVmq+8WSk4lrGquQ0DF9y+tW4SCjlBaYkW98jTcx0vltiy6E07BuD9L8
	uvKLLOVhUDSQZ5gg9NjcejJ64kJL29b/wsmjdZb5P9zqvAQawIPVi8mjWFWHq5Y0wEIq
	L09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mfGgkeqHqwY9oa4W2/bg8ERwjG2d0Cfw7fXm85fywYw=;
	b=cvL5JqG2eolJw2JVpZ+1XG8tFvp8bXhskmnfqkHs6X4MUV4X60UxupYjmkFi609zy+
	B+l9SppxYdLdGkEIXycfi7fKRznXZyouuVj7E+d/6F54RpzfaWnNIKhby/82likTuPkA
	9BGGn+kPNUYBtv6vXf/a/UZzX0yTC5iLVU2lnOUH10zbLJXjtcDo96NNdY9UhTwWpU1S
	HcYf6VjzG7XswAgsBeWRdZlRDajVo2u80lxCt669ghG4Veu5dLErZJ9DYgKeC2Y9wqyo
	2BVowIkefYh8kkjqXB9pVwlyL4si8BacNgsyV377Kp3cfmHClaDtjT6o32qUCw4VIngA
	oe9w==
X-Gm-Message-State: APjAAAUeTvgVugTBOSEtq8kwiOGgPTrkIuo43fcXw4mqwcqENFXRak46
	aYicu4DpH8qtX2gulDUrOvBJUTx9
X-Google-Smtp-Source: APXvYqyU/pFOTt/pA5ryp8TSMsMGb2M047PUd6ejBWroBr05CodHarwaSJmO11uwU4ofUdXIPIRayw==
X-Received: by 2002:a1c:7f94:: with SMTP id a142mr3230327wmd.33.1574257526963; 
	Wed, 20 Nov 2019 05:45:26 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o189sm7031771wmo.23.2019.11.20.05.45.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 05:45:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 14:44:55 +0100
Message-Id: <20191120134455.125118-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120134455.125118-1-alex.kanavin@gmail.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/11] systemtap: update to 4.2
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
X-List-Received-Date: Wed, 20 Nov 2019 13:45:27 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index abb2b3743b4..116e83fe0ff 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "57c9aca9f1ff32a6add10e02ecd33b7314fad499"
-PV = "4.1+git${SRCPV}"
+SRCREV = "044a0640985ef007c0b2fb6eaf660d9d51800cda"
+PV = "4.2"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
-- 
2.17.1


