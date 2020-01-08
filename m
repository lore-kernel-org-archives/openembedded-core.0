Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CC6ED7FE50
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:33 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w5so1247326wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rHyLarM0kjD8aXBn07SzcTeerJbzikz1dS+Q547qcsU=;
	b=rlXq8Uv3WzBIeFcz1PEJqTKcJmq9Xnza5awL3p7D8MtpGzXeYphHQoAUvLepsj+bcW
	gzkXKV+QKXV5O6JdnMx1fNRjAuK2at8ItM5Py76AslUJhfO1wEDfvnsxyLzA4mGGknq6
	EJj9PmXxCqcJghUSoF/ZTTo2EUPIubqICL3EZvfrSLhB96LdTPMO0Yw6mEHZSByY4ifE
	rEAAY8VfdVSgP2RTuIOL05oWKDUE0Pthk3sAKK//Mp+qWwHYZ2BuyhnVZM6h3WZfHBn2
	NJPG1+eTOJ9l+3hAh8YsvonD31ElLEOZ1Qml7E4fFRQJMVKPuMhDE3d7eXWADfA4BGev
	QFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rHyLarM0kjD8aXBn07SzcTeerJbzikz1dS+Q547qcsU=;
	b=YXDu+fglcLiRCknLxWglaXAGN5AR4Jv+6iH6JZN7aHz528H9cuM/Un8XJ2RBwM8HcN
	U94tDWxxjH/ndqMVZAplEgU8NB7wyopIh12NYx+sZ3WZcE4BWtY6+OkDkN3YQ6Nuo+o2
	tsrndm8LJ5tM18DsBPJwFnHeigqhE1CP+33zE1Vs381MzxnN76rPZl8fWlSLRQ7Z6KST
	nhMQH2VozO+7k1pWmKEGE4kpyUEbvhcP7Ezr4L/Sdx1OkXULYW77Nf7mlFsnsSaGW73H
	VKCAtAfK9+Z5zbt1/Uzsaf/O6NtDsBDrb/QtjM42YEMuH0eCD13k0c0R3z8jX/LCUk+p
	04yA==
X-Gm-Message-State: APjAAAUY7ThJCRbjeQrfl8nYTITrczcTxdaOIPBW1wIuDY3ZSlfKwO7m
	ZM/FsUUB2itSYJbTofJEX54ixr29SPA=
X-Google-Smtp-Source: APXvYqw4qbWyWWtcXI9XrSNnvapzKhcF3YQMaA0+odejIWS5lcONbgDh4uGpqtMKfA9sdkjggxjBPw==
X-Received: by 2002:a1c:6404:: with SMTP id y4mr3948840wmb.143.1578490114352; 
	Wed, 08 Jan 2020 05:28:34 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:58 +0100
Message-Id: <20200108132759.95603-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 27/28] perl: install typemap and other extutils metadata as part of perl-core
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:34 -0000

Modules actually make use of these files, so they belong in perl-core
other than perl-doc (the immediate failure was ptests for
libmodule-build-perl failing).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index d5318fb949b..66707e7f9d8 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -207,6 +207,9 @@ FILES_${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
                ${libdir}/perl5/${PV}/warnings \
                ${libdir}/perl5/${PV}/vars.pm \
                ${libdir}/perl5/site_perl \
+               ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
+               ${libdir}/perl5/${PV}/ExtUtils/xsubpp \
+               ${libdir}/perl5/${PV}/ExtUtils/typemap \
                "
 RPROVIDES_${PN} += "perl-module-strict perl-module-vars perl-module-config perl-module-warnings \
                     perl-module-warnings-register"
@@ -217,9 +220,6 @@ FILES_${PN}-dev_append = " ${libdir}/perl5/${PV}/*/CORE"
 
 FILES_${PN}-doc_append = " ${libdir}/perl5/${PV}/Unicode/Collate/*.txt \
                            ${libdir}/perl5/${PV}/*/.packlist \
-                           ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
-                           ${libdir}/perl5/${PV}/ExtUtils/xsubpp \
-                           ${libdir}/perl5/${PV}/ExtUtils/typemap \
                            ${libdir}/perl5/${PV}/Encode/encode.h \
                          "
 PACKAGES += "${PN}-misc"
-- 
2.17.1


