Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 20342600E2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Nov 2016 18:01:35 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id p9so104928995vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Nov 2016 10:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xflIRzuM0xb8NW3GWXIiC4HdFeTvbdyISVc/y9JHZzM=;
	b=ZFarrF0kZ/3h4Zdi8ryMxb7wsFVDk4wyRfgoTc6R9NZteb1nXcIHgUpVrKBzCTlsNM
	4lLHshna8Q7bP8IIvUVDY1V4PqR6xHPgRhkK3CG1o12Jd/9ciCfyrDqlJPXKjQrcQtxY
	tyU0DD63gqFU3wunzJLRQERIKpueJu8FTTLZq8+qah20KJMDeMfdexBgvYsPqcbA1Dnu
	2ebwJzVl7yhp7NsbGcPGYHVg/UDuYhA5YOVgRvEuj/aksv8z2Oq9FHbzCctbvNrJWbeh
	LvQj2p8YR6SQUl4Xyv68vVVr3JROHVH5Inu1fCMNeuWVPY5b2l42Wgt2U3MoF/Wg7qOq
	A+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xflIRzuM0xb8NW3GWXIiC4HdFeTvbdyISVc/y9JHZzM=;
	b=UzB8yLcYiWXE2M9aEqjre8L1qxOmrfj9tEZjip5JuqdHdcyJgEk1UMVvtaFZ+wGnAP
	4bASclrYbuLeoWKAX6m2BiMqTkfBkuRsjpPqgo9pYrodYF0bL5sqTVsZvi8RJddnb8mj
	NOqYYOe0c87h+KP3FrW+bSGOMYPpEm0scXhGspODNW7diObQWIiSfbcwfplFw4rqz3dW
	hQrHCK6k93XzObuG1HBBVmIZQkw9dHdF7LCv2zmM3tEusn5Tf482O8HSIvPurRcCcbGr
	yRScouGhpQAWeiydaDHeEBZ3eSoHBygYLPYPBn2CAWgCOzoMbU7TgIr3fyY8WfwNDsFK
	2plQ==
X-Gm-Message-State: ABUngvc/O7dYIZtLEs5egte0aIgo8PQMjNEe+Kxpyv86c9yL8tNijgx4TDZ4CkWcOPdVGXoxdCjQHdCRaiZV9w==
X-Received: by 10.31.8.146 with SMTP id 140mr1618510vki.173.1478455296768;
	Sun, 06 Nov 2016 10:01:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.107.142 with HTTP; Sun, 6 Nov 2016 10:01:36 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1611060625550.19174@localhost.localdomain>
References: <alpine.LFD.2.20.1611060625550.19174@localhost.localdomain>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 6 Nov 2016 10:01:36 -0800
Message-ID: <CANx9H-DKBM9qaLr9+d0pa7YgoBs6qz6SqoJrG8L_hN0ua0xQDQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "Can't install perl-soap-lite-1.20-r0@all: no package provides /bin/env" ??
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
X-List-Received-Date: Sun, 06 Nov 2016 18:01:36 -0000
Content-Type: multipart/alternative; boundary=001a1144fa12c7bf8d0540a5b220

--001a1144fa12c7bf8d0540a5b220
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

https://github.com/redhotpenguin/soaplite/search?utf8=3D=E2=9C=93&q=3D%2Fbi=
n%2Fenv
<https://github.com/redhotpenguin/soaplite/search?utf8=3D%E2%9C%93&q=3D%2Fb=
in%2Fenv>

It's only for the tests (in the ${S}/t directory by convention for perl
modules). I would try just doing sed to /usr/bin/env on all those.

Cheers.

--Tim

