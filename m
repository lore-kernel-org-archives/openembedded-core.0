Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id B32076B06C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:02:31 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 21so4432962qky.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 14:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Up0d7F5KdwBfl8hJ3X4Nc5LeAIaDF4aQ/7oIwDvb2qQ=;
	b=tQ610SRioKkNUGvo9G/dEiWzOYi9HdM9VFNLjPITANPHzfp/WkzhxiTEv5U0iycSW0
	2kXNx/GsMq93Jd6AsR3l6gXrUxvuDFa/sMcu7cHih7iuPIOBDn7eNjI6WRub0n26Bxip
	aixfB2UNT8HuwJoVieWAGVD73/1jvEF/XyecdJqvcAp5D3LpOUXVgknOMDpiGosHnYaG
	PoDWpqebdaDIqN0h91VlFJdhbccZwfS9fJ9DVpPnCKry5vFqHPKZ7qus0Y0vh+tDw3aD
	mN0EqrOuwUP7X+GRPLCTjbR0pixKc/0R0y/LLECirtF0uwpNW3/H3pK/eGcEWEa23hb6
	0JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Up0d7F5KdwBfl8hJ3X4Nc5LeAIaDF4aQ/7oIwDvb2qQ=;
	b=k6i7vb9UEdJPLMgqSKh/OpbHP0U/NvP/k9I7RtQFfZtZe1i+WG4hAyFiwCs3HG3TiI
	nUPMjLPKd8jFLxQLK4fIHA6MndgGky8dMmaPHtk+SJwehBuwqtgqXWE+0/GHrNDsKPZ4
	sMhu+H/zJHaGoa2FhYfHBjqWXcV6bhU7sroJOioRgNml9iNFyk42VaVzmA6IBYFQVg56
	dED+MSzkXs7nw5ygooybrlYNXFUo79y123MpdghhSKmpROA/g6ZzA+b48Vljzs2kjdhe
	bjL7Ln6LurNR3jOiZ6dryx3nFJnZAaM3KjKGbA+li+8TjvMKrEekUl+Jrugxv1WdK0oT
	sAIQ==
X-Gm-Message-State: APjAAAUymBkuIdEkgOcKq+oARIkvPnzK7R95DdCIcpVACUpR7GDiuFFy
	MlLFM/8fdcRaYeieQJru3l2K/KO76KpfDhn91QQ=
X-Google-Smtp-Source: APXvYqy3eCofhLntzMDjR5H72oBrmg988cvGU1PQbqpSHcpq0j+sdKvRR6Tjunb+5do7z7MoeT30YZzFWmkUn8G6TAA=
X-Received: by 2002:a37:a3c7:: with SMTP id m190mr7025805qke.212.1579644152525;
	Tue, 21 Jan 2020 14:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-5-alex.kanavin@gmail.com>
	<CALbNGRTcVRb7obS2g8d6fipNUervDr0ZYvJ+izLmCJH4h5QRyQ@mail.gmail.com>
	<1ccb46bd9806f74f4c61b774754e314ca72c368c.camel@linuxfoundation.org>
	<CAMKF1srhnkkSETdWK0Jb0V8OV-4bwpCLJ7MhJuJ9dOx5T3VzUQ@mail.gmail.com>
	<1776d7f035ce96fa5a1b3759e83fdd6c611dca15.camel@linuxfoundation.org>
In-Reply-To: <1776d7f035ce96fa5a1b3759e83fdd6c611dca15.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2020 14:02:21 -0800
Message-ID: <CAMKF1sqvV4xj1p+h6Yjt08L4h9w2YfVSDqLF9J7yW7N8t2-HLA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/24] nss: update to 3.49.1
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
X-List-Received-Date: Tue, 21 Jan 2020 22:02:33 -0000
Content-Type: multipart/alternative; boundary="000000000000953987059cad9006"

--000000000000953987059cad9006
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 12:22 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2020-01-21 at 11:35 -0800, Khem Raj wrote:
> > This is failing on qemuarm btw
> >
> > http://errors.yoctoproject.org/Errors/Details/307410/
>
> That is odd as it passed testing on the autobuilder. It must be
> something tune specific :(
>
Thanks

While my builds are dealing with py2 things this seems not related but I do
have gcc10 in my mix
So it could be future build break I need to triage it a bit more and see
what=E2=80=99s going on


> Cheers,
>
> Richard
>
>

--000000000000953987059cad9006
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 21, 2020 at 12:22 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2020-=
01-21 at 11:35 -0800, Khem Raj wrote:<br>
&gt; This is failing on qemuarm btw<br>
&gt; <br>
&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/307410/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Det=
ails/307410/</a><br>
<br>
That is odd as it passed testing on the autobuilder. It must be<br>
something tune specific :(<br>
</blockquote><div dir=3D"auto">Thanks</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">While my builds are dealing with py2 things this seems not re=
lated but I do have gcc10 in my mix</div><div dir=3D"auto">So it could be f=
uture build break I need to triage it a bit more and see what=E2=80=99s goi=
ng on</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000953987059cad9006--
