Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E0F4160248
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 02:23:06 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id x190so16509984qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 18:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZfDLAVJLBf7Mk1Ec74pZPuTBWZGucwkrIftqUgSK13o=;
	b=i89dChmA9XGf9UK6JO7Rv6uMApC2JBms8TMDA1lKjLE7uG9DXmucpsDT2LIMGUjgrv
	F+VH8pY7S/2dNphp7B52CNICxCt5vpcXlAqyuig7dXTzkY/UddQ377PVTO/LCVn86tBO
	iPPz4lDqBvrhnJpYyql8sJXhUerIrtFAOBPh/naFW2tHUt66zqVVS+mmSKhzKvpkgRGx
	NaBIiXpCysUkrrjyvVkdlJN3PRdf5rJ8Qa1TEn7cMWzpk1KSSkpcKrYJCjWAgCd1oKk2
	h/Tc04a2zeIxefSBA4/386PHaAknwDTLV4TFjoy0OTz97mYLJr9C+os8cgx6NKvOTDag
	SwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZfDLAVJLBf7Mk1Ec74pZPuTBWZGucwkrIftqUgSK13o=;
	b=WQXKZWA5WoxjdIfpylK7uUNLcCqt6V3uyig5nfptaoTAx81AIpcdAtLulermQGoqN8
	r09H6kCj9JcREFKsKb5hKPPJki9Vu8EmSOp9pIfpLmnqMJgycX4DRpiu03RSjvvXggfX
	/C3iRzGVebapujBBPMoJkS8UZwiEQrr9i7Y0anyGTphg/D5a9C6Dw4Fk1IioXamPdYS9
	e19x1Dg8boXb7CwWUa1zAsZHI65sGEk/8Lc/nKO9Ufl7wJctYausniv0DxLmNNRKrf+q
	kKG+9itozsQCyrgoxMxvFNlieQtYh1L1nSeoiJ0LXw/Ezz/uR/crG5hsTmyqHutJ5UiX
	jymA==
X-Gm-Message-State: ABUngvcNDx860xB6Atq6ShvkTNdyunBFIBUPdABcyiqqj9we4oVzsLIpeNjoRQDSFyixhj5jo3625lrxUi90eg==
X-Received: by 10.55.164.206 with SMTP id n197mr17600474qke.197.1478658188025; 
	Tue, 08 Nov 2016 18:23:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Tue, 8 Nov 2016 18:23:07 -0800 (PST)
In-Reply-To: <CAJTo0LbB0eGStoFbyinDYP0zzEJ27BL0eDyGKFkjdh=AaWBPVA@mail.gmail.com>
References: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
	<20161105101438.1ef1f627@nuc.betafive.co.uk>
	<CAJTo0LbB0eGStoFbyinDYP0zzEJ27BL0eDyGKFkjdh=AaWBPVA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Nov 2016 21:23:07 -0500
Message-ID: <CADkTA4OaRgUJwFwT=S_h41EW4OO_Koa+QQr=t3t+X+6pszrzBQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenEmbedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Allow ${S} to be overridden
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
X-List-Received-Date: Wed, 09 Nov 2016 02:23:07 -0000
Content-Type: multipart/alternative; boundary=94eb2c06567a0aa56d0540d4f06c

--94eb2c06567a0aa56d0540d4f06c
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 8, 2016 at 8:04 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 5 November 2016 at 10:14, Paul Barker <paul@paulbarker.me.uk> wrote:
>
>> Ping on this. Anyone had a chance to look at it?
>>
>
> I tend to want to let Bruce have a look at kernel patches, but this does
> seem sufficiently obvious that I've just merge it to my staging branch.
>

It managed to slip by me. Sorry about that.

I can ack this patch, since no defaults change .. there's no risk to
existing users.

Bruce


>
> Ross
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c06567a0aa56d0540d4f06c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 8, 2016 at 8:04 PM, Burton, Ross <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">=
On 5 November 2016 at 10:14, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-12831548189=
02879665:37a" class=3D"m_-1283154818902879665a3s m_-1283154818902879665aXjC=
H m_-1283154818902879665m1583412f2cc867b2">Ping on this. Anyone had a chanc=
e to look at it?<br></div></blockquote><div><br></div></span><div>I tend to=
 want to let Bruce have a look at kernel patches, but this does seem suffic=
iently obvious that I&#39;ve just merge it to my staging branch.</div></div=
></div></div></blockquote><div><br></div><div>It managed to slip by me. Sor=
ry about that.</div><div><br></div><div>I can ack this patch, since no defa=
ults change .. there&#39;s no risk to existing users.</div><div><br></div><=
div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"H=
OEnZb"><font color=3D"#888888"><div><br></div><div>Ross=C2=A0</div></font><=
/span></div><br></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--94eb2c06567a0aa56d0540d4f06c--
