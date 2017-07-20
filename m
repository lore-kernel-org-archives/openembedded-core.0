Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 657226003C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:39:30 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id h199so15917670ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T/kxQMrd2UUHXQFFh33gSQw278kWgZPLWKpXneaAo7E=;
	b=rD9F1uRXJBsI/uxdtZCw9+7HIz2eU07+Z3BZa02fWOm3IGboLNBifBlH+KeScL7EQA
	mx+ScFC9nhmzgK9yBlK93mSjvDvvDR5PzbDLctFSgRkw0sZEb0tTn4yCe5/r8+FPElCs
	vCSaEnjHWBxS93CydFte8GTWNiQnMoEsJIp/9wlY4sHBFJHpyluG4R+dd4kR4PSXj4BE
	BRkrGfXA0ohx83KyoTWOxuLsASf/sjfRqpnThnGQ1yX0MAkMPqcReVhdgXHPdc1571EU
	O46dv7MOA4kJc7TIBwxoIddoBvBO5MFf7iP+IElrCT435qOwrAgCXDnOdUvn9nRVfHZR
	o3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T/kxQMrd2UUHXQFFh33gSQw278kWgZPLWKpXneaAo7E=;
	b=jtLppTCa0HEtTJ0XMgNk1AMrUfTwY7XrWPrndD0QmSOvD74G4lwcaaYk5EDmgPpWuB
	+BLf68kUwqlxrdEx6Ky5zU09sR7A+3SFvPahb3yiMtSndytITlgXFzhFqu6iwlahWQY7
	tbjHRM+jCCQUv9PW7WdMe3QQPF6VCzLLAxC/1+BD04Qgd4CAXel4iopHmjrZ4PHhdBUO
	OKQZNdLiWTWaC+3vC9e14kp4xcotBz0SEGtba1l7Yy37r7cXJeom3Ep17b7qUVuMOL4X
	FtP/a+Yw5YBcWn0BnKFvgHp+eZpIE/zTNk2QOHyOehVnjeVEj67i+32OZK0E45s5/9ih
	xCww==
X-Gm-Message-State: AIVw112tCbNmTZBdUMfF8D5A9iwql1WvP5xvPqtd23xrYCoDhGiPEN4I
	8mNX+mlGrU2r/1ar7GnJ7rT1G1M055ia
X-Received: by 10.36.201.198 with SMTP id h189mr3272424itg.113.1500557972397; 
	Thu, 20 Jul 2017 06:39:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 06:39:11 -0700 (PDT)
In-Reply-To: <CAP71WjzwRpC92KED-8k=xmdouRi8TfaNYbWGJyMkc7PBf1KFHQ@mail.gmail.com>
References: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
	<CAP71Wjz2gS1PYWZzZ2FYb72F_T2dP30266Xcy70eRJvftjsKUA@mail.gmail.com>
	<CAJTo0LaKDgomugkgS0uirpirJPOLSu=-OXyEDQcGSuF6PTP8HQ@mail.gmail.com>
	<CAP71WjzwRpC92KED-8k=xmdouRi8TfaNYbWGJyMkc7PBf1KFHQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 14:39:11 +0100
Message-ID: <CAJTo0Lbng_6OzZQsBqMAd_qpiQVqr+v4kz2=Dy=PbLQbZw0VAg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix pkg-config utilization
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
X-List-Received-Date: Thu, 20 Jul 2017 13:39:31 -0000
Content-Type: multipart/alternative; boundary="94eb2c089360e8f89a0554bfe0de"

--94eb2c089360e8f89a0554bfe0de
Content-Type: text/plain; charset="UTF-8"

On 20 July 2017 at 14:37, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> but do we want to make these changes as 1 patch with the pkg-config
> fix, or as a follow up patch? I have other patches to fix sdl -> sdl2
> and add ffplay support.
>

Followup is fine, imho.

Ross

--94eb2c089360e8f89a0554bfe0de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2017 at 14:37, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D=
"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@lin=
aro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:286" class=3D"a3s aXjCH m15d6038746e069a5">but do we want to make these ch=
anges as 1 patch with the pkg-config<br>
fix, or as a follow up patch? I have other patches to fix sdl -&gt; sdl2<br=
>
and add ffplay support.<br></div></blockquote></div><br>Followup is fine, i=
mho.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--94eb2c089360e8f89a0554bfe0de--
