Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 59A53748A9;
	Tue, 22 May 2018 16:14:55 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id a137-v6so17260887wme.1;
	Tue, 22 May 2018 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=58hSeY6GxHVaOjjvebh11uYyf6B66R54PJ+dbq0E0dM=;
	b=pKRy6/1OU4wHoJjw0ynAXWUBpXm/lbFQlBaoDq2akCrCtAEiIKF9afW81cLOsXzXu0
	h2HGJsU1Bc01EecPMnjOqbpOdy1DOn6v5M/57xAdZ/iU9a9PVR36gdi3d58+VfZMpC1m
	ww+RGGqui55fL882CgZj7HS5D17UWAPkzrirLmZ4oD4k8bYzK5zaSHvJIWzQM4+Y2Ny7
	xqgW0UbiqvtONzt/94deJSl+fRlBN1AWsGUeC0cc7HK4Tfb1NzzenvIct0AjMneDC9Id
	f5KLT4bHY43EJGlqnyWW4wNh86uRF7zpyPL8LRIx3Jn+0ZyflJgZXkXeFc46fHhm226E
	129w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=58hSeY6GxHVaOjjvebh11uYyf6B66R54PJ+dbq0E0dM=;
	b=BwS04MROSWBecWPs4Yd/0XMwWmCNQLnbv1NJbuGSkV92ufXE6E5EKnHf5IYv4xQfxW
	FXNkUtxKhQJg+9021OWNWBSnRp8PVzQLBGa46/gb7tW+BpLXelBfKIFBZKr/K/EXjl6X
	fsIWkjAxy4S5h2t+4jW9+7+COVJHRwh27uwlyx1qMzxB0YaYBBofY6lpJPdxKb65oSFk
	LV6Sl2mCCgMb6jF5lLn8sLfR2iyCqiNi+UTZAO7vhtPp81SEJ/IWuL4S1TOg6LRQOgi5
	hWGbiIuX6VfhhV9gANR5vyKIYewD94NbUATR2fyPP2RuV7UVJYZygmeGpqjWOg/CknR/
	6fOg==
X-Gm-Message-State: ALKqPwcDl+ISRFMNniwxkYeJIeXD93ITDB0vthwQUMI/1GEjcw9E8HKw
	kocmuyUGFVz3Pjtej9CLyoMLjTkKczW/NUmU5A4=
X-Google-Smtp-Source: AB8JxZqXF1/gyEIPKVQo0WXOtkqBz13ADWwRHtP17/qMHKy0H3dqKTvREDXWvNPVt9n8nPDTyVZ4I4HEdLSAM/STJn4=
X-Received: by 2002:a1c:cc08:: with SMTP id h8-v6mr1869196wmb.79.1527005695870;
	Tue, 22 May 2018 09:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
In-Reply-To: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 22 May 2018 18:14:44 +0200
Message-ID: <CA+chaQe-1BaJFNARyK4wBh-vSmC=HqpcLHj=i_tHMrq-sa0x1A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-openembedded maintainer ship change.
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
X-List-Received-Date: Tue, 22 May 2018 16:14:55 -0000
Content-Type: multipart/alternative; boundary="000000000000128a97056ccdb837"

--000000000000128a97056ccdb837
Content-Type: text/plain; charset="UTF-8"

Thanks Armin and Khem!

On Tue, May 22, 2018 at 5:41 PM akuster808 <akuster808@gmail.com> wrote:

> Hello all,
>
> After much thought, I have decided to step away from being the
> meta-openembedded maintainer, patch wrangler and builder.  Khem Raj has
> kindly stepped up to continue these activities. Maintaining this was
> consuming too much of my free time and I need to focus on other things
> in the community.
>
> Thanks for the opportunity to have served you.
>
> Kind regards,
>
> Armin
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000128a97056ccdb837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Armin and Khem!</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr">On Tue, May 22, 2018 at 5:41 PM akuster808 &lt;<a href=3D=
"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hello all,<br>
<br>
After much thought, I have decided to step away from being the<br>
meta-openembedded maintainer, patch wrangler and builder.=C2=A0 Khem Raj ha=
s<br>
kindly stepped up to continue these activities. Maintaining this was<br>
consuming too much of my free time and I need to focus on other things<br>
in the community.<br>
<br>
Thanks for the opportunity to have served you.<br>
<br>
Kind regards,<br>
<br>
Armin<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000128a97056ccdb837--
