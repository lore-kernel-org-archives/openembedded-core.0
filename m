Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id EDED76E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 18:30:55 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id e64so7037647vkg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 10:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wx3aqjfbTVnTRMaFpvEyZCwOGaty/q9svLdciUVIypM=;
	b=SkqbsOFschbyf/0YF6pZIDfUWPcKIK3Btb/OQTLN6P3ywtocIfP47Q2VvUdL17zZov
	ZPrnUorMptAB4kQsv4NqcfjphRZHH8L3WZFdshN3h6Cc0Z8ISu519gTix8LFJsqoC+G5
	bOtpX7iqa+7ixULes3u24w/V6ENPl8rVC7JRWGH5K/NXOjSqNOitgWQ8/qmPQdeKaLNN
	hG+kGlVPz0WI4Eo6l8hx4fdoFftPl0xRehvYxpQjxo27e1HIrk2UR60rHvWTAff4l+me
	9hDSSZjsn4aRlTGP1IKyh5PWpwEN0ldyVhSImMcjVt9yslgVmOS9KSt8Rd6YVFxwjl/7
	Zu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=wx3aqjfbTVnTRMaFpvEyZCwOGaty/q9svLdciUVIypM=;
	b=BUGPj2BCdXIWzOh9JvZ8eF9m2Eft8Kx5Pkl5T5/7pj85RfLQedwHiJ2VQu8dXmwz7w
	eogosHeY53ozi3T0hxcTv9uWPMUZCPSJXCjGSlSEWNOzzMoYsIUf4ieRejWkSL15BMLm
	spAjjN7ZjDKLlecjouywpX8E1FZjMrg3KyTS24Wr7xGpdcI+56gARjIKui3JqWF9tt7O
	g8hh5jZ83cAeMVWwCcTHTuTNMFd2pkrOzurxK7o67HLmIyETkOejXaY46Qrf2giwfYgm
	JdsfZWUs5ma1am6AmwL7M8SsVyuTDthbY+GBcOk6SaZzm7wFh5pb+SVJE6CpWIQd5uYa
	AQRg==
X-Gm-Message-State: ALoCoQnr8V1q3/Kf16tHnweJ3XBul86THSXNJiRw45ip6DM3bXmMjPJ04C21useRTxu5kxlQDLG3Zxe+JVdaHl+ncQGMTa9h1w==
MIME-Version: 1.0
X-Received: by 10.31.44.77 with SMTP id s74mr8642369vks.4.1452882655796; Fri,
	15 Jan 2016 10:30:55 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Fri, 15 Jan 2016 10:30:55 -0800 (PST)
In-Reply-To: <1452881834.27999.0.camel@rpsys.net>
References: <1452754008-158464-1-git-send-email-jian.liu@windriver.com>
	<1452881834.27999.0.camel@rpsys.net>
Date: Fri, 15 Jan 2016 13:30:55 -0500
Message-ID: <CADkTA4PUxjss-jTsyy9T+Tb+X8GqGZu0PMJ5tzOTEXgNsT+VUA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-libc-headers: set ALLOW_EMPTY
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
X-List-Received-Date: Fri, 15 Jan 2016 18:30:56 -0000
Content-Type: multipart/alternative; boundary=001a11c075a29971080529639a36

--001a11c075a29971080529639a36
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 15, 2016 at 1:17 PM, Richard Purdie <rpurdie@rpsys.net> wrote:

> On Thu, 2016-01-14 at 14:46 +0800, Jian Liu wrote:
> > If setting IMAGE_INSTALL += "linux-libc-headers", do_rootfs will
> > cause
> > error.
> >   ERROR: linux-libc-headers not found in the base feeds
> >
> > This is because that there is no linux-libc-headers.rpm generated.
>
> There is no point in generating an empty package just for the sake of
> it. Surely you just shouldn't put that in IMAGE_INSTALL?
>

Agreed. We can cook up all sorts of invalid/empty package names that
won't work, some things are better simply as a learning experience if
someone tries it :)

Bruce


>
> Cheers,
>
> Richard
>
> > Signed-off-by: Jian Liu <jian.liu@windriver.com>
> >
> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc
> > -headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc
> > -headers.inc
> > index 2ba6ed5..403360b 100644
> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > @@ -76,3 +76,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (=
> > ${EXTENDPKGV})"
> >
> >  INHIBIT_DEFAULT_DEPS = "1"
> >  DEPENDS += "unifdef-native"
> > +
> > +ALLOW_EMPTY_${PN} = "1"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11c075a29971080529639a36
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jan 15, 2016 at 1:17 PM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:rpurdie@rpsys.net" target=3D"_blank">rpurdie@rpsys.net</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Th=
u, 2016-01-14 at 14:46 +0800, Jian Liu wrote:<br>
&gt; If setting IMAGE_INSTALL +=3D &quot;linux-libc-headers&quot;, do_rootf=
s will<br>
&gt; cause<br>
&gt; error.<br>
&gt;=C2=A0 =C2=A0ERROR: linux-libc-headers not found in the base feeds<br>
&gt;<br>
&gt; This is because that there is no linux-libc-headers.rpm generated.<br>
<br>
</span>There is no point in generating an empty package just for the sake o=
f<br>
it. Surely you just shouldn&#39;t put that in IMAGE_INSTALL?<br></blockquot=
e><div><br></div><div>Agreed. We can cook up all sorts of invalid/empty pac=
kage names that <br></div><div>won&#39;t work, some things are better simpl=
y as a learning experience if<br></div><div>someone tries it :)<br><br></di=
v><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Signed-off-by: Jian Liu &lt;<a href=3D"mailto:jian.liu@windriver.com">=
jian.liu@windriver.com</a>&gt;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc<br>
&gt; -headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc<br>
&gt; -headers.inc<br>
&gt; index 2ba6ed5..403360b 100644<br>
&gt; --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc<br=
>
&gt; +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc<br=
>
&gt; @@ -76,3 +76,5 @@ RRECOMMENDS_${PN}-dbg =3D &quot;${PN}-dev (=3D<br>
&gt; ${EXTENDPKGV})&quot;<br>
&gt;<br>
&gt;=C2=A0 INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;unifdef-native&quot;<br>
&gt; +<br>
&gt; +ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a11c075a29971080529639a36--
