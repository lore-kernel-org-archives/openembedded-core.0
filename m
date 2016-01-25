Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id B0FC173196
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 17:37:57 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id ik10so39385602igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 09:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=olwYPsMOOH2mmJA7jc9zkgCIL9MSRXbKkAcmGlhfdwQ=;
	b=jIhKTavmB++agjAy5KvoRVUvu/yrHfqi5kMPH81fYfH/YqD9zbbkOsZrJXlEwdrYsd
	Vyc5qA9JNlSK3YuPuUeqekmrbhvTubP0kpDzp2YBscBWn5ckUA2AJk1Ljv/l1MnLKiIR
	OTph67sWoSSDDlHyV2HHSiTI8Q1CZx2csQTVE6BX7HQ8EiBaA1iz5WacjaH9qv4klXuk
	t8u51KR/CHv/nJj95RcGXWkvvpdY1HrN4GZbgWR8d7/OdV4jtCehO1IzFFVCgKufywt/
	vo8PgdzmEEl1P2DLFCMNulja7Xa4b9pnRfpvlYfETeXOaqdxcN8mLU1HoxFVPEfUR3go
	otdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=olwYPsMOOH2mmJA7jc9zkgCIL9MSRXbKkAcmGlhfdwQ=;
	b=HI6+RXIXAz2nDb2xESdRKmeJIHCzX0vyFTkxN5CZO5VwYgRX+yjb22GoazNqxkMjSp
	0IJyaau62KiOeKHGE7e246eSt7ZN6NKPZwK0mYnVWsrKdAjbcjWErrgAhDq/OVFuLoeF
	IEGAIMkkflJBBaElv8HsbU8Ge97iprm2/YaGE/2FkWZDU90jKhQjXJKAxWUvqN/xCMWj
	toyjM3lnsXy26J32QMVLRPi8yAq7fhkHZaFZ4xgMIsMgnXBNnxjmYOv5McdI+PX06drK
	Lw02zeBm2EvpVz/HQaNIfVOhLXFYDfLkB9DdqeTm9bAZBVV2jWXajwFuCqy9IynEaIyX
	h3sw==
X-Gm-Message-State: AG10YORFwY3zfflzqcXe99L5hpgVL+qGg1GZi9Kl7siLq1lTjM3iVaFDeJisA0b2R6v51H5ztTB1gY9VeGNQPdFd
X-Received: by 10.50.13.100 with SMTP id g4mr17459668igc.64.1453743477657;
	Mon, 25 Jan 2016 09:37:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 25 Jan 2016 09:37:38 -0800 (PST)
In-Reply-To: <CALbNGRSZ+edCEyGJzWbkniTkds6M=PqF3_gD65=fO0JiYOELBA@mail.gmail.com>
References: <CALbNGRSZ+edCEyGJzWbkniTkds6M=PqF3_gD65=fO0JiYOELBA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jan 2016 17:37:38 +0000
Message-ID: <CAJTo0LZbDJS6MCjsXqaBE7krYiR9toB=VoxaXGx+2J45hw+jKQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>, 
	Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: opkg pkg_prerm on package update
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
X-List-Received-Date: Mon, 25 Jan 2016 17:38:01 -0000
Content-Type: multipart/alternative; boundary=089e013c661494aae9052a2c07d3

--089e013c661494aae9052a2c07d3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 January 2016 at 09:50, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> although opkg 0.2 -> 0.3 is long ago I noticed a change in behaviour
> when updating a package:
>
> * 0.2.x did not call pkg_prerm
> * 0.3.x calls pkg_prerm
>
> Is calling pkg_prerm a valid behaviour when updating a package?
>

opkg is copying what dpkg does [1], which makes sense considering opkg is
basically a dpkg clone.  It passes variables to the script so you can
identify if the context is "i'm being deleted" or "i'm being upgraded".

This changed in
http://git.yoctoproject.org/cgit/cgit.cgi/opkg/commit/?id=3Da8555d352d2851e=
e1482b74b57ba9eacfb354c18
if you want more context.

[1] https://www.debian.org/doc/debian-policy/ch-maintainerscripts.html is
what dpkg does, fwiw.

Ross

--089e013c661494aae9052a2c07d3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2016 at 09:50, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony=
@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:r=
gb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":17h4"=
 class=3D"" style=3D"overflow:hidden">although opkg 0.2 -&gt; 0.3 is long a=
go I noticed a change in behaviour<br>
when updating a package:<br>
<br>
* 0.2.x did not call pkg_prerm<br>
* 0.3.x calls pkg_prerm<br>
<br>
Is calling pkg_prerm a valid behaviour when updating a package?</div></bloc=
kquote></div><br></div><div class=3D"gmail_extra">opkg is copying what dpkg=
 does [1], which makes sense considering opkg is basically a dpkg clone.=C2=
=A0 It passes variables to the script so you can identify if the context is=
 &quot;i&#39;m being deleted&quot; or &quot;i&#39;m being upgraded&quot;.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">This ch=
anged in=C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/opkg/com=
mit/?id=3Da8555d352d2851ee1482b74b57ba9eacfb354c18">http://git.yoctoproject=
.org/cgit/cgit.cgi/opkg/commit/?id=3Da8555d352d2851ee1482b74b57ba9eacfb354c=
18</a> if you want more context.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">[1] <a href=3D"https://www.debian.org/doc/debian=
-policy/ch-maintainerscripts.html">https://www.debian.org/doc/debian-policy=
/ch-maintainerscripts.html</a> is what dpkg does, fwiw.<br></div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e013c661494aae9052a2c07d3--
