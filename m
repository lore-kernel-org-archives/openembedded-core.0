Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id E8E827E8E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 16:24:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d18so3681442wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=emsRwVvcaI+RlfbwPGa6PR7AhJDy91dqpPIRsWi/3bY=;
	b=I8b3pMZSIwYtRinJpm9qj42JSY/kHu9goAe/Hb8AYdxYlQO8Vbg9M5ipdANONAiMbp
	EZi/6ziqwJ6Ya8c58qVFuNyFa+LABADCv9MO6ZbdlPMOVXGyidTaXQGe0yQLluEPnLcJ
	djHYl8oqScgJCosSd7f3HOY0fSINS77QD/f6HF6XO0yp5jPNw/yqumLjst4a4MyhuAuw
	DPIdzPBLDU3EEMsWDYlf7hBNhhqA53g+QoyG+T9uEvlaLDE3SA8FiyEJ6+678d4qGe7S
	NGyT8uZH4StV/HO+lSAzVfOOos77d+rUNnXdWcnVdxFba14+ClQC5YqoFEU73piYYsI5
	TvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=emsRwVvcaI+RlfbwPGa6PR7AhJDy91dqpPIRsWi/3bY=;
	b=U7idmO0yUpgu8UeZKqJQiCFIvByGuTZRf6S7gtCViTCvyG3OuSgpEfvt9jXRghfdHk
	En16IlGvDwHTGTUUIusgT6kvtMUFK1rkYrl2b86m16FxCVcbBTU2dYTOdeRctAVR8DJn
	1nnpHRn15Eorg/lQ3VZpAX+XS2K88kGYNz3yUW99twvMJyHlFjtEnohR/d6yL6AsxOzc
	TryZBqUIHhSU2dloK2UQaBw53UPa644eMKi2scRLNjW0fey+u+fdA6LFJtnf5FJ2dbZG
	PgMnjz/7ZKTqxb+8O288221dxnm21uljTm+xEVNZEKqHrhcaOqfhy/GOD71mdf/LXayx
	UYnw==
X-Gm-Message-State: APjAAAUSljqX0HK0nXdI6PJ90ncVJGEkl38LfqIyw5vkxaV9vcgAbQ9V
	KR45nJuSOT1pjL6H8EQpE3pV1EHora6K3Ajtt7E=
X-Google-Smtp-Source: APXvYqyhR9st1QXpOioMIQQObX8vu0TKbHec0WuElrk3dm3daf7Lt2RzSFNEG82g1kd3QrenUNxQyk2Hfox6Sbs+LfU=
X-Received: by 2002:adf:fbd0:: with SMTP id d16mr8185560wrs.341.1561047881571; 
	Thu, 20 Jun 2019 09:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190620154704.13940-1-JPEWhacker@gmail.com>
	<CAJTo0LaFrRAchscWMQdQdEUKtqHXJ4kzENrLjPm42Tp4gZwZLw@mail.gmail.com>
In-Reply-To: <CAJTo0LaFrRAchscWMQdQdEUKtqHXJ4kzENrLjPm42Tp4gZwZLw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 20 Jun 2019 11:24:28 -0500
Message-ID: <CAJdd5GbXL9r0Sbi9Q41yS=Y2SGcc1wGySoMoZBDTtoAzmRp4rw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Remove .build files for reproducible builds
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
X-List-Received-Date: Thu, 20 Jun 2019 16:24:41 -0000
Content-Type: multipart/alternative; boundary="000000000000756478058bc3c873"

--000000000000756478058bc3c873
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 20, 2019, 11:20 AM Burton, Ross <ross.burton@intel.com> wrote:

> Is it easier to just always delete those files?  Do they serve any
> useful purpose?
>

Probably not for our uses. I'll post a V2 unless someone complains


> Ross
>
> On Thu, 20 Jun 2019 at 16:47, Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > Bash has an internal "build number" that it tracks and automatically
> > increments ever time a given builds is made from the same sandbox.
> > However, this can make builds non-reproducible in the event that a build
> > directory is reused multiple times.
> >
> > Remove the .build files after every build if reproducible builds have
> > been requested which will reset the build build number for the next
> > build.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/recipes-extended/bash/bash.inc | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/meta/recipes-extended/bash/bash.inc
> b/meta/recipes-extended/bash/bash.inc
> > index c91cc8ada8d..e2844dffbad 100644
> > --- a/meta/recipes-extended/bash/bash.inc
> > +++ b/meta/recipes-extended/bash/bash.inc
> > @@ -39,6 +39,14 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " \
> >
> >  CACHED_CONFIGUREVARS += "headersdir=${includedir}/${PN}"
> >
> > +do_compile_prepend() {
> > +    # If reproducible builds are requested, remove any leftover .build
> files.
> > +    # This ensures that bash always has the same version number
> > +    if [ "${BUILD_REPRODUCIBLE_BINARIES}" == "1" ]; then
> > +        rm -f ${B}/.build
> > +    fi
> > +}
> > +
> >  do_compile_ptest () {
> >         oe_runmake buildtest
> >  }
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000756478058bc3c873
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Jun 20, 2019, 11:20 AM Burton, Ross &lt;<a hre=
f=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Is it easier to just always delete tho=
se files?=C2=A0 Do they serve any<br>
useful purpose?<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Probably not for our uses. I&#39;ll post a V2 unless someone=
 complains</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
Ross<br>
<br>
On Thu, 20 Jun 2019 at 16:47, Joshua Watt &lt;<a href=3D"mailto:jpewhacker@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">jpewhacker@gmail.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; Bash has an internal &quot;build number&quot; that it tracks and autom=
atically<br>
&gt; increments ever time a given builds is made from the same sandbox.<br>
&gt; However, this can make builds non-reproducible in the event that a bui=
ld<br>
&gt; directory is reused multiple times.<br>
&gt;<br>
&gt; Remove the .build files after every build if reproducible builds have<=
br>
&gt; been requested which will reset the build build number for the next<br=
>
&gt; build.<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/bash/bash.inc | 8 ++++++++<br>
&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extend=
ed/bash/bash.inc<br>
&gt; index c91cc8ada8d..e2844dffbad 100644<br>
&gt; --- a/meta/recipes-extended/bash/bash.inc<br>
&gt; +++ b/meta/recipes-extended/bash/bash.inc<br>
&gt; @@ -39,6 +39,14 @@ RDEPENDS_${PN}-ptest_append_libc-glibc =3D &quot; \=
<br>
&gt;<br>
&gt;=C2=A0 CACHED_CONFIGUREVARS +=3D &quot;headersdir=3D${includedir}/${PN}=
&quot;<br>
&gt;<br>
&gt; +do_compile_prepend() {<br>
&gt; +=C2=A0 =C2=A0 # If reproducible builds are requested, remove any left=
over .build files.<br>
&gt; +=C2=A0 =C2=A0 # This ensures that bash always has the same version nu=
mber<br>
&gt; +=C2=A0 =C2=A0 if [ &quot;${BUILD_REPRODUCIBLE_BINARIES}&quot; =3D=3D =
&quot;1&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${B}/.build<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 do_compile_ptest () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake buildtest<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.21.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--000000000000756478058bc3c873--
