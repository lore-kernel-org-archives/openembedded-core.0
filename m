Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0096F60EA5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 21:45:26 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q8so6385265wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 13:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=svyIX9uiDm8Hn1kx/AhH3icX9P5/XiP+fEQh3v9SkKU=;
	b=eBUJ2gaHjGakhrOmraF0VtlG0afFWsUYE+dVD8JIqqu3mGTjxzXxO9F0be0iYrvxpH
	tzQhBL7f5RvbE6KNzorHJQXVP7Kb1Yer9lBho5V902DlUyhFOepwiDpIjhNG3t6HdcSy
	rxSLf5fnlDyCfpxuH+MDJlo83nAc9asBWWBdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=svyIX9uiDm8Hn1kx/AhH3icX9P5/XiP+fEQh3v9SkKU=;
	b=DZ/lKxDPdzIJlZm7RjQChsHMXjuAIU/Rw3P9vapUglCKTz4LPLFAHTXLNeo0NsEDLm
	5L1NbcgWmOl4cswAMsH25mvnYlJPHPpXR6hvRRN5uQfQLlhxgwfW1Vw59qLTPN9/MCFW
	WPwy3a6rypuRrE7b14JeCY5cLSdm3bNx2s8cCN99pHK5UaLzsJDJb2E4S9g/oIswOi13
	XDRp6suGLhMGTUJ+TraCBMvtjNgkxo3l3vWU96w/54xMcTkUKsNhdAIhb6zxIr6EzRVi
	//xnkmw6GMtd3gfEUl8X41apylY/weetwBhopMicnGSeemwKk3Ny1t7OrwL9hzBEXKx8
	yjgw==
X-Gm-Message-State: ANhLgQ0pxuQ6aewM+Md8TzJGE6hgsoZn3qzEGO0xUVSGG5T4N33/e3Vr
	JMi8IDFQ5QSAnbvconAa/tEqHw==
X-Google-Smtp-Source: ADFU+vsCC/ruvrbrP/jG92Zkgbhhv24fq5swKq+Ipi0qvPwOAHTQ1ZX4CVy0BklNUwY8KLj9Mm/17w==
X-Received: by 2002:adf:aa0e:: with SMTP id p14mr40825wrd.399.1583271927541;
	Tue, 03 Mar 2020 13:45:27 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a9sm616782wmm.15.2020.03.03.13.45.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 13:45:27 -0800 (PST)
Message-ID: <5251314825f750f21564e99b8e20b0de2625fd50.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Leon Woestenberg <leon@sidebranch.com>, Jacob Kroon <jacob.kroon@gmail.com>
Date: Tue, 03 Mar 2020 21:45:25 +0000
In-Reply-To: <CAMjhiJjY-9N=J03XNV=TuAUW+RAxWKfzrmM64rqPv0z_tx70yg@mail.gmail.com>
References: <20200229234742.3780-1-matt.ranostay@konsulko.com>
	<6353532b-aa0e-a005-2589-2e8281863fd5@gmail.com>
	<CAMjhiJjY-9N=J03XNV=TuAUW+RAxWKfzrmM64rqPv0z_tx70yg@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: freetype: add pixmap to PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Mar 2020 21:45:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-03 at 22:23 +0100, Leon Woestenberg wrote:
> Hello all,
> 
> On Tue, Mar 3, 2020 at 6:42 PM Jacob Kroon <jacob.kroon@gmail.com>
> wrote:
> > On 3/1/20 12:47 AM, Matt Ranostay wrote:
> > > Add pixmap to PACKAGECONFIG defaults to allow consumers to
> > > render color emojis without distro changes.
> > > 
> > > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> > > ---
> > > -PACKAGECONFIG ??= "zlib"
> > > +PACKAGECONFIG ??= "zlib pixmap"
> > > 
> > Wouldn't it make sense to keep it off by default and let whoever
> > needs it enable it ?
> > /Jacob
> > 
> I would agree, and would also vote for opt-in rather than opt-out for
> this use-case.
> 
> Do we have a more generic stance on how we select the PACKAGECONFIG
> defaults?

It feels like I've seen this come in a few times, I've said no, it
keeps coming back, I gave in.

Basically the policy is trying to keep things as sensible defaults for
the majority of users. Many of our users are concerned about build
time, space usage and minimisation of dependencies.

These things do change over time as our userbase changes and as the
demands and expectations from software changes.

In this case its fairly hard to figure out that tweaking this option
breaks emojis and libpng isn't such an uncommon or problematic library.

Its hard for me as the maintainer of all this to get a decent feeling
for how people feel about some changes so its also based a lot on feel,
there is only limited patch review a lot of the time.

If there is strong demand not to have this, we can revert it. I'd like
to see how many people do/don't want it and see a few more opinions on
that though.

Cheers,

Richard





