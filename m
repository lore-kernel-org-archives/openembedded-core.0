Return-Path: <joe@deserted.net>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0BEFA608CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 14:50:46 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id a13so12906523iee.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 07:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=VXYgUpaygNsaLszNjAhiwjrOdVKReaZdV+JPW4+PbZQ=;
	b=mDvZp05vD8WyCxY3dLwrVRJnIWdZTRTIYKz0lZaUBdRKFc7CpxSGrYIx9AYfD5utK6
	k+m/C/JUxYbC2BefpOpN8A05iuFT+mubO8hv1Lvj18EFIsI3Unv6/PxhyS2+vFk2CK7I
	9bcbL7k5Wq0gl054IJM3qiylWXp55YN+kpbhtmb52lq7I7GcwzpGUAUePbfWYzrX6YFs
	UKXZSfFlGzB5LGQu4Ewahyz1PAP1FkTlIEauCSJj1uHEc1pIJ1qQkO2SUGsZPOiFdKi6
	Q9bsA0SXyI2QpC4yRaXrlyXcsU0jIip7beCBU1ovyVqa/u8P1FuaExH1MxUW/lriWIQ7
	oPOA==
MIME-Version: 1.0
X-Received: by 10.43.158.8 with SMTP id ls8mr1293683icc.34.1371653447914; Wed,
	19 Jun 2013 07:50:47 -0700 (PDT)
Received: by 10.42.25.70 with HTTP; Wed, 19 Jun 2013 07:50:47 -0700 (PDT)
In-Reply-To: <1371652646.20823.192.camel@ted>
References: <1371650216-31735-1-git-send-email-joe@deserted.net>
	<1371651046.20823.189.camel@ted>
	<CANBf+V3L7MBU3U9vZTqVtgv8GYPfoV9aeqyNA6C2QjMpentXOQ@mail.gmail.com>
	<1371652646.20823.192.camel@ted>
Date: Wed, 19 Jun 2013 10:50:47 -0400
Message-ID: <CANBf+V2sThoGM4-U=XfeGgG3kOdZonXx=pgz61LX_83msLbjSg@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQmaXwRde/xFWNh7p0xZewLiywzALD7HcnUdTcFIlPvUtk7bf8k2rXhSo1kIV8k9D1FahYoZ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bdwgc: support configure on autoconf <2.69
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
X-List-Received-Date: Wed, 19 Jun 2013 14:50:47 -0000
Content-Type: multipart/alternative; boundary=001a11c1e95484b67d04df82f4e1

--001a11c1e95484b67d04df82f4e1
Content-Type: text/plain; charset=ISO-8859-1

Adding the oe-core list back to the cc list since I accidentally dropped
the list on my first response.

On Wed, Jun 19, 2013 at 10:37 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2013-06-19 at 10:15 -0400, Joe MacDonald wrote:
> >
> >
> > On Wed, Jun 19, 2013 at 10:10 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >         On Wed, 2013-06-19 at 09:56 -0400, joe@deserted.net wrote:
> >         > From: Joe MacDonald <joe@deserted.net>
> >         >
> >         > Building bdwgc-native on systems with older versions of
> >         autoconf (earlier
> >         > than 2.69) is known to have issues:
> >         >
> >         >       https://github.com/ivmai/bdwgc/issues/16
> >         >
> >         > An option is to simply mask the errors with
> >         m4_pattern_allow(...) for each
> >         > of the macros, but rerunning autoreconf produces a
> >         functional configure
> >         > script that builds a functional native version of bdwgc.
> >         >
> >         > Signed-off-by: Joe MacDonald <joe@deserted.net>
> >         > ---
> >         >  meta/recipes-support/bdwgc/bdwgc_7.2d.bb | 9 +++++++++
> >         >  1 file changed, 9 insertions(+)
> >         >
> >         > I tripped over this yesterday on one of my older builders.
> >          It happens to still
> >         > be Ubuntu 12.04.2.  I don't know if it's unique to my
> >         configuration, but after
> >         > doing some digging around on the web I can't see any obvious
> >         indications that
> >         > I'm missing any autotools package and the general consensus
> >         seems to be that
> >         > autoreconf is the best option when the failures are
> >         relatively beign as they
> >         > are here.
> >         >
> >         > -J.
> >         >
> >         > diff --git a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> >         b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> >         > index 46e5257..d8e2de5 100644
> >         > --- a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> >         > +++ b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> >         > @@ -36,3 +36,12 @@ ARM_INSTRUCTION_SET = "arm"
> >         >
> >         >  inherit autotools
> >         >  BBCLASSEXTEND = "native nativesdk"
> >         > +
> >         > +do_configure_prepend() {
> >         > +     # Without this, on older installations of autoconf
> >         errors crop up during configure:
> >         > +     # | configure.ac:70: error: possibly undefined macro:
> >         AC_MSG_ERROR
> >         > +     # |       If this token and others are legitimate,
> >         please use m4_pattern_allow.
> >         > +     # |       See the Autoconf documentation.
> >         > +     # | configure.ac:358: error: possibly undefined macro:
> >         AS_IF
> >         > +     ( cd ${S}; autoreconf -i )
> >         > +}
> >
> >
> >         This is timely since we're seeing this issue on some of the
> >         autobuilders. We should be autoreconfing by default though,
> >         any idea why
> >         it doesn't in this case?
> >
> >
> > No, I didn't actually dig into that, I didn't realize it should be
> > autoreconfing.  Is it explciit in the do_configure step, or implicit?
> >  Maybe it's a timestamp issue or something?  The only machine I've got
> > left that has this problem is pretty fast, so maybe on a slower (or
> > more heavily loaded) machine an implicit rule will fire where a beefy,
> > unloaded one won't?  Just a wild guess.
>
> Reading the link you supplied further, it could be a missing pkgconfig
> dependency?
>

