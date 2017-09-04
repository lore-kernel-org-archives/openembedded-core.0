Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id A3A1878170
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 09:38:10 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id z67so17784951iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 02:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MZqBeLXVDV7FvYPjjGgJVdctKoIAvhC0wrFjUzsWEPU=;
	b=yH6RrWN60eSZZMpzcc9hPygOmAAhpLMSu0NoD8UJOGQnMxvecC8EesYj1ubY8CxQbv
	8RVUY0iVx1FzRqSGS/nV6ZsVYZJbEhoj7tX7OdV60MmaQEWEO2pdsSdtr5kUk49hKDLy
	gAOUo88ZgFXNQ0rAWwkaLlNXBRUfIfaXZ9EfEugsKONOx5NeNDecUqbAAAIvQJ8CUITy
	eJM5AzC2HWLqVasLyG3EtJuJ2MeyhaxQd6jejclPenvVckMUMiz9/EHM15DsA9CLBgES
	uAHUHXeR3sCNIqJXPtMsqfW1DqmgtZaFOKNrWqYYrP+YUT43BxUwyQGM9TPTLvGKMCs2
	9gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MZqBeLXVDV7FvYPjjGgJVdctKoIAvhC0wrFjUzsWEPU=;
	b=HXpgcaKyOmX4Oqv2XDgD7XlGALZmZGAtXtecKqLFXecq8r3o8jmEJgTZzHrbqLLe+j
	0WQm6YCRhB6wWMzqnEzRVqIFuW+iIYrWc7WMpgDBABZszsuduWgpz5GC9La1XsTop/n2
	6rjW9fhXhM3rb3cQn1GcGhKTllvzzF+9u55om1frAQ3Z47KeIaU8ONXscJ/3PBF8uo/F
	n22pmuGccLdWBsCUU++73T7VQW5mmynvYzoGC1bJNHNcSPIiBJLJ7onrAlbNv3KgeCdK
	jDd3eb383zGV624WP/Z95f93aGQZ01808jKfQ07Tl69w8LHYLyUucB2juRnx7QEAsmhb
	LMng==
X-Gm-Message-State: AHPjjUhk+HKIlkUiy5Ur7oPCg+tKK61j/wIFCz6TUcolTUMU7WcL99rL
	3FYDBbQedsADYdNTX5GDwRU5/5SVcaaM
X-Google-Smtp-Source: ADKCNb4MUfCJuRX4srnHfiqMGppTdjm0+d4Wy2Wwry1avgo4LRlrMe4VF7S9L5QKm8uKl0SVLsWvLoLuyjf8gVpb0r4=
X-Received: by 10.107.53.17 with SMTP id c17mr21907ioa.117.1504517891784; Mon,
	04 Sep 2017 02:38:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Mon, 4 Sep 2017 02:37:51 -0700 (PDT)
In-Reply-To: <20170904075716.6361-1-git@andred.net>
References: <20170904075716.6361-1-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Sep 2017 10:37:51 +0100
Message-ID: <CAJTo0LZVihDnWJtkAT-a++Ogdr9F5=0gXP4kYeSJ6TM1ixu2Bw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: enable threaded resolver
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
X-List-Received-Date: Mon, 04 Sep 2017 09:38:10 -0000
Content-Type: multipart/alternative; boundary="001a114493907fa129055859de5b"

--001a114493907fa129055859de5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 4 September 2017 at 08:57, Andr=C3=A9 Draszik <git@andred.net> wrote:

> +PACKAGECONFIG[thres] =3D "--enable-threaded-resolver,
> --disable-threaded-resolver"
>

That's not the most obvious name for the option, how about just
"threaded-resolver" to make it clear?

Ross

--001a114493907fa129055859de5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 September 2017 at 08:57, Andr=C3=A9 Draszik <span dir=
=3D"ltr">&lt;<a href=3D"mailto:git@andred.net" target=3D"_blank">git@andred=
.net</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">+PACKAGECONFIG[thres] =3D &quot;--e=
nable-threaded-resolver, --disable-threaded-resolver&quot;<br></blockquote>=
<div><br></div><div>That&#39;s not the most obvious name for the option, ho=
w about just &quot;threaded-resolver&quot; to make it clear?</div><div><br>=
</div><div>Ross=C2=A0</div></div></div></div>

--001a114493907fa129055859de5b--
