Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 627826FF30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:54:49 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id w85so47242199oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 19:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=psdgFiyzfMIS9da07+kA8tP0LcyzRf7xL+HRcfgCvqk=;
	b=OSCz5iipr/Gwptsf7BW4FQvYV+SQVuBkZc3z8m9Mhm/faM+nqLDdVz3BcRdnWVmuae
	9XZOymxTQNYe/v7b5Ril6oR+7ADQuc0N93StDf0fpAKRT9V4oDfHJI9S377Ki2CQtgiH
	i6MNy9YOQF30H+6AkiQKqHh7Y7q7CFItFdTwqezOcjYAxoogiZvRHhRtbNVkMAj8AMDx
	bhzZ4+EARv+qrDg4XqNzwHhfXHxo0e7sETcEKtenQbhLlsh9vJbfVyDirnZ/yajp/Vi9
	38A0Ip/zKM5rC69313XU4xx4JTQaAplCzdhU1U/iDDpfp4eu5HIUZYfu/WJbYRJW8Upo
	80iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=psdgFiyzfMIS9da07+kA8tP0LcyzRf7xL+HRcfgCvqk=;
	b=fLcv1lRWNW6afudCqVx4/wDgu2EOaPzfBo8ahjezWmh+y6AMdnGyAAaykvC7/ZrfBS
	B/OGb/3Fk06yNKE1BlG8POEQadq1u1XJft6BgURBeXmIMmEa8mJlHUto3oBwfb5iDJFt
	/hbtfDrXjjTd26tFV9VLSO/Cb5i8/8c1drBlJbC3QpQoLnIoignMpHZ4tfhHEO5V63KI
	xL3FHJFFYBmtSIaruZUTOJ+UHplUrtd+Dkhtt+VxlzfdueubzyQlS/HsRXAxBbOAL4lF
	tNJu6H26XmIWVwLgSBwXgRZQOhwELhQHBYBwSH8kWp0gkgeGEOJIfEJ3cBDB/oOjreB9
	zuuw==
X-Gm-Message-State: AOPr4FUkwKulFWh8bDdTr263/kZI3BK7WahgIuXqTl16b19xgXeRGQdeG1WHHYV75/zfvcYJYKI8K9QxC9i3yg==
MIME-Version: 1.0
X-Received: by 10.157.54.54 with SMTP id w51mr2917195otb.186.1460516089953;
	Tue, 12 Apr 2016 19:54:49 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 12 Apr 2016 19:54:49 -0700 (PDT)
In-Reply-To: <1460498600.9308.71.camel@linuxfoundation.org>
References: <cover.1460442964.git.liezhi.yang@windriver.com>
	<0877ab068513b9720c808aaeb0c8a90f9a45afc3.1460442964.git.liezhi.yang@windriver.com>
	<570CEB0D.7090701@windriver.com>
	<1460498600.9308.71.camel@linuxfoundation.org>
Date: Tue, 12 Apr 2016 22:54:49 -0400
Message-ID: <CADkTA4Np4vD77Km_HbRTVHMy6pFwAJiYyJ3Bv=iOJawwGsyN0w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto-tiny: fix KBRANCH
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
X-List-Received-Date: Wed, 13 Apr 2016 02:54:50 -0000
Content-Type: multipart/alternative; boundary=001a114772b2bb083f053054e6a9

--001a114772b2bb083f053054e6a9
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 12, 2016 at 6:03 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2016-04-12 at 08:33 -0400, Bruce Ashfield wrote:
> > On 2016-04-12 2:36 AM, Robert Yang wrote:
> > > Fixed:
> > > WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0
> > > do_patch: After meta data application, the kernel tree branch is
> > > standard/tiny/common-pc. The
> > > WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0
> > > do_patch: SRC_URI specified branch standard/tiny/base. The branch
> > > will be forced to standard/tiny/base,
> > > WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0
> > > do_patch: but this means the board meta data (.scc files) do not
> > > match the SRC_URI specification.
> > > WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0
> > > do_patch: The meta data and branch standard/tiny/base should be
> > > inspected to ensure the proper
> > > WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0
> > > do_patch: kernel is being built.
> > >
> > > Use standard/tiny/common-pc which is pointed by the .scc to fix
> > > problem.
> > > Btw, standard/tiny/base and standard/tiny/common-pc points to the
> > > same
> > > commit id.
> >
> > When tiny eventually supports more architectures/boards we'll have
> > to change this again, but for the 2.1 release this is the change
> > with the least impact.
> >
> > Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >
> > I can pick this patch up and put it in my queue, speak now if someone
> > else is going to grab it.
>
> I took this into -next on the basis that its better if I can test
> things sooner. The tiny build passed so I can merge this if
> appropriate.
>

Sounds good. But please don't take the SRCREV bump, I need to do that part.
It it
in amongst other changes that I'm testing. I've dropped this one from my
queue.

Bruce


>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114772b2bb083f053054e6a9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 12, 2016 at 6:03 PM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Tue, 2016-04-12 at=
 08:33 -0400, Bruce Ashfield wrote:<br>
&gt; On 2016-04-12 2:36 AM, Robert Yang wrote:<br>
&gt; &gt; Fixed:<br>
&gt; &gt; WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-=
r0<br>
&gt; &gt; do_patch: After meta data application, the kernel tree branch is<=
br>
&gt; &gt; standard/tiny/common-pc. The<br>
&gt; &gt; WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-=
r0<br>
&gt; &gt; do_patch: SRC_URI specified branch standard/tiny/base. The branch=
<br>
&gt; &gt; will be forced to standard/tiny/base,<br>
&gt; &gt; WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-=
r0<br>
&gt; &gt; do_patch: but this means the board meta data (.scc files) do not<=
br>
&gt; &gt; match the SRC_URI specification.<br>
&gt; &gt; WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-=
r0<br>
&gt; &gt; do_patch: The meta data and branch standard/tiny/base should be<b=
r>
&gt; &gt; inspected to ensure the proper<br>
&gt; &gt; WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-=
r0<br>
&gt; &gt; do_patch: kernel is being built.<br>
&gt; &gt;<br>
&gt; &gt; Use standard/tiny/common-pc which is pointed by the .scc to fix<b=
r>
&gt; &gt; problem.<br>
&gt; &gt; Btw, standard/tiny/base and standard/tiny/common-pc points to the=
<br>
&gt; &gt; same<br>
&gt; &gt; commit id.<br>
&gt;<br>
&gt; When tiny eventually supports more architectures/boards we&#39;ll have=
<br>
&gt; to change this again, but for the 2.1 release this is the change<br>
&gt; with the least impact.<br>
&gt;<br>
&gt; Acked-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com">bruce.ashfield@windriver.com</a>&gt;<br>
&gt;<br>
&gt; I can pick this patch up and put it in my queue, speak now if someone<=
br>
&gt; else is going to grab it.<br>
<br>
</div></div>I took this into -next on the basis that its better if I can te=
st<br>
things sooner. The tiny build passed so I can merge this if<br>
appropriate.<br></blockquote><div><br></div><div>Sounds good. But please do=
n&#39;t take the SRCREV bump, I need to do that part. It it</div><div>in am=
ongst other changes that I&#39;m testing. I&#39;ve dropped this one from my=
 queue.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a114772b2bb083f053054e6a9--
