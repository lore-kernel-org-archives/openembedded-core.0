Return-Path: <ka6sox@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3F31B6ACEA;
	Wed,  2 Jul 2014 07:03:53 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id uz6so11877456obc.1
	for <multiple recipients>; Wed, 02 Jul 2014 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5O40vUDs7E+2J2pTeGvGUSjXIUzGSgnYbP6FZMhn/0w=;
	b=Ec/4un4DjHpi1C71fnod162mTd3he+YoTP/qgH1Cd9wdUYT/Cj8h17oGcBhgPqruLD
	n7hgHS09uBDTndmbLScGWUya5dLfJppTFgckAQbpq18UIdR+yZHoTVU4pyZ61vj9LS3r
	/gB6G2eUUCE6BWBxPpHfxTWGl9dl5/HS8mcesRLSkWcdlW5QOjF/AuFcS/ZY1/OBM8jx
	LrR1AkUfHr1qyO+BHARYIKaZ0sjqTojpUh+owTcIa4744oJCH/MH1ovmT1ATtKV7Z8hi
	K9fitUt9oR3s4Gpnmm+wzRNKEafS/6v1NA9lvxyBbiP+0UUrR6KO3EGS3mww+CyMlH8Q
	/h5A==
MIME-Version: 1.0
X-Received: by 10.60.16.72 with SMTP id e8mr48538597oed.11.1404284634402; Wed,
	02 Jul 2014 00:03:54 -0700 (PDT)
Received: by 10.76.128.201 with HTTP; Wed, 2 Jul 2014 00:03:54 -0700 (PDT)
In-Reply-To: <20140701105815.GF2437@jama>
References: <20140619113451.GO2117@jama> <20140624101443.GO2437@jama>
	<CAHQecY6eQfhY4hY_EEUmXd5MEA2_fDb5yfj7YP0i1gg=dKFQ7Q@mail.gmail.com>
	<20140701105815.GF2437@jama>
Date: Wed, 2 Jul 2014 00:03:54 -0700
Message-ID: <CAHQecY4dLUKL_48e5_CEiwsxS_HR_+0Wy85pyNMcMdwtT6TAUw@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Few archives to add on sources.oe.org
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
X-List-Received-Date: Wed, 02 Jul 2014 07:03:58 -0000
Content-Type: multipart/alternative; boundary=089e0149be22cc184804fd307eed

--089e0149be22cc184804fd307eed
Content-Type: text/plain; charset=UTF-8

Done