On Sun, Nov 6, 2016 at 3:28 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   currently writing my first batch of perl recipes, fairly mindlessly
> plagiarizing from existing recipes, first bunch worked fine, then i
> whipped together a recipe for SOAP::Lite from here:
>
>   https://metacpan.org/pod/SOAP::Lite
>
> built fine, but when i tried to add the perl-soap-lite-1.20-r0.all.rpm
> to my core-image-minimal build, i got:
>
>   Computing transaction...error: Can't install \
>     perl-soap-lite-1.20-r0@all: no package provides /bin/env
>
> sure enough, that rpm has that dependency:
>
>   $ rpm -qpR perl-soap-lite-1.20-r0.all.rpm
>   /bin/env
>   /usr/bin/env
>   perl
>   $
>
> and when i fire up my "qemuppc" session for that core-image-minimal
> image, there is indeed no /bin/env file (hence the error), but there
> is:
>
>   /usr/bin/env -> /bin/busybox.nosuid
>
> so ... what is the proper solution for this? i suspect i'm going to
> run into this issue again in upcoming recipes, so i'd love to resolve
> it in a minimally hacky way.
>
> rday
>
> p.s. now that i think about it, why would a package have a dependency
> on *both* /bin/env and /usr/bin/env? isn't that sort of redundant?
>
> p.p.s. i searched for the phrase "no package provides /bin/env" as a
> first attempt, and i weirdly got this:
>
> https://www.google.ca/search?q=3D%22no+package+provides+/bin/
> env%22&ie=3Dutf-8&oe=3Dutf-8&gws_rd=3Dcr&ei=3DjBMfWJ20JIfZjwTKzarIBg
>
> never heard of that website before, and no other matches. seems a bit
> odd.
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144fa12c7bf8d0540a5b220
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://github.com/redhotpenguin/soaplite/searc=
h?utf8=3D%E2%9C%93&amp;q=3D%2Fbin%2Fenv">https://github.com/redhotpenguin/s=
oaplite/search?utf8=3D=E2=9C=93&amp;q=3D%2Fbin%2Fenv</a><br><div><br></div>=
<div>It&#39;s only for the tests (in the ${S}/t directory by convention for=
 perl modules). I would try just doing sed to /usr/bin/env on all those.</d=
iv><div><br></div><div>Cheers.</div><div><br></div><div>--Tim</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Nov 6, 2016=
 at 3:28 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjda=
y@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 currently writing my first batch of perl recipes, fairly mindlessly<=
br>
plagiarizing from existing recipes, first bunch worked fine, then i<br>
whipped together a recipe for SOAP::Lite from here:<br>
<br>
=C2=A0 <a href=3D"https://metacpan.org/pod/SOAP::Lite" rel=3D"noreferrer" t=
arget=3D"_blank">https://metacpan.org/pod/SOAP:<wbr>:Lite</a><br>
<br>
built fine, but when i tried to add the perl-soap-lite-1.20-r0.all.rpm<br>
to my core-image-minimal build, i got:<br>
<br>
=C2=A0 Computing transaction...error: Can&#39;t install \<br>
=C2=A0 =C2=A0 perl-soap-lite-1.20-r0@all: no package provides /bin/env<br>
<br>
sure enough, that rpm has that dependency:<br>
<br>
=C2=A0 $ rpm -qpR perl-soap-lite-1.20-r0.all.rpm<br>
=C2=A0 /bin/env<br>
=C2=A0 /usr/bin/env<br>
=C2=A0 perl<br>
=C2=A0 $<br>
<br>
and when i fire up my &quot;qemuppc&quot; session for that core-image-minim=
al<br>
image, there is indeed no /bin/env file (hence the error), but there<br>
is:<br>
<br>
=C2=A0 /usr/bin/env -&gt; /bin/busybox.nosuid<br>
<br>
so ... what is the proper solution for this? i suspect i&#39;m going to<br>
run into this issue again in upcoming recipes, so i&#39;d love to resolve<b=
r>
it in a minimally hacky way.<br>
<br>
rday<br>
<br>
p.s. now that i think about it, why would a package have a dependency<br>
on *both* /bin/env and /usr/bin/env? isn&#39;t that sort of redundant?<br>
<br>
p.p.s. i searched for the phrase &quot;no package provides /bin/env&quot; a=
s a<br>
first attempt, and i weirdly got this:<br>
<br>
<a href=3D"https://www.google.ca/search?q=3D%22no+package+provides+/bin/env=
%22&amp;ie=3Dutf-8&amp;oe=3Dutf-8&amp;gws_rd=3Dcr&amp;ei=3DjBMfWJ20JIfZjwTK=
zarIBg" rel=3D"noreferrer" target=3D"_blank">https://www.google.ca/search?<=
wbr>q=3D%22no+package+provides+/bin/<wbr>env%22&amp;ie=3Dutf-8&amp;oe=3Dutf=
-8&amp;gws_<wbr>rd=3Dcr&amp;ei=3D<wbr>jBMfWJ20JIfZjwTKzarIBg</a><br>
<br>
never heard of that website before, and no other matches. seems a bit<br>
odd.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/<wbr>rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1144fa12c7bf8d0540a5b220--
