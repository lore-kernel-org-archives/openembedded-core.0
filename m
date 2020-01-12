Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2777FDAD
	for <openembedded-core@openembedded.org>;
	Sun, 12 Jan 2020 06:15:01 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id g9so322059plq.1
	for <openembedded-core@openembedded.org>;
	Sat, 11 Jan 2020 22:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1uv0pRZRRzGkLeLmRBRVSgzmq0HSvsM34XHFcu2bJOg=;
	b=eQB6Lg0H16pfxC6zVkAKFUosRJCI970/nOheL54XfcWFRbfT7ck1ClTIrRp2duS06t
	XL9h9l5PjVHaAnbWPRc4GGZEhgawRTtZqfOdXhERfTeE5IJYyXlkoGyI1DgeRLKk41q2
	RY5NO0suIkrfQJ6Krw2aXXqlL7v9z/a94/1u/2gagRlv803jYKdFW9gXga91aBxqu1xk
	jClDX/BGVzuzAwk3pkT8mzl9v8zyoC38CtWyDSZPTcEcuT8AXhR0qodA46ehZ4EAI34+
	9k28VIQtWGGEnSrD3xErJPFn/I/SOQJ8f0m/kJ0oF7iAauq5atlCW0gXndAoiUX3zJcK
	xGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1uv0pRZRRzGkLeLmRBRVSgzmq0HSvsM34XHFcu2bJOg=;
	b=uckkFaT1l09bUEp0fB7FAPYG38JTj2H2bIzqFVvxvqFuu2lEUjnT5tCbN4Ar5W3u3v
	PvsvTG2vgXq0UPMwp1p7nvQ9MlcwqDg/2Kup5XgM8LSwKewqNnRyRbwJ499DwjPNE/5/
	ewbUxmwBYNxl3M/Y7m97J9/RxQzR3HwUqGNS+TzJfubpxbCrcSBhSx0I7y9lZBff5Kjh
	xczlHplzhayVJwxhBPiqgnOWZsll3CRfHuw2PsnOdw/jZawVqcJZRgSFpVCPij0teLKC
	s5Zv7xh0J0SeKRphF83HVQ4RQgDTZmcEJ0r0MFSaiRejXZmw/+mur8Bi8Q/pxPU1/qtl
	EnRQ==
X-Gm-Message-State: APjAAAX5o5slq0uYlG/Di08/EzZ0THiABghILb8TTg8OpGh4iQEzAKFG
	geiYY9KUUnEAkltBGS9o5Cp/5JUv
X-Google-Smtp-Source: APXvYqwEEaizLux1rvjeCqkU3He7XRDFFlUVF6ibTb+ytfBV4lBEjhgGPbUTuMJT4rgwsixdmO4fTw==
X-Received: by 2002:a17:902:fe90:: with SMTP id
	x16mr7713160plm.31.1578809702565; 
	Sat, 11 Jan 2020 22:15:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:3849:7200:d754:59fc])
	by smtp.gmail.com with ESMTPSA id g8sm8978559pfh.43.2020.01.11.22.15.01
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 22:15:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sat, 11 Jan 2020 22:14:57 -0800
Message-Id: <20200112061457.10741-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200112061457.10741-1-akuster808@gmail.com>
References: <20200112061457.10741-1-akuster808@gmail.com>
Subject: [warrir][PATCH 4/4] stress: update SRC_URI
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
X-List-Received-Date: Sun, 12 Jan 2020 06:15:01 -0000

Fixes:
WARNING: stress-1.0.4-r0 do_fetch: Failed to fetch URL http://people.seas.harvard.edu/~apw/stress/stress-1.0.4.tar.gz, attempting MIRRORS if available

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/stress/stress_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress/stress_1.0.4.bb b/meta/recipes-extended/stress/stress_1.0.4.bb
index e9179d3e19..42046d5bf4 100644
--- a/meta/recipes-extended/stress/stress_1.0.4.bb
+++ b/meta/recipes-extended/stress/stress_1.0.4.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://people.seas.harvard.edu/~apw/${BPN}/${BP}.tar.gz \
+SRC_URI = "https://fossies.org/linux/privat/${BP}.tar.gz \
            file://texinfo.patch \
            "
 
-- 
2.17.1


