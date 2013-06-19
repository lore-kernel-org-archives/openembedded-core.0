Return-Path: <joe@deserted.net>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id C260A608CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 15:09:33 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id a13so13505414iee.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 08:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=pHT+F1mLiTZ4xf7XixCcEbRTdMhBBd7W64atmT0H5Pk=;
	b=Pl8azFFwrjQw3bezQTy8WRIWNyuhLDWWSLCT3UNnd4it6c6YCNA7nUWn6gnBiiObtJ
	q1mG+xRu6QacmOQlAg3RCa7yCJF9hBsj9S4bDE2sl2H3s5VU5dX+4xt5VsbSLfN5gQ6V
	1tcqhQ1O19xn4hMvX2GJ9OPLf9lnV0BuHf2p7JJsJLhlwKT3M+NFAYBQKKCw/I9w2+YG
	pG5qBp6661Pl4biYlaWzSUmNt/HY4p1DIP9JWHKD74u9+zDzRZJ5SjrAlshWZAngi7W/
	kujr4tnnQIAWCjpBUw9/cq+p5FYmUv8h62Y4UZAdzsAR9G8rEGMwEoQqJshCtlE7KiPV
	IRoQ==
MIME-Version: 1.0
X-Received: by 10.43.158.8 with SMTP id ls8mr1329992icc.34.1371654574972; Wed,
	19 Jun 2013 08:09:34 -0700 (PDT)
Received: by 10.42.25.70 with HTTP; Wed, 19 Jun 2013 08:09:34 -0700 (PDT)
In-Reply-To: <1371654124.20823.194.camel@ted>
References: <1371650216-31735-1-git-send-email-joe@deserted.net>
	<1371651046.20823.189.camel@ted>
	<CANBf+V3L7MBU3U9vZTqVtgv8GYPfoV9aeqyNA6C2QjMpentXOQ@mail.gmail.com>
	<1371652646.20823.192.camel@ted>
	<CANBf+V2sThoGM4-U=XfeGgG3kOdZonXx=pgz61LX_83msLbjSg@mail.gmail.com>
	<1371654124.20823.194.camel@ted>
Date: Wed, 19 Jun 2013 11:09:34 -0400
Message-ID: <CANBf+V00HqZe5u94jvQ278DS7pDzNE5Fg5iRGQyqNQ7QhRO6fg@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQmOTw/cnNMVk/tsxbSIWunq99AaxF0iYv7Udyl6nFo8CKhKhsG8zRsjC4Xz9EuAmkKc8Z2Y
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
X-List-Received-Date: Wed, 19 Jun 2013 15:09:34 -0000
Content-Type: multipart/alternative; boundary=001a11c1e954b224c704df8337cc