I thought so at first, but I couldn't find anything absent on my builder
that looked even remotely pkgconfig-related.  Then I started digging into
the autotools stuff, since the warning is clearly about expanding autoconf
macros and that's when I finally started paying attention to the version
numbers on the failing host versus the builders I use that weren't
complaining.

It could still be that there's something missing, but when I noticed the
comment just below the "closed" bar in the issue I linked:

<https://github.com/ivmai/bdwgc/issues/16#issuecomment-7854845>
ivmai<https://github.com/ivmai>
 commented <https://github.com/ivmai/bdwgc/issues/16#issuecomment-7854845>10
months ago <https://github.com/ivmai/bdwgc/issues/16#issuecomment-7854845>
I have tested the git sources from bdwgc and they only configure properly
with autoconf >= 2.69. [...]
It seemed like I'd found at least confirmation that what I was seeing was
expected.

I have no idea why the autotools.bbclass' autoreconf wouldn't do it,
though.  I'll go have a quick look to see if the tree is different because
I also passed it -i when I did the autoreconf.

-- 
Joe MacDonald
:wq

--001a11c1e95484b67d04df82f4e1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Adding the oe-core list back to the cc list since I accidentally dropped th=
e list on my first response.<br><br><div class=3D"gmail_quote">On Wed, Jun =
19, 2013 at 10:37 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linu=
xfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2013-06-19 at 10:1=
5 -0400, Joe MacDonald wrote:<br>
&gt;<br>
&gt;<br>
</div><div><div class=3D"h5">&gt; On Wed, Jun 19, 2013 at 10:10 AM, Richard=
 Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 On Wed, 2013-06-19 at 09:56 -0400, <a href=3D"mailto:j=
oe@deserted.net">joe@deserted.net</a> wrote:<br>
&gt; =A0 =A0 =A0 =A0 &gt; From: Joe MacDonald &lt;<a href=3D"mailto:joe@des=
erted.net">joe@deserted.net</a>&gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; Building bdwgc-native on systems with older versi=
ons of<br>
&gt; =A0 =A0 =A0 =A0 autoconf (earlier<br>
&gt; =A0 =A0 =A0 =A0 &gt; than 2.69) is known to have issues:<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 <a href=3D"https://github.com/ivmai/b=
dwgc/issues/16" target=3D"_blank">https://github.com/ivmai/bdwgc/issues/16<=
/a><br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; An option is to simply mask the errors with<br>
&gt; =A0 =A0 =A0 =A0 m4_pattern_allow(...) for each<br>
&gt; =A0 =A0 =A0 =A0 &gt; of the macros, but rerunning autoreconf produces =
a<br>
&gt; =A0 =A0 =A0 =A0 functional configure<br>
&gt; =A0 =A0 =A0 =A0 &gt; script that builds a functional native version of=
 bdwgc.<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; Signed-off-by: Joe MacDonald &lt;<a href=3D"mailt=
