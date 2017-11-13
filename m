Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA3A6FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 19:55:42 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id n79so11044176ion.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 11:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wfuksfECzTDSHLch7Bqk7qvqdkZyW9xSk4jaUId5pFQ=;
	b=EkbE7u69VaHQxTP+BwrnpDxvT2V2vhnZ1/zoERyj3mMiEizIkIaJPvhEZ/DqrTjCUy
	JkgAsEVjJ00KA5Z53LSwH/8KGGXZKhXSv6K2jFymP4DplUI9TufuOZ1BKdpN0FAcx1P5
	f3qtfDqQqd0zP8Ew1Po6hAbsc6xlp9fYKTWRPqBCNe4/POEgbnT+SZII/oOI9O8HXcvL
	JbqJQ2C3JIiAREg34JfWfYk+T//6vH3y5OIkOY8ZByBjsu7+WITgdB7H47Hn+OUY/L6J
	OsHWd+1neCKZJkQl9pcA45xsPdekAuYzDBdEhyfsUYrVssfx7EoxVdxqoiXJGOgBkRyt
	0NzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wfuksfECzTDSHLch7Bqk7qvqdkZyW9xSk4jaUId5pFQ=;
	b=mqVakeWEN81R0W8XrVgpyav9l5kMTI+rmCV4JKGFux3MSxbEZeEv/zDBCnV84SepZF
	fK2zGAQBUq5jcQ4u+wNE81gAesAfohD8Oyk24+6HZPXuenXk/s7JWNTvQFepWg/Qj1yp
	F5ZFqdvZQbYElB4KR2r5o1gt7mOdqRQkETBw8A5HmeA+CmgNiSiOb4i+timJXPurwb6T
	82cZ2QRZJ8gO/qV780d+M8Shr/XU+gfegjGmBoiZ8OVbOduYSnMf3CFDaQZTZA955CkB
	f1bfVC9POHjEX+6Gzi5Nu8+J3Q+J2z4pp9yCP+Uu+u/Cj6PcaluNRavqIYrkktg7Lo2+
	na3Q==
X-Gm-Message-State: AJaThX52hFstSnU138zSbanqZ2PcL6RZ9NCd8ulUG56PsdbKd7JSKG2e
	tpfIyBm7PSBSmaG9icrXKHteBsafp5lyBV34yr6aMA==
X-Google-Smtp-Source: AGs4zMZetcol32LNSSPQ4dqkXBAfudVM8e2Blh5/eoYaNEOuSdapCPFhpNjpWjWoN+D9knhPPu2ZyPot7yS/+Wm55Ms=
X-Received: by 10.107.146.86 with SMTP id u83mr11484289iod.37.1510602943582;
	Mon, 13 Nov 2017 11:55:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Mon, 13 Nov 2017 11:55:23 -0800 (PST)
In-Reply-To: <CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
References: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Nov 2017 19:55:23 +0000
Message-ID: <CAJTo0LaNR-YLyCX=wHTS42XimeJrfhCWwCmm-hKCwNRkJ1KFmQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Drop rng-tools
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
X-List-Received-Date: Mon, 13 Nov 2017 19:55:43 -0000
Content-Type: multipart/alternative; boundary="94eb2c054fa6d969c8055de2a787"

--94eb2c054fa6d969c8055de2a787
Content-Type: text/plain; charset="UTF-8"

Can you explain why?

Ross

On 13 November 2017 at 19:30, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Mon, Nov 13, 2017 at 3:35 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This was included to allow hwrng to feed data to /dev/random. Since the
> > kernel does this itself (confirmed by the recent kernel Kconfig text
> change
> > , code inspection and local testing), we can drop rng-tools from these
> > images.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> This is still needed for QEMU ARM.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c054fa6d969c8055de2a787
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you explain why?<div><br></div><div>Ross</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 13 November 2017=
 at 19:30, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio.s=
alvador@ossystems.com.br" target=3D"_blank">otavio.salvador@ossystems.com.b=
r</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On Mon, Nov 13, 2017 at 3:35 PM, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@<w=
br>linuxfoundation.org</a>&gt; wrote:<br>
&gt; This was included to allow hwrng to feed data to /dev/random. Since th=
e<br>
&gt; kernel does this itself (confirmed by the recent kernel Kconfig text c=
hange<br>
&gt; , code inspection and local testing), we can drop rng-tools from these=
<br>
&gt; images.<br>
&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
<br>
</span>This is still needed for QEMU ARM.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c054fa6d969c8055de2a787--
