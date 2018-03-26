Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id E2042786EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:15 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id 9-v6so12033734ple.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/6RihELX9lSLIUX2frXA++rM4Cp6C+Wm5t8LOu3zDc0=;
	b=SCszLq8Sb62yfQFkftfkwYCekjGKltgSkTu9UxYpKGvj2xvDgKOkzYAQbrtWSe1P7/
	CzQ51Sp2Kpjkl3X8w8P0pHV7wIkXtVzn4QWHep3qaDVHK5bTpOusWvUi2FfUCuzCzO5j
	K7Lj7+4qw1PrIgZrcaYnqOeCLfKBg0nU34rWRj5R9+OzZ0gHR+Ay/MUdKJCT0hTQDa7E
	uGR9WYyINBgJs84+ntW39CIYDaznHe1HvOTnzDIbrmtK9b9q07tKTwo/jmcN3+h/hcOj
	Tyx7SADuFOrh3XazXjOjTfa/dUDFig3plhTKZqV4Gn2QVOjUFAfH91DsY90AeLQ0z9qk
	4Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/6RihELX9lSLIUX2frXA++rM4Cp6C+Wm5t8LOu3zDc0=;
	b=tN3+0SA2uwCeFCN3XtL36zDDnPDxJYo7jbGTtRWr7DD2u2oWA7yRNmNYx1ErESfeve
	2kXoy4iC7nD0UEcO7OBJrs1vbO4dMoCVGdsouTld/xY6P7evv3RpiBCCKfE0sFY6b2IM
	KlkkJ2288yx9XUdDBUDTbzkqka6p/oZqB6lllsT+a4b4YT6rvm7ZoBHlG370edAQIHBq
	EKdcnDBDOVdGDPqWN3mqXY+sWKp3yJbXNJVRThB2rKNhxMwKAxS6qg+sa43zsVly20Te
	FqzaguGHcvjG7uNWvepv9a6ruwiUsCCknMlHgpQqn6w9mAIf86GSK5xC3VIHZZB03HiP
	uUSQ==
X-Gm-Message-State: AElRT7F67gJ/SZ+EJwQaV+p5XRdxlZ8ZC9eQhNNF2dWQb79Sq22BMnE+
	kMeR1jkZDQGbUpqVps9+KJk=
X-Google-Smtp-Source: AG47ELtEZ/IJbG1B63aYiCb9v8jp+dbyxnEVZMnwXzYFOHsVKIq0F96fiFl0yrLNJXc4RR7XMhKeGw==
X-Received: by 2002:a17:902:2862:: with SMTP id
	e89-v6mr40637139plb.348.1522074677006; 
	Mon, 26 Mar 2018 07:31:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:05 -0700
Message-Id: <d9fadb068411c8ff611692d561a776da2db1884e.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 02/21] libpcre2: update to 10.31
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:16 -0000

From: Armin Kuster <akuster@mvista.com>

LICENSE changed do to updating copyrige date

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libpcre/{libpcre2_10.30.bb => libpcre2_10.31.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.30.bb => libpcre2_10.31.bb} (90%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.30.bb b/meta/recipes-support/libpcre/libpcre2_10.31.bb
similarity index 90%
rename from meta/recipes-support/libpcre/libpcre2_10.30.bb
rename to meta/recipes-support/libpcre/libpcre2_10.31.bb
index 46c2d63..a10c312 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.30.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.31.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=12d55e15a0c6da5c645ba40382bd3293"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=f5e4bde9fd0493d0967b4dba9899590f"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
 "
 
-SRC_URI[md5sum] = "d3adf4b130eed854a530390f00020a65"
-SRC_URI[sha256sum] = "90bd41c605d30e3745771eb81928d779f158081a51b2f314bbcc1f73de5773db"
+SRC_URI[md5sum] = "e0b91c891a3c49050f7fd15de33d0ba4"
+SRC_URI[sha256sum] = "e07d538704aa65e477b6a392b32ff9fc5edf75ab9a40ddfc876186c4ff4d68ac"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.7.4


