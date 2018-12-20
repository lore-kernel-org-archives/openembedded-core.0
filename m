Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 42F7D79EE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 11:58:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m22so1857701wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 03:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=YNAkKdoMI/N4TJzeZSA+y2OPeZvWlebH7jfeX4p3Pfk=;
	b=gfNtB0uLU1yqIhzpmUwJT5jx0xNdNeheI2nLk+z++hCU+u1U7q99Gfc9KWBgYERojQ
	v7xAmUWWoOii73TE8h8pAohHsyHtoFdcnGCgX+fKBcT7Wfy6PRlAAvS5t+ivK102iPtP
	7HwLdq5rckT6Z25PuOue1FqbnLyk8Pqb6f07k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YNAkKdoMI/N4TJzeZSA+y2OPeZvWlebH7jfeX4p3Pfk=;
	b=dOswlt7DftqytfSPh4ENYeG+hpG4B620TTv0hkv/KPuI6d9wnNfcs/S/JAWVuKzDvp
	nIAFGXXfuBMHqYSZOvhrm+MOZ+jSFnxP/wvTRO/Hcv3v9YvHmZDAWTUgilJPC7rNes3W
	4zJ39yqQYOxfg/hHtOcoxTYGdIioL6WBhp06zAyLx8gT6iZkg/NalcYo87I9nqPLNqvL
	K7CyvQuIJZXA8ha9NzTPr73UCkH0JEl55L4vqYd7PxbSz6OWE40csBddQvDVCD/K6IRH
	ygLgkfSpipTfWZd1VpNUWlodLIhxlFKaWXNIff+GybDTO2+E+e9qaEFyKvE05yNEMnLc
	2vAQ==
X-Gm-Message-State: AA+aEWZcpQ79aI9BhkGs/j82AVag3cJTCso1Ze/RpKnQ0/7CTkjrpZD/
	V/U4QKt75lBnw6eIf64fojusgg==
X-Google-Smtp-Source: AFSGD/XXmcwqdmMjeXUiG08x0ZuyU8aL3dnrq3dGMakhLcQSVktKv2Fkxtin5yaNS7YTLrINMoiHUw==
X-Received: by 2002:a1c:5fd7:: with SMTP id
	t206mr11705878wmb.145.1545307138916; 
	Thu, 20 Dec 2018 03:58:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y13sm8687772wme.2.2018.12.20.03.58.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Dec 2018 03:58:58 -0800 (PST)
Message-ID: <d796d8b521000f3fce1b514cedebe1476c57df1c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Burton, Ross" <ross.burton@intel.com>, Mark Hatle
	<mark.hatle@windriver.com>
Date: Thu, 20 Dec 2018 11:58:57 +0000
In-Reply-To: <CAJTo0LZ=Q8EuXqh0s79poWhw0gcrVRouJLyaF0OxgadWqFejMA@mail.gmail.com>
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
	<CAJTo0LZ=Q8EuXqh0s79poWhw0gcrVRouJLyaF0OxgadWqFejMA@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] glibc: Remove site_config and glibc-initial
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
X-List-Received-Date: Thu, 20 Dec 2018 11:58:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-20 at 11:50 +0000, Burton, Ross wrote:
> As the only users of siteconfig are now zlib and ncurses, should we
> just rip it out entirely leaving a gap for a fresh implementation?

I'm cc'ing Mark who has a lot of the history on this.

I think we're at a point where we likely need to re-implement this in a
different way...

Cheers,

Richard


> Ross
> On Thu, 20 Dec 2018 at 00:16, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The only reason we appear to need glibc-initial at this time is to
> > support
> > the site_config code. The site_config code compiles and therefore
> > needs
> > at least some level of working C library to link against.
> > 
> > This isn't a good reason to keep the complexity of glibc-initial
> > around
> > so remove it, and the site_config support which then breaks.
> > 
> > Performance benchmarks suggest the time spent just rerunning
> > configure
> > for site_config just about equals any performance benefit for OE-
> > Core
> > image builds excluding the time spent adding glibc-initial to the
> > dependency chain.
> > 
> > I'm not opposed to readding some other form of site_config support
> > but it needs to be rethought.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