--001a11c1e954b224c704df8337cc
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 19, 2013 at 11:02 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2013-06-19 at 10:50 -0400, Joe MacDonald wrote:
> > Adding the oe-core list back to the cc list since I accidentally
> > dropped the list on my first response.
> >
> > On Wed, Jun 19, 2013 at 10:37 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >         On Wed, 2013-06-19 at 10:15 -0400, Joe MacDonald wrote:
> >         >
> >         >
> >
> >         > On Wed, Jun 19, 2013 at 10:10 AM, Richard Purdie
> >         > <richard.purdie@linuxfoundation.org> wrote:
> >         >         On Wed, 2013-06-19 at 09:56 -0400, joe@deserted.net
> >         wrote:
> >         >         > From: Joe MacDonald <joe@deserted.net>
> >         >         >
> >         >         > Building bdwgc-native on systems with older
> >         versions of
> >         >         autoconf (earlier
> >         >         > than 2.69) is known to have issues:
> >         >         >
> >         >         >       https://github.com/ivmai/bdwgc/issues/16
> >         >         >
> >         >         > An option is to simply mask the errors with
> >         >         m4_pattern_allow(...) for each
> >         >         > of the macros, but rerunning autoreconf produces a
> >         >         functional configure
> >         >         > script that builds a functional native version of
> >         bdwgc.
> >         >         >
> >         >         > Signed-off-by: Joe MacDonald <joe@deserted.net>
> >         >         > ---
> >         >         >  meta/recipes-support/bdwgc/bdwgc_7.2d.bb | 9
> >         +++++++++
> >         >         >  1 file changed, 9 insertions(+)
> >         >         >
> >         >         > I tripped over this yesterday on one of my older
> >         builders.
> >         >          It happens to still
> >         >         > be Ubuntu 12.04.2.  I don't know if it's unique to
> >         my
> >         >         configuration, but after
> >         >         > doing some digging around on the web I can't see
> >         any obvious
> >         >         indications that
> >         >         > I'm missing any autotools package and the general
> >         consensus
> >         >         seems to be that
> >         >         > autoreconf is the best option when the failures
> >         are
> >         >         relatively beign as they
> >         >         > are here.
> >         >         >
> >         >         > -J.
> >         >         >
> >         >         > diff --git
> >         a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> >         >         b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> >         >         > index 46e5257..d8e2de5 100644
> >         >         > --- a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> >         >         > +++ b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> >         >         > @@ -36,3 +36,12 @@ ARM_INSTRUCTION_SET = "arm"
> >         >         >
> >         >         >  inherit autotools
> >         >         >  BBCLASSEXTEND = "native nativesdk"
> >         >         > +
> >         >         > +do_configure_prepend() {
> >         >         > +     # Without this, on older installations of
> >         autoconf
> >         >         errors crop up during configure:
> >         >         > +     # | configure.ac:70: error: possibly
> >         undefined macro:
> >         >         AC_MSG_ERROR
> >         >         > +     # |       If this token and others are
> >         legitimate,
> >         >         please use m4_pattern_allow.
> >         >         > +     # |       See the Autoconf documentation.
> >         >         > +     # | configure.ac:358: error: possibly
> >         undefined macro:
> >         >         AS_IF
> >         >         > +     ( cd ${S}; autoreconf -i )
> >         >         > +}
> >         >
> >         >
> >         >         This is timely since we're seeing this issue on some
> >         of the
> >         >         autobuilders. We should be autoreconfing by default
> >         though,
> >         >         any idea why
> >         >         it doesn't in this case?
> >         >
> >         >
> >         > No, I didn't actually dig into that, I didn't realize it
> >         should be
> >         > autoreconfing.  Is it explciit in the do_configure step, or
> >         implicit?
> >         >  Maybe it's a timestamp issue or something?  The only
> >         machine I've got
> >         > left that has this problem is pretty fast, so maybe on a
> >         slower (or
> >         > more heavily loaded) machine an implicit rule will fire
> >         where a beefy,
> >         > unloaded one won't?  Just a wild guess.
> >
> >
> >         Reading the link you supplied further, it could be a missing
> >         pkgconfig
> >         dependency?
> >
> >
> > I thought so at first, but I couldn't find anything absent on my
> > builder that looked even remotely pkgconfig-related.  Then I started
> > digging into the autotools stuff, since the warning is clearly about
> > expanding autoconf macros and that's when I finally started paying
> > attention to the version numbers on the failing host versus the
> > builders I use that weren't complaining.
> >
> >
> > It could still be that there's something missing, but when I noticed
> > the comment just below the "closed" bar in the issue I linked:
> >
> >
> >  ivmai commented10 months ago
> > I have tested the git sources from bdwgc and they only configure
> > properly with autoconf >= 2.69. [...]
> > It seemed like I'd found at least confirmation that what I was seeing
> > was expected.
> >
> >
> > I have no idea why the autotools.bbclass' autoreconf wouldn't do it,
> > though.  I'll go have a quick look to see if the tree is different
> > because I also passed it -i when I did the autoreconf.
> >
>
> I have a reproducer:
>
> bitbake bdwgc-native pkgconfig-native -c clean; bitbake bdwgc-native
>
> Pretty sure its a missing pkgconfig dependency.
>

Confirmed on the failing machine here too.  You've got this, then?  Or do
you want me to send a new patch?

-- 
Joe MacDonald
:wq

