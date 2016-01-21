Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 725B275D4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:39 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id x140so1562410oif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DCPHk0cfhiq23pOH36iEBPvxwZIUoFmebYA19OldaP4=;
	b=q0400mUGp4XbXvWmukU2pIUkfS0Oa9IM1CLqZD75c9JhTxYpsDhqxW++L1GzoW0bIx
	lMgGnN5teE5zpSBlgHlXYgff+aRkivGY/4e80TXCgbkTo40yFZm2ztKlju06u+WuEhLY
	9PaHhPT1AvJ1hZFZdh4qXBOaS8oEe9Qf2pagbRm4Cqsek9WPAUXEABqdt1e4/0ZaEyBx
	PWfrfYgh0MV21QcH1I/vwzQ6XyBK6hrSnc1GY0GOGngvTrijY8M3VG52RIR9CrwISC3X
	+LHHFVZP67NQ/j1kNiKTMqopPz8wp0D/SYBH7jeFF7uRIScKlf/Z4c2/DcunY/H3RFFf
	QcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DCPHk0cfhiq23pOH36iEBPvxwZIUoFmebYA19OldaP4=;
	b=iz5KXT1PHO5EFLlTMYMPh37Rbcts6+EWbyrdxkPjMKgwpjSJJ8zMMJeeWvFrFbEbhj
	XkoVbPtuDfSz7DHwTtNao45jqYY7N2NVcp9b5+ESMd6cs4jyKFvgBow/Z3sKxHf0LsTf
	XqS/58BbPXIpFVsQOg9OEnwO+rpvPU/XzIH2wzRyiEj1EpzVik0APU4/fN7VQSQyTzHP
	FJKYf3PCmFaFANKRk8nH1jFFb13X5QGs9cPQDoLLtixa5KfK23bfnrwFo5sRjV6YABT4
	PIT//5eFRxkwlmb99a/USmcBfJQ0vpYMywyPCs+kdvDRU8lGSINs6wtAKreVL+LR4dHa
	accA==
X-Gm-Message-State: AG10YOScmzXiQoXERS7fDZwiNrH+wCZL8YXDd/EZXKX7YyVcmk7a8vcyxkggB9aq7xu+Zw==
X-Received: by 10.202.218.138 with SMTP id r132mr14712729oig.55.1453354660057; 
	Wed, 20 Jan 2016 21:37:40 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:39 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:36 -0800
Message-Id: <1453354610-19218-19-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 18/32] gstreamer1.0-plugins.inc: drop obsolete lib-link.m4 workaround
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:39 -0000

There is no lib-link.m4 in any of the gst-plugins-XXX sources (and
there hasn't been for a long time). Drop the obsolete workaround.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index a552653..f179ce9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -54,10 +54,3 @@ def get_gst_srcuri(d):
     else:
         s = "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv)
     return s
-
-delete_liblink_m4_file() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm "${S}/m4/lib-link.m4" || true
-}
-
-do_configure[prefuncs] += " delete_liblink_m4_file "
-- 
1.9.1


