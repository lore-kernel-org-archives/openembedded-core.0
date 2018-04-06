Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id AF571750FB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 14:15:33 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id m13so1920221wrj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1iDPD6UCiD/lezaq8Xl2N4wWOEMGkC37EVuFJ0K1Ico=;
	b=TJ3rC407Z6yQR3N40VTyEeE49YLWzqtdV1J7IQtWh0DnLcBwuFkAcCXTY/88Xx+EuE
	4FbZqGiZp3sMfPzQAdIK6NIlJ6tPIkgWt5V0w1WAM3YATML/V8sVD/hqfq5SQUfKxYB2
	1U+ayCvdJMBaUPBHiGFSac6kT6KRKzWX5Fv1V2yRX0vICBA8jsBafIgjWseKSnwFrFxY
	vmeNWE5abW0I16S0mYFaO4ODGhCLo2p2LOP+zHixo44D0ZiC9ih4MYzG5iytdysfN2kb
	PB9DfA/r1VlyohkSNRVstJf96x9XkdVY8R7ddu3rxE+SBcgWRrT1XDSjm22uNvbqtfyc
	yTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1iDPD6UCiD/lezaq8Xl2N4wWOEMGkC37EVuFJ0K1Ico=;
	b=gYujlhsmyefCinSun1o0YXjaMZHxQrdyMyckQtz4sBJtVRKmMZmxF9XlTgyX3KxMJC
	tvHcMKH7ME3yejcewkt0eD8KXXxLQmdCGmcL4bdaokGYU2EKtVXHWQ6O3+yUL8Pz4DHG
	lssuPnL8QmPTTOHDro0B43kha2Jr7BaaZS9VOsjmiDO4T3UloUaZtA0pwXzvamHznd1w
	4iwGagZmsm9orS/lcSxYETi1P7/N52VQVq0UGFdkGLLUBsKMHXP/pGs6LeqOdqNEeHNg
	7XkgpxzqVYnwAms70iTV5sWuEoPjBL3u+VRoUa9BRV+MirKo4BxLFSzuJxuyMdLhNK6r
	sYUA==
X-Gm-Message-State: ALQs6tDmss1G7RaRi8PCsC3oDAejzhWnl89udkc2UtQRj2G8E9DPHYk1
	vaCmun/u9qTith3atcUNYonBlqW7Wr1uL9b1cFc=
X-Google-Smtp-Source: AIpwx49CI0ivVWshqzjATHEpB9iNGgfwHSYqlDdx8mCFBSzdeTq1DWd3Yb9IaxF04cf6EdkC1Vr93jizZqZvHM/LnyI=
X-Received: by 10.223.189.14 with SMTP id j14mr2694691wrh.138.1523024134074;
	Fri, 06 Apr 2018 07:15:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Fri, 6 Apr 2018 07:15:33 -0700 (PDT)
In-Reply-To: <1523023909.2942.8.camel@linuxfoundation.org>
References: <cover.1522936224.git.akuster808@gmail.com>
	<CAJ86T=XmqNbTF+qXWhG5xFHNBUnRCaDx5DKeTQ_Y+wfqhgbiyg@mail.gmail.com>
	<CA+chaQf17H2+HKJ6V=+tGnL7xkH_ocPRj7j_hBWSG5e2AKV31w@mail.gmail.com>
	<1523023909.2942.8.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 6 Apr 2018 16:15:33 +0200
Message-ID: <CA+chaQeM2cRQZ+pHtjDQEBZZGydA8wnThTThsq-+HZmpjTkfjA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/38] Morty Next pull request
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
X-List-Received-Date: Fri, 06 Apr 2018 14:15:33 -0000
Content-Type: multipart/alternative; boundary="089e082fcdb87ef69305692eb014"

--089e082fcdb87ef69305692eb014
Content-Type: text/plain; charset="UTF-8"

In this build I was starting with empty TMPDIR, there shouldn't be any old
files, but will retry manually in different builds.

On Fri, Apr 6, 2018 at 4:11 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2018-04-06 at 16:07 +0200, Martin Jansa wrote:
> > > Is it safe to backport to morty, which doesn't have RSS?
> >
> > It doesn't work well for me, all the builds are now failing with:
> >
> > ERROR: glibc-2.24-r0 do_stash_locale_setscene: The recipe glibc is
> > trying to install files into a shared area when those files already
> > exist. Those files and their manifest location are:
> >    TMPDIR/sysroots-components/aarch64/glibc-stash-locale/SUPPORTED
> >  Matched in b''
> >    TMPDIR/sysroots-components/aarch64/glibc-stash-
> > locale/lib/libnss_nisplus.so.2
> >  Matched in b''
> >    TMPDIR/sysroots-components/aarch64/glibc-stash-locale/lib/ld-
> > 2.24.so
> >  Matched in b''
> > ...
>
> I suspect using its own sstate task is ok in morty even if it didn't
> have RSS. What may have broken is the existing TMPDIR upgrade path
> though :(
>
> If the files are removed, I suspect things will then work out ok. There
> were manifest handling changes in later versions which dealt with this
> kind of issue better (removals before installations).
>
> Cheers,
>
> Richard
>

--089e082fcdb87ef69305692eb014
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In this build I was starting with empty TMPDIR, there shou=
ldn&#39;t be any old files, but will retry manually in different builds.</d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Apr 6,=
 2018 at 4:11 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfou=
ndation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">On Fri, 2018-04-06 at 16:07 +0200, Martin Jansa wrote:<br>
&gt; &gt;=C2=A0Is it safe to backport to morty, which doesn&#39;t have RSS?=
<br>
&gt;<br>
&gt; It doesn&#39;t work well for me, all the builds are now failing with:<=
br>
&gt;<br>
&gt; ERROR: glibc-2.24-r0 do_stash_locale_setscene: The recipe glibc is<br>
&gt; trying to install files into a shared area when those files already<br=
>
&gt; exist. Those files and their manifest location are:<br>
&gt; =C2=A0 =C2=A0TMPDIR/sysroots-components/<wbr>aarch64/glibc-stash-local=
e/<wbr>SUPPORTED<br>
&gt; =C2=A0Matched in b&#39;&#39;<br>
&gt; =C2=A0 =C2=A0TMPDIR/sysroots-components/<wbr>aarch64/glibc-stash-<br>
&gt; locale/lib/libnss_nisplus.so.2<br>
&gt; =C2=A0Matched in b&#39;&#39;<br>
&gt; =C2=A0 =C2=A0TMPDIR/sysroots-components/<wbr>aarch64/glibc-stash-local=
e/<wbr>lib/ld-<br>
&gt; <a href=3D"http://2.24.so" rel=3D"noreferrer" target=3D"_blank">2.24.s=
o</a><br>
&gt; =C2=A0Matched in b&#39;&#39;<br>
&gt; ...<br>
<br>
</span>I suspect using its own sstate task is ok in morty even if it didn&#=
39;t<br>
have RSS. What may have broken is the existing TMPDIR upgrade path<br>
though :(<br>
<br>
If the files are removed, I suspect things will then work out ok. There<br>
were manifest handling changes in later versions which dealt with this<br>
kind of issue better (removals before installations).<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--089e082fcdb87ef69305692eb014--
