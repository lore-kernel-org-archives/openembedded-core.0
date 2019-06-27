Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB2307E9A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:44:17 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 136so1899394lfa.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=/6J9ziRnKlaKqLi1/GOiqKEfycfk0bSF9h/t6o8Wjt4=;
	b=WkCLaMD8If0CiMLIWYgEM9nkeT5N9Wl6waMNqzASLKoePQ6WuLm4nVEVvh43/q5dB+
	MNBxXL8JLUlJOPm/cK7TH5cbRiXONr0qZR0rG14xP4uOBn4yrAgDn8a2IGhWB6BHCiax
	YKPfbEh7wQGE6w72E9SDtrQDoBc6GkEJhbTt3G/d6ie7cxW63giYBfNBZqv/C1DCz2xr
	jOBsjGXWccwySBwCLQNOCk1RZBr0hWMB6TYUZFUva+KaCK1/1uP33EVjVY1H2gqAiaL5
	iAFlxOVDEpF/PQlU5TkhClM5eudzDKoxVohJiAD50yWaOQoxmldkVp4Y72JpiHEXQfz1
	i9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/6J9ziRnKlaKqLi1/GOiqKEfycfk0bSF9h/t6o8Wjt4=;
	b=DkT8RAmDOlTcyEldKBiKIsVSbRMTSzEbyODo2vgHsPfdlh7lB4UXlf7wHfMiIMHmcn
	sBS/GGTunikMfjNUqiMTixPai08Lg0E164liwW6f54dMHoL1d+M5mW13Z78N8pLO/Zi9
	a1thd0j963LA9xcVWZSPZaeGZvHj7dPTzAV/6U/NzrrYYVXc+irHt0B+N1ym7dfEfl5F
	67DO07IEIDnml1ffyAzCaJGHi8NR5FCSdDtBqfDR+wvliiMwpZnGI0jynhdEF2SwXDOf
	QL/Twz3cgdvwDg+VJht8ThSpTLUTqqTF3dAYm522Tfn1TF2iyn/FxbGlP8Bw2Q2DipXD
	+4zQ==
X-Gm-Message-State: APjAAAURoUcdPw+/gNC+yUWADj8RuyLFfwDFRWyeVswRL85Pz3/8nEQ1
	MRJDGXoCvCPg7RwLasOAKih4ybEWOoc=
X-Google-Smtp-Source: APXvYqzaAwftkMkkhf+6b6TDlcn5dc4uN5shTwHoSIZu4lqo2WhZYFOc7L9RVTOUAfW6bB3Q7SZtTQ==
X-Received: by 2002:ac2:5b05:: with SMTP id v5mr2446768lfn.38.1561650257998;
	Thu, 27 Jun 2019 08:44:17 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d2sm451795lfh.1.2019.06.27.08.44.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 08:44:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 17:44:15 +0200
Message-Id: <20190627154415.1924-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] autoconf-archive: update to 2019.01.06
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
X-List-Received-Date: Thu, 27 Jun 2019 15:44:18 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...f-archive_2018.03.13.bb => autoconf-archive_2019.01.06.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2018.03.13.bb => autoconf-archive_2019.01.06.bb} (78%)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
similarity index 78%
rename from meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
rename to meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
index 7d62e52ab8..985a254fcc 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "46b13a5936372297b6d49980327a3c35"
-SRC_URI[sha256sum] = "6175f90d9fa64c4d939bdbb3e8511ae0ee2134863a2c7bf8d9733819efa6e159"
+SRC_URI[md5sum] = "d46413c8b00a125b1529bae385bbec55"
+SRC_URI[sha256sum] = "17195c833098da79de5778ee90948f4c5d90ed1a0cf8391b4ab348e2ec511e3f"
 
 inherit autotools allarch
 
-- 
2.17.1


