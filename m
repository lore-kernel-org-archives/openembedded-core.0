Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8780E61624
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:05:49 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id o6so1544818oag.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=MRvDDguVU1yFYX0por7uzQWjpcF+rZiH/nu4iU7ucNE=;
	b=CZd4u6TcH0b28DGRHVbTFRjJqIatbNyGpOKREPwbiMhhO8UzorN9envjaBh9zPVET2
	fw341k2of+sMM7yWiZpWEG7WWmtUdIKPcZzg/ibpJ/uzC5ZfegTRr+73CRSSpOVh3ckm
	muk6NPCbWVoUUfrxPr6chOjxRJ28tPTo+B1PQt3msuxu/AXi8DrE6QqGlT3scNCYhacy
	sbCbJ1OMBVGAZMhUmWsZAjuqKcodH5ZncS3hcX8nYmxW+qP18GZf23T6inXebnOXIxIX
	pvawzAbrsC5zYS5/lD4uEwhg4P9KEIyC+afAN47/wvsd52dpbnlHXLUERTMvsNrNZTfs
	TYvQ==
MIME-Version: 1.0
X-Received: by 10.182.194.5 with SMTP id hs5mr2660828obc.19.1389805550325;
	Wed, 15 Jan 2014 09:05:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 09:05:50 -0800 (PST)
In-Reply-To: <CANyK_8cBWSps_v=eF-ktk6YbUKo76KfGTufa09m2gVsgQk7NRQ@mail.gmail.com>
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
	<1389752246-4296-4-git-send-email-paul@paulbarker.me.uk>
	<52D6A554.2050705@linux.intel.com>
	<CANyK_8cBWSps_v=eF-ktk6YbUKo76KfGTufa09m2gVsgQk7NRQ@mail.gmail.com>
Date: Wed, 15 Jan 2014 15:05:50 -0200
X-Google-Sender-Auth: b8fJYb-X4F4LZL9IA81llF-nsB8
Message-ID: <CAP9ODKr3DCMEsGB0xg1+RUZkgqJqrrWAwNKWbsF-DYs4U2-+kg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] opkg: No longer PROVIDES update-alternatives
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
X-List-Received-Date: Wed, 15 Jan 2014 17:05:51 -0000
Content-Type: multipart/alternative; boundary=f46d0444eb292254f104f005520d

--f46d0444eb292254f104f005520d
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 2:13 PM, Paul Barker <paul@paulbarker.me.uk> wrote:

> On 15 January 2014 15:12, Saul Wold <sgw@linux.intel.com> wrote:
> > On 01/14/2014 06:17 PM, Paul Barker wrote:
> >>
> >> The new provider is the opkg-utils recipe.
> >>
> > This seems to have triggered a failure on the AB:
> >
> > | Computing transaction...error: Can't install
> > nativesdk-shadow-4.1.4.3-r13@i686_nativesdk: no package provides
> > nativesdk-update-alternatives-opkg
> >
>
> I've not really done much with nativesdk, but my guess is I just need to
> change
>
>     BBCLASSEXTEND = "native"
>
> to
>
>     BBCLASSEXTEND = "native nativesdk"
>
> in the opkg-utils recipe so that nativesdk-* packages are built for
> that recipe. Does that sound correct? If so, I'll re-spin the patches
> with that change.
>

Yes; that should fix it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--f46d0444eb292254f104f005520d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jan 15, 2014 at 2:13 PM, Paul Barker <span dir=3D"ltr">&lt;=
<a href=3D"mailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.=
me.uk</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 15 January 2014 15:12, =
Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a=
>&gt; wrote:<br>

&gt; On 01/14/2014 06:17 PM, Paul Barker wrote:<br>
&gt;&gt;<br>
&gt;&gt; The new provider is the opkg-utils recipe.<br>
&gt;&gt;<br>
&gt; This seems to have triggered a failure on the AB:<br>
&gt;<br>
&gt; | Computing transaction...error: Can&#39;t install<br>
&gt; nativesdk-shadow-4.1.4.3-r13@i686_nativesdk: no package provides<br>
&gt; nativesdk-update-alternatives-opkg<br>
&gt;<br>
<br>
</div>I&#39;ve not really done much with nativesdk, but my guess is I just =
need to change<br>
<br>
=A0 =A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
to<br>
<br>
=A0 =A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
in the opkg-utils recipe so that nativesdk-* packages are built for<br>
that recipe. Does that sound correct? If so, I&#39;ll re-spin the patches<b=
r>
with that change.<br></blockquote><div><br></div><div>Yes; that should fix =
it.=A0</div></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.=
ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0=
 =A0 =A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">http://c=
ode.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--f46d0444eb292254f104f005520d--
