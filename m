Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id C3FFB62133
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 01:34:18 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id n32so20897602qte.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 17:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VGibpq+icH/K2tl3uBq5tIZK9BvKZuJF871K+3+cfac=;
	b=BdwKCRGfk+tuXfvTeQplFPMwcU9OruoteTP4v3SZ/d0pL+OY3A+8m5p40K2ELW1OBp
	NL6FMEjbIB6nRVPaocCsvJ/hpGUX3GBaae35k8Jz7/B2116/4KILmwYz4Tv2tYk7XmiH
	DROpBjf0eIDNL8agVDCH3lAM9IrWbqw7oH8n/byHupxvTwxwnjglu5e1OAgxI09VSiDn
	gBJ1L3WNgzmolZEjRf3dUshLdvf+Ic+GZCGl+04+CUGcTQZTS2PdzQ/DIQY/P/+x0qb5
	yJEVRU+0acJJDIxPV2+uOEhf+e1UNANb1uWt5xNFowVGxbEEduJu4isF4qGB2b56fQit
	X85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VGibpq+icH/K2tl3uBq5tIZK9BvKZuJF871K+3+cfac=;
	b=QmY3Vkx75+vBgJf5LG4UaxDFHGT4BMdXFeKL7vWV9fSq/5oYiDjXRgdR59cmb4myco
	qd7dELYdxthoOCVLSx8AZIUbkbVYylFFqdaQA0O/AWECcr/DBXVHyD8WrCIPpBZuTkNT
	tHXnmV1e5QS2RQvsbxOQ7NVOFOkAJWjKuCzGQ7KHDjcSHZ2g7OClro+PB+3nXC9OL1ER
	aWGLeRWIW/7Isj9InQtKf2ZthlqWwg9issIrUG82SiE/yvv0AZo/x84F0EgI7pkvw7qN
	LH2ypiBM3+Y1H5Mo+7Jpb1MklwIut52IeV3J7jyQn9DhlTZQFiGdIpB+rllsAdDpKTs2
	is7Q==
X-Gm-Message-State: AJcUukfbeM71DxecgZSFaQTjwL9ahvfvnipLesLmkRjDf9xcWEJ3wcqS
	o9YDFdrTVhW2z2zO642Pww5yNB3AD9mz2cA3otY=
X-Google-Smtp-Source: ALg8bN4refWigvdr2prqGXuyR2pF0Zu45fl+OzmmxZalGQwtrVuRub5v6xIEFeskrcrEVXV0Hdo06S/zIuR0WMTmhzA=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr15633480qtc.236.1547256859214;
	Fri, 11 Jan 2019 17:34:19 -0800 (PST)
MIME-Version: 1.0
References: <8a7ab09f-a64a-71ee-f123-01b988575f0e@windriver.com>
In-Reply-To: <8a7ab09f-a64a-71ee-f123-01b988575f0e@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Jan 2019 17:34:08 -0800
Message-ID: <CAMKF1so99qQrnDPHMzh=HF=Dpg73jCOAL8BQp3HEJrC5d4_rNg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Suggest removing classes/siteconfig.bbclass
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
X-List-Received-Date: Sat, 12 Jan 2019 01:34:18 -0000
Content-Type: multipart/alternative; boundary="00000000000078476d057f38cfda"

--00000000000078476d057f38cfda
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 9, 2019 at 11:17 PM Robert Yang <liezhi.yang@windriver.com>
wrote:

> Hi,
>
> I reimplemented glibc's site config and did a lot of tests recently,
> finally,
> I found that it isn't as useful as I had thought, so I'm leaning to remove
> classes/siteconfig.bbclass.
>
> * Here are the test results of with/without glibc's siteconfig:
> $ bitbake recipe -cconfigure && bitbake recipe -ccleansstate && time
> bitbake
> recipe -cconfigure
> - gettext:
>      without: 2m38.382s
>      with:    2m33.099s
>
> - coreutils:
>      without: 1m19.967s
>      with:    1m13.574s
>
> - bison:
>      without: 0m56.203s
>      with:    0m50.134s
>
> These 3 recipes' do_configure are very time consuming, we can see that it
> saves
> about 6s for bison/coreutils/gettext's do_configure, but they need depend
> on
> glibc's site config recipe (glibc-site.bb), while glibc-site requires
> about 30s
> to build, so if we count glibc-site's 30s, it seems not worth. And I also
> tested
> again and again on core-image-minimal and core-image-sato with/without
> glibc's
> siteconfig, there is nearly no difference, about 30s in 30m (1.6%)'s
> differences, this maybe because of host rather than siteconfig. So I think
> that
> we can remove classes/siteconfig.bbclass since it is not as useful as
> expected.
>
> I've also tested remove siteconfig.bbclass (zlib and ncurses use it),
> there is
> no difference when "time bitbake core-image-minimal".
>
> The new implementation for glibc's site config is:
> - Add a recipe called glibc-site_2.28.bb, find out the top 100 used
> functions
>    and headers, and add them to site_config/funcs and site_config/headers.
> Please
>    see patches' commit message on how to find out the top 100.
>
> - Make target/nativesdk recipes depend on glibc-site when inherit
> autotools.bbclass
>
> Here are the 2 patches:
>    git://git.openembedded.org/openembedded-core-contrib rbt/glibc-site
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/glibc-site
>
>
> Please feel free to give your comments, and I will remove it if no
> objections.
>

