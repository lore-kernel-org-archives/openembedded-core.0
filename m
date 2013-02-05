Received: from mail-bk0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanglei.fage@gmail.com>) id 1U2Y5a-0000Lz-Ac
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 03:16:53 +0100
Received: by mail-bk0-f50.google.com with SMTP id jg9so3031024bkc.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 18:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=nVsKwoMNd9zujjWz7iMbk8wtHrxxbbu766GjzCpqGr8=;
	b=eov6FFgIXR30RLCzRWm02Yk2PxrU+4Vffa5ds63hPaHs+LCbsPEiPTPWbFhtmQijbk
	fjCZkbgrrEfDRFFXTHt9ypxMJ1ysQPUTfexpureGbvQG+xV1iEvlkn5KQnuFOSJS1lp9
	bgDoexuZEI7SjL8EXZr14OSjqWPvpZhWYeUf0fqHPOIIS8gbloIYR5zCTJOiYuNSnUis
	Tic2VfJ70/qsekLx1USHuxvW1GShDcwcbZm0/7GGGpTZgUIs0gI2aH+gy1i3czP/ARAD
	bWMefmOjSBOy6HGKiKbkkI9U1MrtonFCLbnqCf73kuz6ga27U1MCHIzJ/2R8K4JftrFO
	sv4g==
MIME-Version: 1.0
X-Received: by 10.204.13.25 with SMTP id z25mr6011922bkz.114.1360029660245;
	Mon, 04 Feb 2013 18:01:00 -0800 (PST)
Received: by 10.204.185.8 with HTTP; Mon, 4 Feb 2013 18:00:55 -0800 (PST)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB161F3065@IRSMSX102.ger.corp.intel.com>
References: <1359731346-16190-1-git-send-email-cristian.iorga@intel.com>
	<258C02DC-9331-432A-93B2-4173DA69968D@gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB161F3065@IRSMSX102.ger.corp.intel.com>
Date: Tue, 5 Feb 2013 10:00:55 +0800
Message-ID: <CAHsH0E-fKH4ZyCPjsi5D9pqZoPfXzswc5Xt_Jm0m87LUoZFfZQ@mail.gmail.com>
From: lei yang <yanglei.fage@gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] net-tools: upgrade to v1.60-24.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 02:16:56 -0000
Content-Type: multipart/alternative; boundary=0015174c3324c86f1904d4f09463

--0015174c3324c86f1904d4f09463
Content-Type: text/plain; charset=ISO-8859-1

On Monday, February 4, 2013, Iorga, Cristian wrote:

> See my answers below.
>
> -----Original Message-----
> From: Lei Yang [mailto:yanglei.fage@gmail.com <javascript:;>]
> Sent: Sunday, February 03, 2013 4:15 AM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org <javascript:;>
> Subject: Re: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2
>
>
>
> Sent from my iPhone
>
> On 2013-2-1, at 23:09, Cristian Iorga <cristian.iorga@intel.com<javascript:;>>
> wrote:
>
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com <javascript:;>>
> > ---
> > .../net-tools-config.h                                           |    0
> > .../net-tools-config.make                                        |    0
> > .../net-tools/{net-tools_1.60-23.bb => net-tools_1.60-24.2.bb}   |    6
> +++---
> > 3 files changed, 3 insertions(+), 3 deletions(-) rename
> > meta/recipes-extended/net-tools/{net-tools-1.60-23 =>
> > net-tools-1.60-24.2}/net-tools-config.h (100%) rename
> > meta/recipes-extended/net-tools/{net-tools-1.60-23 =>
> > net-tools-1.60-24.2}/net-tools-config.make (100%) rename
> > meta/recipes-extended/net-tools/{net-tools_1.60-23.bb =>
> > net-tools_1.60-24.2.bb} (94%)
> >
> > diff --git
> > a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
> > b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config
> > .h
> > similarity index 100%
> > rename from
> > meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
> > rename to
> > meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.h
> > diff --git
> > a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.m
> > ake
> > b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config
> > .make
> > similarity index 100%
> > rename from
> > meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.mak
> > e rename to
> > meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.m
> > ake diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
> > b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
> > similarity index 94%
> > rename from meta/recipes-extended/net-tools/net-tools_1.60-23.bb
> > rename to meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
> > index bc61d21..4040e1a 100644
> > --- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
> > +++ b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
> > @@ -5,7 +5,7 @@ BUGTRACKER = "http://bugs.debian.org/net-tools"
> > LICENSE = "GPLv2+"
> > LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> >
> file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
> > -PR = "r3"
> > +PR = "r0"
> >
>
> Is there a reason to change it back to r0
> Yes, because an upgrade has been done.
>
>
I  thought it should aways bump,seems if we update the PV, it will be reset
to r0. Right?


