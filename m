Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id BD7587D3A1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 07:31:08 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id y204so2197830itf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 00:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1Z1HK9XCxm9um3633FM/Gp3o1LZjfKPwSx8JMBND7aA=;
	b=TcKf9wQS985aN9UCdFRjdYJ3cGJZYVH1L5M0aMJueZ25JVmcLqS0RF7SwTGIb/cuVD
	Gep2KDl+Orl3pOkCh2Ruz6cCvvw4dklovN/JLVNlrFy8vYEVBoVKQK3/jBZAIxONRrmm
	6vuchq7a28OYf/mr1U+FlgwNIyFf3+JxoHmTqzXH8Q+2PSoBlNHYkrMpOdGUSL9gQNcW
	o+MiWOkyy5aIXy922YdnyVcSyZD31fJ2/dosRAAuHwXDZGxIKIOIoXpLbfOscKj2giOn
	J2Pq/EjVbHtNS5q3FHda2n1jtkaAdF1qtC3bvmtMfCdh6lcVjHpXq6pq/0skwnRgmWYS
	xk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1Z1HK9XCxm9um3633FM/Gp3o1LZjfKPwSx8JMBND7aA=;
	b=Y33E9ulnBHQ97/tfzOq/RrUhB40R7OFxnUGXsoS4f3owu77rWJfDjo3f+WYD+HEfez
	gVd4UD5Q4xEDILXDGmJ7A1anFJZhV1MIUZO22nsh2s/F4Ew5ufPFhUQ2UZcZdYrLz3XG
	CzziDVSCRn+bBlwNziA503ZLoPusJfw1PUHO/Zk28hyKC0HXfhCrxN+aR6NSJACdIb5q
	WGqg1fdOstB9XHIJkmGJSgi7JceZaa2CHsC744mUPPIEsPkBWaUyw5gMoOPJXtPfR3eV
	pT35XXeR8oNp5PR2llWDqAK/d6NGQGnY7KocF1ZUwzLAmUi57NotMDVD0mbS9hVvQVls
	Gvrw==
X-Gm-Message-State: APjAAAUxEfdVekL44MS/7TpehNW24RSpg7Wo63JR43iMGMD3JPmVEsEC
	swHXNxJtoCXqv+8FXUwal4ZK5DS8WIUZouhlrdufSA==
X-Google-Smtp-Source: APXvYqxPRqZWIPWgJ+grpcvoeHeHd18b+zKkiQwTdjQgKkmdWza5S64x+yPBPpBPx6UeZzuen/1Hp86W95cbp+dsRYc=
X-Received: by 2002:a24:1749:: with SMTP id 70mr3651767ith.50.1554363069759;
	Thu, 04 Apr 2019 00:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <1554358311-216590-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1554358311-216590-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Apr 2019 08:30:57 +0100
Message-ID: <CAJTo0La7viPMKAR+9PMx8m_SNTk6eyfM+M9ge5qeTyYrG-6QRQ@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] asciidoc: disable xmllint check
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
X-List-Received-Date: Thu, 04 Apr 2019 07:31:08 -0000
Content-Type: text/plain; charset="UTF-8"

I've submitted fixes for this already.

Ross

On Thu, 4 Apr 2019 at 07:12, <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> asciidoc-native build with below error when
> there is no xmllint program located on build
> host:
> | python3 a2x.py -f manpage doc/asciidoc.1.txt
> | a2x: ERROR: "xmllint" --nonet --noout --valid "/build/tmp/work/x86_64-linux/asciidoc-native/8.6.9+py3-gitAUTOINC+618f6e6f6b-r0/git/doc/asciidoc.1.xml" returned non-zero exit status 4
> |
> | Makefile:110: recipe for target 'doc/asciidoc.1' failed
>
> Considering it's only used to check the xml format
> of the doc file as doc/asciidoc.1.txt, so disable
> xmllint check to fix the above issue.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb   |  4 ++-
>  .../0001-Makefile.in-disable-xmllint-check.patch   | 38 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch
>
> diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> index d0d1517..7e00b34 100644
> --- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> @@ -8,7 +8,9 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
>                      file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
>
> -SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
> +SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
> +           file://0001-Makefile.in-disable-xmllint-check.patch \
> +"
>  SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
>  PV .= "+py3-git${SRCPV}"
>
> diff --git a/meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch b/meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch
> new file mode 100644
> index 0000000..4c0dd6d
> --- /dev/null
> +++ b/meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch
> @@ -0,0 +1,38 @@
> +From 242e58f16c129f5983d6b32d493619cc4f87703e Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <Mingli.Yu@windriver.com>
> +Date: Thu, 4 Apr 2019 13:38:10 +0800
> +Subject: [PATCH] Makefile.in: disable xmllint check
> +
> +asciidoc-native build with below error when
> +there is no xmllint program located on build
> +host:
> +| python3 a2x.py -f manpage doc/asciidoc.1.txt
> +| a2x: ERROR: "xmllint" --nonet --noout --valid "/build/tmp/work/x86_64-linux/asciidoc-native/8.6.9+py3-gitAUTOINC+618f6e6f6b-r0/git/doc/asciidoc.1.xml" returned non-zero exit status 4
> +|
> +| Makefile:110: recipe for target 'doc/asciidoc.1' failed
> +
> +So disable xmllint check to fix the above issue.
> +
> +Upstream-Status: Inappropriate [oe build specific]
> +
> +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> +---
> + Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index ffba3b5..fb95fab 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -107,7 +107,7 @@ $(DATATARGETS): % : %dir
> +       $(INSTALL_DATA) $($@) $(DESTDIR)/$($<)/
> +
> + $(manp): %.1 : %.1.txt
> +-      python3 a2x.py -f manpage $<
> ++      python3 a2x.py -L -f manpage $<
> +
> + docs:
> +       $(INSTALL) -d $(DESTDIR)/$(docdir)
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

