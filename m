Return-Path: <ryan.harkin@linaro.org>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id D34B77E45D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:53:21 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id o17so3071499qko.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 05:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sjRxzk0dqt7E22M5LqmOCT8S1/baReonAaRxo29POu0=;
	b=kaT9TUiFPQY5ULm2pHIGJNj7agosEDPlJ12PNjhHQSjABj1VO/lvkKi38oi2P9KPPy
	KxmzMaiAjF3+ujbAgPDT6tbT+htPr215A//JUbPNCiB050elquyTz7Q7Jnc6IWIft4fX
	tvwKirDKIyB8c25zQKocKlz0KlOyZJNCoC/hcVEhljhhFaLnmeLLzs9cRrukj+XDrPJJ
	0QIz8teGt8QP0NygWNpmRTc7+QHpjqFHaE84S1WWP+W9xSQXjgbVLutN4Z+gsIlQ8m/e
	FDgI9mDHDzKoUL7jxsPN+ETGSMUpHOwMg35672P7rbnRNN4o55BVdOhkUa7R2t7bgbho
	4Fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sjRxzk0dqt7E22M5LqmOCT8S1/baReonAaRxo29POu0=;
	b=brhd3PBzsLUR3B7rytw20wSw5o5Z+a3ijPA6zFW1qxdRF0tFEww7L2MRxbcA+1dMb6
	YfMRGr012cqRhJ6dFVm3BCTHnoVcZ+dkz4PIs5Oxb6HmPFmeWwkFYzpOw7CJezDUQG0E
	fLYOheQ0wK/4ffHEEIvC0DqtWxN4XWRoDNTc/NaOCynzLWsD4WuCSVqJpsn0hM5vq8G2
	fnYDJLhK1hxTCM/sXYsDtU5+B6oVRyeqUJuavhZX/TmfQn2Vu1gPFFsBuXV9ONzfNpsP
	F2fQWa6gMRV06Guqys28gbdTC3o6AE7eA1maSC8SRXOj9GY8pVTzfURAKTkUhiDRv2fJ
	JtYQ==
X-Gm-Message-State: APjAAAWe1kVY8XgClfP3WoML6rCbC6LLCcdCyuRd7Rpcf2+mWznRz2pm
	ig3oyaUniqPRQjVhEL3jK+KtkRGUH0q7XEB64uKMnA==
X-Google-Smtp-Source: APXvYqzkdIw5jKRLvzTcgk6SHuFHKCv4g+WB+KUMBsuD+Wij4V9stZkE9iYM6dEsow9Gg6WjQe0baeq8LqvSyxqzCac=
X-Received: by 2002:a05:620a:1375:: with SMTP id
	d21mr8138697qkl.285.1574344402620; 
	Thu, 21 Nov 2019 05:53:22 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
	<CAD0U-hKMtXR+tvpS45D9=+XqaZVZBs7jMm9U3Vk7r+mJuVW5-A@mail.gmail.com>
	<CAD0U-hJ96imEfDwAyMQyjvABmaNYxEexQWNvpHJr+wsNzpGSbw@mail.gmail.com>
	<CAJ86T=Ucx125+XdRrpnh64km1WypAyyc1fUN5pWbjXzmUSXu3g@mail.gmail.com>
	<CAD0U-h+RGNRr2omcsCdKkD7qsnbQiGqW3MzGc93ZtgmVXEagLA@mail.gmail.com>
	<CAP71WjyEBYf-XaaMGceZ_+78=vJKGT6=n_3HnRk_OXkZEBm8UQ@mail.gmail.com>
In-Reply-To: <CAP71WjyEBYf-XaaMGceZ_+78=vJKGT6=n_3HnRk_OXkZEBm8UQ@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Thu, 21 Nov 2019 13:53:10 +0000
Message-ID: <CAD0U-h+TuUCazHeoW_nHBwFSju2UYtBE8C0A_Vsw2F8BiktXNQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Thu, 21 Nov 2019 13:53:22 -0000
Content-Type: multipart/alternative; boundary="000000000000df91e20597db9e7f"

--000000000000df91e20597db9e7f
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Nov 2019 at 13:39, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> On Thu, Nov 21, 2019 at 2:15 PM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >
> >
> >
> > On Wed, 20 Nov 2019 at 23:53, Andre McCurdy <armccurdy@gmail.com> wrote:
> >>
> >> On Wed, Nov 20, 2019 at 2:41 PM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >> > On Wed, 20 Nov 2019 at 21:29, Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >> >>
> >> >> I pulled the whole openssl dir from your repo, added the layer.conf
> changes to my layer.conf and rebuilt openssl and my image.
> >> >>
> >> >> Unfortunately, I still have no /usr/bin/openssl in my disk image. So
> I've added the RPROVIDES from Andre's in a vain attempt to get it to work:
> >> >>
> >> >> RPROVIDES_${PN} += "openssl-bin"
> >> >>
> >> >> ... although I'm not hopeful it'll do the trick...
> >> >
> >> > It didn't work. Once thing that's puzzling me: where is the package
> "openssl-bin"? I can only find references to it, but no package.
> >>
> >> The "openssl-bin" package is created by the openssl 1.1.x recipe.
> >>
> >> Adding "openssl-bin" to RPROVIDES in the openssl 1.0.2 recipe is a
> >> solution for users who are switching from openssl 1.1.x back to 1.0.2
> >> and have an image which is tries to include the new openssl-bin
> >> package. I don't think that's what you are trying to do (?).
> >
> >
> > Correct. I only tried it because the 1.0.2t recipe wasn't working.
> >
> > To be clear - I have /usr/bin/openssl in my image when using 1.0.2p from
> the Poky Sumo branch. When I add the 1.0.2t recipe to my own layer, openssl
> builds without errors, but I don't get the binary.
> >
> >>
> >> If you are using openssl 1.0.2 then the openssl command line tool is
> >> in the openssl package... so to include the openssl command line tool,
> >> add the "openssl" package to your image.
> >>
> >> If you are using openssl 1.1.x then the openssl command line tool is
> >> in the openssl-bin package... so to include the openssl command line
> >> tool, add the "openssl-bin" package to your image.
> >>
> >> But anyway, in all cases, the way to debug what's going on isn't to
> >> try random recipe changes and then rebuild the final image. Instead
> >> you should build your chosen version of openssl, look in the
> >> packages-split directory to see which package includes the openssl
> >> command line tool and then add that package to your image.
> >
> >
> > I don't have a packages-split. I was unaware of it, and reading the
> manual, it seems I should have one. But I don't. Running 'bitbake -e
> openssl | grep "PKGDEST="' tells me I should have one, but there are no
> instances in a directory called "packages-split" in my tmp dir.
>
> most likely because you are using rm_work.
>

