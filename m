Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEDE77FEDB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d73so2491326wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ox9JchgTAN52fT2p55EtyoOEzsXA/b6XmsGVauQtC34=;
	b=ThOzXgf4+l/21LeIx55CQ/QQPasLK1RTI62MikHrq13+YyEXIP7i0DvbMV6TS9ZGFo
	PhLXyZJj+1huL8nFXBVL3zB5GR7+hstxcTPy+hlhQYwLHfawv6z6+wgHBxiAm4JlKei0
	CvnCI8mGjvhL4Cm4pIklAj4oghwQe7ST6II4tzUY7nUzseS4TwleQ3OwHY/SKyXc6mcZ
	ZzXIN9xDpHElUNMbB0nvX+LSnSmLwi4lFahAtEGzfJdbKacEjRI5aqlNbKLcKHgR5Scw
	ScDDCQXCQ0bXXZ+0s107m++X6vjuQS+ZZV9itLoJktncUbeuJqWuP/xCXisa5nafCvk5
	y6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ox9JchgTAN52fT2p55EtyoOEzsXA/b6XmsGVauQtC34=;
	b=R5mN2bjXnWPjm0HE80jbrSkbS7ktkEffuQNGmWxsAegvWhgkaGxspc8AJqq0hUp7Ls
	YgBxAwK/bUa/pH9NPkGxf3y8XzQaRuAkaIE/IWk8+owvOKS3XyXJXirs1QCANsIJu6LQ
	w8VeYdQyhWTUc/T6WgRt5CjWdInbhIFwfrlG9p8cvjEr0DhButpgy05qJysBI3eqz+xS
	W+F6a440wlzLTF+tg7R9BlWyJKUcVqkzzMFLz5Vu2ZgyIvZIN7TDbvU6t/U4X7IXg4Z6
	4TbPyGoKWuIvpiQdkWDeSVdpvjQGgtjZZPeyzZMfqR9YMKb0YNHFLEyKpY+iP3rGGh8K
	z28A==
X-Gm-Message-State: APjAAAU1QLVo+EtxGPguEBqmCSNavwTzHcvVef/98PLySJ9t+sNEcnDs
	4XYk8EdgiikhHfdoz09N9IbyPIkB7jo=
X-Google-Smtp-Source: APXvYqzMqDEZRx+liVOpjJC3D03/LMYJHDWN0qnqmcI5f/JQZGgSUNJCsEENga6H8LLzsMM5nVYJpQ==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr3978793wmc.21.1578490113272; 
	Wed, 08 Jan 2020 05:28:33 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:57 +0100
Message-Id: <20200108132759.95603-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 26/28] perl: package Config.pm from arch directory into the main perl package
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:33 -0000

Otherwise, some modules such as libmodule-build-perl fail to work
properly.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 6e0b2007fb7..d5318fb949b 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -198,6 +198,7 @@ require perl-ptest.inc
 FILES_${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/libperl.so* \
                ${libdir}/perl5/site_perl \
                ${libdir}/perl5/${PV}/Config.pm \
+               ${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config.pm \
                ${libdir}/perl5/${PV}/*/Config_git.pl \
                ${libdir}/perl5/${PV}/*/Config_heavy-target.pl \
                ${libdir}/perl5/config.sh \
-- 
2.17.1


