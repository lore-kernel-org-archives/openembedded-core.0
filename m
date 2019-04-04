Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1596C3AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 08:02:40 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id v8so7538909itf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 01:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=01sBN2WrJ/PRJO/KwCq3YJV49P9NjzkFkBO+NyC71J4=;
	b=ZHsMM4CAIpp+t1Ex0ngLhw7swv7wdZ+wmIRAII4hlgrgGUqVFLI+rBzAGDDdtpupoq
	H1Rxc5GOer8tR/UB0yjPqhD1p4jZezb3jAdv0awDPGO7ZPjqDwZShF0gQNilesVDizgU
	hKCPOj4CvWfyXEEuwPrYhjZ6aDH/jCWfpNaYtuTrPSF2tvHwNJ315emsmDP46hbsgmgW
	mWFXOEzKGOebYh2m3n2ICPx/5bfg+f69i1sp8iAl41JKW2j3rh+7/w+Pj9IDaWPbx5IR
	7IHbpLQxeJfXnV0X938fPEjsVFZO5Wu5cGk898qZv1AeE8Msx3GLOWpfO7KpvswNCEOL
	gFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=01sBN2WrJ/PRJO/KwCq3YJV49P9NjzkFkBO+NyC71J4=;
	b=SS5rhyqqyBSchBwksPTAgXuogG2hHQTDOYPQy/YbV8a0qoAI2ml8i4Ag63LfHJ0qOg
	4Fq2P47i4FFfsgHXbRX6nClwYT4Bt8gkAcMF7OWv7VidS9NFh0EgjBasoMe4n1VFwjI8
	1dMMT/HUHoZ6HBdYAiMMTrqudwM/w3jYt+vW3/29nhpMMEaZ+IrVGzvAwlr1ObpQkSZr
	l0NyF8oGKWSlbxO/x93LHI1G8bpyv75P6gyqRW4m5Nug//157/71QpOT58Q8xcwjjn1t
	N20dx3KTbXZZwfchs27REu2jPG5XibepU0cYsqp5K3aGnwv1uwA8guauvR+70SqwHGOE
	/UXA==
X-Gm-Message-State: APjAAAXTmQV4n528YuEnI1RHufKyyLH5Mj/O6znPi/ICYxxGp3ys4oPz
	18aSJSLo00JGJszvGK6H2XmWoFUgJ+VzfGbz7ZPRWQ==
X-Google-Smtp-Source: APXvYqwaPtDfqpaFKrJbuyPk+6ExLpYNN96/ltgdy73CEVffCdnInolpUJPS6V0qaX5qeDNS0NYbwicE4adEVcj0SQg=
X-Received: by 2002:a24:1749:: with SMTP id 70mr3727973ith.50.1554364961319;
	Thu, 04 Apr 2019 01:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <1554358311-216590-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0La7viPMKAR+9PMx8m_SNTk6eyfM+M9ge5qeTyYrG-6QRQ@mail.gmail.com>
In-Reply-To: <CAJTo0La7viPMKAR+9PMx8m_SNTk6eyfM+M9ge5qeTyYrG-6QRQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Apr 2019 09:02:29 +0100
Message-ID: <CAJTo0Lak05SBbDApK4L-QZpSqR_cONECVhDUUq99B_JFFhgVbQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Apr 2019 08:02:40 -0000
Content-Type: text/plain; charset="UTF-8"

Some further context (note to self: don't reply to mails during
breakfast): the problem which lead to xmllint failing also leads to
the XSL stylesheets in the sysroot not being used, so xsltproc
downloads them.  On my machine, asciidoc should execute do_compile in
about a second, but with the broken catalogues this was taking almost
a minute.

Ross

On Thu, 4 Apr 2019 at 08:30, Burton, Ross <ross.burton@intel.com> wrote:
>
> I've submitted fixes for this already.
>
> Ross
>
> On Thu, 4 Apr 2019 at 07:12, <mingli.yu@windriver.com> wrote:
> >
> > From: Mingli Yu <Mingli.Yu@windriver.com>
> >
> > asciidoc-native build with below error when
> > there is no xmllint program located on build
> > host:
> > | python3 a2x.py -f manpage doc/asciidoc.1.txt
> > | a2x: ERROR: "xmllint" --nonet --noout --valid "/build/tmp/work/x86_64-linux/asciidoc-native/8.6.9+py3-gitAUTOINC+618f6e6f6b-r0/git/doc/asciidoc.1.xml" returned non-zero exit status 4
> > |
> > | Makefile:110: recipe for target 'doc/asciidoc.1' failed
> >
> > Considering it's only used to check the xml format
> > of the doc file as doc/asciidoc.1.txt, so disable
> > xmllint check to fix the above issue.
> >
> > Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> > ---
> >  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb   |  4 ++-
> >  .../0001-Makefile.in-disable-xmllint-check.patch   | 38 ++++++++++++++++++++++
> >  2 files changed, 41 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch
> >
> > diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > index d0d1517..7e00b34 100644
> > --- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > @@ -8,7 +8,9 @@ LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> >                      file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
> >
> > -SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
> > +SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
> > +           file://0001-Makefile.in-disable-xmllint-check.patch \
> > +"
> >  SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
> >  PV .= "+py3-git${SRCPV}"
> >
> > diff --git a/meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch b/meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch
> > new file mode 100644
> > index 0000000..4c0dd6d
> > --- /dev/null
> > +++ b/meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch
> > @@ -0,0 +1,38 @@
> > +From 242e58f16c129f5983d6b32d493619cc4f87703e Mon Sep 17 00:00:00 2001
> > +From: Mingli Yu <Mingli.Yu@windriver.com>
> > +Date: Thu, 4 Apr 2019 13:38:10 +0800
> > +Subject: [PATCH] Makefile.in: disable xmllint check
> > +
> > +asciidoc-native build with below error when
> > +there is no xmllint program located on build
> > +host:
> > +| python3 a2x.py -f manpage doc/asciidoc.1.txt
> > +| a2x: ERROR: "xmllint" --nonet --noout --valid "/build/tmp/work/x86_64-linux/asciidoc-native/8.6.9+py3-gitAUTOINC+618f6e6f6b-r0/git/doc/asciidoc.1.xml" returned non-zero exit status 4
> > +|
> > +| Makefile:110: recipe for target 'doc/asciidoc.1' failed
> > +
> > +So disable xmllint check to fix the above issue.
> > +
> > +Upstream-Status: Inappropriate [oe build specific]
> > +
> > +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> > +---
> > + Makefile.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index ffba3b5..fb95fab 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -107,7 +107,7 @@ $(DATATARGETS): % : %dir
> > +       $(INSTALL_DATA) $($@) $(DESTDIR)/$($<)/
> > +
> > + $(manp): %.1 : %.1.txt
> > +-      python3 a2x.py -f manpage $<
> > ++      python3 a2x.py -L -f manpage $<
> > +
> > + docs:
> > +       $(INSTALL) -d $(DESTDIR)/$(docdir)
> > +--
> > +2.7.4
> > +
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

