Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3F28A605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 17:05:37 +0000 (UTC)
Received: by qgeu79 with SMTP id u79so56502444qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 10:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=etQOV5oGQ64Y6msBRI7vy40hD4h9IAA/VjPAqSLv8s8=;
	b=J5e5hvz0/Be2jxS598QpCmINX80+bln+nJanRa8hfefDgywSrmPLj4WqTPP/sDaT+2
	QwJWqgUWQL4iFeuBmWQ7cWaSaqr5aINnGIE8vd660EK445gjN3yv2q/vTze0YA06m2Kt
	WjKD1+4Xd3vzkLdCZvGiCocCtQBSmzh/QUVxiUBeME23yY9yvd9vhRaKICp24TuYa4qr
	RUsp8jKUFjsz0C+kgzjVCQb50ng5FmUU/WUGGcvrW1YJePG0mnTNbT3cpUtDbrr4j/bi
	twKPXvUF6knuH/49yBxNkb7W1WrzQYWKLJosr87jGmCpH5QzwlEZ4bdvI9w9zVqsyAo6
	y23w==
X-Gm-Message-State: ALoCoQmkcnGueJrQdQDkxrTTCnh6zPEZeLQZWQ0yanoDNzgguOHi1V+akVePtQwf+nAOWK1pUEiy
X-Received: by 10.140.235.19 with SMTP id g19mr44418140qhc.52.1438016737733;
	Mon, 27 Jul 2015 10:05:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Mon, 27 Jul 2015 10:05:18 -0700 (PDT)
In-Reply-To: <CAP9ODKpMEdbLXiv=kHRpnX0CJ0v7ee_FRF0ZVMWYMW7a18mWdQ@mail.gmail.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
	<1437996407-29463-2-git-send-email-b54851@freescale.com>
	<CAP9ODKpMEdbLXiv=kHRpnX0CJ0v7ee_FRF0ZVMWYMW7a18mWdQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Jul 2015 18:05:18 +0100
Message-ID: <CAJTo0LbOeMQXd+tRS4=ETVCcDwcaSkKAie_7aR+2zUXT2_pWrg@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 1/6] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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
X-List-Received-Date: Mon, 27 Jul 2015 17:05:40 -0000
Content-Type: multipart/alternative; boundary=001a11376dacd5854a051bde5cca

--001a11376dacd5854a051bde5cca
Content-Type: text/plain; charset=UTF-8

How many of these patches are applied in the 1.5 releases of GStreamer?  We
can upgrade instead and a colleague is going to be looking at the upgrades
tomorrow, so if several can be dropped then that will save time and effort.

Ross