> Lei
>
> > SRC_URI =
> "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
> >
> > ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=no;name=p
> > atch \
>
> Not sure why it not apply but not remove it.
> Sorry, I don't understand your comment.
> This package is distributed as a "base" tarball + patches to higher
> versions.
> Hence, I don't understand your comment.


I mean apply=no, here

Lei


I


> Lei
>
> > @@ -17,8 +17,8 @@ S = "${WORKDIR}/net-tools-1.60"
> > SRC_URI[tarball.md5sum] = "ecaf37acb5b5daff4bdda77785fd916d"
> > SRC_URI[tarball.sha256sum] =
> "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc9aa3095d5c591f302c2de0f5"
> >
> > -SRC_URI[patch.md5sum] = "2412e55c20308d5fbd28bfadd18c075f"
> > -SRC_URI[patch.sha256sum] =
> "d678b3ea97d6c7ca548918994642bfc6b5511ab02f3a5881dfcca00c88bfd73b"
> > +SRC_URI[patch.md5sum] = "524658bb8df5ff92c4a991f5edcaf240"
> > +SRC_URI[patch.sha256sum] =
> "170cc024fcb34329f4c25fd88b5f160a06be5d6d3eaf0bc976650fd1b1a6235d"
> >
> > inherit gettext
> >
> > --
> > 1.7.10.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org <javascript:;>
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--0015174c3324c86f1904d4f09463
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, February 4, 2013, Iorga, Cristian  wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">See my answers below.<br>
<br>
-----Original Message-----<br>
From: Lei Yang [mailto:<a href=3D"javascript:;" onclick=3D"_e(event, &#39;=
cvml&#39;, &#39;yanglei.fage@gmail.com&#39;)">yanglei.fage@gmail.com</a>]<b=
r>
Sent: Sunday, February 03, 2013 4:15 AM<br>
To: Iorga, Cristian<br>
Cc: <a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;ope=
nembedded-core@lists.openembedded.org&#39;)">openembedded-core@lists.openem=
bedded.org</a><br>
Subject: Re: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2<br>
<br>
<br>
<br><br>
<br>
On 2013-2-1, at 23:09, Cristian Iorga &lt;<a href=3D"javascript:;" onclick=
=
=3D"_e(event, &#39;cvml&#39;, &#39;cristian.iorga@intel.com&#39;)">cristia=
n.iorga@intel.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Cristian Iorga &lt;<a href=3D"javascript:;" onclick=3D=
"_e(event, &#39;cvml&#39;, &#39;cristian.iorga@intel.com&#39;)">cristian.io=
rga@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; .../net-tools-config.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A00<br>
&gt; .../net-tools-config.make =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A00<br>
&gt; .../net-tools/{<a href=3D"http://net-tools_1.60-23.bb" target=3D"_bla=
nk">net-tools_1.60-23.bb</a> =3D&gt; <a href=3D"http://net-tools_1.60-24.2.=
bb" target=3D"_blank">net-tools_1.60-24.2.bb</a>} =A0 | =A0 =A06 +++---<br>
&gt; 3 files changed, 3 insertions(+), 3 deletions(-) rename<br>
&gt; meta/recipes-extended/net-tools/{net-tools-1.60-23 =3D&gt;<br>
&gt; net-tools-1.60-24.2}/net-tools-config.h (100%) rename<br>
&gt; meta/recipes-extended/net-tools/{net-tools-1.60-23 =3D&gt;<br>
&gt; net-tools-1.60-24.2}/net-tools-config.make (100%) rename<br>
&gt; meta/recipes-extended/net-tools/{<a href=3D"http://net-tools_1.60-23.=
bb" target=3D"_blank">net-tools_1.60-23.bb</a> =3D&gt;<br>
&gt; <a href=3D"http://net-tools_1.60-24.2.bb" target=3D"_blank">net-tools=
_1.60-24.2.bb</a>} (94%)<br>
&gt;<br>
&gt; diff --git<br>
&gt; a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.=
h<br>
&gt; b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-confi=
g<br>
&gt; .h<br>
&gt; similarity index 100%<br>
&gt; rename from<br>
&gt; meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h<=
br>
&gt; rename to<br>
&gt; meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.=
h<br>
&gt; diff --git<br>
&gt; a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.=
m<br>
&gt; ake<br>
&gt; b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-confi=
g<br>
&gt; .make<br>
&gt; similarity index 100%<br>
&gt; rename from<br>
&gt; meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.ma=
k<br>
&gt; e rename to<br>
&gt; meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.=
m<br>
&gt; ake diff --git a/meta/recipes-extended/net-tools/<a href=3D"http://ne=
t-tools_1.60-23.bb" target=3D"_blank">net-tools_1.60-23.bb</a><br>
&gt; b/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.60-24=
.2.bb" target=3D"_blank">net-tools_1.60-24.2.bb</a><br>
&gt; similarity index 94%<br>
&gt; rename from meta/recipes-extended/net-tools/<a href=3D"http://net-too=
ls_1.60-23.bb" target=3D"_blank">net-tools_1.60-23.bb</a><br>
&gt; rename to meta/recipes-extended/net-tools/<a href=3D"http://net-tools=
_1.60-24.2.bb" target=3D"_blank">net-tools_1.60-24.2.bb</a><br>
&gt; index bc61d21..4040e1a 100644<br>
&gt; --- a/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.6=
0-23.bb" target=3D"_blank">net-tools_1.60-23.bb</a><br>
&gt; +++ b/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.6=
0-24.2.bb" target=3D"_blank">net-tools_1.60-24.2.bb</a><br>
&gt; @@ -5,7 +5,7 @@ BUGTRACKER =3D &quot;<a href=3D"http://bugs.debian.or=
g/net-tools" target=3D"_blank">http://bugs.debian.org/net-tools</a>&quot;<b=
r>
&gt; LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D8ca43cbc842c2336e8359=
26c2166c28b \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://ifconfig.c;beginline=
=3D11;endline=3D15;md5=3Dd1ca372080ad5401e23ca0afc35cf9ba&quot;<br>
&gt; -PR =3D &quot;r3&quot;<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt;<br>
<br>
Is there a reason to change it back to r0<br>
Yes, because an upgrade has been done.<br>
<br></blockquote><div><br></div><div>I=A0 thought it should aways bump,see=
ms if we update the PV, it will be reset to r0. Right?</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">

<br>
Lei<br>
<br>
&gt; SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.or=
ig.tar.gz;name=3Dtarball \<br>
&gt;<br>
&gt; ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=3Dno;nam=
e=3Dp<br>
&gt; atch \<br>
<br>
Not sure why it not apply but not remove it.<br>
Sorry, I don&#39;t understand your comment.<br>
This package is distributed as a &quot;base&quot; tarball + patches to hig=
her versions.<br>
Hence, I don&#39;t understand your comment.</blockquote><div><br></div><di=
v>I mean apply=3Dno, here</div><div><br></div><div>Lei<span></span></div><d=
iv>=A0</div><div><br></div>I<br><div>=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">

Lei<br>
<br>
&gt; @@ -17,8 +17,8 @@ S =3D &quot;${WORKDIR}/net-tools-1.60&quot;<br>
&gt; SRC_URI[tarball.md5sum] =3D &quot;ecaf37acb5b5daff4bdda77785fd916d&qu=
ot;<br>
&gt; SRC_URI[tarball.sha256sum] =3D &quot;ec67967cf7b1a3a3828a84762fbc013a=
c50ee5dc9aa3095d5c591f302c2de0f5&quot;<br>
&gt;<br>
&gt; -SRC_URI[patch.md5sum] =3D &quot;2412e55c20308d5fbd28bfadd18c075f&quo=
t;<br>
&gt; -SRC_URI[patch.sha256sum] =3D &quot;d678b3ea97d6c7ca548918994642bfc6b=
5511ab02f3a5881dfcca00c88bfd73b&quot;<br>
&gt; +SRC_URI[patch.md5sum] =3D &quot;524658bb8df5ff92c4a991f5edcaf240&quo=
t;<br>
&gt; +SRC_URI[patch.sha256sum] =3D &quot;170cc024fcb34329f4c25fd88b5f160a0=
6be5d6d3eaf0bc976650fd1b1a6235d&quot;<br>
&gt;<br>
&gt; inherit gettext<br>
&gt;<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Op=
enembedded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.opene=
mbedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openem=
bedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/l=
istinfo/openembedded-core</a><br>
</blockquote>

--0015174c3324c86f1904d4f09463--
