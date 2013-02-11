Received: from mail-vb0-f45.google.com ([209.85.212.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4v4i-0002pA-M1
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 16:13:45 +0100
Received: by mail-vb0-f45.google.com with SMTP id p1so3810850vbi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 06:57:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=IIcN7N+hRD4IxUB2zGPZ6tqGL2L6y9JrIQWWkux8i9I=;
	b=BHbFObpkbjNO8gR+f1OYjh0lgflbwSjkGw1UP96KHE1Xco1wSa2Up//Kqq39n5QtPU
	pyoppM229R8Kiq+FJ/rttQLS9p5oTMCXGwpCUrrQsLSM39E3WuHYQ5TxBiFtfNrsFTwS
	xjqRqHiXLyWPhOtR/in1sCxjUJF9zgkn+7V/ozpzS/uqbBD0ZSQfErAihiCQR9gHOlqr
	OnrAd36rHG5qEWGGsh7sB+ZBUvmFHwOuVz3qgnq7lLgTPTTFKgWRpaR5YpS+zDodVbSj
	jfRzn/R3t8RiJ0Rs5/HTztWInkWBOd8RWJkF5YZ67ogWTm/aySwhetYcrcmygVhlPGRH
	eK0Q==
X-Received: by 10.58.132.170 with SMTP id ov10mr18735673veb.57.1360594666200; 
	Mon, 11 Feb 2013 06:57:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.229.195 with HTTP; Mon, 11 Feb 2013 06:57:26 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <3827804.EL3IkEV3FJ@helios>
References: <50D17BD22A23EE4A887974F6B5882038855FB4BE@ALA-MBB.corp.ad.wrs.com>
	<CAK18fxFaVeETyzWOCK0j3q3iVZUZxygbwoiREPcK-jfbsWNAjg@mail.gmail.com>
	<3827804.EL3IkEV3FJ@helios>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 11 Feb 2013 16:57:26 +0200
Message-ID: <CAK18fxFJBGM5=bqy=LJuYff0XbSdpTR5poyHLpCs4ySNFcGBTQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQk9eXA19Pb2X3jPxItFgxNOV0DpdRO0hnrXVIs0Sug1TEFVwX0xqG0CeAlNZN5e3zbucGdz
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
X-List-Received-Date: Mon, 11 Feb 2013 15:13:46 -0000
X-List-Received-Date: Mon, 11 Feb 2013 15:13:46 -0000
Content-Type: multipart/alternative; boundary=047d7b6da8f8c31cd304d5742146

--047d7b6da8f8c31cd304d5742146
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 11, 2013 at 4:43 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Monday 11 February 2013 16:01:10 Andrei Gherzan wrote:
> > On Mon, Feb 11, 2013 at 3:10 PM, Sarbu, Florin-Ionut (Florin) <
> > Florin.Sarbu@windriver.com> wrote:
> > > On Monday, February 11, 2013 02:51 AM Andrei Gherzan wrote:
> > > >
> > > > In denzil SRC_URI for qt4.8.0 uses:
> > > >
> http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.g
> > > > z
> > > >
> > > >  This source seems to be outdated and replaced by:
> > > > http://releases.qt-project.org/qt4/source/
> > > >
> > > >  The problem is that the new location doesn't include the 4.8.0
> release.
> > > >  qt-everywhere-opensource-src-4.6.4.tar.gz
> > > >  qt-everywhere-opensource-src-4.8.1.tar.gz
> > > >  qt-everywhere-opensource-src-4.8.2.tar.gz
> > > >  qt-everywhere-opensource-src-4.8.3.tar.gz
> > > >  qt-everywhere-opensource-src-4.8.4.tar.gz
> > > >
> > > >  So right now qt4 in denzil is not fetch-able anymore.
> > >
> > >  Use git
> >
> > We are not talking about switching of sources. I want to know why 4.8.0
> is
> > not on yocto mirror.
>
> It should be there, not sure why it isn't.
>
> Michael, could you please upload qt 4.8.0 and anything else downloaded by
> "bitbake -c fetchall world" for the denzil-7.0.2 release into the mirror?
>
>
Thank you.

-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--047d7b6da8f8c31cd304d5742146
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Feb 11, 2013 at 4:43 PM, Paul Eggleton <span dir=3D"ltr">&l=
t;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.e=
ggleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Monday 11 February 2013=
 16:01:10 Andrei Gherzan wrote:<br>
&gt; On Mon, Feb 11, 2013 at 3:10 PM, Sarbu, Florin-Ionut (Florin) &lt;<br>
&gt; <a href=3D"mailto:Florin.Sarbu@windriver.com">Florin.Sarbu@windriver.c=
om</a>&gt; wrote:<br>
</div><div class=3D"im">&gt; &gt; On Monday, February 11, 2013 02:51 AM And=
rei Gherzan wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In denzil SRC_URI for qt4.8.0 uses:<br>
&gt; &gt; &gt; <a href=3D"http://get.qt.nokia.com/qt/source/qt-everywhere-o=
pensource-src-${PV}.tar.g" target=3D"_blank">http://get.qt.nokia.com/qt/sou=
rce/qt-everywhere-opensource-src-${PV}.tar.g</a><br>
&gt; &gt; &gt; z<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0This source seems to be outdated and replaced by:<br>
&gt; &gt; &gt; <a href=3D"http://releases.qt-project.org/qt4/source/" targe=
t=3D"_blank">http://releases.qt-project.org/qt4/source/</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0The problem is that the new location doesn&#39;t include =
the 4.8.0 release.<br>
&gt; &gt; &gt; =A0qt-everywhere-opensource-src-4.6.4.tar.gz<br>
&gt; &gt; &gt; =A0qt-everywhere-opensource-src-4.8.1.tar.gz<br>
&gt; &gt; &gt; =A0qt-everywhere-opensource-src-4.8.2.tar.gz<br>
&gt; &gt; &gt; =A0qt-everywhere-opensource-src-4.8.3.tar.gz<br>
&gt; &gt; &gt; =A0qt-everywhere-opensource-src-4.8.4.tar.gz<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0So right now qt4 in denzil is not fetch-able anymore.<br>
&gt; &gt;<br>
</div><div class=3D"im">&gt; &gt; =A0Use git<br>
&gt;<br>
&gt; We are not talking about switching of sources. I want to know why 4.8.=
0 is<br>
&gt; not on yocto mirror.<br>
<br>
</div>It should be there, not sure why it isn&#39;t.<br>
<br>
Michael, could you please upload qt 4.8.0 and anything else downloaded by<b=
r>
&quot;bitbake -c fetchall world&quot; for the denzil-7.0.2 release into the=
 mirror?<br><div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></block=
quote><div><br></div><div style>Thank you.</div><div style><br></div></div>

-- <br><div dir=3D"ltr"><div style=3D"text-align:center"></div><div style=
=3D"text-align:center"><div align=3D"left" style=3D"font-family:&#39;Times =
New Roman&#39;;font-size:medium"><b style=3D"color:rgb(51,51,51);font-famil=
y:Arial;font-size:small;text-align:center">Andrei Gherzan</b><font face=3D"=
Arial" color=3D"#333333" size=3D"-1"><br>

</font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.744.478.41=
4 | =A0f: +40.31.816.28.12</font><br></div></div></div>
</div></div>

--047d7b6da8f8c31cd304d5742146--
