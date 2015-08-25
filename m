Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id E783676ABD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 14:25:06 +0000 (UTC)
Received: by igcse8 with SMTP id se8so13715874igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 07:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=D/ZfIAbl1c36hOAygI65S/OvrfQk3x8Lsuj5Lt64N+o=;
	b=rJzlxMJPqChfdmIERoA9b0zr93eIDCQPCM2nj3XkZa3Rsq1Yh70v+CgEXX4y0Xtu8V
	SLZjW6w1Nz4UqnFfaAVk+p0jq3mKql7G0ZFVpZbXezJ9To+lIppCpT/n4nBUiBE42aIS
	eQ17n2dMTYIxdn+XB8vAUOC6+QMAMyixFE+aFgifsAy54rS8URC+h2SUrOtoVyoJnhcP
	9OZhqX0hKuxWTp3uZTZWaruYdQDar6hTar3eeoX6kmGHAUssWDYTl1KaBR2F6W3gazYM
	KFkxGaBRxq+m9iZx4Eje8MgNpOWq6oh7TIW7cLqrZ4/4yQo2RGtqOynvX+dzT8yGlkHO
	FLgw==
X-Received: by 10.50.43.170 with SMTP id x10mr2799780igl.68.1440512706545;
	Tue, 25 Aug 2015 07:25:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.71 with HTTP; Tue, 25 Aug 2015 07:24:47 -0700 (PDT)
In-Reply-To: <1440492678.12105.413.camel@linuxfoundation.org>
References: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
	<16c46495d37fed950d54ef66134e6cb77771e696.1440454289.git.chris_larson@mentor.com>
	<1440492678.12105.413.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 25 Aug 2015 07:24:47 -0700
Message-ID: <CABcZANnLPX8oyi9+pTQFjEOLuaGseJoWB2CE7-2rqYTUYc0vEw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] bitbake.conf: add MIRROR vars to SRC_URI vardeps
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
X-List-Received-Date: Tue, 25 Aug 2015 14:25:08 -0000
Content-Type: multipart/alternative; boundary=089e01176cad2b1199051e23807f

--089e01176cad2b1199051e23807f
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 25, 2015 at 1:51 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2015-08-24 at 15:18 -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Changes to what mirror we happen to fetch from shouldn't cause rebuilds.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  meta/conf/bitbake.conf | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 21f1698..1407c5f 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -581,6 +581,23 @@ SAVANNAH_GNU_MIRROR = "
> http://download.savannah.gnu.org/releases"
> >  SAVANNAH_NONGNU_MIRROR = "http://download.savannah.nongnu.org/releases"
> >  CPAN_MIRROR = "http://search.cpan.org/CPAN"
> >
> > +SRC_URI[vardeps] += "\
> > +    APACHE_MIRROR \
> > +    CPAN_MIRROR \
> > +    DEBIAN_MIRROR \
> > +    GENTOO_MIRROR \
> > +    GNOME_GIT \
> > +    GNOME_MIRROR \
> > +    GNU_MIRROR \
> > +    GPE_MIRROR \
> > +    KERNELORG_MIRROR \
> > +    SAVANNAH_GNU_MIRROR \
> > +    SAVANNAH_NONGNU_MIRROR \
> > +    SOURCEFORGE_MIRROR \
> > +    XLIBS_MIRROR \
> > +    XORG_MIRROR \
> > +"
>
> Do you mean vardeps here? Don't you want to exclude them?


Err, yes, that should obviously be vardepsexclude. I recreated it rather
than copying and pasting it from mel since I wanted to use a current list
of mirrors from that file, and clearly typoed/thinko'd. Thanks, will fix.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01176cad2b1199051e23807f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Aug 25, 2015 at 1:51 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">On Mon, 2015-08-24 at 1=
5:18 -0700, Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; Changes to what mirror we happen to fetch from shouldn&#39;t cause reb=
uilds.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/bitbake.conf | 17 +++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 17 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 21f1698..1407c5f 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -581,6 +581,23 @@ SAVANNAH_GNU_MIRROR =3D &quot;<a href=3D"http://d=
ownload.savannah.gnu.org/releases" rel=3D"noreferrer" target=3D"_blank">htt=
p://download.savannah.gnu.org/releases</a>&quot;<br>
&gt;=C2=A0 SAVANNAH_NONGNU_MIRROR =3D &quot;<a href=3D"http://download.sava=
nnah.nongnu.org/releases" rel=3D"noreferrer" target=3D"_blank">http://downl=
oad.savannah.nongnu.org/releases</a>&quot;<br>
&gt;=C2=A0 CPAN_MIRROR =3D &quot;<a href=3D"http://search.cpan.org/CPAN" re=
l=3D"noreferrer" target=3D"_blank">http://search.cpan.org/CPAN</a>&quot;<br=
>
&gt;<br>
&gt; +SRC_URI[vardeps] +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 APACHE_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 CPAN_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 DEBIAN_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 GENTOO_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 GNOME_GIT \<br>
&gt; +=C2=A0 =C2=A0 GNOME_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 GNU_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 GPE_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 KERNELORG_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 SAVANNAH_GNU_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 SAVANNAH_NONGNU_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 SOURCEFORGE_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 XLIBS_MIRROR \<br>
&gt; +=C2=A0 =C2=A0 XORG_MIRROR \<br>
&gt; +&quot;<br>
<br>
</div></div>Do you mean vardeps here? Don&#39;t you want to exclude them?</=
blockquote></div><br>Err, yes, that should obviously be vardepsexclude. I r=
ecreated it rather than copying and pasting it from mel since I wanted to u=
se a current list of mirrors from that file, and clearly typoed/thinko&#39;=
d. Thanks, will fix.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"l=
tr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, Op=
enEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, M=
entor Graphics</div></div>
</div></div>

--089e01176cad2b1199051e23807f--