--001a11c1e954b224c704df8337cc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Jun 19, 2013 at 11:02 AM, Richar=
d Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</spa=
n> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On W=
ed, 2013-06-19 at 10:50 -0400, Joe MacDonald wrote:<br>
&gt; Adding the oe-core list back to the cc list since I accidentally<br>
&gt; dropped the list on my first response.<br>
&gt;<br>
&gt; On Wed, Jun 19, 2013 at 10:37 AM, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 On Wed, 2013-06-19 at 10:15 -0400, Joe MacDonald wrote=
:<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; On Wed, Jun 19, 2013 at 10:10 AM, Richard Purdie<=
br>
&gt; =A0 =A0 =A0 =A0 &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 On Wed, 2013-06-19 at 09:56 -0400=
, <a href=3D"mailto:joe@deserted.net">joe@deserted.net</a><br>
&gt; =A0 =A0 =A0 =A0 wrote:<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; From: Joe MacDonald &lt;<a h=
ref=3D"mailto:joe@deserted.net">joe@deserted.net</a>&gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; Building bdwgc-native on sys=
tems with older<br>
&gt; =A0 =A0 =A0 =A0 versions of<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 autoconf (earlier<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; than 2.69) is known to have =
issues:<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 <a href=3D"https=
://github.com/ivmai/bdwgc/issues/16" target=3D"_blank">https://github.com/i=
vmai/bdwgc/issues/16</a><br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; An option is to simply mask =
the errors with<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 m4_pattern_allow(...) for each<br=
>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; of the macros, but rerunning=
 autoreconf produces a<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 functional configure<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; script that builds a functio=
nal native version of<br>
&gt; =A0 =A0 =A0 =A0 bdwgc.<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; Signed-off-by: Joe MacDonald=
 &lt;<a href=3D"mailto:joe@deserted.net">joe@deserted.net</a>&gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; ---<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; =A0meta/recipes-support/bdwg=
c/<a href=3D"http://bdwgc_7.2d.bb" target=3D"_blank">bdwgc_7.2d.bb</a> | 9<=
br>
&gt; =A0 =A0 =A0 =A0 +++++++++<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; =A01 file changed, 9 inserti=
ons(+)<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; I tripped over this yesterda=
y on one of my older<br>
&gt; =A0 =A0 =A0 =A0 builders.<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 =A0It happens to still<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; be Ubuntu 12.04.2. =A0I don&=
#39;t know if it&#39;s unique to<br>
&gt; =A0 =A0 =A0 =A0 my<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 configuration, but after<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; doing some digging around on=
 the web I can&#39;t see<br>
&gt; =A0 =A0 =A0 =A0 any obvious<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 indications that<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; I&#39;m missing any autotool=
s package and the general<br>
&gt; =A0 =A0 =A0 =A0 consensus<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 seems to be that<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; autoreconf is the best optio=
n when the failures<br>
&gt; =A0 =A0 =A0 =A0 are<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 relatively beign as they<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; are here.<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; -J.<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; diff --git<br>
&gt; =A0 =A0 =A0 =A0 a/meta/recipes-support/bdwgc/<a href=3D"http://bdwgc_7=
.2d.bb" target=3D"_blank">bdwgc_7.2d.bb</a><br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 b/meta/recipes-support/bdwgc/<a h=
ref=3D"http://bdwgc_7.2d.bb" target=3D"_blank">bdwgc_7.2d.bb</a><br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; index 46e5257..d8e2de5 10064=
4<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; --- a/meta/recipes-support/b=
dwgc/<a href=3D"http://bdwgc_7.2d.bb" target=3D"_blank">bdwgc_7.2d.bb</a><b=
r>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; +++ b/meta/recipes-support/b=
dwgc/<a href=3D"http://bdwgc_7.2d.bb" target=3D"_blank">bdwgc_7.2d.bb</a><b=
r>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; @@ -36,3 +36,12 @@ ARM_INSTR=
UCTION_SET =3D &quot;arm&quot;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; =A0inherit autotools<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; =A0BBCLASSEXTEND =3D &quot;n=
ative nativesdk&quot;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; +<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; +do_configure_prepend() {<br=
>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 # Without this, on=
 older installations of<br>
&gt; =A0 =A0 =A0 =A0 autoconf<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 errors crop up during configure:<=
br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 # | <a href=3D"htt=
p://configure.ac:70" target=3D"_blank">configure.ac:70</a>: error: possibly=
<br>
&gt; =A0 =A0 =A0 =A0 undefined macro:<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 AC_MSG_ERROR<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 # | =A0 =A0 =A0 If=
 this token and others are<br>
&gt; =A0 =A0 =A0 =A0 legitimate,<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 please use m4_pattern_allow.<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 # | =A0 =A0 =A0 Se=
e the Autoconf documentation.<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 # | <a href=3D"htt=
p://configure.ac:358" target=3D"_blank">configure.ac:358</a>: error: possib=
ly<br>
&gt; =A0 =A0 =A0 =A0 undefined macro:<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 AS_IF<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; + =A0 =A0 ( cd ${S}; autorec=
onf -i )<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 &gt; +}<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 This is timely since we&#39;re se=
eing this issue on some<br>
&gt; =A0 =A0 =A0 =A0 of the<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 autobuilders. We should be autore=
confing by default<br>
&gt; =A0 =A0 =A0 =A0 though,<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 any idea why<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0 =A0 =A0 =A0 it doesn&#39;t in this case?<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; No, I didn&#39;t actually dig into that, I didn&#=
39;t realize it<br>
&gt; =A0 =A0 =A0 =A0 should be<br>
&gt; =A0 =A0 =A0 =A0 &gt; autoreconfing. =A0Is it explciit in the do_config=
ure step, or<br>
&gt; =A0 =A0 =A0 =A0 implicit?<br>
&gt; =A0 =A0 =A0 =A0 &gt; =A0Maybe it&#39;s a timestamp issue or something?=
 =A0The only<br>
