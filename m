Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id BD28F7D075
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 19:59:15 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x2so578033qtr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 12:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ITmBBAkmbNeUn1BcFleAG+xYu2abJtadaN1LhCieQjU=;
	b=J7/85oO9qOCIuE9ckxTNYjQqF/hg6T1h7nSMLA6F2qBgsEto3seT8CuM7xBw7lpmMe
	9r8kYdCtrS9Qix86r8Bw4oxFr41R2Qvsy4HEW1rCRb+yfuQICg9wUoBgq+o7cnBPvn0O
	j2sXsu1nbdqzEuNlDKIoQpwzvAwq6u/d85WtvFzYM5tQyzLV/XyPX+vcHh9EJ5q5JPMP
	duafSGOhQmGgUOw2JcMqPJ5cQ9Gh9xYpFVoRkgXRo7NlB79goaw7pom4+KP8u73nbnO+
	usoovhPKNw5025ljoCURmUgkuqIq5uIws+RbYZ+NM8mfzJJrNuKYBVfDLeL7Gp3ytwFY
	QsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ITmBBAkmbNeUn1BcFleAG+xYu2abJtadaN1LhCieQjU=;
	b=Ir7z0A6FqR/VbzaK8+0i/YKrqw/RV0pkT2JkGBIXU1Lx7Ct+drdt70ZkPZ3IrplAT8
	Elie4Yw0diGbxugxhqoqxzRzatALvFokYThy1cX6CHWaaP8sZKSsMaGw7MIdtZcs1tB+
	vWA0aK9OhrD1FBEkGSNeRpZI0ISWWGJyNoGuMDemATb1441/FCQJTSa7eKvKtGRzhiyk
	KW+KlN3REcW2m9B8AVIvekugXe+gPh2OTfnZcbeWzjNljIL3uvUX/84mli6wQauc8BVW
	0SILXK/UKKQVjO57Is6ZQEwsxqU60QuiyIP5TwDGETCD4Jrwfv9jCBdkfOd0wjmnMWMF
	1oOw==
X-Gm-Message-State: APjAAAWxo6OE7dXNJCGTwwWbkUTfoSyk6zFyQcIVA/EVxxt7RGFZ30/7
	fFKxFObwvbnVMwHVpp0UZsw0SSWwQkDjyBl7IhcoCg==
X-Google-Smtp-Source: APXvYqyX3VBLdTCn9FjaZUORShodZG5RHReLKsuzXXS2UtitZtFAhoIxEI9fv4qmHrvT7j8m6xXp3R4oBkNXjBnC/PE=
X-Received: by 2002:a0c:b0ce:: with SMTP id p14mr35529912qvc.51.1560974356285; 
	Wed, 19 Jun 2019 12:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190614072956.13672-1-bunk@stusta.de>
	<34f4c3911dcbb9e4856848a27a87ed6f6a9a3d4d.camel@linuxfoundation.org>
In-Reply-To: <34f4c3911dcbb9e4856848a27a87ed6f6a9a3d4d.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jun 2019 12:59:05 -0700
Message-ID: <CAMKF1sruqVtNBQjDnP-BkpKhgz9HCmk-yZv=of1tPvdzfGXKOQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [RFC][PATCH] systemd: Remove clearly incorrect musl patches
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
X-List-Received-Date: Wed, 19 Jun 2019 19:59:16 -0000
Content-Type: multipart/alternative; boundary="000000000000028f55058bb2aa10"

--000000000000028f55058bb2aa10
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 14, 2019 at 4:44 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2019-06-14 at 10:29 +0300, Adrian Bunk wrote:
> > This removes clearly incorrect musl patches and marks
> > systemd as incompatible with musl until these issues
> > are fixed.
> >
> > The previous status quo where systemd was made compiling
> > with patches that are known to introduce bugs and security
> > vulnerabilities silently delivered a sub-standard package
> > to users, this change makes it clear where work is needed
> > to be done by people interested in systemd on musl.
> >
> > Patches that are merely questionable or not upstreamable
> > are not touched.
>
> I'll be interested to see what others think of this, I can't imagine
> this move being very popular...
>

There are real products using this combination
And this is not a good message, eventually we want to either fix or stop
supporting this but I think now is not the time

>
> You can make arguments both ways.
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000028f55058bb2aa10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jun 14, 2019 at 4:44 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2019-=
06-14 at 10:29 +0300, Adrian Bunk wrote:<br>
&gt; This removes clearly incorrect musl patches and marks<br>
&gt; systemd as incompatible with musl until these issues<br>
&gt; are fixed.<br>
&gt; <br>
&gt; The previous status quo where systemd was made compiling<br>
&gt; with patches that are known to introduce bugs and security<br>
&gt; vulnerabilities silently delivered a sub-standard package<br>
&gt; to users, this change makes it clear where work is needed<br>
&gt; to be done by people interested in systemd on musl.<br>
&gt; <br>
&gt; Patches that are merely questionable or not upstreamable<br>
&gt; are not touched.<br>
<br>
I&#39;ll be interested to see what others think of this, I can&#39;t imagin=
e<br>
this move being very popular...<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">There are real p=
roducts using this combination</div><div dir=3D"auto">And this is not a goo=
d message, eventually we want to either fix or stop supporting this but I t=
hink now is not the time=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
You can make arguments both ways.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000028f55058bb2aa10--
