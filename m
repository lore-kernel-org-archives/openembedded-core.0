Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id A60CD7765C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 11:15:08 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id v125so86076141qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 03:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bu4WxrzW+NxAOtqVnb2rm1JCuNyFFHRgHFOYUyqdSLs=;
	b=irsGDflshIY+IZ9A1v+B/8yfqNvcvSBMtJ8ioO7xDy2xaG3r8ViK1Frq3wzlsyxBR+
	NtHEr2ZtOTl5T2eTirOJAbigb7s4mcedMEFq8AV9BJCrscRFjJEFnr7+52GJQVZKSdCQ
	HcNoGel3sMred8VDcz0EKKxPvMTlUZWelpgcnJtFq1CH1i5qfb8Xxxbmj87UVIAfxoh9
	p3gn7f2WZ64SS/MIs9KiQdg/eUl+gdIF8J9KsXZUS7YJ5r46N7LGW+h7o3Hbu+aMJuA6
	8ygI7OARKA3TyaeZo9wEhu+nqblt1l/oKJ7J8H/N0cUIy07OtkCbeOx6y8kwIpZ4+9Fh
	erBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bu4WxrzW+NxAOtqVnb2rm1JCuNyFFHRgHFOYUyqdSLs=;
	b=BgIzJ4vdk2aEYdTU3mpFUAxuElm5MimzviNy/n831ZNBfl5uWADXF8bEXl5j+aWf2C
	cY/+cS0Zr8czpBUFh2yVXcKlEgA0xcLpUp8VVLCrZdGN5TXkphNEb5tZjfgs8nLKFkum
	Mph5bghM7ib1zqvgaRXrCP+jyWWBO/f4CX9an7Ng+yVOj5KLHqO7fvMIjU8hfa2Fgw3e
	Oqh9AH9BubU/mN0tCCkx0njreAoisK3QTGOtBpJv2+iZ1yn77C9tVNEtmoqt/qjMsQi2
	HVyAGoO0Wqk7DOHwm24IRPIhyoRrOjQqwtvAau4Lq4ESJNImE9RoCaHC8Tt5J6TX1cwM
	6pYg==
X-Gm-Message-State: AMke39mHbqtueMLL8Wx4/VX45K2lnNh6I03SOwIEs1Hg9iIkvGyXZ+mm0WclO+e13jTxpY6yCZ9S7tknDMGeoHc4
X-Received: by 10.55.183.133 with SMTP id h127mr15645616qkf.121.1488798909481; 
	Mon, 06 Mar 2017 03:15:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 03:14:49 -0800 (PST)
In-Reply-To: <1488378511-18969-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1488378511-18969-1-git-send-email-ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 11:14:49 +0000
Message-ID: <CAJTo0LaafDCfjH_cCHJDx0BCeZxVi7DPv3Cw_QdXvqYD+ehseA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Mon, 06 Mar 2017 11:15:09 -0000
Content-Type: multipart/alternative; boundary=94eb2c060056245828054a0e026a

--94eb2c060056245828054a0e026a
Content-Type: text/plain; charset=UTF-8

On 1 March 2017 at 14:28, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> +       [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>

I think you need to end this with || true to eat the failure if the test
fails.

Ross

--94eb2c060056245828054a0e026a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 March 2017 at 14:28, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":h9" cla=
ss=3D"a3s aXjCH m15a8a4befad70194">+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -h ${SSTAT=
E_PKG}.siginfo ] &amp;&amp; touch -a ${SSTATE_PKG}.siginfo<br></div></block=
quote></div><br>I think you need to end this with || true to eat the failur=
e if the test fails.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c060056245828054a0e026a--
