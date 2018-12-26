Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6BADD6BB13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 20:10:23 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id m1so7903041pgq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 12:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=avKpXa98tBJS24yJpBOzjoYabvIDgSkVh9yn92qS6ls=;
	b=DwwMUuI1lcD2ojAoyyU2dgF4Aqgmf81NnIcOQlIxTHIw+R3HVXDv2g7QmHU+Fqm/ZZ
	euNRdIoOZEC0Qp0uTUtRpIVx/SBMMtejHzkaxExcd4sJUz5cBlLP4ge6caRW/AAfC3cc
	lBsZkon84fIJVej2CvN69W9i7AzIPSCwyZywN9N+7ueDMAhnjy7Erhc/SxYAzPlpTZK1
	ntqt39qYEzQIvokoe+IBtNFdAoati1qIy1hm95UB7QW42UrxsW+FuKS4w+yr5CH6au3n
	IAAIvD5ykH0Ue9vUViRiJ3w/u72TT3gayRCSkgvVeZvoinrzKazs7zsRytSm/pR6JWvz
	5Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=avKpXa98tBJS24yJpBOzjoYabvIDgSkVh9yn92qS6ls=;
	b=UqZzDnrzskJja+z4bhp/juwszBUa1U3i6fmEHgmfB1loH+4zJJKOhC0NTZfVwMo1o1
	24IHT2R/Oe/3QiGejNc+W2AzEetmvHKfm8a9JK6ng5Joky2o/bQ2uJTHGsHxkdTtug0f
	47NAgq5X6HlVdIQXQjA0XWVS6B4dl1dmPp9mVsAzhWtTDJL9mtWwb4Pft9HlbXfI7EE7
	KK6kCQGZ/FPLfjYwkb7LHDAMsIeUGrUwWaF4leQzlq3CRF65q49q1j5pBV8bym2vJojH
	kRRY270UB23ZpkM5bfXcIWhWE9j5s2iwkpPgAqPs/Ui4JZiJq42KQkEL+9uo0liF8oCZ
	gkQg==
X-Gm-Message-State: AJcUukf4vFBVPEvAhZcpcuJfQXRZGBAjF5/FXjEzVUkZcjbmVeE3b9Ft
	cyJMAldm07epLotV08ua1BL7MiO3BEg=
X-Google-Smtp-Source: ALg8bN4yZ5YKlTGHJnJC4VFhxveuNuNAvn3ipD42ABO3pwWKTC+MJXfGxh+nAqPP1kJhPEt6xQw3yw==
X-Received: by 2002:a63:4384:: with SMTP id
	q126mr19975517pga.160.1545855024209; 
	Wed, 26 Dec 2018 12:10:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	l3sm60029493pga.92.2018.12.26.12.10.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 12:10:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2018 12:09:48 -0800
Message-Id: <20181226200954.5267-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181226200954.5267-1-raj.khem@gmail.com>
References: <20181226200954.5267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] nfs-utils: Disable format-overflow as Werror
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
X-List-Received-Date: Wed, 26 Dec 2018 20:10:23 -0000
Content-Transfer-Encoding: 8bit

These warnings are intricate and we can ignore that for now as they are
being found by gcc 9, eventually this should be not needed when code
upstream is fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
index 6be2aab47c..63aa6add5a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
@@ -64,6 +64,8 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --with-statdpath=/var/lib/nfs/statd \
                "
 
+CFLAGS += "-Wno-error=format-overflow"
+
 PACKAGECONFIG ??= "tcp-wrappers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
-- 
2.20.1


