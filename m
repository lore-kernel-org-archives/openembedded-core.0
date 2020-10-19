Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.4859.1603138227541133234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 13:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QGg5C9yP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 13so732594wmf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/vLdq3ay73nIhy/pe4uKt5WCef1nSN4qCbrKQqAnfkE=;
        b=QGg5C9yP6dFRVy/AQs4+pdiW564nUGYWl/zerVPtnzyI3JRQYt0/wu7Bp5UWhEdbWh
         GMrJT+AMXNHkg83aGGibU+aJPrHwjdd4e3g9rGMof2VH3q2tuqZlV06pTrWEKtOn/tOx
         yHJ1pxNl5kBpOs5SVrO2UnhAo+/5S4DoboQto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/vLdq3ay73nIhy/pe4uKt5WCef1nSN4qCbrKQqAnfkE=;
        b=EaEsGYY/6LZ6s5Ckj/SJ7YrnEYEmzSawIGxOT5AkOVSei9VgID2rdRJb7Tl9EBxueo
         tBe55QnqTuHsIdtkLiBsl1eQfVf3czXEyYluwRqjxSEjysLddD6pHdRmEHhQOl1W4z+F
         XThCyru9mh7JKaATCY5UlCemHUgZkz2RzoZcLcTEHd620NpjWtYiUOKZJpQz1jTTdOdu
         SE8iqwbo0d9oaxRfFhlqDdPV3U6+Q2MPo9BMPrYI787nS5o5VGfcQcaZ/DvlVEeKpfHC
         lSWnGIe+pX48J8TXPsvQv8XOWyQk9YxCnz3AWVQ+paojayUSx83EwGqvvv/FJg3i7m9s
         VRmw==
X-Gm-Message-State: AOAM532QUZdpEluaw7RIOXTGW8r0CLpYuXhH749M44n2DpCCNNE0FmrN
	V7B3nqBc3DhmQD+z/BmD2/bIUQ==
X-Google-Smtp-Source: ABdhPJzYi1cOycDmPeUfsPUxyl/EFqnPG5M/k8DND8SnnbaZSX9rPjGNyRQcq6U3OxDF+kQ1gN7dfA==
X-Received: by 2002:a1c:87:: with SMTP id 129mr882518wma.103.1603138225999;
        Mon, 19 Oct 2020 13:10:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.c.4.c.b.d.d.d.d.1.e.7.a.1.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.c.4.c.b.d.d.d.d.1.e.7.a.1.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1c1a:7e1d:dddb:c4ce])
        by smtp.gmail.com with ESMTPSA id v6sm922941wrp.69.2020.10.19.13.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:10:25 -0700 (PDT)
Message-ID: <c455d8210a548fb7dc5f81e9cd24a72980108c81.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] busybox: add rev and pgrep
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Andrej Valek <andrej.valek@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Diego Sueiro
 <diego.sueiro@arm.com>
Date: Mon, 19 Oct 2020 21:10:24 +0100
In-Reply-To: <CAJ86T=UNe-e5N9SLmwC=2Vto0og8aV-bmA2YF1dB9bV3R1Ujxw@mail.gmail.com>
References: <20201015054600.24514-1-akuster808@gmail.com>
	 <27107.1602752871157273119@lists.openembedded.org>
	 <DB8PR10MB39778008487808091759D8AB92030@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
	 <9ea47af9eca270bea1b3e468f530dad782023a44.camel@linuxfoundation.org>
	 <CAJ86T=WvteSbKp3W5UvEQDVsUDh=SRvq20kP343PLQZMmQV_uA@mail.gmail.com>
	 <618b0ed0615813e02e06dbc2068c5398cae15c4d.camel@linuxfoundation.org>
	 <CAJ86T=UNe-e5N9SLmwC=2Vto0og8aV-bmA2YF1dB9bV3R1Ujxw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-19 at 13:04 -0700, Andre McCurdy wrote:
> On Mon, Oct 19, 2020 at 12:57 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2020-10-19 at 12:55 -0700, Andre McCurdy wrote:
> > > On Mon, Oct 19, 2020 at 6:25 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Fri, 2020-10-16 at 16:48 +0000, Andrej Valek wrote:
> > > > > Why are you not enabling these configs correctly via
> > > > > defconfig?
> > > > 
> > > > I'd wondered about that. I didn't really want to block the
> > > > fixes on
> > > > that discussion and am trying to pick the best places for
> > > > discussion
> > > > but I'd take patches tweaking this.
> > > 
> > > It would be good to clarify this. At one stage the advice was
> > > "the
> > > more fragmented the better". Does that no longer apply?
> > > 
> > >   https://lists.openembedded.org/g/openembedded-core/topic/72273944#68672
> > > 
> > 
> > The fragments need to be useful. We could create a fragment per
> > config
> > option but that would clearly not be particularly useful/usable.
> > Its a
> > question of common sense, which is hard to document explicitly :/.
> 
> We have individual config fragments for sha1 and sha256 based on your
> advice in 2015. Has that been useful or usable?

I said I was torn, there was a second opinion that the fragments in
question were useful so we ran with that. I didn't say "the more the
better". My comment was specifically directed at keeping the login
pieces separate which I do still believe is the right move.

The distro situation was different 5 years ago, it would be interesting
to see if any layers did end up overriding the checksum pieces. If they
didn't, they likely can be merged IMO. Or maybe there should be one
checksum fragment with our defaults in?

Cheers,

Richard

