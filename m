Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.7155.1588601941606786943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 07:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vSQsTiyC;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id l18so10409882wrn.6
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 07:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z+4+3G1/8OtmwEbw83mN7CGHw3TVl+sMsAcZOCwl70M=;
        b=vSQsTiyCQPl7sfBb4f+mCmXpnDdOZbzSv7lWNNvr8Ow7rHAZGaqQxzLWkTibwD+jKo
         wtDOyFpMIepE+ohqlSTb3Hx8IHbuJgX4rbvNRu2nner6f13MQSs2EvBZ1CUnTUG8MLsk
         I1BssGXRazDOUtYHKQ0cetECaFM+sSIVxT3nSXoBmoQFJ1xqaKPZkSSzNnrEYKfksNju
         g2Y5rREKIv2kqmUOysCtNXYVyMpNTSw6CaUSnG7ZeeIR+ceegBqpYPOjfuNssgnYAD+c
         Sq1PV4WKu0duLwq8swJNbmtP2f5i8oncSiUpbOZiQkCNJV81wNNLrpyCsSQk/ccNllvt
         JOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z+4+3G1/8OtmwEbw83mN7CGHw3TVl+sMsAcZOCwl70M=;
        b=igWmV0LvYA59tfOteNwXaoD8l+5IoHlc/N1X32Yd1gPgM1TWWB4bcbXUrzXpl5W8QQ
         bDc15h7wS01rahBM7kkhMUIiLt3GrNn0MPOJOLbXzwiwGNeBEooNYbJUeOSfZLPHkx+X
         b/GrdsgkAw9Tlh6ID3gYTaaiE1hIiSeBAcasR7ha9duM0apMoVGSypz76s33xhcB1oWT
         eBMa0cr4msMp0YiL8ekUkcEEmPkbVgiStxKARWRlNbPVKmkskjHG//Y00fxEqWeV+nzL
         VyXkuN8AARYTo+nfp4mk9j75wUfYVAfhWKOlr1PwGLuQaoh/vkdCBB/7IuZ+/T6A063B
         ThZQ==
X-Gm-Message-State: AGi0Pua7/yNOsTG7OiRVvymCjVgnfsr+opUMbIqFGYwMzA8z2nT4YqgC
	rxSE+iA6A9hKUaiNxVvCIuuDRjIX53eUMuhK7b26iQ==
X-Google-Smtp-Source: APiQypJwIkB8dF73ZJoDKb6Xwm1dvtRWuQfWz15UpLPXYJVcD0E4up6GRzmDKbXHn5IPkhTlAcyQ2AerSwPgI9MsmGA=
X-Received: by 2002:adf:a2d7:: with SMTP id t23mr5201720wra.402.1588601939834;
 Mon, 04 May 2020 07:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587931177.git.akuster808@gmail.com> <1ef6f737d5b44b11b409ed459438666b611b7fa9.camel@pengutronix.de>
 <1339637a-51fc-d092-1c71-903feca9d6c9@gmail.com> <4c2aebfe371152c24ee60d8201882d70172867ec.camel@pengutronix.de>
In-Reply-To: <4c2aebfe371152c24ee60d8201882d70172867ec.camel@pengutronix.de>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 4 May 2020 04:18:48 -1000
Message-ID: <CAGDS+n=6x6=r0Vh6ofb0RtWwCC0PtR0pCoiVAK2Aw4JFBptmdQ@mail.gmail.com>
Subject: Re: [OE-core] [zeus 0/7] Merge request
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: akuster <akuster808@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Jan Luebbe <jlu@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2020 at 3:42 AM Jan Luebbe <jlu@pengutronix.de> wrote:
>
> On Tue, 2020-04-28 at 10:09 -0700, akuster wrote:
> >
> > On 4/28/20 9:13 AM, Jan L=C3=BCbbe wrote:
> > > On Mon, 2020-04-27 at 19:15 -0700, akuster wrote:
> > > > Adrian Bunk (1):
> > > >   openssl: Upgrade 1.1.1d -> 1.1.1e
> > > >
> > > > Alexander Kanavin (1):
> > > >   openssl: update to 1.1.1f
> > > As 1.1.1g has been released to fix CVE-2020-1967
> > > https://www.openssl.org/news/secadv/20200421.txt
> > > maybe we should just update instead of picking Zhang Xiao's
> > > "openssl:
> > > fix CVE-2020-1967" (which would conflict with this PR).
> > Thanks for the information.
> >
> > Once Master and then Dunfell have this update then Zeus can take it.
>
> It has landed in master as 8e0283e70b9977c9ac14cdab77907301405c3cee.
> Richard: Do you want to pick this for dunfell?

I'll put this in my next set of dunfell patches for review.

Steve
