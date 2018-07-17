Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id AAA6078A09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 18:38:04 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id 125-v6so1121190vke.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YI3Ez+O0F60f9wgd7xE5qfMd9aBDAzgDmY50QfwJ5Yo=;
	b=Y8FAU1uQtEVxmlJIqaZwOaTL+53wttGfpSogv6vmatVOSmVqnyG8EWb+lom4yNUUD4
	VBtVyMhLQy4Pbg0BTHTxP71N+iVKx4KLcyCuI3+Zc4J/0qMHjap34VuUoHReNOdrh4pp
	2vraPNRIDfUiDCCgZiSLnKg650rkKlgi/tkhURciDrDXB9vidizhxA7PxKTEj+sVQixY
	lhjnvhOAi76KmzeMt+0/nKQ0BM9fpmv2SOJmlbWQvPkVxOuHVHkLQ5e6jJe4hvbA0Po2
	7o3uiR8mxVZ6NM97fAS6D5tudKn6+bwKuMhZ8yq2gdmd8V470cILin+i5KeqLAumIwG3
	dUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YI3Ez+O0F60f9wgd7xE5qfMd9aBDAzgDmY50QfwJ5Yo=;
	b=CqoqFA159m7om7nVth7T61PuZpOEcWGbVRhWunCHEVyV1lonk7cyBLEmbKPc7+e2RE
	aIpVNlOHkrXo42HC00BnETCmnnFImNFIP+wVy/Gb6nc+ApU+3YwYiDZwc+eJEsFRxUZQ
	UDJgvw+K3BWM3c2aGvZx2Kw0NaZaGwKUqof9kvFu4O/eOxWl1NE3m2d+uGbC0U3Uyqbo
	1K5kXbegpYWMhq/jqDd1jIudIoGwvh6fh//VL1LaaDDSoxIx7/4hiVe0184foL4nAId+
	Zldi4fbO8F5sFCxMmDYdnvn5ozYNmAoLF88m13uJvy5phCfbviz+Nk1IWnlMYvej3hu1
	ZgFg==
X-Gm-Message-State: AOUpUlHt3oNWCYzcnENKwhUOG2h/pQideRpv4YAi5S1htDqkseobqqBx
	6tM+HJ9N5RTNR5XlDST6gJB7hFTCJmJf2u2lHq8=
X-Google-Smtp-Source: AAOMgpdQhACHaOKbjVEbNa4U9R90+NFw4AoM7VU2a+5OtVjcBbX2yUr0Q8OR06ZcuiBLhviIBS93U+MLEVR131koeAY=
X-Received: by 2002:a1f:e605:: with SMTP id d5-v6mr1561384vkh.4.1531852685365; 
	Tue, 17 Jul 2018 11:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <1531850817-26274-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sp3z1n+t5QKgbiWn6MkXEGOEFF_8G_X=1dYFTcx48U3RQ@mail.gmail.com>
	<CAJ86T=WYor_Gf2dpio37Yu86bmCfeDht9s6p02XFgH_2QDOv9w@mail.gmail.com>
In-Reply-To: <CAJ86T=WYor_Gf2dpio37Yu86bmCfeDht9s6p02XFgH_2QDOv9w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jul 2018 11:37:39 -0700
Message-ID: <CAMKF1spGseSt53y4jON1S0sX8VFn4MfuQhyfPNfh3zK0Jt4asQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: disable C source code generator
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
X-List-Received-Date: Tue, 17 Jul 2018 18:38:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 17, 2018 at 11:34 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Jul 17, 2018 at 11:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Tue, Jul 17, 2018 at 11:07 AM Andre McCurdy <armccurdy@gmail.com> wrote:
> >>
> >> The --libcurl command line option causes curl to generate C source
> >> code which, when compiled and linked with libcurl, creates a binary
> >> which behaves in the same way as curl when run with the other options
> >> passed on the curl command line.
> >>
> >>   https://curl.haxx.se/docs/manpage.html#--libcurl
> >>
> >> It's a development tool and not generally useful on the target,
> >> especially if the target doesn't contain a toolchain etc.
> >>
> >
> > probably better to have it controlled via packageconfig knob
>
> Really? Why?
>

We do have people building SDKs for SBCs which ship development
environments on targets and I believe
it does not hurt to use packageconfig. Do you see downsides ?

> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> ---
> >>  meta/recipes-support/curl/curl_7.61.0.bb | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
> >> index 03d627e..cc983fd 100644
> >> --- a/meta/recipes-support/curl/curl_7.61.0.bb
> >> +++ b/meta/recipes-support/curl/curl_7.61.0.bb
> >> @@ -49,6 +49,7 @@ PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
> >>  PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
> >>
> >>  EXTRA_OECONF = " \
> >> +    --disable-libcurl-option \
> >>      --disable-ntlm-wb \
> >>      --enable-crypto-auth \
> >>      --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

