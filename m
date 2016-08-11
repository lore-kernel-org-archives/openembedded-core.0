Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 769297016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 09:14:13 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id b62so637377iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 02:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vbw0KTaQAmQTycM6oA5pPD5vGdQ8XuC2I4LBXzCIPSQ=;
	b=0gL9lvcNpJ/RDF6TT+5gB8XT32CPv1s3nR7wGIp4htjFaTyF+P9Rf3CUioVoRovWs+
	tiIEzU1uzj/03NErcsq+aId529Wd5YV8b+wDZV2t4SESpsGWvI38nXy7LHVdMUduJ4t8
	tm4jOfou1SrtdRrWrBMsyNFryzqbTVtUzCiGV4PCvt1XF+1FKWUitPovBmEe1+GlEhgM
	1w6n+Os+dzLNTgE/HDEI52jpBfnu7o7JupGIANoSTnuZSIEY1MBrcWpioSFimHfBRomH
	MpK9n6BKmpdw5EX1kTbia9eAls7cU5QNuzonqChNSbT8XDfFJ1lmkPeonZX7zF/3MJ52
	5rMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vbw0KTaQAmQTycM6oA5pPD5vGdQ8XuC2I4LBXzCIPSQ=;
	b=PTfG+EI++Rz1VLkov+W9Dj/ON5/3C7HaT7DxPbcuROVZawATCNNdqvgbhimUFW7S4o
	L7Z4DHhuvdOVKtLgsnDVIoRnNBPlAgk+KneJciNT98k0PJZjt0zG3NCGChHcK9sPaCr6
	rGgty9YBI5Cngt2jKtiNA7ENVhwPa8J0ZB9SCWPkaH9S5hvSbqkG0BiRnLC71T9vAOWq
	n3dw50q8qC+Edn9x9XJhft1cqV9H2ALdJHuRxkG5r9pn7Ig6k5QRTkIf1sHaIlHm4xnj
	kx4VDNdHW5SS8kFOoDLk0UBKTEc81lQ9AhcYjopTy9kpWxg+DO1RYchfyFe2hcf4mlLP
	Yugw==
X-Gm-Message-State: AEkoousAxVzHfd0cda/+yQoDtjir34O7ltmNhm1CZUxMagEF0zVrR5jpaMf5Rfubm/j3RqQFi5RVGO3ZhCBmfpY0
X-Received: by 10.107.135.142 with SMTP id r14mr11070354ioi.133.1470906854193; 
	Thu, 11 Aug 2016 02:14:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 11 Aug 2016 02:13:53 -0700 (PDT)
In-Reply-To: <1470864947-17916-1-git-send-email-michael.davis@essvote.com>
References: <1470864947-17916-1-git-send-email-michael.davis@essvote.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Aug 2016 10:13:53 +0100
Message-ID: <CAJTo0LYpubvSWuWkRt_wH3jU2G+6-gAw_fNvUe5Rikfut-=BiA@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv4] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Thu, 11 Aug 2016 09:14:15 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc8ad2230539c83025

--001a113eccbc8ad2230539c83025
Content-Type: text/plain; charset=UTF-8

On 10 August 2016 at 22:36, Davis, Michael <michael.davis@essvote.com>
wrote:

> GPLV3 and BSD portions were originally placed in the same package.
> The GPLv3 portion has been seperated into pcsc-lite-spy and
> pcsc-lite-spy-dev so the package can be used with GPLv3 blacklisted.


Wrong list still, meta-oe patches go to openembedded-devel@.

Ross

--001a113eccbc8ad2230539c83025
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 August 2016 at 22:36, Davis, Michael <span dir=3D"ltr">&lt;<a href=3D=
"mailto:michael.davis@essvote.com" target=3D"_blank">michael.davis@essvote.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">GPLV3 and BSD portions were originally placed in the same package.<br>
</span>The GPLv3 portion has been seperated into pcsc-lite-spy and<br>
pcsc-lite-spy-dev so the package can be used with GPLv3 blacklisted.</block=
quote></div><br>Wrong list still, meta-oe patches go to openembedded-devel@=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a113eccbc8ad2230539c83025--
