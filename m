Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8F671B37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 11:45:34 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id k15so306122346qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 03:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iwe1OPWpDrqwQHQXeDC0aCkk0vbkUBipfUS591sxDaA=;
	b=WaN+MC1vl9bJognEOoUPieqi6VOa1vXYNMmSxNaILAqiUOWa8F9zVw40IUfmAkpcJL
	dx7P3SUcO40gPMysr0NWfjb/L56KVjEtfylLvTVGAfeEyIssygSWJgQ3T89E79UE0U+q
	7d16zgT7Z+eX37yzST4wsPHTqbxvTmLg5qHj3Rnv3tW0izjnmhNxXnntTPP1Ljv4Hams
	+Yl7SLv28YhEeYdSaA8KY5n3LZOdHyK3ae1RUO4I4QIkcnzhuKjEJqcIDWbDAZpGZCGQ
	jYH8QV0VkKwyUF6cNEDmXk3cb4fsfhIxiIyaRViN0xLNaa9OoOo/yQYC/8630Fl0Abij
	YlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iwe1OPWpDrqwQHQXeDC0aCkk0vbkUBipfUS591sxDaA=;
	b=PvrrSlDGdpD7/LSkM1uta/uLrtlAZmJBXiHbK/sHC/iaeMpjOZMwxCaSXeCQn15QDU
	Gg5cMuLvOPhPj3ZHDi7xJeRJVzQqdpj+gD0URIROGpgSVbmbAVAgJLuzqaCAucP15lHy
	E18tj+TP3zgwKuZDVs5HzviYrv4DVhR/eAaceAFT4MDRG02rRpX0HFzCCprFQ1V2muNY
	z7rOlwjbPGZJ7CJZMI0M/XzX+l9WnlwMRHW9Oj3KJYvfGYsMI3De7nAb0zgWLY52vFs9
	y6FhPSEcIV3lluCynxNjIqExuWXqv0/d/7gW8jxLdKBftYb/FtNF3vWihFHMkusBi01b
	3yaw==
X-Gm-Message-State: AIkVDXJOfvbgm86998QXIP2B4MFJdKp8GMCi8wPgWPPawIWujEwxfJgiN+1MqSl0m27lZiPa58fO00/ortg8Bjwe
X-Received: by 10.237.44.161 with SMTP id g30mr71760388qtd.144.1483703135037; 
	Fri, 06 Jan 2017 03:45:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 6 Jan 2017 03:45:14 -0800 (PST)
In-Reply-To: <20170103015528.29635-1-raj.khem@gmail.com>
References: <20170103015528.29635-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jan 2017 11:45:14 +0000
Message-ID: <CAJTo0LYyvqUP+gE=mcbkgF9u7ZEqDPEQL15=M6gtr=AtKL33tw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to 1.1.16+ on master
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
X-List-Received-Date: Fri, 06 Jan 2017 11:45:35 -0000
Content-Type: multipart/alternative; boundary=94eb2c12584850ffdb05456b8eac

--94eb2c12584850ffdb05456b8eac
Content-Type: text/plain; charset=UTF-8

On 3 January 2017 at 01:55, Khem Raj <raj.khem@gmail.com> wrote:

> summary of changes
>
> http://git.musl-libc.org/cgit/musl/commit/?id=
> 8fe1f2d79b275b7f7fb0d41c99e379357df63cd9
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Looks like this is to blame for connman failing last in my test builds:

http://errors.yoctoproject.org/Errors/Details/116506/

Ross

--94eb2c12584850ffdb05456b8eac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 January 2017 at 01:55, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex"><div id=3D"gmail-:6dx" class=3D"gmail-a3s gmail-a=
XjCH gmail-m159628ae1395828c">summary of changes<br>
<br>
<a href=3D"http://git.musl-libc.org/cgit/musl/commit/?id=3D8fe1f2d79b275b7f=
7fb0d41c99e379357df63cd9" rel=3D"noreferrer" target=3D"_blank">http://git.<=
span class=3D"gmail-il">musl</span>-libc.org/cgit/<wbr><span class=3D"gmail=
-il">musl</span>/commit/?id=3D<wbr>8fe1f2d79b275b7f7fb0d41c99e379<wbr>357df=
63cd9</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br></div></blockquote></div><br>Looks like this is to bla=
me for connman failing last in my test builds:</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra"><a href=3D"http://errors.yoctoproj=
ect.org/Errors/Details/116506/">http://errors.yoctoproject.org/Errors/Detai=
ls/116506/</a><br></div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--94eb2c12584850ffdb05456b8eac--
