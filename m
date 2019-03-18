Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0304E7C623
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:13:10 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v20so18805001qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BYaWWYjsv7IkbNG4HvY2FQ6hfwml5bXn92OYDW20MIM=;
	b=SWW9wRZHwHkwJs62N1bIWjqf75D7UDVGFAI4lKLXyafPAhtipws3dmrj8wjcX8ZVSp
	8Mn+hbHoubeU+bh/KUCT4xVMQhGAVl+RGyqMsEYApP1wXdJPPmX3e1kzYRaZ4Uop5ker
	ITf0eMcZ0Otm5ygIj8OuXNXSxd9Zx4wgFAkucW/hVMjurL5n3+j6Yz38GxzD+Ls0+7+R
	CYBmtOknF3g6oPfAsq/SEg/Bt8CmASxdGRalSbLK0qr5oVAEh4diuVCiG6mz4fCI/R8V
	Vxrn5D8oSaskf2g5IFT+5wWUjqnOMZ8o17U6p/bOtbMWzGGd8RmtZyno3/75lME9YJDB
	rrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BYaWWYjsv7IkbNG4HvY2FQ6hfwml5bXn92OYDW20MIM=;
	b=l5xozC7nWLcidDSRVHvpGDq1rJaVRWyZnaCfw65LKwgD49mLZ+pvIHcrgSiK7VUYMk
	/dtjj4sjecgNmiJyQX74TcAZ+N4UuGXFdqyjMLUJTA+3O892u3Y+l9CgoXJE54fpKGNs
	sAIghP+BtJ3Qe92Pg9jqiQLk5U40xkJJFWFH5g40YZlMRB0yxCfuGkRUWdJHjnL2gZk5
	DwgKqkD2nvWWMe9pbcrHpP5rEOa+ev8q7XMs1AJSTnPXBLaMs3wzA/reXGU8/zBwix+b
	DIYY7wEW+VQFC80sohesyI7t36cOXS1g5407ktx/OnhjhTbVZY3WHieQeb19sCQaC/FH
	uXjw==
X-Gm-Message-State: APjAAAUamXZediJVGkFWaDJydHn6a+dkhIAjN382EEgKQ3kP2vjecwIc
	gl//EKyTKidaHoqTeXJSdGAPQ0NmKU8YORr1bDU=
X-Google-Smtp-Source: APXvYqyCgwASa9/ucpDNEfkkKoa/MJC61DkqhezPkxmkiru49KNIfz7uSqpB1BGMltrwRi1G5sqGvJwBQbiMMmvgsak=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr10705443qtn.253.1552929191668; 
	Mon, 18 Mar 2019 10:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190318165803.10375-1-raj.khem@gmail.com>
	<20190318170826.GC25848@joraj-alpa>
In-Reply-To: <20190318170826.GC25848@joraj-alpa>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Mar 2019 10:12:44 -0700
Message-ID: <CAMKF1sqA6uf+wZVvVA+qkANJS1La46hEovzgTHcS4rNHUEjtqQ@mail.gmail.com>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] lttng: Enable on musl and riscv
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
X-List-Received-Date: Mon, 18 Mar 2019 17:13:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 18, 2019 at 10:08 AM Jonathan Rajotte-Julien
<jonathan.rajotte-julien@efficios.com> wrote:
>
> Hi Khem,
>
> This looks good, still please take some moment to read this thread from musl
> mailing list regarding lttng-ust usage of _SC_NPROCESSORS_CONF. For now I would
> maintain the disabling of lttng-ust when musl is used. I should have CC'ed you,
> I forgot.

I think thats right, I should keep this pull just to riscv for now. I
will send a v2 soonish

>
> The modification for riscv64 seems good to me. We do support lttng-* for
> riscv64 [2] on debian.
>
> [1] https://www.openwall.com/lists/musl/2019/03/15/5
> [2] https://packages.debian.org/sid/utils/lttng-tools
>
>
> On Mon, Mar 18, 2019 at 09:58:01AM -0700, Khem Raj wrote:
> > Latest version compiles on musl as well as on risv64 now
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb | 2 +-
> >  meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb   | 2 --
> >  2 files changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
> > index 086254d3d3..15e75e51c9 100644
> > --- a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
> > +++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3 \
> >
> >  inherit module
> >
> > -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
> > +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
> >
> >  #https://lttng.org/files/lttng-modules/lttng-modules-2.10.7.tar.bz2
> >  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
> > diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> > index 151e35e3c3..d544f8e206 100644
> > --- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> > +++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> > @@ -26,9 +26,7 @@ PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig
> >  PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
> >  PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
> >  PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
> > -PACKAGECONFIG_remove_libc-musl = "lttng-ust"
> >  PACKAGECONFIG_remove_arc = "lttng-ust"
> > -PACKAGECONFIG_remove_riscv64 = "lttng-ust"
> >
> >  SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
> >             file://x32.patch \
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Jonathan Rajotte-Julien
> EfficiOS

