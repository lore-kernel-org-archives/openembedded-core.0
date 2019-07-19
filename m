Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 487C87F0F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 08:09:12 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id k18so29906090ljc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 01:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zvmC7iIMld+UxnYhcIQQHRuXSIUtSvg2DL+AgeJal84=;
	b=o3QxGoSjRZ/TsgdNfWmkZYAtBgesmA2l2nttUJrMMN8wEwUMvdIpWSIiCJjgW4VP0D
	FT+Y9fr4H0sLBwwYrqJeyT9Bz3M/yaZxF/hzEQvUfz/xYbqTypxqrftFsWqbUl5Zf8Zp
	56D55zGyBG2Gtzwx4B4adkGzfT6XYuhPg+tn/5yEPh+Hqk+TrswpyPDLivoz+bDL5CLj
	4f5bm1xejxqKaVZ6nJNAEU+7rrZCmI47CTNUsPPlZPvqt8QVqL6fIoVkcoEyh86JA/Xi
	YwJPf8sI4jNkWeBHTlTRN+XlxDU7mpwj4EEnZboxQrXN5PbDHa0YCFzlwo26uJ9qUqZr
	Pf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zvmC7iIMld+UxnYhcIQQHRuXSIUtSvg2DL+AgeJal84=;
	b=Akl9qeJuqhvsGAMwXAKDSMaLM/OfGqkhpbtEdh9HnesG0hcfrs4eqCjYg6sZJ1PO1f
	TkzrPI/T9C0YpM0VnRCN16sv5Sy+MIo4S37hIt8/LOKUmYVyk9aFwErgmCUrl0uPIrS7
	SPXLB9m6FZ8xE/INp1Zszgj56q1GuJQq2wpYUVixadqYl40K+VamMxAMAXxK3LWuMwiB
	I0/rumeRue3wE1xWjXZEXqdyBiBiFxAG3OtfMh3gfyvuWJlaeueedVP4aZeC9ItywFpH
	HcG9vfdMWX1Z/zLQQQb9rp/bYuWw/RuugeAn7mEJN9ZKIzCdF1qcjvA3Fq5ehoSAY3ca
	fcgQ==
X-Gm-Message-State: APjAAAU3kxLAzo/4m9E1j+H8CYH+2IgddgEIi8K0VHJCO8Ar1HPZkZjf
	bKh12npgbD/FT9SEKcgFE8pQJaGF1nK4wXL8a4sglg==
X-Google-Smtp-Source: APXvYqxesx0ZiHqpAbzDU5fE8O/WNsQBsRtMlCxG9ppq6Z7UDDZ/DXTEz6MYmndBu92GlQUgoW/eqCLbQ8qw5JHjEoA=
X-Received: by 2002:a2e:3602:: with SMTP id d2mr27215273lja.112.1563523752733; 
	Fri, 19 Jul 2019 01:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ86T=XCwABdHj0rXHFsfK9pLndsKGQYv8R2=jOh4tz_9HmeAQ@mail.gmail.com>
	<CAJTo0LZjsiwdv6QB1SdDmyxtTvByjyiend_uSnXFQ_tRi8HwcA@mail.gmail.com>
	<CAJ86T=UTXq=aPkTRV1U+aN71KO3hCyz+fsT45=Mbm8ALZvPmiA@mail.gmail.com>
	<CAMKF1squ8mH9Aq9k1j9PZ=KDPp02DagQtuf9tWrrSqZ6XEMr4A@mail.gmail.com>
	<1467757624.8590.207.camel@linuxfoundation.org>
	<CAJ86T=XjCQjTANa4g8ztdxQCRggGgn7QkYMa6Y1+3QTAOdSyjg@mail.gmail.com>
In-Reply-To: <CAJ86T=XjCQjTANa4g8ztdxQCRggGgn7QkYMa6Y1+3QTAOdSyjg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 19 Jul 2019 10:09:01 +0200
Message-ID: <CAP71WjyC=tyfebrf0sitvc36DqOhxN6ZQoWXf7spFazd=H=GpQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Automatically creating tar files for bin_package.bbclass
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
X-List-Received-Date: Fri, 19 Jul 2019 08:09:12 -0000
Content-Type: text/plain; charset="UTF-8"

hi Andre!