o:joe@deserted.net">joe@deserted.net</a>&gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; ---<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0meta/recipes-support/bdwgc/<a href=3D"http://b=
dwgc_7.2d.bb" target=3D"_blank">bdwgc_7.2d.bb</a> | 9 +++++++++<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A01 file changed, 9 insertions(+)<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; I tripped over this yesterday on one of my older =
builders.<br>
&gt; =A0 =A0 =A0 =A0 =A0It happens to still<br>
&gt; =A0 =A0 =A0 =A0 &gt; be Ubuntu 12.04.2. =A0I don&#39;t know if it&#39;=
s unique to my<br>
&gt; =A0 =A0 =A0 =A0 configuration, but after<br>
&gt; =A0 =A0 =A0 =A0 &gt; doing some digging around on the web I can&#39;t =
see any obvious<br>
&gt; =A0 =A0 =A0 =A0 indications that<br>
&gt; =A0 =A0 =A0 =A0 &gt; I&#39;m missing any autotools package and the gen=
eral consensus<br>
&gt; =A0 =A0 =A0 =A0 seems to be that<br>
&gt; =A0 =A0 =A0 =A0 &gt; autoreconf is the best option when the failures a=
re<br>
&gt; =A0 =A0 =A0 =A0 relatively beign as they<br>
&gt; =A0 =A0 =A0 =A0 &gt; are here.<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; -J.<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; diff --git a/meta/recipes-support/bdwgc/<a href=
=3D"http://bdwgc_7.2d.bb" target=3D"_blank">bdwgc_7.2d.bb</a><br>
&gt; =A0 =A0 =A0 =A0 b/meta/recipes-support/bdwgc/<a href=3D"http://bdwgc_7=
.2d.bb" target=3D"_blank">bdwgc_7.2d.bb</a><br>
&gt; =A0 =A0 =A0 =A0 &gt; index 46e5257..d8e2de5 100644<br>
&gt; =A0 =A0 =A0 =A0 &gt; --- a/meta/recipes-support/bdwgc/<a href=3D"http:=
//bdwgc_7.2d.bb" target=3D"_blank">bdwgc_7.2d.bb</a><br>
&gt; =A0 =A0 =A0 =A0 &gt; +++ b/meta/recipes-support/bdwgc/<a href=3D"http:=
//bdwgc_7.2d.bb" target=3D"_blank">bdwgc_7.2d.bb</a><br>
&gt; =A0 =A0 =A0 =A0 &gt; @@ -36,3 +36,12 @@ ARM_INSTRUCTION_SET =3D &quot;=
arm&quot;<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0inherit autotools<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;=
<br>
&gt; =A0 =A0 =A0 =A0 &gt; +<br>
&gt; =A0 =A0 =A0 =A0 &gt; +do_configure_prepend() {<br>
&gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 # Without this, on older installations =
of autoconf<br>
&gt; =A0 =A0 =A0 =A0 errors crop up during configure:<br>
&gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 # | <a href=3D"http://configure.ac:70" =
target=3D"_blank">configure.ac:70</a>: error: possibly undefined macro:<br>
&gt; =A0 =A0 =A0 =A0 AC_MSG_ERROR<br>
&gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 # | =A0 =A0 =A0 If this token and other=
s are legitimate,<br>
&gt; =A0 =A0 =A0 =A0 please use m4_pattern_allow.<br>
&gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 # | =A0 =A0 =A0 See the Autoconf docume=
ntation.<br>
&gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 # | <a href=3D"http://configure.ac:358"=
 target=3D"_blank">configure.ac:358</a>: error: possibly undefined macro:<b=
r>
&gt; =A0 =A0 =A0 =A0 AS_IF<br>
&gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 ( cd ${S}; autoreconf -i )<br>
&gt; =A0 =A0 =A0 =A0 &gt; +}<br>
&gt;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 This is timely since we&#39;re seeing this issue on so=
me of the<br>
&gt; =A0 =A0 =A0 =A0 autobuilders. We should be autoreconfing by default th=
ough,<br>
&gt; =A0 =A0 =A0 =A0 any idea why<br>
&gt; =A0 =A0 =A0 =A0 it doesn&#39;t in this case?<br>
&gt;<br>
&gt;<br>
&gt; No, I didn&#39;t actually dig into that, I didn&#39;t realize it shoul=
d be<br>
&gt; autoreconfing. =A0Is it explciit in the do_configure step, or implicit=
?<br>
&gt; =A0Maybe it&#39;s a timestamp issue or something? =A0The only machine =
I&#39;ve got<br>
&gt; left that has this problem is pretty fast, so maybe on a slower (or<br=
>
&gt; more heavily loaded) machine an implicit rule will fire where a beefy,=
<br>
&gt; unloaded one won&#39;t? =A0Just a wild guess.<br>
<br>
</div></div>Reading the link you supplied further, it could be a missing pk=
gconfig<br>
dependency?<br></blockquote><div><br></div><div>I thought so at first, but =
I couldn&#39;t find anything absent on my builder that looked even remotely=
 pkgconfig-related. =A0Then I started digging into the autotools stuff, sin=