On 27 July 2015 at 17:44, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> Hello,
>
> I am fine with the patch but it needs fixing.
>
> Check below.
>
> On Mon, Jul 27, 2015 at 8:26 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> > Use g_utf16_to_utf8() instead of g_convert to fix the issue that
> > id3 tags utf16 charaters cannot be extreacted in id3demux when try
> > to get the id3v2 tag such as TIT2, TALB etc.
> >
> > Signed-off-by: Yuqing Zhu <b54851@freescale.com>
> > ---
> >  .../fix-id3demux-utf16-to-utf8-issue.patch         | 54
> ++++++++++++++++++++++
> >  .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
> >  2 files changed, 55 insertions(+)
> >  create mode 100755
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
> >
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
> > new file mode 100755
> > index 0000000..458d153
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
> > @@ -0,0 +1,54 @@
> > +Author: Lyon Wang <b12696@freescale.com>
> > +Date:   Thu Oct 9 17:37:43 2014 +0800
> > +
> > +[id3v2frames] Bug fix for id3demux issue
> > +
> > +Fix the issue that id3 tags utf16 charaters cannot be extreacted in
> id3demux
> > +when I tried to get the id3v2 tag such as TIT2, TALB etc. it will
> return extrac
> > +failed.
> > +
> > +Checked in id3v2frame.c,  When parse the UTF-16 streams, it used
> g_convert() to
> > +convert the buffer from UTF-16 to UTF-8, however it will return err
> that this
> > +conversion is not supported which cause the extraction failed with
> these UTF-16
> > +characters.
> > +
> > +In the patch, use g_utf16_to_utf8() instead of g_convert, which can
> convert the
> > +character format successfully.
> > +
> > +https://bugzilla.gnome.org/show_bug.cgi?id=741144
> > +
> > +Upstream Status: Pending
>
> It is:
>
> Upstream-Status:
>
> and it seems all patches you sent has this very same error. Please
> update it and resend the whole serie (with this fixed in ALL patches)
> as it is easy to get missed while applying the patches and makes
> tracking harder.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11376dacd5854a051bde5cca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How many of these patches are applied in the 1.5 releases =
of GStreamer?=C2=A0 We can upgrade instead and a colleague is going to be l=
ooking at the upgrades tomorrow, so if several can be dropped then that wil=
l save time and effort.<div><br></div><div>Ross</div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 27 July 2015 at 17:44, Otavio =
Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.=
com.br" target=3D"_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
I am fine with the patch but it needs fixing.<br>
<br>
Check below.<br>
<div><div class=3D"h5"><br>
On Mon, Jul 27, 2015 at 8:26 AM, Yuqing Zhu &lt;<a href=3D"mailto:b54851@fr=
eescale.com">b54851@freescale.com</a>&gt; wrote:<br>
&gt; Use g_utf16_to_utf8() instead of g_convert to fix the issue that<br>
&gt; id3 tags utf16 charaters cannot be extreacted in id3demux when try<br>
&gt; to get the id3v2 tag such as TIT2, TALB etc.<br>
&gt;<br>
&gt; Signed-off-by: Yuqing Zhu &lt;<a href=3D"mailto:b54851@freescale.com">=
b54851@freescale.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../fix-id3demux-utf16-to-utf8-issue.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 54 ++++++++++++++++++++++<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-plugins-base_1.4.5.=
bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-base_1.4.5.bb=
</a>=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 55 insertions(+)<br>
&gt;=C2=A0 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
se/fix-id3demux-utf16-to-utf8-issue.patch b/meta/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch<br>
&gt; new file mode 100755<br>
&gt; index 0000000..458d153<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-=
id3demux-utf16-to-utf8-issue.patch<br>
&gt; @@ -0,0 +1,54 @@<br>
&gt; +Author: Lyon Wang &lt;<a href=3D"mailto:b12696@freescale.com">b12696@=
freescale.com</a>&gt;<br>
&gt; +Date:=C2=A0 =C2=A0Thu Oct 9 17:37:43 2014 +0800<br>
&gt; +<br>
&gt; +[id3v2frames] Bug fix for id3demux issue<br>
&gt; +<br>
&gt; +Fix the issue that id3 tags utf16 charaters cannot be extreacted in i=
d3demux<br>
&gt; +when I tried to get the id3v2 tag such as TIT2, TALB etc. it will ret=
urn extrac<br>
&gt; +failed.<br>
&gt; +<br>
&gt; +Checked in id3v2frame.c,=C2=A0 When parse the UTF-16 streams, it used=
 g_convert() to<br>
&gt; +convert the buffer from UTF-16 to UTF-8, however it will return err t=
hat this<br>
&gt; +conversion is not supported which cause the extraction failed with th=
ese UTF-16<br>
&gt; +characters.<br>
&gt; +<br>
&gt; +In the patch, use g_utf16_to_utf8() instead of g_convert, which can c=
onvert the<br>
&gt; +character format successfully.<br>
&gt; +<br>
&gt; +<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D741144" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?i=
d=3D741144</a><br>
&gt; +<br>
&gt; +Upstream Status: Pending<br>
<br>
</div></div>It is:<br>
<br>
Upstream-Status:<br>
<br>
and it seems all patches you sent has this very same error. Please<br>
update it and resend the whole serie (with this fixed in ALL patches)<br>
as it is easy to get missed while applying the patches and makes<br>
tracking harder.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a11376dacd5854a051bde5cca--