On Wed, Jul 6, 2016 at 10:21 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Jul 5, 2016 at 3:27 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2016-07-05 at 08:12 -0700, Khem Raj wrote:
> >> On Tue, Jul 5, 2016 at 1:21 AM, Andre McCurdy <armccurdy@gmail.com>
> >> wrote:
> >> > On Mon, Jul 4, 2016 at 8:58 AM, Burton, Ross <ross.burton@intel.com
> >> > > wrote:
> >> > >
> >> > > On 4 July 2016 at 16:00, Andre McCurdy <armccurdy@gmail.com>
> >> > > wrote:
> >> > > >
> >> > > > Say I have a proprietary library which only I can build from
> >> > > > source
> >> > > > and I have a conventional recipe which builds it within OE. I
> >> > > > would
> >> > > > now like to create a tar file of the library and headers etc,
> >> > > > plus a
> >> > > > companion recipe based on bin_package.bbclass to allow others
> >> > > > to make
> >> > > > use of the library in their OE builds. ie the situation
> >> > > > described
> >> > > > here:
> >> > > >
> >> > > > http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.ht
> >> > > > ml#packaging-externally-produced-binaries
> >> > > >
> >> > > > Is there a recommended way to create the tar file to support
> >> > > > that?
> >> > > > e.g. a class which automatically creates a deployable tar file
> >> > > > of a
> >> > > > recipe's ${D} directory?
> >> > >
> >> > > You *may* be able to use package_tar in the recipe in some way to
> >> > > achieve
> >> > > this.
> >> >
> >> > It only seems to support creating tar files after packages have
> >> > been
> >> > split ( ie individual tar files for each subdirectory under
> >> > ${WORKDIR}/packages-split ). I don't think it's going to be
> >> > directly
> >> > useful for creating a tar file of ${D}.
> >>
> >> package_tar is just another packaging format here so you will get
> >> individual package separately
> >> you might want to add another class to package everything into 1
> >> thats
> >> a separate issue, you have
> >> to either add this via a bbclass or additional function
> >
> > Personally, I think that involving package_tar is likely going to
> > overcomplicate this, as is packaging up the already separated out
> > packages.
> >
> > Better to provide the output as do_install would leave it in ${D}, and
> > then let packaging happen as the user has configured. Only tricky part
> > would be the lack of source for the debugging symbols but if you can't
> > release the source you'd want to "fix" that anyway.
>
> I think the common case is that you wouldn't want to include source or
> debug symbols, so using ${D} directly is still not perfect.
>
> Here's the generate-prebuilt-tarfile.bbclass I'm currently using. It's
> certainly not suitable for merging yet.
>
> ----
>
> DEPLOY_DIR_PREBUILTS ?= "${DEPLOY_DIR}/prebuilts"
>
> do_genprebuilt[depends] += "pbzip2-native:do_populate_sysroot"
> do_genprebuilt[dirs] = "${DEPLOY_DIR_PREBUILTS}/${PACKAGE_ARCH} ${WORKDIR}"
>
> do_genprebuilt() {
>
>     if [ "${CLASSOVERRIDE}" != "class-target" ]; then
>         exit 0
>     fi
>
>     TARFILE_BASENAME="$(echo ${PN}-prebuilt-${PV} | sed 's/AUTOINC+//')"
>
>     tar --transform "s|^image|$TARFILE_BASENAME|" --owner 0 --group 0
> -cvf - $(find image ! -type d | LC_ALL=C sort) | pbzip2 >
> ${DEPLOY_DIR_PREBUILTS}/${PACKAGE_ARCH}/$TARFILE_BASENAME.tar.bz2
> }
>
> addtask do_genprebuilt after do_install before do_populate_sysroot
>

has anything more been done on that topic? I happen to now need
something similar. E.g. packaging for proprietary content, and google
led me to this discussion. What's the recommended approach nowadays to
deal with recipes for proprietary content? The use case is similar,
when building internally, we want to build all sources, but when we
distribute, we want to distribute all open source content +
proprietary as blob, but with minimal (if not none) changes in the
meta data.


> ----
>
> > This way you don't need to worry if your tarball matches the users
> > package configuration options (which backend, which packaging options
> > etc.).
> >
> > Cheers,
> >
> > Richard
> >
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

