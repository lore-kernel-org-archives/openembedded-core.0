Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id D665071DCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 12:19:12 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id w20so12835171qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 04:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OcMsF1+As7s+t7StvpfQH4c4d4UJTaj2HoD7POQlIXo=;
	b=FRSE0DzHkSecQ4JjqIJd+Nfhe+jEDKq2Ti/4lXpn191BUiCw83cgf53Nz7F390NFEl
	uSMU43zxbgwx3FExviFPs4wcAYUNLAcLgklk7flwpILH9mBh6BHfcFUr0tmdxEAQ6FWL
	kon5pubhI92Pc48F/5JgKfudMsv4ioG6Wz6M6VO3k7yH3z0oWaNYm/MwyJQtSYCyRRww
	kBvoAz49vMmhPhpfAJid5b1yVTqFrOFr3eIV7b8To/dfayfVPoF/H1yOrINq4ZYnXqt8
	Je89ChIArj8I5fD0DV00InAFZTyEP2vDGxXz2smkYqeA0weGoPqdDH+N7VeD3CAKmifT
	K2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OcMsF1+As7s+t7StvpfQH4c4d4UJTaj2HoD7POQlIXo=;
	b=e/gLvuXV4JU5KWysB/B1i8RM0iafqd6cCiNBwpfP4arzLM5xvBY8bYnyJBlNV8f+cY
	5YWYTugt04YU4UiiW2YW2azmLdv3Y4BZ3M2P+snWrRdnzwYvd/1m8K50/hmLNUq9GX7o
	Ofc/sDS6HB7rWakrE7bHwCOav3259qf4iVZSt99gkXe6rkRn9MSDiwQzfoeU/pevVfM0
	dRo0dAb37+cp2ViEqau+WQJmD8DUpEfB//gaInhZpLWEO+8srLL3QUvCLd0mOUqKfCWO
	0V9utl7WM1SFnH1MD1dsI8wpn8xrUOTdHMj450fMpwN8AmA0cPHEiS4bTJqNrFlun42P
	MKTw==
X-Gm-Message-State: AMke39nQAQMvayj4JXt0sYIUsNVWXkC5VYvshKazHor9P3HkQAhd5SA33oT1+6LPtnB+yogmbR25rjHhFcgBNA==
X-Received: by 10.200.46.123 with SMTP id s56mr22659109qta.8.1486988352916;
	Mon, 13 Feb 2017 04:19:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.37.136 with HTTP; Mon, 13 Feb 2017 04:18:52 -0800 (PST)
In-Reply-To: <CAJTo0LZ_ea-cm=ZSNt2zVbasOApPdbGegZCH7VU-+0XH=-noZA@mail.gmail.com>
References: <1480609418-3264-1-git-send-email-linus.svensson@axis.com>
	<1480609418-3264-2-git-send-email-linus.svensson@axis.com>
	<CAJTo0LZ_ea-cm=ZSNt2zVbasOApPdbGegZCH7VU-+0XH=-noZA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 13 Feb 2017 13:18:52 +0100
Message-ID: <CAPybu_1tqVeyDqhQLd0qPOOR=D=4WhC_D-Tv4wkZJ2_todZ0oQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] meson: Add recipe for the meson build system
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
X-List-Received-Date: Mon, 13 Feb 2017 12:19:13 -0000
Content-Type: multipart/alternative; boundary=001a113d4ed28fc6a605486874c6

--001a113d4ed28fc6a605486874c6
Content-Type: text/plain; charset=UTF-8

Hi!

What is the status on this? it just needs to be resend to meta-oe? We are
considering meson for our next project and we need support in OE.

Regards!

On Tue, Feb 7, 2017 at 5:33 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 1 December 2016 at 16:23, <linus.svensson@axis.com> wrote:
>
>> Meson is a build system designed to be fast and as user firendly as
>> possible. Find out more about meson at mesonbuild.com.
>>
>> This patch is based on a prototype patch by
>> Ross Burton <ross.burton@intel.com>.
>
>
> So the good news is that I just used this recipe and class to build the
> new libepoxy release with Meson instead of autotools, and it worked for all
> architectures.
>
> However this can't be considered for oe-core as it is, because it depends
> on ninja-native (and that on re2c-native) which are part of meta-oe.
>
> Until we have a need for Meson in oe-core, would you consider submitting
> it to meta-oe?
>
> Cheers,
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
Ricardo Ribalda

--001a113d4ed28fc6a605486874c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<div><br></div><div>What is the status on this? it just=
 needs to be resend to meta-oe? We are considering meson for our next proje=
ct and we need support in OE.=C2=A0</div><div><br></div><div>Regards!</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Feb=
 7, 2017 at 5:33 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
oss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_extra"><span class=3D""><br><div class=3D"gmail_quote">On 1 December 2=
016 at 16:23,  <span dir=3D"ltr">&lt;<a href=3D"mailto:linus.svensson@axis.=
com" target=3D"_blank">linus.svensson@axis.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><span class=3D"m_-5393749688984336144il">Meson<=
/span> is a build system designed to be fast and as user firendly as<br>
possible. Find out more about <span class=3D"m_-5393749688984336144il">meso=
n</span> at <a href=3D"http://mesonbuild.com" rel=3D"noreferrer" target=3D"=
_blank">mesonbuild.com</a>.<br>
<br>
This patch is based on a prototype patch by<br>
Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">=
ross.burton@intel.com</a>&gt;.</blockquote></div><br></span>So the good new=
s is that I just used this recipe and class to build the new libepoxy relea=
se with Meson instead of autotools, and it worked for all architectures.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">However =
this can&#39;t be considered for oe-core as it is, because it depends on ni=
nja-native (and that on re2c-native) which are part of meta-oe.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Until we have a n=
eed for Meson in oe-core, would you consider submitting it to meta-oe?</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,</d=
iv><div class=3D"gmail_extra">Ross</div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">Ricardo Ribalda</=
div>
</div>

--001a113d4ed28fc6a605486874c6--
