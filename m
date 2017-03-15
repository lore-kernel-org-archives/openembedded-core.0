Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id E5BAB6059F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 14:48:44 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id r45so13960131qte.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VgRLL0+zV9izeNqA7H6xht89GtAjYGk+yRCTwYVKTmI=;
	b=n89lIz4LOqNZ363gplvAWDXdflKhR8g0tXT9N+aYCN2gL5u/p5bgoEMQSdim/NrL0t
	JUtkMsh7UEgEpOp6JVt/3g+LDVQTyZX68gC6ewChPgkHlvuQrr75zZnPSXhQWUUfcGxe
	gpu+kmZz66cpE7r/1Or2+33MACd7Gjj+zJIozqybfJOYA7DjbhFPFeuz7jJyG0Po8+MG
	dzikNjg3M51I+I+8BlgKSITyaKg9WJr94dcknpn+RRPt6DddzICdrOsT4fvr3dmQNtvI
	JBI0UZ1YUc6YZDs4Ju4TNfGTQ/c1Fw+YQCR/z6PQaOFDrC2RRCDLJYUX/MjL9CsngcVb
	GhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VgRLL0+zV9izeNqA7H6xht89GtAjYGk+yRCTwYVKTmI=;
	b=p2dDthc45JbtsPKXrIFKgUnH1ttvQXfr7aQ2cGWNSmgeTvVgJ7EzEN/xIgHrIZBm1P
	cquXGNsLSU1oC/1GL/bAy9Y5EvyRvJ06DQUWU8l1fRphMPkatmlhr9P0oT7VJj5hJSAW
	s6V601HZVAhBMgkyWF+7/S91UrJBKT49r4Ci49H2kIewcLcMUEBUgMnu56aLcI7QFO+X
	nejQ79xgMaCH2/V98h5LwSfHxik+XROn6nKXRTR4/25gQL0AWZUKPxefi0S6nVhleDz/
	ydTiHyMaKK8wSb4IXCdWq4BUxLygOTzk2+GiQ7phKgqF95mSt4y3fIRWyXmQG7UiIT4h
	rarw==
X-Gm-Message-State: AFeK/H0C1GtGxF51Pt4OuLMninQpnhfjaPapO+IRtYRZc0g3o6uS/R9zC1kHL3yIf189AzG+fPfwfwQXMVA6sGk5
X-Received: by 10.237.53.9 with SMTP id a9mr3095622qte.188.1489589325575; Wed,
	15 Mar 2017 07:48:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 15 Mar 2017 07:48:25 -0700 (PDT)
In-Reply-To: <1489581612.6396.94.camel@intel.com>
References: <alpine.LFD.2.20.1703150639340.8646@localhost.localdomain>
	<CAJTo0LZm4zR2f+2Wgvab0=dhdP-Mu-cDGihqh2_hnVvuaOVGmg@mail.gmail.com>
	<1489581612.6396.94.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Mar 2017 14:48:25 +0000
Message-ID: <CAJTo0LYPvmaKgmQAV3jn=qWh4MhGWkkpSR_C6JHVk3Lus3+SBw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what shell programming constructs can we count on in .bbclass files?
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
X-List-Received-Date: Wed, 15 Mar 2017 14:48:45 -0000
Content-Type: multipart/alternative; boundary=001a11c0285e9cd473054ac60a76

--001a11c0285e9cd473054ac60a76
Content-Type: text/plain; charset=UTF-8

On 15 March 2017 at 12:40, Patrick Ohly <patrick.ohly@intel.com> wrote:

> Unfortunately bitbake has problems parsing useful things like $( ). Are
> there open bugs about that and/or is it worth filing enhancement
> requests?
>

Absolutely worth filing bugs.  Worst case, they get marked as duplicates.

Ross

--001a11c0285e9cd473054ac60a76
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 March 2017 at 12:40, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":18r" class=
=3D"a3s aXjCH m15ad1fcf0be81229">Unfortunately bitbake has problems parsing=
 useful things like $( ). Are<br>
there open bugs about that and/or is it worth filing enhancement<br>
requests?</div></blockquote></div><br>Absolutely worth filing bugs.=C2=A0 W=
orst case, they get marked as duplicates.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c0285e9cd473054ac60a76--