I think if we cache all values then It probably will be faster but partial
caching will give results like you see what will be interring to see is
world build time differences when doing build from scratch
But it indeed sounds a over optimization

>
> --
> Thanks
>
> Robert
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000078476d057f38cfda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed,=
 Jan 9, 2019 at 11:17 PM Robert Yang &lt;<a href=3D"mailto:liezhi.yang@wind=
river.com">liezhi.yang@windriver.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Hi,<br>
<br>
I reimplemented glibc&#39;s site config and did a lot of tests recently, fi=
nally,<br>
I found that it isn&#39;t as useful as I had thought, so I&#39;m leaning to=
 remove<br>
classes/siteconfig.bbclass.<br>
<br>
* Here are the test results of with/without glibc&#39;s siteconfig:<br>
$ bitbake recipe -cconfigure &amp;&amp; bitbake recipe -ccleansstate &amp;&=
amp; time bitbake <br>
recipe -cconfigure<br>
- gettext:<br>
=C2=A0 =C2=A0 =C2=A0without: 2m38.382s<br>
=C2=A0 =C2=A0 =C2=A0with:=C2=A0 =C2=A0 2m33.099s<br>
<br>
- coreutils:<br>
=C2=A0 =C2=A0 =C2=A0without: 1m19.967s<br>
=C2=A0 =C2=A0 =C2=A0with:=C2=A0 =C2=A0 1m13.574s<br>
<br>
- bison:<br>
=C2=A0 =C2=A0 =C2=A0without: 0m56.203s<br>
=C2=A0 =C2=A0 =C2=A0with:=C2=A0 =C2=A0 0m50.134s<br>
<br>
These 3 recipes&#39; do_configure are very time consuming, we can see that =
it saves<br>
about 6s for bison/coreutils/gettext&#39;s do_configure, but they need depe=
nd on<br>
glibc&#39;s site config recipe (<a href=3D"http://glibc-site.bb" rel=3D"nor=
eferrer" target=3D"_blank">glibc-site.bb</a>), while glibc-site requires ab=
out 30s<br>
to build, so if we count glibc-site&#39;s 30s, it seems not worth. And I al=
so tested<br>
again and again on core-image-minimal and core-image-sato with/without glib=
c&#39;s<br>
siteconfig, there is nearly no difference, about 30s in 30m (1.6%)&#39;s<br=
>
differences, this maybe because of host rather than siteconfig. So I think =
that<br>
we can remove classes/siteconfig.bbclass since it is not as useful as expec=
ted.<br>
<br>
I&#39;ve also tested remove siteconfig.bbclass (zlib and ncurses use it), t=
here is<br>
no difference when &quot;time bitbake core-image-minimal&quot;.<br>
<br>
The new implementation for glibc&#39;s site config is:<br>
- Add a recipe called <a href=3D"http://glibc-site_2.28.bb" rel=3D"noreferr=
er" target=3D"_blank">glibc-site_2.28.bb</a>, find out the top 100 used fun=
ctions<br>
=C2=A0 =C2=A0and headers, and add them to site_config/funcs and site_config=
/headers. Please<br>
=C2=A0 =C2=A0see patches&#39; commit message on how to find out the top 100=
.<br>
<br>
- Make target/nativesdk recipes depend on glibc-site when inherit autotools=
.bbclass<br>
<br>
Here are the 2 patches:<br>
=C2=A0 =C2=A0git://<a href=3D"http://git.openembedded.org/openembedded-core=
-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openemb=
edded-core-contrib</a> rbt/glibc-site<br>
=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/openembedded-core-cont=
rib/log/?h=3Drbt/glibc-site" rel=3D"noreferrer" target=3D"_blank">http://cg=
it.openembedded.org/openembedded-core-contrib/log/?h=3Drbt/glibc-site</a><b=
r>
<br>
<br>
Please feel free to give your comments, and I will remove it if no objectio=
ns.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think if we ca=
che all values then It probably will be faster but partial caching will giv=
e results like you see what will be interring to see is world build time di=
fferences when doing build from scratch=C2=A0</div><div dir=3D"auto">But it=
 indeed sounds a over optimization</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
-- <br>
Thanks<br>
<br>
Robert<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000078476d057f38cfda--
