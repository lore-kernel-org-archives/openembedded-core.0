Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 342F07317F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 21:34:16 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id e126so69603371ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 13:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1m8AgsVOXPR8Lx3f5XgUhpXWTpOHW1agEwuUuxvSdHM=;
	b=YFiXn9DT0lLB7Ged6jJBRJRpO7Q2o0dhH2xxq0uzA8N2LFtfKThJ+KsSqHb+eJcTvK
	bAp8Y2N10eMOmIDmQVGrwi2a4d5jie3dPoRRnDzAB8PjPCrfxYTzrvXwuAZkpjmml6v1
	lx3LJnK4vyZEwSEQEsNRXb1N+EKq+nySjk/O20D92ybS+3xn2D3QCQGukjj8+aYBU12u
	d/J2mIM8BCczQZWQ9qfsUB+2LlZ/AiOjvL6Px8DZp8P13475Z8+9OSx0VViqC5XAOlqt
	PIedPT9OQq40eNju5T9ijogi+gSM2liOe3FdBWj+O1odrCEAMURB4mLg+mrlj0bOi8bX
	33+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1m8AgsVOXPR8Lx3f5XgUhpXWTpOHW1agEwuUuxvSdHM=;
	b=G9VneBSiUlGJpE3nHMhKbSz8L4Zo9XTpjlNJERfNlwsfYoaJpgRSoNeNMkRBCTyRRt
	pHyPEfh1sCRxsCk/I4MVX9EhW0qrKsDMRy+z3eEQSu1e/GEHV+ZruTxlnhQCpBBubjko
	k9TLsby8YuaPsQ6amdE4Ryg7SIZAWCFWcp7Fj47qNDvdhbROVphC6A2HBaa2eCA3WuOG
	6Heh1krTYYumKVuHKJJYR1/PFjJznHNf8glIFQdNNgE2jRYh+JHTSMdxfOpcDQ60Gr+2
	jGM+kTEWdD8q0cy/foiRjKasl95Zqn/NvZkaXSWAc5YFsvVKj93gUwCLcERrzPpwuNbg
	igDQ==
X-Gm-Message-State: ALoCoQm8rgPNGWwK99TNW9PIlE1HU7yJdRAzoj6IfQkOaXQg4se8cDFEsSOvLwNgAMrM1UrlB5u9UXkN5TFVsUVtZRCfMEMFnI6dV35NTAXLUGUGUEH0rwQ=
X-Received: by 10.107.164.161 with SMTP id d33mr620137ioj.148.1450388057452;
	Thu, 17 Dec 2015 13:34:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 17 Dec 2015 13:33:57 -0800 (PST)
In-Reply-To: <1450377152-13329-1-git-send-email-cristian.iorga@intel.com>
References: <1450377152-13329-1-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Dec 2015 21:33:57 +0000
Message-ID: <CAJTo0LZdfkEWwjx6BPcdWspi0nsbeix9fUOBmGDpGScNeVhhXA@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to 2.5.0
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
X-List-Received-Date: Thu, 17 Dec 2015 21:34:17 -0000
Content-Type: multipart/alternative; boundary=001a1141c976f38ba805271ec83f

--001a1141c976f38ba805271ec83f
Content-Type: text/plain; charset=UTF-8

On 17 December 2015 at 18:32, Cristian Iorga <cristian.iorga@intel.com>
wrote:

> - cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch removed,
> included upstream;
> - smc91c111_fix*.patch patches removed, included upstream;
> - trace-remove-malloc-tracing.patch patch removed, included upstream;
> - some configure options disappeared or changed name, updated.
>

Looks like if it finds gcrypt it will try to use it:

| ERROR: /usr/bin/libgcrypt-config should not be used, use an alternative
such as pkg-config
| ERROR: /usr/bin/libgcrypt-config should not be used, use an alternative
such as pkg-config

Ross

--001a1141c976f38ba805271ec83f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2015 at 18:32, Cristian Iorga <span dir=3D"ltr">&lt;<a href=
=3D"mailto:cristian.iorga@intel.com" target=3D"_blank">cristian.iorga@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div id=3D":35n" class=3D"" =
style=3D"overflow:hidden">- cpus.c-qemu_mutex_lock_iothread-fix-race-condit=
ion-a.patch removed,<br>
included upstream;<br>
- smc91c111_fix*.patch patches removed, included upstream;<br>
- trace-remove-malloc-tracing.patch patch removed, included upstream;<br>
- some configure options disappeared or changed name, updated.</div></block=
quote></div><br>Looks like if it finds gcrypt it will try to use it:</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=
=3D"gmail_extra">| ERROR: /usr/bin/libgcrypt-config should not be used, use=
 an alternative such as pkg-config</div><div class=3D"gmail_extra">| ERROR:=
 /usr/bin/libgcrypt-config should not be used, use an alternative such as p=
kg-config</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div></div>

--001a1141c976f38ba805271ec83f--
