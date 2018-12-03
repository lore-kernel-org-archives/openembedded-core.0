Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id 358486C56D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 20:14:36 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id 189so8177911qkj.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 12:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=hTKjjX93ih+9CdjTS02QLRqg7Uwu+V7PNEO39XWYuBw=;
	b=PLGgXLQkCZSyp8pRNfgBTspnfER/AkJha0fJ45YU1+BVQmBlxzJAKhcjDQemZfxmt6
	Wweg4VTE+TNud5fGdfoJjGxHFxCBcrewHK4D8Fw07FrTvG6qrb0lQJRQLVjFadht37fb
	hghmvmzjawCBoUxBiOqYq2bXKHNSDSMD1ehakibvmEfy6YboCsnu8w9duTgkCef3+XBn
	UAReyMDW5ExW60Y6nrO31P21EHrfxrUA5rwO+2UI5A9OxHiDKAFMAbBeasEPOsAwkhO1
	n3tsGHx85U6U2Rg23TOyHqJLaPOgTPqSfkUTZv9DkLpLIx4sjliPiUhPH8z5l04NghsW
	qq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=hTKjjX93ih+9CdjTS02QLRqg7Uwu+V7PNEO39XWYuBw=;
	b=bhP2tkwhmGnBcyg6fYox6RCGkjU4E+vmCDWDeY3UZthfpIUJ2dwFRImqIreNO8S2H1
	QDJlz07nCd4ezLvesW9GQ3/pRHp09PlxF2iU2bW7B9zKZ5WqkaWCorZnubYe0pgLG7v7
	dSRCxnbsoMUmPki0q/Kof2wKceoSBJinCUwo6DGowI0tModE2ZH0Rge0fCR64GTTSrvo
	j11rkvL0TuttpESsKpkTcHqBvjk4kZtDseEPnqiXXdoiONmjhvR4D+LiYmo832tjf2dW
	72k8J4Tyak4/K3Tjont9eslcIsXB1g9GstzVFxxa/QFzFIrY1BULJChZ5vcgPn8BUBqB
	fXsQ==
X-Gm-Message-State: AA+aEWaQx3t3VHorEb0MLk+hB9Ziq9tTIVFBu6+aMfsKmG5gyurzZuXT
	tm4rxH+I8b7Ez3QVRi3J1K6/w1WLryDNy+h2KyE=
X-Google-Smtp-Source: AFSGD/Vt0xU971Njw1Vis2xfChsbD0lkkhblYdF9m3Eq/rvpB9LwGaPmB6mlhQez8pjFfpU4hI5Don9aBQ7yyqog5cc=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr16506315qkm.102.1543868077818; 
	Mon, 03 Dec 2018 12:14:37 -0800 (PST)
MIME-Version: 1.0
References: <20181130215537.29981-1-JPEWhacker@gmail.com>
	<20181201030142.9385-1-JPEWhacker@gmail.com>
	<c492b503-696b-9cad-0f69-9bd9129a6e14@gmail.com>
In-Reply-To: <c492b503-696b-9cad-0f69-9bd9129a6e14@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Dec 2018 12:14:11 -0800
Message-ID: <CAMKF1soDs+MZ3G5e2_MDvO2r+bPy+ofLn5UEEvUQ3jcteU=Y3A@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] classes/waf: Fix builds when B != S
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
X-List-Received-Date: Mon, 03 Dec 2018 20:14:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 1, 2018 at 4:09 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Joshua
>
> There is a build failure for a2jmidid see
>
> http://errors.yoctoproject.org/Errors/Details/202833/
>
> Seem to be related can you validate
>
> On 11/30/18 7:01 PM, Joshua Watt wrote:
> > Waf requires that the current working directory be ${S} (the location of
> > the wscript) when building. Most of the time, this was true only because
> > B defaults to S. However, anything that changed that behavior (notably,
> > using externalsrc) would break the recipe. Remedy this by explicitly
> > changing cwd to ${S} when running waf commands. As a happy side effect,
> > B can be set up for "out of tree" builds to keep the source directory
> > clean.

I have sent a workaround for a2jmidid to ml which means we can go
ahead with this change in OE-Core

> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >   meta/classes/waf.bbclass | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> > index 19e93761b39..8e6d754c299 100644
> > --- a/meta/classes/waf.bbclass
> > +++ b/meta/classes/waf.bbclass
> > @@ -1,6 +1,8 @@
> >   # avoids build breaks when using no-static-libs.inc
> >   DISABLE_STATIC = ""
> >
> > +B = "${WORKDIR}/build"
> > +
> >   EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
> >
> >   python waf_preconfigure() {
> > @@ -22,16 +24,16 @@ python waf_preconfigure() {
> >   do_configure[prefuncs] += "waf_preconfigure"
> >
> >   waf_do_configure() {
> > -     ${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF}
> > +     (cd ${S} && ./waf configure -o ${B} --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
> >   }
> >
> >   do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
> >   waf_do_compile()  {
> > -     ${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
> > +     (cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)})
> >   }
> >
> >   waf_do_install() {
> > -     ${S}/waf install --destdir=${D}
> > +     (cd ${S} && ./waf install --destdir=${D})
> >   }
> >
> >   EXPORT_FUNCTIONS do_configure do_compile do_install
> >