ce the warning is clearly about expanding autoconf macros and that&#39;s wh=
en I finally started paying attention to the version numbers on the failing=
 host versus the builders I use that weren&#39;t complaining.</div>
<div><br></div><div>It could still be that there&#39;s something missing, b=
ut when I noticed the comment just below the &quot;closed&quot; bar in the =
issue I linked:</div><div><br></div><div><div class=3D"comment-header norma=
l-comment-header" style=3D"height:33px;padding:0px 10px 0px 6px;border-bott=
om-width:1px;border-bottom-style:solid;border-bottom-color:rgb(204,204,204)=
;background-color:rgb(225,225,225);background-image:linear-gradient(rgb(248=
,248,248),rgb(225,225,225));font-size:13.333333969116211px;color:rgb(51,51,=
51);font-family:Helvetica,arial,freesans,clean,sans-serif;background-repeat=
:repeat no-repeat">
<a href=3D"https://github.com/ivmai/bdwgc/issues/16#issuecomment-7854845" c=
lass=3D"comment-type-icon octicon octicon-mail-read tooltipped downwards" s=
tyle=3D"color:rgb(147,154,160);text-decoration:none;font-size:16px;font-fam=
ily:github-octicons;line-height:1;display:inline-block;margin:8px 2px 0px 1=
px"></a>=A0<a href=3D"https://github.com/ivmai" class=3D"comment-header-aut=
hor" style=3D"color:rgb(34,34,34);text-decoration:none;max-width:600px;line=
-height:33px;font-weight:bold;overflow:hidden;white-space:nowrap;text-overf=
low:ellipsis">ivmai</a>=A0<span class=3D"comment-header-action-text"><a hre=
f=3D"https://github.com/ivmai/bdwgc/issues/16#issuecomment-7854845" style=
=3D"color:rgb(102,102,102);text-decoration:none">commented</a></span><span =
class=3D"comment-header-right" style=3D"float:right"><a href=3D"https://git=
hub.com/ivmai/bdwgc/issues/16#issuecomment-7854845" class=3D"comment-header=
-date" style=3D"color:rgb(119,119,119);text-decoration:none;display:inline-=
block;margin:0px;height:33px;font-size:11px;line-height:33px">10 months ago=
</a></span></div>
<div class=3D"comment-content" style=3D"padding:0px;color:rgb(51,51,51);fon=
t-size:13.333333969116211px;background-color:rgb(251,251,251);font-family:H=
elvetica,arial,freesans,clean,sans-serif"><div class=3D"edit-comment-hide">=
<div class=3D"js-comment-body comment-body markdown-body" style=3D"line-hei=
ght:1.7;overflow:auto;padding:10px;width:731.8056030273438px">
<div class=3D"email-fragment" style=3D"margin-top:0px!important">I have tes=
ted the git sources from bdwgc and they only configure properly with autoco=
nf &gt;=3D 2.69.=A0[...]</div></div></div></div></div><div>It seemed like I=
&#39;d found at least confirmation that what I was seeing was expected.</di=
v>
<div><br></div><div>I have no idea why the=A0<span style=3D"background-colo=
r:rgb(255,255,255);color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:13px">autotools.bbclass&#39; autoreconf wouldn&#39;t do it, though. =A0I=
&#39;ll go have a quick look to see if the tree is different because I also=
 passed it -i when I did the autoreconf.</span></div>
<div><span style=3D"background-color:rgb(255,255,255);color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:13px"><br></span></div></div>-- <br>J=
oe MacDonald<br>:wq

--001a11c1e95484b67d04df82f4e1--
