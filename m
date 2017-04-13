Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id CC70677E1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:12:00 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id v3so46588248qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UwQbh8yOS+sjt3q/P1GvWddDI204YumJTBLW7kXONnY=;
	b=lxSki4Ngx+aOiMLn7yBtjzNoMKwqmVkoocw/2JfV3dBXBKr4dSyfEG5DbjhpSzKVca
	en2qu9ifLln7khD5NRJa791dLltYAizjVhB03OVQc8w4wDO4L/IeO3C6lU0+xX0j8+BL
	f9w7kyXp4xGDM0jS0sPqGL+qEUQPf9RVeL54h6v5CfK+VL9y0d7YcHLkh9bhPi82RlfH
	IM3PbIPJzTnLTSbf2cUj8XVIOtY4w302huww1cZGhsa7Y4aC5iJSvcMFTq51PuaN6Z2A
	/ONLEClPB1zjrtVz7eFm6CYshFTcFp85pPeg0VgqpiU4ZNQjdoi4DXnvEJxtHWQca77B
	pdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UwQbh8yOS+sjt3q/P1GvWddDI204YumJTBLW7kXONnY=;
	b=OSjyomv3f2RDgTcmdFpR6Jd0kypkfxZ2Fwhgv7YtpRZmcl9KU0H7d+9B9RAhuvPMZu
	KsM+TNoOvxqN1UhJeaDozu3UZU8zPQwaX3v8gMrMpsVx0qOBvGUHKMOR57PylJiHeSHe
	l2KvWsb4RaSO691cNbnfHGy/r2gE1F5MGQzhwmnprp/+ZfKyGf83hawPW49iYQZ8H9vD
	tdf2BaqZxLXwzf5v2odFoXtcQrWqUq3ARYQ9/CJyuFk17niT97DyerdNWbafk7RxXEep
	brrlPI0UYS0eZn6d2nu4Q2gto6jUkO4jW4RM7sElp/mKnMri/z6eDM7WnFjBHxYL84AF
	Okrg==
X-Gm-Message-State: AN3rC/4EMl2Aeat6F21k4hSUwE/ScZ0XdcJp35KQz4s+EDL41mrrVu2F
	O3dC6+f8ptP+3lEExQH1sdp04k29DEy0
X-Received: by 10.200.3.105 with SMTP id w41mr2638573qtg.188.1492092721756;
	Thu, 13 Apr 2017 07:12:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 13 Apr 2017 07:11:41 -0700 (PDT)
In-Reply-To: <20170412063847.GA3855@jama>
References: <20170411013850.GA25337@linux-uys3>
	<CA+chaQcT7jApSyB4SqwPhsn+Pn_XTbryPT0FQZ_ST0OKDTH5xA@mail.gmail.com>
	<CAHUNapQdr_o_F7DbjNkmOYLXiMnntZJEKgw0+HVncMs6kC-Pmg@mail.gmail.com>
	<20170412063847.GA3855@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Apr 2017 15:11:41 +0100
Message-ID: <CAJTo0Lb1fMwBcn7=1yM8WB9qYQPBvkUgimVNtEvRt0M3FDs4Xg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>, Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Cc: Drew Moseley <drew_moseley@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: having llvm available for gallium
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
X-List-Received-Date: Thu, 13 Apr 2017 14:12:02 -0000
Content-Type: multipart/alternative; boundary=f4030435cf58a715f9054d0ce80f

--f4030435cf58a715f9054d0ce80f
Content-Type: text/plain; charset=UTF-8

On 12 April 2017 at 07:38, Martin Jansa <martin.jansa@gmail.com> wrote:

> I don't use meta-clang to check where does it install the llvm-config
> scripts if it's different location than what we have in meta-oe or not,
> but I assume khem was testing his mesa change with meta-clang's llvm.
>

Trevor, what layer were you getting llvm from?  Khem's fix looks good from
a "stop host contamination" point of view, so we either need to fix
meta-something or mesa very soon as oe-core is very close to the final RC
builds.

Ross

--f4030435cf58a715f9054d0ce80f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 April 2017 at 07:38, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5hu" class=
=3D"a3s aXjCH m15b611a98c971e4d">I don&#39;t use meta-clang to check where =
does it install the <span class=3D"il">llvm</span>-config<br>
scripts if it&#39;s different location than what we have in meta-oe or not,=
<br>
but I assume khem was testing his mesa change with meta-clang&#39;s <span c=
lass=3D"il">llvm</span>.<br></div></blockquote></div><br>Trevor, what layer=
 were you getting llvm from?=C2=A0 Khem&#39;s fix looks good from a &quot;s=
top host contamination&quot; point of view, so we either need to fix meta-s=
omething or mesa very soon as oe-core is very close to the final RC builds.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--f4030435cf58a715f9054d0ce80f--
