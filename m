Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E1D8A74758
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 08:57:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z204-v6so12180552wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 01:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FHRcZU8ZMkbkFexp+Nos+c8GfoMk+y11VoI5Vg/cUEI=;
	b=TJsT4AaMlTxgUlaL39zCEr+5YnT7nRWW7arCn72JDgK4SUuRd7jLwcIGX8beBhQxVH
	pCIgU3iC3y5CsneoCY983pRpHx5v7cQDEkuiN2CdOHjsmMJOfOuzV4d4YsZF/fSL79K2
	jOrf/WNUcT3SpAMwkvWrSbFs8PY/GHiSBkpaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FHRcZU8ZMkbkFexp+Nos+c8GfoMk+y11VoI5Vg/cUEI=;
	b=UIPXL/og6HL2c/z69BSWMAd3/eRW6bjG6o9bDA8Q1U/MHQNGCVlfqziFFhI6HCgjHB
	EsXZtPD//yMiqwx5fvyvix7zvH7sqFcllNKFr/T5EOtqZ61k0uxthTi9R9xyH7Ys0fOh
	mSB8M1Zn8tuFTg4uk329DreNUnuduE/CbE7uXm69cQxWfeOl0cKeVURB+wuEKvbCib0R
	yQ1Rq7i9DhqfeRID/zbsdC6XLWOk5H8gAma/OewQ4JHITENtGsY8mMgf5ef8sh+k84zR
	dbLoLwjUxtxfQBQFa5lwJTCmiUb+S2T1Re0v4yRmRNhwDlzJBtecLpbukCS18GwUUGsq
	yFwQ==
X-Gm-Message-State: ABuFfohC4JkyUYfZn0GYdemPmEu4gniJdutYxbSNVtaNTDc4E/5dejYn
	a/CG0warmCChF5E9HT0QcKxBOw==
X-Google-Smtp-Source: ACcGV601w+bkxhHeW45ZiCo5LZujCzQC8pvbFwd9R3tijwfrtodpJGDrawabRAWpnpDTmYCN/edwYA==
X-Received: by 2002:a1c:b604:: with SMTP id
	g4-v6mr4642637wmf.111.1539334657189; 
	Fri, 12 Oct 2018 01:57:37 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s10-v6sm675156wmf.15.2018.10.12.01.57.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Oct 2018 01:57:36 -0700 (PDT)
Message-ID: <62308c8aac0596271b7ca1f12aabb78547f1a7a9.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 09:57:34 +0100
In-Reply-To: <3012dac0-ec3a-bfd8-fb58-27be91642b4d@windriver.com>
References: <20181011095511.5509-1-hongxu.jia@windriver.com>
	<e8b42506cdaf9437f715100f0ff6541d5ed3c894.camel@linuxfoundation.org>
	<8fe4eb7c-a838-e1da-a1a2-7acd201d9977@windriver.com>
	<3012dac0-ec3a-bfd8-fb58-27be91642b4d@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] openssl: use nativeperl to build
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
X-List-Received-Date: Fri, 12 Oct 2018 08:57:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-10-12 at 15:54 +0800, Hongxu Jia wrote:
> On 2018年10月11日 22:58, Hongxu Jia wrote:
> > On 2018年10月11日 20:00, richard.purdie@linuxfoundation.org wrote:
> > > On Thu, 2018-10-11 at 02:55 -0700, Hongxu Jia wrote:
> > > > If host perl is old version (such as perl v5.16.3 on CentOS-
> > > > 7.5),
> > > > the openssl-native failed at do_install, the reason is its
> > > > Makefile
> > > > is not correct which is generated at do_configure by perl
> > > > script.
> > > > 
> > > > Use nativeperl to assure latest perl on host for openssl build.
> > > > 
> > > > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > > > ---
> > > >   meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 6 ++++--
> > > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > I think this will have a noticeable effect on built times
> > > unfortunately
> > > since it means openssl-native would then depend upon perl-
> > > native...
> 
> Hi RP,
> 
> With some digging on upstream, more than perl version,
> the building also requires to install perl Text::Template module
> which does not exist in core perl, I think we have to add the recipe
> 
> [snip]
>   Notes on Perl modules we use
>   ----------------------------
>   We make increasing use of Perl modules, and do our best to limit
>   ourselves to core Perl modules to keep the requirements down. There
>   are just a few exceptions:
>   Test::More         We require the minimum version to be 0.96, which
>                      appeared in Perl 5.13.4, because that version
> was
>                      the first to have all the features we're using.
>                      This module is required for testing only!  If
> you
>                      don't plan on running the tests, you don't need
> to
>                      bother with this one.
> 
>   Text::Template     This module is not part of the core Perl
> modules.
>                      As a matter of fact, the core Perl modules do
> not
>                      include any templating module to date.
>                      This module is absolutely needed, configuration
> depends on it.
> [snip]
> 
> https://github.com/openssl/openssl/blob/master/NOTES.PERL
> 
https://github.com/openssl/openssl/commit/4e351ca92e3a1f447cef3d2e330f13941f9412c6

That is a good find. Perhaps we could check for that in sanity.bbclass?
Is it commonly available in distributions like centos? 

I am worried about the build time impact of a nativeperl dependency as
whilst your test doesn't show it in the image build, it will show up on
slower build machines with fewer threads.

Cheers,

Richard


