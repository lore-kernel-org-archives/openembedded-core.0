Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id EC65165D3A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 08:54:11 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id s7so3407581qap.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Nov 2014 00:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WjaxzGTti+tvewnOSGZSt74qxxdDLoao9uCKu8tp3eQ=;
	b=Sqj/b3i2OuCcum4kP1L4F7ix13DQ5WS4ETts6Ri/LwfWdz46SevO8hcxZhPZ6Ar9q1
	BTv6DlcG/K+6ZgLzbfWUvyZ/fGltY0sLSH2PltIW6c/A0O/SQY7iu8FyG8Fv3LEPGbAR
	OFrrZFZ+ZWK4ZWbuf1C6PehwDK8eCb8D0J5H+0mH76zIyui6B7tTQtwTMLszRUPf2np2
	oMHhb/GgtSECwManpABZQ2Nx7AqGJpQ92pox1554zdW3IWBj64vQaF5RRrhVTpEFGse9
	cMmYEVC9tZGyzwT51BfyvEbXi4DYH8+wSgBp2mlTv2Hs2cEoN3c6diGIHnFPt1PkJ58w
	KaAg==
X-Gm-Message-State: ALoCoQmCkrhw8E6aMTGSvgevLLuUqc+8xOWVectEByDlqsXlUD4HWtQtZawzZXu8/5m7GtaI/PdI
X-Received: by 10.224.112.66 with SMTP id v2mr24348728qap.22.1415436852177;
	Sat, 08 Nov 2014 00:54:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Sat, 8 Nov 2014 00:53:51 -0800 (PST)
In-Reply-To: <cover.1415264548.git.kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 8 Nov 2014 08:53:51 +0000
Message-ID: <CAJTo0LbUiPaj5aE0Eb0W9zGthfqx5ct4+6-obv0pJEwPMseuiw@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/25] Add machine qemuarm64
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
X-List-Received-Date: Sat, 08 Nov 2014 08:54:18 -0000
Content-Type: multipart/alternative; boundary=001a1130cb12c6e5ea0507551208

--001a1130cb12c6e5ea0507551208
Content-Type: text/plain; charset=UTF-8

On 6 November 2014 15:34, Kai Kang <kai.kang@windriver.com> wrote:

> It has been tested for core-image-minimal core-image-sato
> core-image-sato-sdk
> meta-toolchain and world.
>

When I boot core-image-sato, X can't start.  Does the virtual machine that
qemu runs not have video support at the moment?

Ross

--001a1130cb12c6e5ea0507551208
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 November 2014 15:34, Kai Kang <span dir=3D"ltr">&lt;<a href=3D"mailto:=
kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":28k" class=3D"a3s=
" style=3D"overflow:hidden">It has been tested for core-image-minimal core-=
image-sato core-image-sato-sdk<br>
meta-toolchain and world.</div></blockquote><div><br></div><div>When I boot=
 core-image-sato, X can&#39;t start.=C2=A0 Does the virtual machine that qe=
mu runs not have video support at the moment?</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--001a1130cb12c6e5ea0507551208--
