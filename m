Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id B970D7EB0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:48:52 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id v6so71824535vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U/g4DmsmZYAIgbkvRuyi5Ldwy/GDMDtacxdJscVFQ5g=;
	b=gaZ8USP1E7o638r2k6NVTgqyi8CSNYzfVW8TC98WRmRBL0OnpEKThuUexdvmoVHunN
	0/K/S1gBbtOkuVRhkycdXkrCwNM+MXv13z3zXXcOt6yoHmJxNhsH0aYN/O2Pim/EFPFG
	2a5Q+eUZxFOj6oPPdup7yqzfKLlo60RfBeF9J5ieimki9JV2m2vZCoIc0QTFcHxRO75H
	BwpVznyHBnoR4vnqWx299Xk7t+SJxPqqUn9zczAem2Pm7UJbeTDrwcxQ0D7OHE4rpx2b
	9p0NGdZp3XGjnar04Mo4OacnCHVtNsZ/h6khp5sl8eA5QLxvIhTlBypo1EK+AbJ8RLZA
	iI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U/g4DmsmZYAIgbkvRuyi5Ldwy/GDMDtacxdJscVFQ5g=;
	b=YO+mZ9TYy23S/d5CwcNDlExeuTEgd3NcU1BjacD7QLEkOjqSM5yAQsW0BhHF8LGGAC
	jkNyItQcotCL4ldioNBlJu9okhYWcbNSFSv3Lh0ZalStCyv4QyHeR5BjPBmOJuYV0fRM
	v7CxIEbyenSNjRak2CRCO2agf6R5yVQW7J7R6tIWIu6Sr1F+QCn8qQxMkZxfuWBKDLsq
	4rhjio6tM57hCnYc5/mYRZrwT8dkfvbGSzsYPN/Arn376/QymM8XjPTUilHNqdbXAFpW
	u6nSzYEEwioWHEcv2/lSFtqU1jI1qd1KcjjE5FdEUoEZ1Ttbmwj7/NuP9Zf44++6R/nt
	7cww==
X-Gm-Message-State: APjAAAWIs7+EyOezSr30/5qcZle/hhOotgDszfS7W41QZ+biuqRuOljk
	6VVXtlaShxILMrhQeeZAn5K+tD1aL02yC8Qr+pw=
X-Google-Smtp-Source: APXvYqxf6AQ/YF/vYZR4TwOzUzNUCTWg30zB/JUAZW4+vIz6iVJ0OFBc9N7jTn2lVF6feV2wquOm4fZ/gd305xt3I3Q=
X-Received: by 2002:a67:62c5:: with SMTP id w188mr8707798vsb.25.1565689733918; 
	Tue, 13 Aug 2019 02:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
	<94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
	<CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
	<CAMKF1squwmc8-sm+JMM6gU5oyHSKHv7ejRoOokTdb4Nd-SEk2A@mail.gmail.com>
	<CAMKF1soSXrDEHu+0v7v052EpCfXwu=+_ysWiwDcd=HY7oaBU8Q@mail.gmail.com>
	<CANNYZj81jgzZP0VNSbpA6RVh=JDc7748XszNEOJ9Dz+qf+8hmQ@mail.gmail.com>
	<CAMKF1sqRZGqR7pquRdqjfqs0=PAKB_5C2W6p_uwM9uTHZeD2GQ@mail.gmail.com>
	<CANNYZj9GsfTokbQG0LW4pBiY6tPQ1Dhv8oiED3VZoyNQuzaLJw@mail.gmail.com>
	<af18d5171f0ee3f44d8bb3396335d5ed2f029157.camel@linuxfoundation.org>
In-Reply-To: <af18d5171f0ee3f44d8bb3396335d5ed2f029157.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Aug 2019 11:48:42 +0200
Message-ID: <CANNYZj8j11TyVNSBbxMeH3gcT01tz5QsUdM89ZxrtKhPbU_o8w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Tue, 13 Aug 2019 09:48:54 -0000
Content-Type: multipart/alternative; boundary="0000000000006b3366058ffc8c3b"

--0000000000006b3366058ffc8c3b
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Aug 2019 at 22:50, <richard.purdie@linuxfoundation.org> wrote:

>
> > world builds seem to have regressed (preparation time wise) even
> > without having hash equivalency. Just oe-core is bearable, but adding
> > meta-oe layers makes it spent many minutes after initializing tasks
> > but before any tasks actually begin.
>
> Is that with master or current master-next?
>
> I'm curious if master-next is better or worse...
>
> To be honest I'm worrying more about correctness right now.
>

Certainly. I didn't want to raise this now as you have plenty on your
plate, but as Khem did, I had to chime in.

This was with master@9983b07fffd19082abded7c3f15cc77d306dd69c.

Alex

--0000000000006b3366058ffc8c3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 12 Aug 2019 at 22:50, &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br>
&gt; world builds seem to have regressed (preparation time wise) even<br>
&gt; without having hash equivalency. Just oe-core is bearable, but adding<=
br>
&gt; meta-oe layers makes it spent many minutes after initializing tasks<br=
>
&gt; but before any tasks actually begin.<br>
<br>
Is that with master or current master-next?<br>
<br>
I&#39;m curious if master-next is better or worse...<br>
<br>
To be honest I&#39;m worrying more about correctness right now.<br>
</blockquote><div><br></div><div>Certainly. I didn&#39;t want to raise this=
 now as you have plenty on your plate, but as Khem did, I had to chime in. =
<br></div><div><br></div><div>This was with master@9983b07fffd19082abded7c3=
f15cc77d306dd69c.<br></div><div><br></div><div></div><div>Alex<br></div></d=
iv></div>

--0000000000006b3366058ffc8c3b--
