Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 708887FCCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 18:53:30 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e12so625101qto.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 10:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WqfAQabJmdfwu+B6Vy/o28EMVZCYdhUrkoO/XNlZZbc=;
	b=Q2OhsEUGvWQ+vC5Dai/xjr3uAyOY3KXL6+knvV+3JnLqYCJlJ/enSwUnsTu6NK/ou0
	uyXo+hxErQcEJKuegCAUSBSc2JoaSvy0nOJNpdG+W3bgeOAfF6OnOuiEvDDjYZ8XywFr
	tmk0lhuPck4/iyKIqD6spAKzOmzkeA2vGuMSVq9e360r4zy2VG+Mmg4BndhAN6zhHUnk
	itXPF1Jw1jzhnZvHXLHG8K5aOY1BPUnUncIUWdEOOeG8uA/XIQZdAQ5DcXt5/GyNh7ZG
	hhpguw/NJW7pQnrjCRdlpegZQJpmPppB7TvJR6kGauK3SCNIPyNUhE/n0zgZB9Dx3L6h
	09HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WqfAQabJmdfwu+B6Vy/o28EMVZCYdhUrkoO/XNlZZbc=;
	b=ZU1TNhmtwsCMjcKcAh5tqoSChi8wohYnWnuQlt1fWn1UGnuSih2S3OqsRBXA57KjXv
	XiHjkq1OQmifSLcAwbY+ckL2jknmdU1yyWVMcQcfDNsld/P6e02kwx6xqeQ5g33E26zU
	iozZeHYCBdkhwIuN1lBJEEoDrpkpvuGXEJ437P8yi0bwX68N6bPRaj7qRsf3KFi4eUYq
	p1n7Bmo/I5W3qssjhx38XQxLSZHsiU6zU4gL9I38fbjbPu312noM19m2GWKn50uCmNMp
	FXtsaY9CfpQ7MT8oSbCgax9S1okboT82ywP2kwpVipyejvUnhiv8Wu6vbEACvhHElQiv
	xQug==
X-Gm-Message-State: APjAAAUCRDTJDQ7DuqqrREftLy7qpzA1NQ3RrnUM8hxrkDbb9pgjt5N4
	5MoN/CCTxdtpRTfs/5/f0DOYAAiK0rQlE3mZZG8=
X-Google-Smtp-Source: APXvYqz8sHARuFoZEiLmikLdEIUhLEqbmmIpqmriJo1zrx10bqXqQzxrIlk2ChB+Y1sQsOyg3t60uFUPqxy36awLrHg=
X-Received: by 2002:ac8:5257:: with SMTP id y23mr798884qtn.88.1579546411022;
	Mon, 20 Jan 2020 10:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20191018112819.16210-1-ross.burton@intel.com>
	<CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
	<1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
	<9bac0b45-777c-faba-f448-d2d03c7e6fac@geanix.com>
	<CAMKF1soa5bEfN23uPAhDCk4rfD_OGjaf2xR+m5ET9cLt+kOn0Q@mail.gmail.com>
	<f6cb669c-d302-c1fa-e2ed-5995b82677ed@intel.com>
In-Reply-To: <f6cb669c-d302-c1fa-e2ed-5995b82677ed@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jan 2020 10:53:19 -0800
Message-ID: <CAMKF1spO9BCYm4xSKUGNQW5ABy9_5Qz9CkqQGtFhiZHvsR1jxA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] file: explicitly disable seccomp
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
X-List-Received-Date: Mon, 20 Jan 2020 18:53:30 -0000
Content-Type: multipart/alternative; boundary="000000000000bc3d22059c96ce1d"

--000000000000bc3d22059c96ce1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 9:10 AM Ross Burton <ross.burton@intel.com> wrote:

> On 20/01/2020 15:45, Khem Raj wrote:
> > pseudo needs some love since it alters syscalls which go out of bounds
> > what is allowed by libseccomp until then pin your file version to 5.37
> > in arch till a supported distro is affected by same problem. It wont
> > be long better option is to fix pseudo
>
> That's not quite right.  pseudo LD_PRELOADs itself into file, and makes
> syscalls which are not whitelisted in file's seccomp configuration.
>

It=E2=80=99s is not different than what I was saying how it inserts itself =
into
process is a detail which is hidden from operating system

However I think file is only one case when used along with libseccomp there
could be more use cases if other host tools we use start using it

So I wonder If we should start building own native versions of tools or
make it part of build tools tarball
Or perhaps just publish a self built container and not worry about what
distros are doing underneath

>
> There's nothing pseudo can do to solve this.
>
> Ross
>

--000000000000bc3d22059c96ce1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jan 20, 2020 at 9:10 AM Ross Burton &lt;<a href=3D"=
mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On 20/01/2020 15:45, Khem Raj wrote:<br>
&gt; pseudo needs some love since it alters syscalls which go out of bounds=
<br>
&gt; what is allowed by libseccomp until then pin your file version to 5.37=
<br>
&gt; in arch till a supported distro is affected by same problem. It wont<b=
r>
&gt; be long better option is to fix pseudo<br>
<br>
That&#39;s not quite right.=C2=A0 pseudo LD_PRELOADs itself into file, and =
makes <br>
syscalls which are not whitelisted in file&#39;s seccomp configuration.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s is =
not different than what I was saying how it inserts itself into process is =
a detail which is hidden from operating system=C2=A0</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">However I think file is only one case when use=
d along with libseccomp there could be more use cases if other host tools w=
e use start using it</div><div dir=3D"auto"><br></div><div dir=3D"auto">So =
I wonder If we should start building own native versions of tools or make i=
t part of build tools tarball=C2=A0</div><div dir=3D"auto">Or perhaps just =
publish a self built container and not worry about what distros are doing u=
nderneath=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
There&#39;s nothing pseudo can do to solve this.<br>
<br>
Ross<br>
</blockquote></div></div>

--000000000000bc3d22059c96ce1d--
