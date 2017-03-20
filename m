Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id CE6A177941
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 12:22:52 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id x35so104606097qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pBcW0y8kDYqcEuYggohIgb7d3tD2VnWSfrtXYbtJE3U=;
	b=HU4g0nyV8IgC0RTvg+XwBhDCSQtFtcSjizVot0eA77jFD+SR+v08UEzvBs4ni9uZzs
	xG0Q/S9MUsb8wY3klAwef6H3xI8jT+ClJbT5BXHhCmpIvoKqFkd58ar/lis7cT3H4Bp+
	0EVyqO4726i+66MUt5mZeXGvFWs1nZ7OUxNehrFWiFSbqV3/TJ6WXmNDtHd8b2qjXyO2
	Yhfv08OSbgGnVbLs0bmGdE4YHV+K7tBUvX/XHKhGKWSh4zFQGI8A6S/wN/ypsh8fanDP
	CVWlGfsDYtelMW6ieIeLy7VfcWhwLbPtrDyCtQGnAQm4C4QjBMGyuUqc6gjcdBPPbbTd
	HKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pBcW0y8kDYqcEuYggohIgb7d3tD2VnWSfrtXYbtJE3U=;
	b=YYp7Z4o7APyoQ9toFYgCixkQPVnshICmXelp2Ns+0a7TVXivZ8/d8Wqt0fMwmm5/lg
	dFM3ImPPgT9+68RuOWWbARrPR7Cx/OmVedt0blyPJ+IzEx0pGaR0u1VwF+GwudtGvSCM
	lC03n7wb1QIiwC5zH5bXx3Dpqt42yy2r5n0WrCdGS4MU+tlNcpAD33W1Vf1yg+VnP2b1
	yGgLO6zeNlcWESehhs0qvS2cKWaeTdFmnCbUtudh1XO0QMHJwORmza1dXrrlFHoRsVlq
	CP1QI8dHuEQ2cStNuCXwwiV1a5+GhqpTO+lmCGaXGRLUzv+x6lfU9pz+OznuUJy8FXXb
	ZpnQ==
X-Gm-Message-State: AFeK/H3Liogy8Q6nLDw1bbshR5swqJAljYyBPfhe6zLEQK3d4mC8sgNmTcCr3S58HVQTpVzQKR9ffAoPIN+KiBBn
X-Received: by 10.237.42.164 with SMTP id t33mr28301903qtd.105.1490012573582; 
	Mon, 20 Mar 2017 05:22:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 20 Mar 2017 05:22:33 -0700 (PDT)
In-Reply-To: <e9c3eaccf98c6cb41cf985c52a59c9562c9e9b25.1489534345.git.raj.khem@gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
	<e9c3eaccf98c6cb41cf985c52a59c9562c9e9b25.1489534345.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Mar 2017 12:22:33 +0000
Message-ID: <CAJTo0LbA51TSyFz3AA+qzo6Pgkkps-YPjbELXNTeTU8R62b6vg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] binutils: Enable threading when gold is enabled and is not default linker
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
X-List-Received-Date: Mon, 20 Mar 2017 12:22:53 -0000
Content-Type: multipart/alternative; boundary=94eb2c0cfe2228fca7054b289680

--94eb2c0cfe2228fca7054b289680
Content-Type: text/plain; charset=UTF-8

On 14 March 2017 at 23:35, Khem Raj <raj.khem@gmail.com> wrote:

> Currently we enable threaded linking feature of gold linker only
> when its used as default ld. There is no need to restrict it when
> its not default linker either. As long as gold is enabled, which
> is the case here, we should be able to do threaded linking.
>

Turns out this broke meta-mingw's Windows SDKS (reproducible if you
set SDKMACHINE = "i686-mingw32" and build binutils-cross).  I've sent a
patch to set LDGOLD to '' on mingw, but your comments are welcome on
alternative fixes.

Ross

--94eb2c0cfe2228fca7054b289680
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2017 at 23:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style=
:solid;padding-left:1ex"><div id=3D"gmail-:1na" class=3D"gmail-a3s gmail-aX=
jCH gmail-m15acf2ed0eecbad2">Currently we enable threaded linking feature o=
f gold linker only<br>
when its used as default ld. There is no need to restrict it when<br>
its not default linker either. As long as gold is enabled, which<br>
is the case here, we should be able to do threaded linking.</div></blockquo=
te></div><br>Turns out this broke meta-mingw&#39;s Windows SDKS (reproducib=
le if you set=C2=A0SDKMACHINE =3D &quot;i686-mingw32&quot; and build binuti=
ls-cross).=C2=A0 I&#39;ve sent a patch to set LDGOLD to &#39;&#39; on mingw=
, but your comments are welcome on alternative fixes.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0cfe2228fca7054b289680--
