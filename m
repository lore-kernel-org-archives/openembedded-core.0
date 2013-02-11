Received: from mail-ve0-f169.google.com ([209.85.128.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4rtC-00053g-Mh
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 12:49:40 +0100
Received: by mail-ve0-f169.google.com with SMTP id 15so5138134vea.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 03:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=AvFvh8p66/AHels5QmV6J5iP4hEjI7OVlNuNjtGhsCA=;
	b=l9zrKSvX9b2+pQqbZX40lZEzUpLspKM8jMlgi6MitoankV29YSCfzg/Y94VWl4ElU0
	wcZstmmQJ387L3ZkqlBk/vR0eokTLe8LU8dEtPkObwS4pj7rADmVL8WXm29E4zJmMHJM
	WzNYn9yMeUAxSQ/JsAfpTgbLrQHJPK/TkQd54QqgSjj9EtacU73CUmWoY8GqK3CRXOCE
	TD4BQX6ZNJmeMO+eQHeTtPTOOmaeKl6tXtc8j534qMFtp2RRRNpJcrRG6VArp+D15NPl
	XQN7C8CiPwddK0TvltCd9Y0TqCu2sK3tG1SxKgS62bVoeyunc/N2KgrtPz9+QZJ8Y8P1
	uLZw==
X-Received: by 10.58.161.41 with SMTP id xp9mr17991986veb.56.1360582420376;
	Mon, 11 Feb 2013 03:33:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.229.195 with HTTP; Mon, 11 Feb 2013 03:33:19 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1360581039.6793.3.camel@ted>
References: <CAK18fxFg2a-H5ss43PGNzaK4kEsr0igKpg=3o+xLfiKOPUi+yQ@mail.gmail.com>
	<1360581039.6793.3.camel@ted>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 11 Feb 2013 13:33:19 +0200
Message-ID: <CAK18fxHKRNBWXuY+p7R1uxsQwJVFh-aKLG=WMQNqtxT5bCeh+Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQnyeFfhtN2ijpO/jDhG4PF3Z1P8Hp9l3Y+s79OlhGwYrB3PpGU9pthgSxYvvIib1HxOQ4xp
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
X-List-Received-Date: Mon, 11 Feb 2013 11:49:41 -0000
X-List-Received-Date: Mon, 11 Feb 2013 11:49:41 -0000
Content-Type: multipart/alternative; boundary=047d7b6dc9aadaad3c04d5714734

--047d7b6dc9aadaad3c04d5714734
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 11, 2013 at 1:10 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2013-02-11 at 12:50 +0200, Andrei Gherzan wrote:
> > In denzil SRC_URI for qt4.8.0 uses:
> >
> http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz
> >
> > This source seems to be outdated and replaced
> > by: http://releases.qt-project.org/qt4/source/
> >
> > The problem is that the new location doesn't include the 4.8.0
> > release.
> > qt-everywhere-opensource-src-4.6.4.tar.gz
> > qt-everywhere-opensource-src-4.8.1.tar.gz
> > qt-everywhere-opensource-src-4.8.2.tar.gz
> > qt-everywhere-opensource-src-4.8.3.tar.gz
> > qt-everywhere-opensource-src-4.8.4.tar.gz
> >
> > So right now qt4 in denzil is not fetch-able anymore.
>
> It should be fetchable from the source mirror at least. Isn't the build
> falling back to that?
>

Seems not. Hm. The real problem is not picking up the mirror as other
packages fail in the same way too: connman, kmod etc.

-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--047d7b6dc9aadaad3c04d5714734
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Mon, Feb 11, 2013 at 1:10 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Mon, 2013-02-11 at 12:5=
0 +0200, Andrei Gherzan wrote:<br>
&gt; In denzil SRC_URI for qt4.8.0 uses:<br>
&gt; <a href=3D"http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-=
src-${PV}.tar.gz" target=3D"_blank">http://get.qt.nokia.com/qt/source/qt-ev=
erywhere-opensource-src-${PV}.tar.gz</a><br>
&gt;<br>
&gt; This source seems to be outdated and replaced<br>
&gt; by: <a href=3D"http://releases.qt-project.org/qt4/source/" target=3D"_=
blank">http://releases.qt-project.org/qt4/source/</a><br>
&gt;<br>
&gt; The problem is that the new location doesn&#39;t include the 4.8.0<br>
&gt; release.<br>
&gt; qt-everywhere-opensource-src-4.6.4.tar.gz<br>
&gt; qt-everywhere-opensource-src-4.8.1.tar.gz<br>
&gt; qt-everywhere-opensource-src-4.8.2.tar.gz<br>
&gt; qt-everywhere-opensource-src-4.8.3.tar.gz<br>
&gt; qt-everywhere-opensource-src-4.8.4.tar.gz<br>
&gt;<br>
&gt; So right now qt4 in denzil is not fetch-able anymore.<br>
<br>
</div>It should be fetchable from the source mirror at least. Isn&#39;t the=
 build<br>
falling back to that?<br></blockquote><div><br></div><div style>Seems not. =
Hm. The real problem is not picking up the mirror as other packages fail in=
 the same way too: connman, kmod etc.</div><div>=A0</div></div>-- <br><div =
dir=3D"ltr">

<div style=3D"text-align:center"></div><div style=3D"text-align:center"><di=
v align=3D"left" style=3D"font-family:&#39;Times New Roman&#39;;font-size:m=
edium"><b style=3D"color:rgb(51,51,51);font-family:Arial;font-size:small;te=
xt-align:center">Andrei Gherzan</b><font face=3D"Arial" color=3D"#333333" s=
ize=3D"-1"><br>

</font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.744.478.41=
4 | =A0f: +40.31.816.28.12</font><br></div></div></div>
</div></div>

--047d7b6dc9aadaad3c04d5714734--