Yes, I am! Thanks, Nico.


>
> >
> > Anyway, I'm giving up for now. I'll come back to another time... or more
> likely, get someone smarter than me to sort it out ;-)
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000df91e20597db9e7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 21 Nov 2019 at 13:39, Nicolas=
 Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.deches=
ne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Thu, Nov 21, 2019 at 2:15 PM Ryan Harkin &lt;<a href=3D"mai=
lto:ryan.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt=
; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, 20 Nov 2019 at 23:53, Andre McCurdy &lt;<a href=3D"mailto:armc=
curdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Nov 20, 2019 at 2:41 PM Ryan Harkin &lt;<a href=3D"mailto:=
ryan.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt; wr=
ote:<br>
&gt;&gt; &gt; On Wed, 20 Nov 2019 at 21:29, Ryan Harkin &lt;<a href=3D"mail=
to:ryan.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt;=
 wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I pulled the whole openssl dir from your repo, added the =
layer.conf changes to my layer.conf and rebuilt openssl and my image.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Unfortunately, I still have no /usr/bin/openssl in my dis=
k image. So I&#39;ve added the RPROVIDES from Andre&#39;s in a vain attempt=
 to get it to work:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; RPROVIDES_${PN} +=3D &quot;openssl-bin&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; ... although I&#39;m not hopeful it&#39;ll do the trick..=
.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It didn&#39;t work. Once thing that&#39;s puzzling me: where =
is the package &quot;openssl-bin&quot;? I can only find references to it, b=
ut no package.<br>
&gt;&gt;<br>
&gt;&gt; The &quot;openssl-bin&quot; package is created by the openssl 1.1.=
x recipe.<br>
&gt;&gt;<br>
&gt;&gt; Adding &quot;openssl-bin&quot; to RPROVIDES in the openssl 1.0.2 r=
ecipe is a<br>
&gt;&gt; solution for users who are switching from openssl 1.1.x back to 1.=
0.2<br>
&gt;&gt; and have an image which is tries to include the new openssl-bin<br=
>
&gt;&gt; package. I don&#39;t think that&#39;s what you are trying to do (?=
).<br>
&gt;<br>
&gt;<br>
&gt; Correct. I only tried it because the 1.0.2t recipe wasn&#39;t working.=
<br>
&gt;<br>
&gt; To be clear - I have /usr/bin/openssl in my image when using 1.0.2p fr=
om the Poky Sumo branch. When I add the 1.0.2t recipe to my own layer, open=
ssl builds without errors, but I don&#39;t get the binary.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; If you are using openssl 1.0.2 then the openssl command line tool =
is<br>
&gt;&gt; in the openssl package... so to include the openssl command line t=
ool,<br>
&gt;&gt; add the &quot;openssl&quot; package to your image.<br>
&gt;&gt;<br>
&gt;&gt; If you are using openssl 1.1.x then the openssl command line tool =
is<br>
&gt;&gt; in the openssl-bin package... so to include the openssl command li=
ne<br>
&gt;&gt; tool, add the &quot;openssl-bin&quot; package to your image.<br>
&gt;&gt;<br>
&gt;&gt; But anyway, in all cases, the way to debug what&#39;s going on isn=
&#39;t to<br>
&gt;&gt; try random recipe changes and then rebuild the final image. Instea=
d<br>
&gt;&gt; you should build your chosen version of openssl, look in the<br>
&gt;&gt; packages-split directory to see which package includes the openssl=
<br>
&gt;&gt; command line tool and then add that package to your image.<br>
&gt;<br>
&gt;<br>
&gt; I don&#39;t have a packages-split. I was unaware of it, and reading th=
e manual, it seems I should have one. But I don&#39;t. Running &#39;bitbake=
 -e openssl | grep &quot;PKGDEST=3D&quot;&#39; tells me I should have one, =
but there are no instances in a directory called &quot;packages-split&quot;=
 in my tmp dir.<br>
<br>
most likely because you are using rm_work.<br></blockquote><div><br></div><=
div>Yes, I am! Thanks, Nico.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Anyway, I&#39;m giving up for now. I&#39;ll come back to another time.=
.. or more likely, get someone smarter than me to sort it out ;-)<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000df91e20597db9e7f--
