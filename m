Received: from mail-ve0-f178.google.com ([209.85.128.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4s6j-0005oo-Tu
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 13:03:38 +0100
Received: by mail-ve0-f178.google.com with SMTP id db10so5018031veb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 03:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=5y/FXMnh6EB1yyqgcoiU0wlsxaj4P84Kj7LTCWvDxsg=;
	b=aN/B/M9E7PuANbwhuqjDFhDFehd5KdYzUvaBKISpweWVi8fWfpR7BuiEyWaneHhCku
	HebJiqH2UkBa2BYuVR5pj7harAjZ+BDi39LxpWDNJe9BQcn4jDZ8nVH/2KXzhQTd4y27
	imPCDq76/2jtRW53U+LGbzxLLEZIirXJfl9IG+LhnmENkd2uKLtEJqxN6aX1tu1COZ+M
	0l21TVSUPs/uIqr0y5xLisPkVTXe6QP7Bxg+HMoDzsJ6Gd5UmMwh+lQXsMaify8xoCXl
	x6q14bgbIgxNFSj3DBQ04Ww8bUh6b920FZ3dzMzNmAnUP4rehOoNFfl1VONR6bLKewFW
	eBXA==
X-Received: by 10.220.154.148 with SMTP id o20mr18465811vcw.54.1360583259593; 
	Mon, 11 Feb 2013 03:47:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.229.195 with HTTP; Mon, 11 Feb 2013 03:47:19 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <7962536.2U1dKqZXgW@helios>
References: <CAK18fxFg2a-H5ss43PGNzaK4kEsr0igKpg=3o+xLfiKOPUi+yQ@mail.gmail.com>
	<1360581039.6793.3.camel@ted>
	<CAK18fxHKRNBWXuY+p7R1uxsQwJVFh-aKLG=WMQNqtxT5bCeh+Q@mail.gmail.com>
	<7962536.2U1dKqZXgW@helios>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 11 Feb 2013 13:47:19 +0200
Message-ID: <CAK18fxHp-rb4JOjK3A6OTjEPUUnhnqvp2mmRzv8EMaPCSSReqA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQkQwaWqmsN/4rUkiiGkxX8s91TNfDAm9DrUWmdAJ82+eDDGDDXNZbCh4vjUuKpR+UhTkEFs
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [denzil] qt 4.8.0 is not available from source anymore
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
X-List-Received-Date: Mon, 11 Feb 2013 12:03:38 -0000
Content-Type: multipart/alternative; boundary=f46d0438936fe01a2704d571798b

--f46d0438936fe01a2704d571798b
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 11, 2013 at 1:39 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Monday 11 February 2013 13:33:19 Andrei Gherzan wrote:
> > On Mon, Feb 11, 2013 at 1:10 PM, Richard Purdie <
> >
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Mon, 2013-02-11 at 12:50 +0200, Andrei Gherzan wrote:
> > > > In denzil SRC_URI for qt4.8.0 uses:
> > >
> http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.g
> > > z
> > >
> > > > This source seems to be outdated and replaced
> > > > by: http://releases.qt-project.org/qt4/source/
> > > >
> > > > The problem is that the new location doesn't include the 4.8.0
> > > > release.
> > > > qt-everywhere-opensource-src-4.6.4.tar.gz
> > > > qt-everywhere-opensource-src-4.8.1.tar.gz
> > > > qt-everywhere-opensource-src-4.8.2.tar.gz
> > > > qt-everywhere-opensource-src-4.8.3.tar.gz
> > > > qt-everywhere-opensource-src-4.8.4.tar.gz
> > > >
> > > > So right now qt4 in denzil is not fetch-able anymore.
> > >
> > > It should be fetchable from the source mirror at least. Isn't the build
> > > falling back to that?
> >
> > Seems not. Hm. The real problem is not picking up the mirror as other
> > packages fail in the same way too: connman, kmod etc.
>
> Can you check to make sure MIRRORS are still set in your configuration?
>


Found the problem. meta-ivi is not using poky distro and this is why I had
no mirrors. Thank you for (obvious) hint.
Cheers!

-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--f46d0438936fe01a2704d571798b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Feb 11, 2013 at 1:39 PM, Paul Eggleton <span dir=
=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_bl=
ank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"g=
mail_extra">

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOE=
nZb"><div class=3D"h5">On Monday 11 February 2013 13:33:19 Andrei Gherzan w=
rote:<br>


&gt; On Mon, Feb 11, 2013 at 1:10 PM, Richard Purdie &lt;<br>
&gt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@l=
inuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Mon, 2013-02-11 at 12:50 +0200, Andrei Gherzan wrote:<br>
&gt; &gt; &gt; In denzil SRC_URI for qt4.8.0 uses:<br>
&gt; &gt; <a href=3D"http://get.qt.nokia.com/qt/source/qt-everywhere-openso=
urce-src-${PV}.tar.g" target=3D"_blank">http://get.qt.nokia.com/qt/source/q=
t-everywhere-opensource-src-${PV}.tar.g</a><br>
&gt; &gt; z<br>
&gt; &gt;<br>
&gt; &gt; &gt; This source seems to be outdated and replaced<br>
&gt; &gt; &gt; by: <a href=3D"http://releases.qt-project.org/qt4/source/" t=
arget=3D"_blank">http://releases.qt-project.org/qt4/source/</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The problem is that the new location doesn&#39;t include the=
 4.8.0<br>
&gt; &gt; &gt; release.<br>
&gt; &gt; &gt; qt-everywhere-opensource-src-4.6.4.tar.gz<br>
&gt; &gt; &gt; qt-everywhere-opensource-src-4.8.1.tar.gz<br>
&gt; &gt; &gt; qt-everywhere-opensource-src-4.8.2.tar.gz<br>
&gt; &gt; &gt; qt-everywhere-opensource-src-4.8.3.tar.gz<br>
&gt; &gt; &gt; qt-everywhere-opensource-src-4.8.4.tar.gz<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So right now qt4 in denzil is not fetch-able anymore.<br>
&gt; &gt;<br>
&gt; &gt; It should be fetchable from the source mirror at least. Isn&#39;t=
 the build<br>
&gt; &gt; falling back to that?<br>
&gt;<br>
&gt; Seems not. Hm. The real problem is not picking up the mirror as other<=
br>
&gt; packages fail in the same way too: connman, kmod etc.<br>
<br>
</div></div>Can you check to make sure MIRRORS are still set in your config=
uration?<br></blockquote><div><br></div><div>=A0</div></div>Found the probl=
em. meta-ivi is not using poky distro and this is why I had no mirrors. Tha=
nk you for (obvious) hint.=A0</div>

<div class=3D"gmail_extra">Cheers!<br clear=3D"all"><div><br></div>-- <br><=
div dir=3D"ltr"><div style=3D"text-align:center"></div><div style=3D"text-a=
lign:center"><div align=3D"left" style=3D"font-family:&#39;Times New Roman&=
#39;;font-size:medium">

<b style=3D"color:rgb(51,51,51);font-family:Arial;font-size:small;text-alig=
n:center">Andrei Gherzan</b><font face=3D"Arial" color=3D"#333333" size=3D"=
-1"><br></font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.74=
4.478.414 | =A0f: +40.31.816.28.12</font><br>

</div></div></div>
</div></div>

--f46d0438936fe01a2704d571798b--
