Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 91DDC60125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 20:10:43 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id n128so54689812ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 13:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S+JSKPI1GX9cOw0pcHcHW+85ir36Eu02tM8IjXKgRII=;
	b=fqQtY/C0zCYwVTwt1L9i7Lf1HYr8Ag98XAizewU9xDsEQ+JuBvdriHIHWybAC6qNVX
	5dm4j8HStAvcebhL8XeG1h5T08NGDfxY2Gzvb0xq2kFjw6F9xDRAnteCH5CphDKFcKUw
	NFClBDA1h20PoZKrT3d1veyFX7UNH003PFikzKCVXUNDJj6LsC0fOH0ns++TlUDf7/Pq
	ebyjFRy8akuz8glr8EJHEX0FGnWVZMnpfuoxv1YfJS/WzqwGDboDB2ZPYq65PngYL3NV
	vHhUzLfktGq9V+8JrPO1Hvnr4CF1Lxui7xKNZ4xWAYxIzl2cSt9ge6OEHDctAOodhESY
	l96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S+JSKPI1GX9cOw0pcHcHW+85ir36Eu02tM8IjXKgRII=;
	b=McbSjnOuRWVA+y8dMi0RrgXZw5jkz0YGEGFTTbcLJFO6P1GtHal06FnLqaZ07euXn4
	uHnCi8x8+LPj4YB+2Xswz/UpsQR72h09YBQsNAjfFQPJI391cPTC09cXZ4INHUiQDd0P
	l9MxD76aZ2wivV6i/XuK0At80DI9jwVA/6Hu65R2wzlE88Kq8TqmvUqU28qiJ02B0j/i
	coQFKzYIf9F+rn0hIfYRWzJMBMmETGyg8TdpWEsyLuu6TnjwZM8sZQ94N3i2vZFRsK6C
	XlwSHwOnxtZ41rxD+SGoUxMJIw1eXQxA4E+nxgeUxFBeqGVkmAPF358XHzEBnYmp+TSS
	ezaw==
X-Gm-Message-State: AE9vXwP2+sd0qa6qhyqH/gGNimx75FdptHqOennyMSvMHaAMmXmDjuSiWLKHEifypeIMx1iklvyjkw8u9/Cs/Cxc
X-Received: by 10.107.135.142 with SMTP id r14mr6638238ioi.133.1472069443999; 
	Wed, 24 Aug 2016 13:10:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 24 Aug 2016 13:10:23 -0700 (PDT)
In-Reply-To: <57BCFC8F.1060706@windriver.com>
References: <cover.1472001956.git.kai.kang@windriver.com>
	<57BCFC8F.1060706@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Aug 2016 21:10:23 +0100
Message-ID: <CAJTo0Lbz3T+eqGmGGWtHRtDPOG4KyvyxQ0GXziXcNQbudyN+5w@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Toggle bind configure options
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
X-List-Received-Date: Wed, 24 Aug 2016 20:10:43 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc4b9135053ad6e046

--001a113eccbc4b9135053ad6e046
Content-Type: text/plain; charset=UTF-8

On 24 August 2016 at 02:46, Kang Kai <Kai.Kang@windriver.com> wrote:

> I didn't see Wangxin's work to upgrade bind. So please comment the
> patches, and I will rebase them when the upgrade patch is merged.
>

Looks good to me!

Ross

--001a113eccbc4b9135053ad6e046
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 August 2016 at 02:46, Kang Kai <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":14p" class=3D"a=
3s aXjCH m156ba3b4f59cc3eb">I didn&#39;t see Wangxin&#39;s work to upgrade =
bind. So please comment the patches, and I will rebase them when the upgrad=
e patch is merged.<br></div></blockquote></div><br>Looks good to me!</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113eccbc4b9135053ad6e046--