On Tue, Jul 1, 2014 at 3:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Jun 24, 2014 at 07:36:59AM -0700, Tom King wrote:
> > done
>
> Thanks,
>
> I've found another one in daisy:
>
> barnyard2-1.8.tar.gz
>
> I've verified that
> wget http://ftp.psu.ac.th/pub/snort/barnyard2-1.8.tar.gz
> provides correct checksum or you can fetch it from aruba
> (/home/jenkins/oe/world/downloads-missing).
>
> SRC_URI[md5sum] = "72fc6c490db6ea6a0f46c27d24998067"
> SRC_URI[sha256sum] =
> "1abfe6530d721debd98921421722b02c844c289564730b1e85729e4915b2bb7a"
>
> > On Tue, Jun 24, 2014 at 3:14 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> > > On Thu, Jun 19, 2014 at 01:34:51PM +0200, Martin Jansa wrote:
> > > > Hi Tom,
> > > >
> > > > can you please add:
> > > > IO-Tty-1.10.tar.gz
> > > > SQLAlchemy-0.7.9.tar.gz
> > > > fetchmail-6.3.26.tar.xz
> > > > usb-modeswitch-2.0.1.tar.bz2
> > > > usb-modeswitch-data-20130807.tar.bz2
> > > >
> > > > to sources.oe.org? I can send you tarballs (or fetch them from
> > > > /home/jenkins/oe/shr-core-branches/downloads-missing/ on aruba)
> > > >
> > > > The most annoying is fetchmail which is now fetching HTML page from
> > > > berlios (so checksum check fails instead of showing 404) :/. And user
> > > > needs to download it manually or use sources.oe.org as PREMIRROR,
> but
> > > > still better than nothing.
> > >
> > > I've found only one more missing in upstream sites and used from dora
> > > branch
> > >
> > > daq-2.0.1.tar.gz
> > >
> > > I've verified that
> > > http://download.lunar-linux.org/lunar/mirrors/daq-2.0.1.tar.gz
> > > provides correct checksum or you can fetch it from aruba as before.
> > >
> > > SRC_URI[md5sum] = "044aa3663d44580d005293eeb8ccf175"
> > > SRC_URI[sha256sum] =
> > > "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d1ba1ea6ce518ec6d"
> > >
> > > Thanks
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--089e0149be22cc184804fd307eed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Done</div><div class=3D"gmail_extra"><br><br><div class=3D=
"gmail_quote">On Tue, Jul 1, 2014 at 3:58 AM, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Tue, Jun 24, 2014 at 07:36:59AM -0700, To=
m King wrote:<br>
&gt; done<br>
<br>
Thanks,<br>
<br>
I&#39;ve found another one in daisy:<br>
<br>
barnyard2-1.8.tar.gz<br>
<br>
I&#39;ve verified that<br>
wget <a href=3D"http://ftp.psu.ac.th/pub/snort/barnyard2-1.8.tar.gz" target=
=3D"_blank">http://ftp.psu.ac.th/pub/snort/barnyard2-1.8.tar.gz</a><br>
<div class=3D"">provides correct checksum or you can fetch it from aruba<br=
>
</div>(/home/jenkins/oe/world/downloads-missing).<br>
<br>
SRC_URI[md5sum] =3D &quot;72fc6c490db6ea6a0f46c27d24998067&quot;<br>
SRC_URI[sha256sum] =3D &quot;1abfe6530d721debd98921421722b02c844c289564730b=
1e85729e4915b2bb7a&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; On Tue, Jun 24, 2014 at 3:14 AM, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Thu, Jun 19, 2014 at 01:34:51PM +0200, Martin Jansa wrote:<br>
&gt; &gt; &gt; Hi Tom,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; can you please add:<br>
&gt; &gt; &gt; IO-Tty-1.10.tar.gz<br>
&gt; &gt; &gt; SQLAlchemy-0.7.9.tar.gz<br>
&gt; &gt; &gt; fetchmail-6.3.26.tar.xz<br>
&gt; &gt; &gt; usb-modeswitch-2.0.1.tar.bz2<br>
&gt; &gt; &gt; usb-modeswitch-data-20130807.tar.bz2<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; to <a href=3D"http://sources.oe.org" target=3D"_blank">sourc=
es.oe.org</a>? I can send you tarballs (or fetch them from<br>
&gt; &gt; &gt; /home/jenkins/oe/shr-core-branches/downloads-missing/ on aru=
ba)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The most annoying is fetchmail which is now fetching HTML pa=
ge from<br>
&gt; &gt; &gt; berlios (so checksum check fails instead of showing 404) :/.=
 And user<br>
&gt; &gt; &gt; needs to download it manually or use <a href=3D"http://sourc=
es.oe.org" target=3D"_blank">sources.oe.org</a> as PREMIRROR, but<br>
&gt; &gt; &gt; still better than nothing.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve found only one more missing in upstream sites and used f=
rom dora<br>
&gt; &gt; branch<br>
&gt; &gt;<br>
&gt; &gt; daq-2.0.1.tar.gz<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve verified that<br>
&gt; &gt; <a href=3D"http://download.lunar-linux.org/lunar/mirrors/daq-2.0.=
1.tar.gz" target=3D"_blank">http://download.lunar-linux.org/lunar/mirrors/d=
aq-2.0.1.tar.gz</a><br>
&gt; &gt; provides correct checksum or you can fetch it from aruba as befor=
e.<br>
&gt; &gt;<br>
&gt; &gt; SRC_URI[md5sum] =3D &quot;044aa3663d44580d005293eeb8ccf175&quot;<=
br>
&gt; &gt; SRC_URI[sha256sum] =3D<br>
&gt; &gt; &quot;ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d1ba1ea6ce51=
8ec6d&quot;<br>
&gt; &gt;<br>
&gt; &gt; Thanks<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Martin &#39;JaMa&#39; Jansa =C2=A0 =C2=A0 jabber: <a href=3D"mail=
to:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
&gt; &gt;<br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa =C2=A0 =C2=A0 jabber: <a href=3D"mailto:Martin.=
Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</div></div></blockquote></div><br></div>

--089e0149be22cc184804fd307eed--
