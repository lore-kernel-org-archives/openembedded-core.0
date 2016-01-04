Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 442E6731C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:06:44 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id mv3so194210642igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 05:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JgQSuumnLIHJQXOElERXECUKBXaviJ2atrnjJt6Q4Is=;
	b=Tn+WvQzcMhM91hbheIqzU56T3gVg3BXX0XL9+7QtuLeE0SlLF3aZLWZWxONpNPCkSl
	UgV+/SslN0YUyNjAjEk/pFo5CuoQczL6WXSWSjZMBt2r/V72cIHgwgYezRRuQ9m/lxWT
	w3WndrS3IqmN89V492zEQdSaOABbj7Wn0dagIa1hW0KIvi9RwoTx+5BEEH0SWCdvBorI
	ctk/XbfDFZddye33W+qinI4YecB0F/EHG5W7/kmJrHYVEaYVweNOhCcBq1umP7mIHaZT
	YbqJKElJHd+4kOd5WoM+MWh4grX+rLMnywUx1bS+om5zFdv2PUTXB+wEadrcecl24JFS
	Ps4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JgQSuumnLIHJQXOElERXECUKBXaviJ2atrnjJt6Q4Is=;
	b=BXlFY/CAfk6I2FupgIoA3nBZ/95/iy6vKJ/R/LOSt0CY4EaRDBomAMT1Tq1COAawIq
	KKaD+f+l/3VotaPPfjniaG8qyV+38cAi0J/M2NCpvTIvVrGI4CCqDGG3jkaWvPvIQHK0
	8EsQ+1+jL+H5cJPshJG2pft5dYH3TZSRbSl2Tfq3fuw2rLsMcIlBbX9HeY06srQy6KLf
	Ns9yqT2tbsFAHTVR0aAAH1MEMQUKxLgFfGdzMEyvHtaqJtPVKLaS5iNgwoHbRuZJyHVP
	fpxg3uRWpiJn8YFtdVAEIZRLT/1csakn3oCvTaBeEkCyRcR00Ibi2M3p4latY5bCsuGK
	+Dmw==
X-Gm-Message-State: ALoCoQmJz366WuqCt8/EJ9uSNU9RYjdZdOROif/Lq81Flsu9Lc8mV+MjBdrYD1TgCtqNnSVoLHAt3Cw2DTV1M/79XHJoPcQorLrqmouBlrmk3TUPs5qGxjM=
X-Received: by 10.50.18.113 with SMTP id v17mr60692627igd.64.1451912804695;
	Mon, 04 Jan 2016 05:06:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 05:06:25 -0800 (PST)
In-Reply-To: <1451910324-5914-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1451910324-5914-1-git-send-email-daniel.alexandrux.istrate@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 13:06:25 +0000
Message-ID: <CAJTo0Lbbm5FXD2PRZ1kSyzfxshdk8gtbQVMC-NM0sp=J_ty5EQ@mail.gmail.com>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-selftest: Improved --list-classes when determining test names
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
X-List-Received-Date: Mon, 04 Jan 2016 13:06:44 -0000
Content-Type: multipart/alternative; boundary=089e01494ff2f820db052881ca4b

--089e01494ff2f820db052881ca4b
Content-Type: text/plain; charset=UTF-8

On 4 January 2016 at 12:25, Daniel Istrate <
daniel.alexandrux.istrate@intel.com> wrote:

> +                                if method.startswith("test_") and
> hasattr(vars(t)[method], '__call__'):
>

Using callable() instead of hasattr() would be neater.

Ross

--089e01494ff2f820db052881ca4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 January 2016 at 12:25, Daniel Istrate <span dir=3D"ltr">&lt;<a href=3D=
"mailto:daniel.alexandrux.istrate@intel.com" target=3D"_blank">daniel.alexa=
ndrux.istrate@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":n7" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if method.startswith(&quot;test_&quot;) and hasatt=
r(vars(t)[method], &#39;__call__&#39;):<br></div></blockquote></div><br>Usi=
ng callable() instead of hasattr() would be neater.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e01494ff2f820db052881ca4b--
