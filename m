Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id CC20677BDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:15:52 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id d10so44499151qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S4hhGPl6XL9YmDBcCOrKBp0rPM1KRa07u6u4Cg5M5Vg=;
	b=L8iGSPRejmcG2sldYuiVTzKikwM4MPgXAMTkrwch8ps+5idZ5V6ScyYhXAuMyaJrLh
	m/tUuyl+lUu0d96iNdYvMvTHJq3xOGnJFe0lis23K9ac099269V7gZeVYqnZ0t+qMxpo
	ggvWkzTz+sEmZG8iroMsFbFMD1HU64wQeRiJGYaepGBEHKfogr4/VDZTpx8VerSOxGiU
	zAK7CGYgEUP8vX39ckrGpvbDlCoxSMPZqYap1MbkrrBON/xvPDrLRJshQdvCllM9cs/y
	Jx7HXOuyVOWMJyXkKnpASvcQi8OcmffquaKt+k07KuG60U+KbMwz3fM32H9F1r3CqF5z
	vDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S4hhGPl6XL9YmDBcCOrKBp0rPM1KRa07u6u4Cg5M5Vg=;
	b=GrseXdxNz969reiZODdD9nn8EyEYmBOqtQxaN2KkVAZMmAnuMD82+MHMcEgQrZkVSM
	O/2IiR/ec7jDQAoW3aTiVv11REAM9qLdgWApXwAIItz1dTYA/mIs2D0IVQ+7tQ1L044m
	ghTg9hMUkiFHPRlElNhsifW+2kDB9Na5vmbtAOQua+kisPhrm88b8H+nTJhXu5zx4XCC
	nopSjdx5THHBuSv5eXXIaiWR+MR8jKM4plTfRe5HV0go6PbE/p0jlrG5cs7mvQ4DKN5w
	ISDNgBkW0pty89g+rFsrt0ZKjYyfwW3foBtLSeZNtgX/M1kQ5j1Xjn/nZGpgHVyuI3e4
	EnTA==
X-Gm-Message-State: AFeK/H3jE/DyfFNmaq0zzb8N6+S8OyBvElRGAjSQY/JiVoAJl+7TiNkqCotrQWRR3ys+AbX9ib5/dkD3YempAJvJ
X-Received: by 10.55.119.134 with SMTP id s128mr521032qkc.244.1490890553677;
	Thu, 30 Mar 2017 09:15:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 30 Mar 2017 09:15:33 -0700 (PDT)
In-Reply-To: <0b00658b-a9c7-680c-9ec3-c6cee05b7f67@linux.intel.com>
References: <20170329092638.11677-1-mikko.ylinen@linux.intel.com>
	<CAJTo0LaLhSaC3bx09=qc+gL7YsPKD0YEtukZafUXcxZdW37dwQ@mail.gmail.com>
	<4cf87faa3852485a820c7526323ef2ab@XBOX02.axis.com>
	<0b00658b-a9c7-680c-9ec3-c6cee05b7f67@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Mar 2017 17:15:33 +0100
Message-ID: <CAJTo0LbtX-r+wp+1+taeimS7P0jGC1ygZHftfSeqJRRQY72iCg@mail.gmail.com>
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: check 'efi' in MACHINE_FEATURES
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
X-List-Received-Date: Thu, 30 Mar 2017 16:15:53 -0000
Content-Type: multipart/alternative; boundary=94eb2c05cbd0d9f12a054bf501f7

--94eb2c05cbd0d9f12a054bf501f7
Content-Type: text/plain; charset=UTF-8

On 30 March 2017 at 07:59, Mikko Ylinen <mikko.ylinen@linux.intel.com>
wrote:

> I'm fine. Perhaps 'efi' should not be a PACKAGECONFIG at all (and
> unconditionally disabled here) and
> the functionality (just bootctl?) is moved in systemd-boot. Thoughts?
>

I'm not fully aware of the details here but this seems like a good idea.
Can you prepare a patch?

Ross

--94eb2c05cbd0d9f12a054bf501f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 March 2017 at 07:59, Mikko Ylinen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:mikko.ylinen@linux.intel.com" target=3D"_blank">mikko.ylinen@linux.int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
1qs" class=3D"a3s aXjCH m15b1e03452bba5a6">I&#39;m fine. Perhaps &#39;efi&#=
39; should not be a PACKAGECONFIG at all (and unconditionally disabled here=
) and<br>
the functionality (just bootctl?) is moved in systemd-boot. Thoughts?<br></=
div></blockquote><div><br></div><div>I&#39;m not fully aware of the details=
 here but this seems like a good idea.=C2=A0 Can you prepare a patch?</div>=
<div><br></div><div>Ross</div></div></div></div>

--94eb2c05cbd0d9f12a054bf501f7--
