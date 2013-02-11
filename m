Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4uCL-0000m0-Tw
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 15:17:37 +0100
Received: by mail-vb0-f52.google.com with SMTP id fa15so3691815vbb.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 06:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=MfhVYj0pm0f/TJ2oEuBRwMf3oyQp70/taxsWu8ZWBc0=;
	b=JTQPr0T66UxzhmINul7X2/GpqeMrV9S2IezYlxpT68+7NFcEVdhFSkXZfu8yRxkOJC
	T77nzkaLr6KCg7YzFZ4TxzpVBmfKsVe2BVJWdG+gmEAeBT9+r0fE8ZBxBJIj3c3pzIP0
	CBc9Wgh+fdkrj01mWaxIIvBwvmYGVDR7ToKTPcKRVxavLM7aFZiVs+rAlvdmsLpSMAs3
	cki7jxgnRrLLwgsBbpjwhiKnUAWYYkWVufIkkmo+18+T+sAXSzY9Iq4FGD44v+mnFcGQ
	zN2LfwfI2AYnZf2Usw+orMUOoRuFaOL0S77sS+NLPzqpmzHcElC9N+8TQ9dwyeiehnA2
	frXQ==
X-Received: by 10.52.20.177 with SMTP id o17mr2136194vde.17.1360591295435;
	Mon, 11 Feb 2013 06:01:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.229.195 with HTTP; Mon, 11 Feb 2013 06:01:10 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <50D17BD22A23EE4A887974F6B5882038855FB4BE@ALA-MBB.corp.ad.wrs.com>
References: <50D17BD22A23EE4A887974F6B5882038855FB4BE@ALA-MBB.corp.ad.wrs.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 11 Feb 2013 16:01:10 +0200
Message-ID: <CAK18fxFaVeETyzWOCK0j3q3iVZUZxygbwoiREPcK-jfbsWNAjg@mail.gmail.com>
To: "Sarbu, Florin-Ionut (Florin)" <Florin.Sarbu@windriver.com>
X-Gm-Message-State: ALoCoQnxcxPwPc9RgqVxGyS+8Zozh/vMUEoLBCPyZaNdU5aTTW1AOmUb8eKmqWW7x22agOggEjOH
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
X-List-Received-Date: Mon, 11 Feb 2013 14:17:38 -0000
Content-Type: multipart/alternative; boundary=20cf307ca1e4d954ff04d57358c9

--20cf307ca1e4d954ff04d57358c9
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 11, 2013 at 3:10 PM, Sarbu, Florin-Ionut (Florin) <
Florin.Sarbu@windriver.com> wrote:

>  Use git
>
>
We are not talking about switching of sources. I want to know why 4.8.0 is
not on yocto mirror.

Andrei


>
> -----Original Message-----
> *From: *Andrei Gherzan [andrei@gherzan.ro]
> *Sent: *Monday, February 11, 2013 02:51 AM Pacific Standard Time
> *To: *openembedded
> *Subject: *[OE-core] [denzil] qt 4.8.0 is not available from source
> anymore
>
> In denzil SRC_URI for qt4.8.0 uses:
> http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz
>
>  This source seems to be outdated and replaced by:
> http://releases.qt-project.org/qt4/source/
>
>  The problem is that the new location doesn't include the 4.8.0 release.
>  qt-everywhere-opensource-src-4.6.4.tar.gz
> qt-everywhere-opensource-src-4.8.1.tar.gz
>  qt-everywhere-opensource-src-4.8.2.tar.gz
>  qt-everywhere-opensource-src-4.8.3.tar.gz
>  qt-everywhere-opensource-src-4.8.4.tar.gz
>
>  So right now qt4 in denzil is not fetch-able anymore.
>
>  --
>   *Andrei Gherzan*
> m: +40.744.478.414 |  f: +40.31.816.28.12
>



