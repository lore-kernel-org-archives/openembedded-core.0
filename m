Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A89EC745EF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 15:55:30 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id s12-v6so8551453wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZjZZe+ho9XrwEvYGlrt+qNvlvgKBiut1K8DTaTVtzDc=;
	b=SrR2/+IuEdgtgG5BwLSN26ob5Kt68SKQyEgjmld9BKK/deujC7uvhrbC+1kTEwVyuU
	hW1CxCFNp0dIRl+8TGR9XJHhgIddHvM9NX7oX556hKDu4agjyuUpiYKLdnotsYq9eFyN
	OxS/650ewmk5REW2g4GKV/Ddvg7vo1efn2w6FPl8YToeSeKYfz8VcYzbWtFWE9pcRshi
	2nnbZOpS/L1K5l9loe2YxEwA9ByLOx1zvkuBEqKm8766wrIBDSlbzW8ebdQZs+LKvN/0
	Q8sB3Y7wheF5kW67/DtVhHsCNd8h1ZbqBBRYpn1dn8qzZWkPSzgzH/HjeFlQQ1/LBsea
	PFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZjZZe+ho9XrwEvYGlrt+qNvlvgKBiut1K8DTaTVtzDc=;
	b=rgDg0rVhPV2IlCi34iMmcff9q9yMqx5TkbOdZEwvBirq43y6UPbeNZViKmIf6IJMPC
	w+698MyquTFQg5qIM3GyCHXHm1kzwmObnSQYYlTym5Po63rsn4Bqa8uYk3XCJ2jFVUph
	TdNoqfdfW3BuebUWqW7Zsn9wxhztN6NiF8YIoRDi1C7BwklSu8nf3upxftsnCahlK6C4
	Ytk2+CpgccwUYYr1SatPBl6b7tFle4Y4ckSLrDHoYpJkr84mtzNi6m2SR85eZDW9+DRw
	+Qbzyk9JEOzzLt6fAoJ0SdoyiqYVSAbeZS9vZiiZFTaK3eXiuuyglyCEVnqP++5LzO3L
	Nxqw==
X-Gm-Message-State: APzg51Asusm7O8lV7RAXGr7uHAy/sgDB6fD+NsyZNthtSUycKxn6xvo0
	yTtEff7O3uqMZarWXKM6jgkytmVUmrjpgPD00sA=
X-Google-Smtp-Source: ANB0VdbgbQ216SieFAVzFdK1vy6BWflPE/cAb6SyOoaaWzSsMOJn8YRSZDHUbZF11HT9kZ0hf0npRaxJeuKsylT0WnA=
X-Received: by 2002:a1c:bb0a:: with SMTP id l10-v6mr651459wmf.32.1536162931148;
	Wed, 05 Sep 2018 08:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
	<CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
	<CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
	<CAMKF1sqWuf8sQj7TA_G-prWpOB5mtXo7F8k_K0bj2ufHXRa6Yg@mail.gmail.com>
	<CANNYZj9rQ-vFT09JPs0pJ46HEYK8_UNzA5Di9G6OXosHOKt3mQ@mail.gmail.com>
	<20180905085322.GA1795@jama>
	<e7847d5e6eb6103ddf02e6da14a1449227e5665a.camel@linuxfoundation.org>
	<CAMKF1sqynK2-5b9ex5fcLW3s2XTH086Ajps_-50stxVvGX9xLQ@mail.gmail.com>
	<CAJ86T=V78dXJH8rOdN2LAshL8UqsC5aJ_njU8Dra9M=tCcBhgg@mail.gmail.com>
In-Reply-To: <CAJ86T=V78dXJH8rOdN2LAshL8UqsC5aJ_njU8Dra9M=tCcBhgg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Sep 2018 17:55:19 +0200
Message-ID: <CA+chaQdkmKDwrAT1Cq-tYApxMKHrSx36QDdLEAHaXp4GO+h0UA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Wed, 05 Sep 2018 15:55:30 -0000
Content-Type: multipart/alternative; boundary="000000000000d40b9f057521cdf6"

--000000000000d40b9f057521cdf6
Content-Type: text/plain; charset="UTF-8"

https://wiki.debian.org/OpenSSL-1.1 says it will cause runtime bugs like
segmentation faults or just misbehaving applications.

