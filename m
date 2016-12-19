Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 870636011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 17:18:55 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id w33so153120842qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 09:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vaNezwEShYc/4pmCnAu/IzbfprSaOXdMelzbmGp65nw=;
	b=vlYFjBABT5O63c4A919PSiWoGLneaKobXYk9KtSrOBnC9xkkpHoB7tatVj5r6LUIwL
	rvEFnVt+l3PvRIB7giB+IguPDGej7v8FTmzmdvOvPouUIC36yfw1+BGsjbgIiTPLUqRJ
	uj5EFF+gavIuKr/1RVarR8m5GdgEgBWOfr0ojE2K1vGyg46bv8HjX+qoIZzp+f23dmw3
	QS0P0pTDjOuxNdlOhx2OsXCw2aelH9IdpXVCzHpCGpxIIGbqvbITV7/IjXLANNBiZxRc
	Sr5b99Q728nMTJws5GKdXDSTvsAYagQVke4T42wlftaO1bJixdzfCC2d5LwPR/CJo+Oe
	XfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vaNezwEShYc/4pmCnAu/IzbfprSaOXdMelzbmGp65nw=;
	b=cqQnprvkCTPtjyEn5/XazXBTkryDTmShMMHQoVpi239rEie9xvjMd1x6Q8m4ovmbRG
	JDFmJtZGrSbRC+vDpTR27S+DnW7CbC8MnFZZdthfr0g1uvAOv89aBpUnvdWenEtYul13
	+maWeMAfocrc0MXvHmR1YY2EwT9LZR3IJMag2vpxSngde1gDLoJQGOjXL/L0ExCgnUG5
	YJ7WX+e3Rf8Iq/MN+0Eu2eaOOT+6cOqnGPRG8w/f6pxfFDmPTyNXHJmcVKxmRfZ3+9yx
	RFptA7ADXkLBeDKfQD7flFyop58xlqv2oN+2Ltbfa/Z5apD5nZmiowX2vxnwztIpGrjl
	vXlg==
X-Gm-Message-State: AIkVDXIoFO6IX38TLMpYgM2y2wvJ7hrzhlXXYKUkpA9NieR/Fw4HLJi0g6a0CPgw2/7htSJ0DtCr3rmGVAdofwZk
X-Received: by 10.237.34.46 with SMTP id n43mr18154901qtc.105.1482167936351;
	Mon, 19 Dec 2016 09:18:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 09:18:35 -0800 (PST)
In-Reply-To: <CAMKF1sohfFT=+-ZTuSmOjL96+ktQZ+oeqiivJDg84XvUq-8HGQ@mail.gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
	<20161219063957.18716-2-raj.khem@gmail.com>
	<CAJTo0LY1m20z=4SmyHJg0v1DVS=PukdGvYkkHT=V7ii9rTgzYA@mail.gmail.com>
	<CAMKF1sohfFT=+-ZTuSmOjL96+ktQZ+oeqiivJDg84XvUq-8HGQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 17:18:35 +0000
Message-ID: <CAJTo0Lasey4rdJiZ-u88SmvcpR45t3yr03YKV7FGzWQuSr70Vg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [V2 02/10] gdb: Upgrade to 7.12
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
X-List-Received-Date: Mon, 19 Dec 2016 17:18:57 -0000
Content-Type: multipart/alternative; boundary=001a11377e18588af30544061dba

--001a11377e18588af30544061dba
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 16:42, Khem Raj <raj.khem@gmail.com> wrote:

> it is rebased on master but I am carrying a glibc 2.25 upgrade patch
> which I am not yet proposing thats why you see conflict
>

Yeah.  No need to resent, I got it applying with -C0.

Ross

--001a11377e18588af30544061dba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 16:42, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":3b9" class=3D"a3s aXj=
CH m15917f7c71341d10">it is rebased on master but I am carrying a glibc 2.2=
5 upgrade patch<br>
which I am not yet proposing thats why you see conflict<br></div></blockquo=
te></div><br>Yeah.=C2=A0 No need to resent, I got it applying with -C0.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a11377e18588af30544061dba--
