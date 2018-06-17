Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 55BA0744D3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 14:04:29 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id l64-v6so8098343vkl.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y/hn5MaL5/kGs7kiifQl7e3hPcMqDW4hswOLjxGvGSw=;
	b=dqipw5C3h/rcJ6rLjQ+b3zYrdFb9cAuPnGmXJkY9TrWCcdc+jiHKPeVtKhuLvW7hhf
	/3cP4GlFlkKq9WkeocNQ2KEWgUYewOLPiN6eHWm/Q2tjJi5L7h6E2nyFHt3+FdtO+99i
	raJiUX5KN+9/iUG6Rwjn+pDiXSPROLuz/xFj0/bcYGLKe9UYb4Elyd/WhuL9JZK7Yw4G
	bXIWnadvNxuON3tbZyRYmpSLgM4YoT5YQHzd1o4RKFdvEjkg3KxJ9qj9GKola5Xec0hm
	6ZcRuYfei65ijvtuWgl+lPGTuV6/8e+OUwlfrTnWG1p8kILd/fwzzApUxgj3552SZugM
	CeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y/hn5MaL5/kGs7kiifQl7e3hPcMqDW4hswOLjxGvGSw=;
	b=PCx6YC7mBwTCUhszzH8z2O4+Q+ss/VTWAEzs+tA9Pww73DdkOD4o9TIKUUepQK361Q
	On2VTvs7jtgXQJRlbFidMQVfgbv79WMUAIyXOdNCuo+qUFVP75iZE7SKZaYPht1VUmCL
	QZZe/zKdQt5ghyVEs+634ALbJNOUOcmO8zx9NePMXlJWWrKLnB9T6B5QoliTjBNKq59h
	+OzZ9XvRxdmNF17URCzQmjsou8Ql4PRfFQwu9ADxNCJRQbpOTNz5zJV5mZ8wEixpaHSk
	6zeJlFH5jRIvdiWqylAWbUQJFTz8KlS5dmDQalQmpQGn/TYC51sVYKNhYR90iD5BuCmF
	zVpw==
X-Gm-Message-State: APt69E3Io8SrojMeEGIpGPErXB5l/ogGFZ4d1A87rjJ4kmhaFUKbnZBV
	kIy42/lq/YJmV5Vkvqk8I04o1PJ1qS0n+BrROUo=
X-Google-Smtp-Source: ADUXVKIZOtJddkdykOELH9df+y4WWZZnS3c2MR48sJCh5QBSRjE85rphUF4QlipLgRMM+9bEBeSea2JrBVV81hJ9a4c=
X-Received: by 2002:a1f:5244:: with SMTP id
	g65-v6mr5131448vkb.28.1529244269925; 
	Sun, 17 Jun 2018 07:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <1529051705-100332-1-git-send-email-mingli.yu@windriver.com>
	<83c024358c85f13cf3a8d0d021b090cc755af1a3.camel@linuxfoundation.org>
In-Reply-To: <83c024358c85f13cf3a8d0d021b090cc755af1a3.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Jun 2018 07:04:18 -0700
Message-ID: <CAMKF1sqeoLNzuAV8W_LjNk0fNDQDKVT1dF-Hwsv4OTuesib84w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] boost: Improve reproducibility
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
X-List-Received-Date: Sun, 17 Jun 2018 14:04:29 -0000
Content-Type: multipart/alternative; boundary="0000000000007bdd6f056ed6ed5d"

--0000000000007bdd6f056ed6ed5d
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 17, 2018 at 2:17 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2018-06-15 at 16:35 +0800, mingli.yu@windriver.com wrote:
> > From: Mingli Yu <Mingli.Yu@windriver.com>
> >
> > Set .file section explicitly for .S files to avoid
> > the linker introduces the host path in symbols for
> > object files whose source file is .S
> > Otherwise, there is a host path in the symbols as
> > below:
> > $ readelf --wide --symbols /my-build/boost/1.67.0-
> > r0/boost_1_67_0/x86_64-poky-
> > linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e
> > d/libboost_context.so.1.67.0
> > 42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-
> > r0/boost_1_67_0/x86_64-poky-
> > linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e
> > d/asm/make_x86_64_sysv_elf_gas.o
> >
> > [YOCTO #12708]
> >
> > Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> >
> Thanks for working through this, the final result is a much better fix!


If we add this directive to all the .S files there
Then it can be up streamed too

>
>
> Cheers,
>
> Richard
>

--0000000000007bdd6f056ed6ed5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Sun=
, Jun 17, 2018 at 2:17 AM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Fri, 2018-06-15 at 16:35 +0800, <=
a href=3D"mailto:mingli.yu@windriver.com" target=3D"_blank">mingli.yu@windr=
iver.com</a> wrote:<br>
&gt; From: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.com" target=
=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
&gt; <br>
&gt; Set .file section explicitly for .S files to avoid<br>
&gt; the linker introduces the host path in symbols for<br>
&gt; object files whose source file is .S<br>
&gt; Otherwise, there is a host path in the symbols as<br>
&gt; below:<br>
&gt; $ readelf --wide --symbols /my-build/boost/1.67.0-<br>
&gt; r0/boost_1_67_0/x86_64-poky-<br>
&gt; linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e<=
br>
&gt; d/libboost_context.so.1.67.0<br>
&gt; 42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-<=
br>
&gt; r0/boost_1_67_0/x86_64-poky-<br>
&gt; linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e<=
br>
&gt; d/asm/make_x86_64_sysv_elf_gas.o<br>
&gt; <br>
&gt; [YOCTO #12708]<br>
&gt; <br>
&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.com=
" target=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
&gt; <br>
Thanks for working through this, the final result is a much better fix!</bl=
ockquote><div dir=3D"auto"><br></div><div dir=3D"auto">If we add this direc=
tive to all the .S files there=C2=A0</div><div dir=3D"auto">Then it can be =
up streamed too</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000007bdd6f056ed6ed5d--