On Wed, Sep 5, 2018 at 5:45 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, Sep 5, 2018 at 8:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, Sep 5, 2018 at 7:45 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Wed, 2018-09-05 at 10:53 +0200, Martin Jansa wrote:
> >> > But patching the components to use libssl10 might actually work
> >> > (unlike
> >> > just changing DEPENDS to openssl10).
> >> >
> >> > It's not only conflicting in build-time in RSS, but it will conflict
> >> > on target as well. You either need to migrate all components included
> >> > in image to 1.1 or all stay on 1.0.
> >>
> >> That isn't quite the case. For OE-Core we have images using both 1.0
> >> (openssh) and 1.1 installed together. Its true there are some issues if
> >> you try and parallel install both the -dev packages but normal target
> >> images are working.
> >>
> >> We could probably "fix" the -dev images to an extent by making 1.1
> >> replace 1.0 dev pieces.
> >>
> >> The build time sysroot problem is harder unfortunately, I've ideas
> >> about things we might be able to do but haven't experimented as yet.
> >>
> >
> > If runtime conflicts are clear
>
> I don't think the runtime issues are clear.
>
> Being able to install both versions of openssl on the target and have
> them be used by different applications is one case (already solved by
> different sonames).
>
> But the builds that are failing in meta-oe are a different case - a
> single application is indirectly linked against both versions of
> openssl. Loading two versions of openssl into the same address space
> at runtime hasn't been solved... and may not be realistically solvable
> - e.g. what happens if code in an app compiled against openssl 1.1
> tries to share an openssl data type with code in a library compiled
> against openssl 1.0?
>
> > I think we can install the headers into /usr/include/openssl10/
> > and dev libs into /usr/lib/openssl10
> > and provide a openssl10.pc file to we can use pkgconfig in packages
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d40b9f057521cdf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><a href=3D"https://wiki.=
debian.org/OpenSSL-1.1">https://wiki.debian.org/OpenSSL-1.1</a> says it wil=
l=C2=A0cause runtime bugs like segmentation faults or just misbehaving appl=
ications.<br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr">On Wed, Sep 5, 2018 at 5:45 PM Andre McCurdy &lt;<a href=3D"mailto:armc=
curdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Wed, Sep 5, 2018 at 8:15 AM, Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote=
:<br>
&gt; On Wed, Sep 5, 2018 at 7:45 AM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 2018-09-05 at 10:53 +0200, Martin Jansa wrote:<br>
&gt;&gt; &gt; But patching the components to use libssl10 might actually wo=
rk<br>
&gt;&gt; &gt; (unlike<br>
&gt;&gt; &gt; just changing DEPENDS to openssl10).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It&#39;s not only conflicting in build-time in RSS, but it wi=
ll conflict<br>
&gt;&gt; &gt; on target as well. You either need to migrate all components =
included<br>
&gt;&gt; &gt; in image to 1.1 or all stay on 1.0.<br>
&gt;&gt;<br>
&gt;&gt; That isn&#39;t quite the case. For OE-Core we have images using bo=
th 1.0<br>
&gt;&gt; (openssh) and 1.1 installed together. Its true there are some issu=
es if<br>
&gt;&gt; you try and parallel install both the -dev packages but normal tar=
get<br>
&gt;&gt; images are working.<br>
&gt;&gt;<br>
&gt;&gt; We could probably &quot;fix&quot; the -dev images to an extent by =
making 1.1<br>
&gt;&gt; replace 1.0 dev pieces.<br>
&gt;&gt;<br>
&gt;&gt; The build time sysroot problem is harder unfortunately, I&#39;ve i=
deas<br>
&gt;&gt; about things we might be able to do but haven&#39;t experimented a=
s yet.<br>
&gt;&gt;<br>
&gt;<br>
&gt; If runtime conflicts are clear<br>
<br>
I don&#39;t think the runtime issues are clear.<br>
<br>
Being able to install both versions of openssl on the target and have<br>
them be used by different applications is one case (already solved by<br>
different sonames).<br>
<br>
But the builds that are failing in meta-oe are a different case - a<br>
single application is indirectly linked against both versions of<br>
openssl. Loading two versions of openssl into the same address space<br>
at runtime hasn&#39;t been solved... and may not be realistically solvable<=
br>
- e.g. what happens if code in an app compiled against openssl 1.1<br>
tries to share an openssl data type with code in a library compiled<br>
against openssl 1.0?<br>
<br>
&gt; I think we can install the headers into /usr/include/openssl10/<br>
&gt; and dev libs into /usr/lib/openssl10<br>
&gt; and provide a openssl10.pc file to we can use pkgconfig in packages<br=
>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000d40b9f057521cdf6--
