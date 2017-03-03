Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6C2775D2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:54:48 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n127so200649216qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 14:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tcv8w67S3M5/xJ7hUJScg8n2PVLL0W9WPLxD9pCscvw=;
	b=kyx8FWscXXAx7YLbNGOXFo8g+6vx1eFgKb5EpF0JGntyw4hVnCXcVYG0KJrQ9/lOsp
	TUW1mHmnetFQBIyW9j9kuiqG8iVQIfWOBqNdpQEhzVAEI3a8G+N1eFPo3uDMJICXC8TS
	Lj+pTtOW8FuBSn8WCWhWpSPgqoc2ZFlenkE5ZPcqHRwsWE62DnMP+ehGlBq4BBGmb5LW
	K38jkUvQAKBliGitVYVZAc//o+x8keKE/vfEt2uyDvYv+MPWKtk0CVM6OkOanh3od60/
	KIFnonzLF7njcxCmUGM3IZCAejpKaRKZ0OFO71QBavu9I0zJRor0BTQhNPcRaVk1kVzP
	udSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tcv8w67S3M5/xJ7hUJScg8n2PVLL0W9WPLxD9pCscvw=;
	b=Bp6RAikbIHMtdofw/bOfy+SGkrUqHnmrWn3OOHF9DWwK46876yEFozwrKAfoTWjSpM
	l0eQcjIdxJDEK+ys+eLQejB1bn2UWpnz8xCQDcnNrLl3LbFrezQH/3H4cr2MCNPGU3CO
	sCuea2Ss0rNArE/BM/czxc6QPM8P/NwJPJVPfhrm8f/8k2kkf/YdjeC7dK79krONbbB0
	H28GidNvOUbHrGIjE80RhD2xX4nJwSeamdWtxxxCDaNsypRV3vmVGkwp29zLB+Jx4vAj
	ZLfFRSx7021PWrp30YK3ea/frWY/VYgxx/xh9pdCsnvSPcmE77jOIodPAYNauBFIEops
	EPcg==
X-Gm-Message-State: AMke39kSsIGP4F4UhofVh9otShzD8l9BFnd36L4erYLI64n9K5OXm+IowV10Kq1g3sWZYDb+uVVW8fGwjAG1yDgk
X-Received: by 10.200.41.115 with SMTP id z48mr5174475qtz.109.1488581690241;
	Fri, 03 Mar 2017 14:54:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 3 Mar 2017 14:54:29 -0800 (PST)
In-Reply-To: <CAMKF1soCXsibCK37Az9MV1HMUpAK2dtWoijOxoBW25RoMhU+8g@mail.gmail.com>
References: <1488542096-23389-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAMKF1soCXsibCK37Az9MV1HMUpAK2dtWoijOxoBW25RoMhU+8g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Mar 2017 22:54:29 +0000
Message-ID: <CAJTo0LYPwxx18CtjJ_Rng28UhQAmJbMCw5=ebW2WkZmcALznUQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Add libmpx supprt for x86
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
X-List-Received-Date: Fri, 03 Mar 2017 22:54:49 -0000
Content-Type: multipart/alternative; boundary=001a1140699cddf3350549db6e6c

--001a1140699cddf3350549db6e6c
Content-Type: text/plain; charset=UTF-8

On 3 March 2017 at 21:39, Khem Raj <raj.khem@gmail.com> wrote:

> > Enabling building the Intel Memory Protection Extension library for x86.
> >
>
> hope this works on amd chips as well ?


https://en.wikipedia.org/wiki/Intel_MPX

It depends on new instructions, so you'll have to ask AMD. :)

Ross

--001a1140699cddf3350549db6e6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 March 2017 at 21:39, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex"><span class=3D"gmail-">&gt; Enabling building the I=
ntel Memory Protection Extension library for x86.<br>
&gt;<br>
<br>
</span>hope this works on amd chips as well ?</blockquote><div>=C2=A0</div>=
</div><a href=3D"https://en.wikipedia.org/wiki/Intel_MPX">https://en.wikipe=
dia.org/wiki/Intel_MPX</a><br></div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">It depends on new instructions, so you&#39;ll have=
 to ask AMD. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a1140699cddf3350549db6e6c--
