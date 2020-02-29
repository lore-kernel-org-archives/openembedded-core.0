Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id DF4C86197C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 20:44:51 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z12so6449581qkg.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 12:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dgqbTeXI7fIePMam0MJ7Zgn3W7kcDI7H3s8jxpEeHzg=;
	b=GW8tOeqPcU2Vf5ECSEZoRS6x9ZdXtL9pFclAp/6LyReJrpal3S2RAtxBG8MqLywA5o
	IeaFcqEjYB9V/mzfYvP9MJ4KTI4rwVxdIUhFutrCgO45KCNatXemJ/v7kOQFjqS4qPLc
	VTpCu4hdEd9lq+xwBOeqk9VlyM34cdkoizwD4S0jd8Cm24Xh0DldSgJ3bl7IA4P6mg1S
	CMxOXrY8LpY6D1KKACa64i5rKX3Yn8q8kSh2Q9lGsn70Bq2JOmkSlBhOohjzAQkHMR9t
	L1Vti+0UmX0OB7eY2e+lrEUhRgJVvroNcxDLhIP+HVa88y4zGiu8+sWB6TBbj8hiIP/J
	2GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dgqbTeXI7fIePMam0MJ7Zgn3W7kcDI7H3s8jxpEeHzg=;
	b=L9SZpiIQDULDHaE6xEXWQ9CziSi7MFvHxj3b9SSvFS3HJ/1EvE1X/zs2qioZ6fmPG+
	eir17q/jd6XpOcSEQVAsQjYkLePY+nYh6uN7l5V2ND7tqtmqVrIqvzLyqSHzGih6zWEp
	yQQEdKepmWivDbzl1Skft756zlwu2Y9XGdp0nygVEWLHNi8cEgAZW9Rk05p0JFG8wfI2
	6KXF+Df1ytgaRPCHiv3GrQh2Q/mDOG7EkrG9UxPfN3IoRBg350Mu2dOGD+0JbHN4em1p
	GYIdKp56m3qJZ01VnGlwZvA0OTOMru1kNnpoQDb9A77BKMwSpZj9mNg/jTKPtqamyRQE
	kEJQ==
X-Gm-Message-State: APjAAAXx1ruv3GM1Bc9TloaX5ZicXCmleRrkHXlx6PxoBLvptgmirVQL
	LgjNjTior6IFXz0lRNSKJY4KdzvewyW2F3rpyzk=
X-Google-Smtp-Source: APXvYqzA47u65s13RSmw6inB8J5sefFnPkXlx6QqomDmSt9+kAvNdVHMJrJVCIeoz0uf+yB0HZF6+V4HNjrBVzXJQKQ=
X-Received: by 2002:a37:47c4:: with SMTP id
	u187mr10130202qka.165.1583009092355; 
	Sat, 29 Feb 2020 12:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20200228175731.10604-1-petr.vorel@gmail.com>
	<e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
	<20200229064656.GA4045619@x230>
	<4db943be8cba440551847721156d22f9664cca0a.camel@linuxfoundation.org>
	<da2bffd2ba22435a66a17044f922ab555d7a3ede.camel@linuxfoundation.org>
	<20200229184006.GB13422@dell5510>
In-Reply-To: <20200229184006.GB13422@dell5510>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Feb 2020 12:44:40 -0800
Message-ID: <CAMKF1spkOJfT0Gg4GaKQRUroPQEXtge0B_G6hZaCgL7wsXCC1A@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 20:44:52 -0000
Content-Type: multipart/alternative; boundary="000000000000a04af1059fbd06c2"

--000000000000a04af1059fbd06c2
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 29, 2020 at 10:40 AM Petr Vorel <petr.vorel@gmail.com> wrote:

> Hi Richard, Khem,
>
> > I was able to confirm that fts is in the recipe sysroot and that the
> > compile step is running "make -j 88 LIBC=musl LIBS=-lfts", i.e. its
> > being passed in to ltp. Beyond that I'm a little out my depth to know
> > how/why its not ending up where it should unfortunately. At least the
> > issue does appear to reproduce though...
> Is there a way to compile only LTP and the necessary build dependencies?
>
> if I run this:
> . oe-init-build-env
> MACHINE=qemuarm TCLIBC=musl bitbake ltp
>
> It takes ages and compiles many things (gnutls, iptables, expat, procps,
> tar, ...).


Yeah first time it will have to build all the dependencies unfortunately
but thereafter it should be incremental

Your command is right to build ltp only for musl

>
>
> Kind regards,
> Petr
>

--000000000000a04af1059fbd06c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Feb 29, 2020 at 10:40 AM Petr Vorel &lt;<a href=3D"=
mailto:petr.vorel@gmail.com">petr.vorel@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Hi Richard, Khem,<br>
<br>
&gt; I was able to confirm that fts is in the recipe sysroot and that the<b=
r>
&gt; compile step is running &quot;make -j 88 LIBC=3Dmusl LIBS=3D-lfts&quot=
;, i.e. its<br>
&gt; being passed in to ltp. Beyond that I&#39;m a little out my depth to k=
now<br>
&gt; how/why its not ending up where it should unfortunately. At least the<=
br>
&gt; issue does appear to reproduce though...<br>
Is there a way to compile only LTP and the necessary build dependencies?<br=
>
<br>
if I run this:<br>
. oe-init-build-env<br>
MACHINE=3Dqemuarm TCLIBC=3Dmusl bitbake ltp<br>
<br>
It takes ages and compiles many things (gnutls, iptables, expat, procps, ta=
r, ...).</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah fir=
st time it will have to build all the dependencies unfortunately but therea=
fter it should be incremental=C2=A0</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Your command is right to build ltp only for musl=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
<br>
Kind regards,<br>
Petr<br>
</blockquote></div></div>

--000000000000a04af1059fbd06c2--
