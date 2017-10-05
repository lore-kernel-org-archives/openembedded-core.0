Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id F3AE87804E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 14:32:00 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id p185so1543486itc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 07:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GPjSynnX2ye2mtRkLi5Osgf7ZXdFEREsJ9kOQr/SUc0=;
	b=kSNqjFub3liJjTiRWwB3y7GFBv04RwfRqo+fXwkvLuPErM06p89wkuP6IajMDufrFc
	rj18r85kzWpR0u30hQQCiAVmV41XVK1R6aHOivX7cj7xwQwLopGpYXDCoPLbAnNmw1fE
	ekSMXkZz5+etu01bLqRsy0sm/OBEHHCd5Fd2votqTtiNDccGGWzvEZqwAkEzFJNVAPTb
	WR3rEwtEDaK+Hdjab7aCMfZePyWV0zszPzXj49oLA6TCSOiyLkEctpwPzYGJnIot2lzE
	eZQsvgFHIbiDPUDe0dS8quMqXD+3YWgkKMWt4SY4dK45hwCy1LuHyMoqQ0Lm5ME6VOFJ
	P5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GPjSynnX2ye2mtRkLi5Osgf7ZXdFEREsJ9kOQr/SUc0=;
	b=nyVQsji52jZlL48a3AC3xoIcpR+5zjEvCl3gPmo84CQE+bu71clDKj9DoDwoxBLWF3
	TAwifF3a12anvcBSmFK9yNiO/JTfVhudTutWK3F96wngVohSPvB0Hh7SMMxqUfKRD8Ar
	4+tuOsa4G/3qjkIhwcyMQV+7b+uWDyG4sO5wd8jKKc4oBgSDtmiqjKuRk60BF/TI3iMF
	U3nCkayuZ9pl44C6j8bCGSmM0JkIupZAs2UZGzUsQIqyv3JMenYlNBK71p8YL902HmIl
	eszlHOQpVJruDqp5bkb/sLp47Fm5ZjfpTVvQOJ94F4IJdvqNg70OBcdTBUe671Qyy36x
	z7tA==
X-Gm-Message-State: AHPjjUh4+a4vCj3KoHtqBeMbXTH8rY1UqnRwjuvsV8mS1BS40uXIhDtd
	c6BvyQbDUQ1kip2vZG4UpEEJmWoFSLM5PSb6/d46Wg==
X-Google-Smtp-Source: AOwi7QC1TwuFA/TuFoX1ZAZmdXiSX6rHX4OxMcyxokbGtMvSDHnUYiv3n1vZLqp/LtWE/EdIcHJJLawlrV0ZcRJw7D4=
X-Received: by 10.36.150.4 with SMTP id z4mr34870939itd.48.1507213921767; Thu,
	05 Oct 2017 07:32:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.59.22 with HTTP; Thu, 5 Oct 2017 07:31:41 -0700 (PDT)
In-Reply-To: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Oct 2017 15:31:41 +0100
Message-ID: <CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Illegal instruction when running go binaries in qemux86
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
X-List-Received-Date: Thu, 05 Oct 2017 14:32:01 -0000
Content-Type: multipart/alternative; boundary="94eb2c07ea9868716c055acd96cf"

--94eb2c07ea9868716c055acd96cf
Content-Type: text/plain; charset="UTF-8"

On 5 October 2017 at 15:23, Paul Barker <pbarker@toganlabs.com> wrote:

> So my question is: should we just set GO386 = "387" so that it applies
> to all go binaries and accept the slight loss of performance on x86
> systems that do support sse2 instructions? Or should we make this
> MACHINE specific so that sse2 instructions can be used where
> supported?
>

Definitely machine-specific.  Need a way of mapping from OE tunes to Go
options that control the instructions used.

Ross

--94eb2c07ea9868716c055acd96cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 October 2017 at 15:23, Paul Barker <span dir=3D"ltr">=
&lt;<a href=3D"mailto:pbarker@toganlabs.com" target=3D"_blank">pbarker@toga=
nlabs.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">So my question is: should we j=
ust set GO386 =3D &quot;387&quot; so that it applies<br>
to all go binaries and accept the slight loss of performance on x86<br>
systems that do support sse2 instructions? Or should we make this<br>
MACHINE specific so that sse2 instructions can be used where<br>
supported?<br></blockquote><div><br></div><div>Definitely machine-specific.=
=C2=A0 Need a way of mapping from OE tunes to Go options that control the i=
nstructions used.</div><div><br></div><div>Ross=C2=A0</div></div></div></di=
v>

--94eb2c07ea9868716c055acd96cf--
