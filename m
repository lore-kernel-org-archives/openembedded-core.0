Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 64DC5719A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 00:13:36 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id x190so236283229qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 16:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qMVkhtkm5eBolHfoIbnej2kLYSct+6OUm5LZyrI4e/8=;
	b=NWdNsASbXABAR6UvHnTw3/nj8FQVioVvX0rKIZaNMwxj+8PiAIST7TsunyPhRD3pFE
	GP0Ysu9D8yqalELQZ2THm6wFFSrzsQm/s9sEOawc/i8lOGZUzZ1D4TahVSUnqDJfq69z
	ivN//CVCi/MbWyHIHdqv8LUbOl8eFDbO5AmeaEGEMYJx0eAD79ZDyp5Q3rJC6gixBOuy
	nYR5qAf0swawFSrgjkVm8rD2vuzgH0HyON9KkqsD8fk0e+HEcKe6ew/NPHaoBp06C2+6
	iD8GF2w7tLRcY6B4c4xn3QMIAk1aGaTDnazCYVevjsAtwriOYd4ejlGWO/+e+m2p83w0
	nnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qMVkhtkm5eBolHfoIbnej2kLYSct+6OUm5LZyrI4e/8=;
	b=QiabChsYgj0qUX04/hBmE8FnVehARAyNyXnaAsb1iEohahx39CF01IrZ1u2eUOaTrY
	VoJa8JkRA9nTFyZ929LkwO3XRc8ywTE3mcqF7tFT4XHSTjsYHlDmpzDKidChO5z7DTUw
	RLvO6GyDyfeIBH+QjVYCfqa6kBEtw1eSiUdOYbTVanopkvO3dINCtzBa7LvD9DUMPafj
	mNhYmhV0bmooZPNtbRISSc2Kl6Ro8CUig2iMMtxFLpEuIdCzlFR9pSywKL41mGBCP6AG
	CcPh13EiUU4TLAgwyO3RzuzQ3nfRjQJnx+J+PA7FG9Z3YbefMZZu6y7cRhEh7wMpmgGT
	P04w==
X-Gm-Message-State: ABUngveajt4U3k44z2N5Be84Rp9aL18K0FUewZjYL1fAUTwPD/ulmscnm++rtqIMLG2RewzfV6vT6BAxbpg0t63y
X-Received: by 10.55.207.78 with SMTP id e75mr18262074qkj.36.1478650417517;
	Tue, 08 Nov 2016 16:13:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 8 Nov 2016 16:13:17 -0800 (PST)
In-Reply-To: <20161108171235.41837-13-Zubair.Kakakhel@imgtec.com>
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
	<20161108171235.41837-13-Zubair.Kakakhel@imgtec.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Nov 2016 00:13:17 +0000
Message-ID: <CAJTo0LZTHPYsot=YkNGXh=p2AP37X89JqW2xMgdYjanftpDxxQ@mail.gmail.com>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch v2 12/14] ltp: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Wed, 09 Nov 2016 00:13:36 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b8e26dfa0540d320c6

--001a1145b7b8e26dfa0540d320c6
Content-Type: text/plain; charset=UTF-8

On 8 November 2016 at 17:12, Zubair Lutfullah Kakakhel <
Zubair.Kakakhel@imgtec.com> wrote:

> Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
> variable is defined
>

I'm guessing that this is the cause of this error for qemumips64:

http://errors.yoctoproject.org/Errors/Details/99744/

Ross

--001a1145b7b8e26dfa0540d320c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 November 2016 at 17:12, Zubair Lutfullah Kakakhel <span dir=3D"ltr">&l=
t;<a href=3D"mailto:Zubair.Kakakhel@imgtec.com" target=3D"_blank">Zubair.Ka=
kakhel@imgtec.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color=
:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmai=
l-:20x" class=3D"gmail-a3s gmail-aXjCH gmail-m15844fae74502ab9">Reduce dupl=
ication in MIPS variants now that the MACHINEOVERRIDES<br>
variable is defined<br></div></blockquote></div><br>I&#39;m guessing that t=
his is the cause of this error for qemumips64:</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra"><a href=3D"http://errors.yoctoproj=
ect.org/Errors/Details/99744/">http://errors.yoctoproject.org/Errors/Detail=
s/99744/</a><br></div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1145b7b8e26dfa0540d320c6--
