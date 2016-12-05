Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4CB6022F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 16:25:46 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id o20so26249294lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 08:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qf021ubbP2hPq5rGiF+Fv+cDJLCwP14nv+2K53hZ8Yk=;
	b=g2r+fzPBjVCOdAYUwzR6QbHZa3oDdMFyw8AIjgpdo7WwHz4nMVFVJ3drtxMvCk010X
	3Ek6qmsU4xqnTN6xB1diiZlvfHcgpwsvr55h2KJpdtuNOL2XAteiwlBytZZHNF8FCQBH
	5Jx3JRFSJzXXLC9sfKBa6BYwTetc0Rlx8u+SiD8xoYQBCq6kJnGm82UhWhau5giBXNo6
	LDD5F/Ans5CKdqCrDrIaxJ+4C/xe1zoMoO/CD6z/bSpBi8Oy2c6pwA/fgqyBqy/RehtR
	YRitStEpPMn/DMsv/3x7rDKfwK0NjGeLqMaPskbwIHGyVAJ2mw8SlTwPcen4o35tJ6iq
	+LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qf021ubbP2hPq5rGiF+Fv+cDJLCwP14nv+2K53hZ8Yk=;
	b=LG2KT1kUGbnyqIylGKS3kvbHfB3v7lZFLY/7Iymd11pm5+sZoLtK6D9lDIfjwzqvCU
	FmKsZIA/4ElHNxv8Nl+S8idvFxasTl9XDT/qNLonoDwFKuINoqwu4u8Vr/j3iP2XxgSG
	/5y5SwcQ7SGNm2GwvLw4ljZ7CUXsWCwW40ZORo6+MUFHjRDbKT2ruGNEnsHTPPktfbAd
	7ruvYBid53OfhZydZDjmra+IF9g+oN4+ve7JjO5ePBoPpXuvCI2/epD2lUcnRAzDNHbX
	ez9PS5/5rxYfZ8qy0qobrf61HD/Cmxg55uxgYGAz4W+K78h7pEC7kbZY448bQqrq1UYO
	8cfg==
X-Gm-Message-State: AKaTC03f7NBVQ8jyzNixOfGAuDHnpTbjaMZ51OUlVqkNb/ozqQ7t5L3NcRB7tm28fMDoypk+9Bh0kCDifPV2Tw==
X-Received: by 10.46.72.18 with SMTP id v18mr20477179lja.12.1480955147850;
	Mon, 05 Dec 2016 08:25:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.41.70 with HTTP; Mon, 5 Dec 2016 08:25:17 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <CAJTo0LaPMyELP89ZvUoi5kEnH_ToGt_bxMuRwWN1ooYWxeUWCA@mail.gmail.com>
References: <1480687192-4813-1-git-send-email-fabio.berton@ossystems.com.br>
	<CAJTo0LaPMyELP89ZvUoi5kEnH_ToGt_bxMuRwWN1ooYWxeUWCA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 5 Dec 2016 14:25:17 -0200
Message-ID: <CAAPZna2sZ7LaXJ2Y5gTumLwgtR4kzYZFFhufX0HQK44YSw_6Fg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add RPROVIDES bootloader
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
X-List-Received-Date: Mon, 05 Dec 2016 16:25:47 -0000
Content-Type: multipart/alternative; boundary=f403045ea28284301f0542ebbdf7

--f403045ea28284301f0542ebbdf7
Content-Type: text/plain; charset=UTF-8

Use MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "u-boot" without apply any patch?

On Mon, Dec 5, 2016 at 2:18 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 2 December 2016 at 13:59, Fabio Berton <fabio.berton@ossystems.com.br>
> wrote:
>
>> This change allow to install u-boot in /boot partition using
>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS variable e.g.:
>>
>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "bootloader"
>>
>> This is usefull when system has only one partition and u-boot,
>> kernel and device tree need to be installed in /boot.
>>
>
> What does this give you over just MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=
> "u-boot"?
>
> Ross
>

--f403045ea28284301f0542ebbdf7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Use MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D &quo=
t;u-boot&quot; without apply any patch?<br></div></div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Mon, Dec 5, 2016 at 2:18 PM, Burto=
n, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" targ=
et=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D=
""><br><div class=3D"gmail_quote">On 2 December 2016 at 13:59, Fabio Berton=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" tar=
get=3D"_blank">fabio.berton@ossystems.com.br</a><wbr>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D"m_395579980547892422:1yx" class=
=3D"m_395579980547892422a3s m_395579980547892422aXjCH m_395579980547892422m=
158bfd741a2acefe">This change allow to install u-boot in /boot partition us=
ing<br>
MACHINE_ESSENTIAL_EXTRA_RDEPEN<wbr>DS variable e.g.:<br>
<br>
MACHINE_ESSENTIAL_EXTRA_RDEPEN<wbr>DS +=3D &quot;bootloader&quot;<br>
<br>
This is usefull when system has only one partition and u-boot,<br>
kernel and device tree need to be installed in /boot.<br></div></blockquote=
></div><br></span>What does this give you over just MACHINE_ESSENTIAL_EXTRA=
_<wbr>RDEPENDS +=3D &quot;u-boot&quot;?</div><span class=3D"HOEnZb"><font c=
olor=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></font></span></div>
</blockquote></div><br></div>

--f403045ea28284301f0542ebbdf7--
