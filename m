Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A13B7D42D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 20:55:52 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id x132so1944462lfd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 13:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RaveMAlw8hfurblxUX4osqdmVgEn1D+SAhZuUgRIK6U=;
	b=OU2hih3WllwA+a5tNss7Rf6EPVbMpRazE4NKbBxU+2r7FseC5mlLU6Lal7DViaTGkY
	SfaRT9x9jbHTCOLvDGBjbeAhWqj2R6EIFdsAsR2Sl1NMtuTt3ptMBf7cHt8dixca/ozm
	VJ60JMZ35qzJnwfbK0FzDYxC9NJ/z+jzoXMvUQC5qGZhAY5H2HwwxTZOU/nbugkcw5H5
	onVNEoZ04vuT76OeIpfrH4hMFJyViQqe0VhokwcztT4ztZSXM04meWEzBKZ2sAAMRbgk
	h1CKaNg+bncwjIysrqxkyo4FUjnz1x8RqiiQBWlsBEqSdgcqu3/LxijOUA5uCJQTAzD2
	VtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RaveMAlw8hfurblxUX4osqdmVgEn1D+SAhZuUgRIK6U=;
	b=p+SYq6ZefzeMl/CFOxrpT3omNRynQ9tws8d2xBsMkeYhTa5mi2C/kO34c9wP7WQPsk
	5goNrxhH4yMYX8EFX85evNcBfobK2hD+0RBmvqQu6vU4zs1gAln7gCpuJlP46tiKOh0P
	tyUVAdFafP6n7Z+BQUTcURgpfi1/yHiDoasiyWqlvbPC6G7PAriFpIGd69CLYEvfhI3J
	jdthwpUoCru6WXMEEmXBNwHlhhklxx/ZJCHnfR4dRCyFw1xUR6v4xAx3pXPxJq76x/Td
	TKjg+EdiXqfw743YyCDtI2UsvREmtN6FW0snPFoRuNE/7QOfiYDntZ+aN32QI5LUsnjh
	WFJA==
X-Gm-Message-State: APjAAAXsW8rKM1EE2t5WFqw6bgdraLHgldYkpg5QKluFLwI/mmBgKoDF
	gJs695crQlPWE5vpOLeyz65OfpqEok8=
X-Google-Smtp-Source: APXvYqx9n4DpEEDtzqOYqCd+llb+xNkxtWcLDlyKAzZvk+bsA/FQs5eLhqVG+FwTwFggCLOlBg7uAg==
X-Received: by 2002:ac2:560b:: with SMTP id v11mr295696lfd.151.1557262552674; 
	Tue, 07 May 2019 13:55:52 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id m29sm805248lfj.43.2019.05.07.13.55.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 13:55:52 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 22:55:50 +0200
Message-Id: <20190507205550.24763-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] msmtp: update to 1.8.4
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
X-List-Received-Date: Tue, 07 May 2019 20:55:52 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../msmtp/{msmtp_1.8.3.bb => msmtp_1.8.4.bb}              | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.3.bb => msmtp_1.8.4.bb} (84%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.3.bb b/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
similarity index 84%
rename from meta/recipes-extended/msmtp/msmtp_1.8.3.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.4.bb
index 9f28d6ac25..888c1bbb5a 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.3.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
@@ -6,15 +6,13 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 DEPENDS = "zlib gnutls"
 
-#COPYING or Licence
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
-SRC_URI[md5sum] = "0c0be51e6872e818f78bd6924636327b"
-SRC_URI[sha256sum] = "3cb2eefd33d048f0f82de100ef39a494e44fd1485e376ead31f733d2f36b92b4"
+SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
+SRC_URI[md5sum] = "abfabb92f0461137f3c09cd16d98fc9b"
+SRC_URI[sha256sum] = "e5dd7fe95bc8e2f5eea3e4894ec9628252f30bd700a7fd1a568b10efa91129f7"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.17.1


