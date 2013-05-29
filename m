Return-Path: <cazfi74@gmail.com>
Received: from mail-qe0-f54.google.com (mail-qe0-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0AF6066A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 22:14:02 +0000 (UTC)
Received: by mail-qe0-f54.google.com with SMTP id i11so5506732qej.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1L77WJ4QmqTPePbVtOnuMI4JUnoJ0vCIgdp7hBf3QCo=;
	b=ZJ4HnfS/9yaPmXxuUV7qwA6NXLY6SSoEn0as1Ak/ZFLq+ZjWFSD8e4gsAQdFELRF00
	uIPKOYtKdWJpB+dgKbrFu4wVhmZlftHHLo3rrNrJUrO3RUiTKvD1pVC1jXwVd30tFfWv
	b+a+up1jKX1p2QOThFCe4uuZ/eWel4eaSNxoh4TWEKdHpsvfz9fS2WOJZJLdBvPI97Y4
	iDn5yZGZtlcHtdV0uH4KiZJuuU/n7YKeIua/RgjLlFogRDMYUzl0svVIAcwDzlLZyVV3
	siAJg2/syKpWqdv5MsROdyRnFZL9cRHLgVOh0LJE/VplRn8dhkDNk1fV7BaJ6irJMtOf
	q5xQ==
MIME-Version: 1.0
X-Received: by 10.224.128.70 with SMTP id j6mr5050622qas.41.1369865642963;
	Wed, 29 May 2013 15:14:02 -0700 (PDT)
Received: by 10.224.36.17 with HTTP; Wed, 29 May 2013 15:14:02 -0700 (PDT)
In-Reply-To: <CAJTo0LYaM+1fB7h7cK0jQ3QcDio_79+y4eZ7_cpYxBTwiqoR4A@mail.gmail.com>
References: <cover.1369576071.git.cazfi74@gmail.com>
	<CAJTo0LYaM+1fB7h7cK0jQ3QcDio_79+y4eZ7_cpYxBTwiqoR4A@mail.gmail.com>
Date: Thu, 30 May 2013 01:14:02 +0300
Message-ID: <CAF6bG8dmfuM_mH3dhBaiM=0y2NkA0pXtehzfJnGJ9cKma+8dJg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] RFC: Add recipe of gtk3 version of vte alongside gtk2 one.
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
X-List-Received-Date: Wed, 29 May 2013 22:14:03 -0000
Content-Type: multipart/alternative; boundary=001a11c1f8cc09f86704dde2b3c5

--001a11c1f8cc09f86704dde2b3c5
Content-Type: text/plain; charset=UTF-8

On 29 May 2013 13:14, Burton, Ross <ross.burton@intel.com> wrote:

> On 26 May 2013 15:03, Marko Lindqvist <cazfi74@gmail.com> wrote:
> > Last gtk2-compatible version of vte is 0.28.2 currently present on OE
> core.
> > Later versions depend on gtk3.
>
> vte supports both gtk2 and gtk3.
>

 0.30.0 NEWS states that "dropped support for gtk2". While this sounds like
upstream 0.28.2 would work with either gtk2 or gtk3, OE recipe depends on
"gtk+", which is always gtk2?


> > Since gtk3 exist in OE core, it would make
> > sense to be able to build version of vte (and other similar packages)
> > that does not depend on gtk2. Otherwise we end with systems that must
> > contain both gtk2 (to be used by some programs) and gtk3 (to be used by
> > other programs).
> > This patch just adds new recipe for latest vte version, 0.34.5, alongside
> > with 0.28.2 version.
> > How should priorities be set? "1" for gtk2-version, so it gets selected
> despite gtk3-version being newer?
>
> Because they are *not* drop-in replacements, how about naming the gtk3
> vte vte3_3.34.5.bb?
>

 I think calling it vte3 would be confusing at best, when vte itself is not
version 3.x. How about "vte-gtk3"?


 - ML

--001a11c1f8cc09f86704dde2b3c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 29 May 2013 13:14, Burton, Ross <span dir=3D"ltr">&lt;<=
a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel=
.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 26 May 2013 15:03, Mark=
o Lindqvist &lt;<a href=3D"mailto:cazfi74@gmail.com">cazfi74@gmail.com</a>&=
gt; wrote:<br>

&gt; Last gtk2-compatible version of vte is 0.28.2 currently present on OE =
core.<br>
&gt; Later versions depend on gtk3.<br>
<br>
</div>vte supports both gtk2 and gtk3.<br></blockquote><div><br></div><div>=
=C2=A00.30.0 NEWS states that &quot;dropped support for gtk2&quot;. While t=
his sounds like upstream 0.28.2 would work with either gtk2 or gtk3, OE rec=
ipe depends on &quot;gtk+&quot;, which is always gtk2?<br>
</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"im"=
>
&gt; Since gtk3 exist in OE core, it would make<br>
&gt; sense to be able to build version of vte (and other similar packages)<=
br>
&gt; that does not depend on gtk2. Otherwise we end with systems that must<=
br>
&gt; contain both gtk2 (to be used by some programs) and gtk3 (to be used b=
y<br>
&gt; other programs).<br>
&gt; This patch just adds new recipe for latest vte version, 0.34.5, alongs=
ide<br>
&gt; with 0.28.2 version.<br>
&gt; How should priorities be set? &quot;1&quot; for gtk2-version, so it ge=
ts selected despite gtk3-version being newer?<br>
<br>
</div>Because they are *not* drop-in replacements, how about naming the gtk=
3<br>
vte <a href=3D"http://vte3_3.34.5.bb" target=3D"_blank">vte3_3.34.5.bb</a>?=
<br></blockquote><div><br></div><div>=C2=A0I think calling it vte3 would be=
 confusing at best, when vte itself is not version 3.x. How about &quot;vte=
-gtk3&quot;?<br>
</div><div>=C2=A0<br><br></div><div><font color=3D"#888888">=C2=A0- ML<br><=
br></font></div></div></div></div>

--001a11c1f8cc09f86704dde2b3c5--