&gt; =A0 =A0 =A0 =A0 machine I&#39;ve got<br>
&gt; =A0 =A0 =A0 =A0 &gt; left that has this problem is pretty fast, so may=
be on a<br>
&gt; =A0 =A0 =A0 =A0 slower (or<br>
&gt; =A0 =A0 =A0 =A0 &gt; more heavily loaded) machine an implicit rule wil=
l fire<br>
&gt; =A0 =A0 =A0 =A0 where a beefy,<br>
&gt; =A0 =A0 =A0 =A0 &gt; unloaded one won&#39;t? =A0Just a wild guess.<br>
&gt;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 Reading the link you supplied further, it could be a m=
issing<br>
&gt; =A0 =A0 =A0 =A0 pkgconfig<br>
&gt; =A0 =A0 =A0 =A0 dependency?<br>
&gt;<br>
&gt;<br>
&gt; I thought so at first, but I couldn&#39;t find anything absent on my<b=
r>
&gt; builder that looked even remotely pkgconfig-related. =A0Then I started=
<br>
&gt; digging into the autotools stuff, since the warning is clearly about<b=
r>
&gt; expanding autoconf macros and that&#39;s when I finally started paying=
<br>
&gt; attention to the version numbers on the failing host versus the<br>
&gt; builders I use that weren&#39;t complaining.<br>
&gt;<br>
&gt;<br>
&gt; It could still be that there&#39;s something missing, but when I notic=
ed<br>
&gt; the comment just below the &quot;closed&quot; bar in the issue I linke=
d:<br>
&gt;<br>
&gt;<br>
&gt; =A0ivmai commented10 months ago<br>
&gt; I have tested the git sources from bdwgc and they only configure<br>
&gt; properly with autoconf &gt;=3D 2.69. [...]<br>
&gt; It seemed like I&#39;d found at least confirmation that what I was see=
ing<br>
&gt; was expected.<br>
&gt;<br>
&gt;<br>
&gt; I have no idea why the autotools.bbclass&#39; autoreconf wouldn&#39;t =
do it,<br>
&gt; though. =A0I&#39;ll go have a quick look to see if the tree is differe=
nt<br>
&gt; because I also passed it -i when I did the autoreconf.<br>
&gt;<br>
<br>
</div></div>I have a reproducer:<br>
<br>
bitbake bdwgc-native pkgconfig-native -c clean; bitbake bdwgc-native<br>
<br>
Pretty sure its a missing pkgconfig dependency.<br></blockquote><div><br></=
div><div>Confirmed on the failing machine here too. =A0You&#39;ve got this,=
 then? =A0Or do you want me to send a new patch?=A0</div></div><div><br></d=
iv>
-- <br>Joe MacDonald<br>:wq

--001a11c1e954b224c704df8337cc--
