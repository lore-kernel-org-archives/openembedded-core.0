Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD1E61273
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 04:43:09 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t6so4541411plj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 20:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tAdqnAoEkKq+fTS6JXSZZb9EUEQ3PRkqDRqMQqj6NVQ=;
	b=MXc4LVQXvttaDR6Kx7ros8xBk9I/X3XUoNAi/kzRngEUcVeOX7QdBlNMCY+ak9QIkj
	ZV83+52GG/qOTNEiQhqd87n9cqYP2NL52M1HZBxySOxbKL6/0HdLbRwHsISUu9Xj5y+j
	XiKl68LrPCihd7zW09dnQxVbX9X+tUgoPXRzsM7gAS9xYodjgNMOkGXVNFo1vd4QfhVk
	1SuX0Q3ajNyMkZyP+KNacqkZR5SmSBPFD9qAQ3RzRWuXDO21HjCtxU3jT1M8HEcIYQRO
	Y4WO1+qD1wQSQESSX42fI47AIKf4KCiVec1wOevuXSqHceFA7ZlLmnvW/ft3qPOhqjNj
	LqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=tAdqnAoEkKq+fTS6JXSZZb9EUEQ3PRkqDRqMQqj6NVQ=;
	b=b9QawBHgXIr6MDwLHbclllKFMbi4pU667Zgd04ulBwKPeSrPH1T+C8DvtfwHUQK7/a
	LLmwV2AEah66hszjQfMDeeyhI31By5RnA9hzWQ7VznZNtlkDQ81wIKY/A9f+wJsEN3MB
	j3ChoUY1pwVPvloMFqdLmBe4WDIVekM9KxNoirLb5HEDFs7OP3N+ZI9P58b+x0Bn9hr9
	RnpcfBS9OFaKbZRblWl7D67DnzwCyGiVpEXmmQfT+G4h4aTmZdoSofa4KHTwWZkWGntF
	ib+bob62P57Kaaukd/9ks8jcfvdNkhufIr3PvUWZFBN/Atsq82OL+pssEyw3L24283P8
	EBvg==
X-Gm-Message-State: APjAAAUF5JFCycZjSkF7F+MIoSBJQjnC0TBDKmOaCdzBc7pF9F9yvANY
	5vOmp15Hd12tMmX2Di0SThTDmyY6sMYQEQ==
X-Google-Smtp-Source: APXvYqw8Gisy1TmDdW3+pDvow5Pe2QmOva/6ZUzoN1JY2fzAOOhTUqAjEICWV6pJr1x5r9oal+WM9w==
X-Received: by 2002:a17:902:9f88:: with SMTP id
	g8mr6676527plq.100.1581741790133; 
	Fri, 14 Feb 2020 20:43:10 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	d73sm8843394pfd.109.2020.02.14.20.43.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 20:43:09 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 5D3582A04B2; Fri, 14 Feb 2020 20:43:08 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 20:42:53 -0800
Message-Id: <20200215044253.5596-6-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200215044253.5596-1-jpuhlman@mvista.com>
References: <20200215044253.5596-1-jpuhlman@mvista.com>
Subject: [PATCH 6/6] x11perf: make x11perfcomp a mulitlib script
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
X-List-Received-Date: Sat, 15 Feb 2020 04:43:09 -0000

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

x11perfcomp encodes the library paths in the script.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb b/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
index 33c0c8a95c..c4d443bfb9 100644
--- a/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
+++ b/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
@@ -13,6 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=428ca4d67a41fcd4fc3283dce9bbda7e \
 
 PE = "1"
 
+inherit multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/x11perfcomp"
+
 do_install_append_class-target () {
     sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${bindir}/x11perfcomp
 }
-- 
2.13.3


