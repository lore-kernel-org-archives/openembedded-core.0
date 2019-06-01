Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4695B7E63C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 10:25:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c6so4474399wml.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4OWEPhxo7Pa1PL6D2u0KK/QTz65jQEhhoqT2vUUA9AY=;
	b=WJy4g+4C4/Qi18S/OAx88HNIe0lHMTzaLmXxdE6j9vDaGxljBLC7aSOI/rKvBCQgbN
	ny1xXdh9s+aeOetHg6Z8I47z0v8TKK0Bu9low7zBsRQTP10rymbaYTFSwr+tCbVB0ya3
	ckhAvItdYARtdZfwpVap4hbxD1Hp3mqUuzz0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4OWEPhxo7Pa1PL6D2u0KK/QTz65jQEhhoqT2vUUA9AY=;
	b=GMW6gJfV/1VHsCptbJhMoBLfBhVLWe91QcrjQ7hn+N5RBEtovsEe5WO3u21EsipiAk
	dIMnW8zk0ocnhf6yRUtX1XmKm+AniA7dLsC9Fxlp3yg8zO0OjWOgagAhVvhtp/vdAdeN
	1Posn1B7wLE+GBz9vhY51VX8ngSCSH1YA6jD7u6elB9yYLifb9Zp5Z4JBuSqZljA3Qcd
	fHdi5ZOEbzVkRCIHGv1vi+0MIABiypHjhf63f7bJXNruVkMzCBkD7OBlmi8B67oPHN4u
	EQYiqmGdPwIXiOQstfN2cufo5Lj0MEjYzSt77S9Vq32JHXUQ0I7t/gj9nYbSS3J2Q4Kc
	Jv8w==
X-Gm-Message-State: APjAAAVIq+bwtQX0XRMS4/AxVsPHv4sbofAB8uabNZ4ZZo4tkKpxBVky
	xjSIWYFBYbkDzUnBt4p2N5Ta7ZYWftg=
X-Google-Smtp-Source: APXvYqzlGkKZgjzDYiop91ZRJFtuu3gky51OG82t1tRaDNenFE60Dc59FkZHbSsZXCW6anSU7sWDuw==
X-Received: by 2002:a7b:cb06:: with SMTP id u6mr8235756wmj.170.1559384735988; 
	Sat, 01 Jun 2019 03:25:35 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a124sm11912234wmh.3.2019.06.01.03.25.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 03:25:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 11:25:28 +0100
Message-Id: <20190601102530.5995-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
References: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 6/8] libconvert-aan1-perl: Fix module and ptest dependencies
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
X-List-Received-Date: Sat, 01 Jun 2019 10:25:35 -0000
Content-Transfer-Encoding: 8bit

This fixes runtime errors when running the ptest in a minimal image.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
index 644d8208ecd..9f992d3e83f 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
@@ -14,4 +14,7 @@ inherit cpan ptest-perl
 
 EXTRA_PERLFLAGS = "-I ${PERLHOSTLIB}"
 
+RDEPENDS_${PN} += "perl-module-exporter perl-module-constant perl-module-encode perl-module-encode-encoding perl-module-utf8 perl-module-socket perl-module-time-local perl-module-posix"
+RDEPENDS_${PN}-ptest += "perl-module-math-bigint perl-module-io-socket perl-module-data-dumper perl-module-math-bigint-calc"
+
 BBCLASSEXTEND = "native"
-- 
2.20.1