-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--20cf307ca1e4d954ff04d57358c9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Feb 11, 2013 at 3:10 PM, Sarbu, Florin-Ionut (Flor=
in) <span dir=3D"ltr">&lt;<a href=3D"mailto:Florin.Sarbu@windriver.com" tar=
get=3D"_blank">Florin.Sarbu@windriver.com</a>&gt;</span> wrote:<br><div cla=
ss=3D"gmail_extra">

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">



<div>
Use git<div class=3D"im"><br></div></div></blockquote><div><br></div><div s=
tyle>We are not talking about switching of sources. I want to know why 4.8.=
0 is not on yocto mirror.</div><div style><br></div><div style>Andrei=A0</d=
iv>

<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"im">
<br>
-----Original Message-----<br>
<b>From:=A0</b>Andrei Gherzan [<a href=3D"mailto:andrei@gherzan.ro" target=
=3D"_blank">andrei@gherzan.ro</a>]<br>
<b>Sent:=A0</b>Monday, February 11, 2013 02:51 AM Pacific Standard Time<br>
<b>To:=A0</b>openembedded<br>
<b>Subject:=A0</b>[OE-core] [denzil] qt 4.8.0 is not available from source =
anymore<br>
<br>
</div><div dir=3D"ltr"><div class=3D"im">In denzil SRC_URI for qt4.8.0 uses=
:
<div><a href=3D"http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-=
src-$%7BPV%7D.tar.gz" target=3D"_blank">http://get.qt.nokia.com/qt/source/q=
t-everywhere-opensource-src-${PV}.tar.gz</a></div>
<div><br>
</div>
<div>This source seems to be outdated and replaced by:=A0<a href=3D"http://=
releases.qt-project.org/qt4/source/" target=3D"_blank">http://releases.qt-p=
roject.org/qt4/source/</a></div>
<div><br>
</div>
<div>The problem is that the new location doesn&#39;t include the 4.8.0 rel=
ease.=A0</div>
<div>
<div>qt-everywhere-opensource-src-4.6.4.tar.gz</div>
<div>qt-everywhere-opensource-src-4.8.1.tar.gz<br>
</div>
<div>qt-everywhere-opensource-src-4.8.2.tar.gz<br>
</div>
<div>qt-everywhere-opensource-src-4.8.3.tar.gz<br>
</div>
<div>qt-everywhere-opensource-src-4.8.4.tar.gz<br>
</div>
<div><br>
</div>
<div>So right now qt4 in denzil is not=A0fetch-able=A0anymore.</div>
</div>
</div><div>
<div><br>
</div><div class=3D"im">
-- <br>
<div dir=3D"ltr">
<div style=3D"text-align:center"></div>
<div style=3D"text-align:center">
<div align=3D"left" style=3D"font-family:&#39;Times New Roman&#39;;font-siz=
e:medium"><b style=3D"color:rgb(51,51,51);font-family:Arial;font-size:small=
;text-align:center">Andrei Gherzan</b><font face=3D"Arial" color=3D"#333333=
" size=3D"-1"><br>


</font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: <a href=3D"tel=
:%2B40.744.478.414" value=3D"+40744478414" target=3D"_blank">+40.744.478.41=
4</a> | =A0f: <a href=3D"tel:%2B40.31.816.28.12" value=3D"+40318162812" tar=
get=3D"_blank">+40.31.816.28.12</a></font><br>


</div>
</div>
</div>
</div></div>
</div>
</div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr"><div style=3D"text-align:center"></div><div style=3D"text-align:center=
"><div align=3D"left" style=3D"font-family:&#39;Times New Roman&#39;;font-s=
ize:medium">

<b style=3D"color:rgb(51,51,51);font-family:Arial;font-size:small;text-alig=
n:center">Andrei Gherzan</b><font face=3D"Arial" color=3D"#333333" size=3D"=
-1"><br></font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.74=
4.478.414 | =A0f: +40.31.816.28.12</font><br>

</div></div></div>
</div></div>

--20cf307ca1e4d954ff04d57358c9--
