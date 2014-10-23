Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 899E465D3F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 11:55:44 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id x3so568659qcv.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 04:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9PSRG1jMjFb734+msiT/2hdvgLFPl1IOsW61TIM1qYA=;
	b=ZHnM12v4ZD92Z9lymh89eNkqq5wwg7U3EIlcsnC0hOMYzImaHTBVkPcm2dDwvUYJO5
	ZMYWSrNlBIMyAxEcm/7r56Fn24EDOQRAHtcmAHkcaxZSa4vQkKewvuUG7fd5wSQ+nIAc
	+tyMEklx9n7cMO0ZLI59apYjg5DQ+7hz00rGD06oUbs4viuplDMmhWLEgKNpRLXSy/Xt
	50oPvBg+WA4HcSvDDs+nmdKIOgY+ETD7GCS/dWXdOBGC4Nm+XjW/JgxfKyZSCXGqAVi2
	zkAxORu9ioQJz0TPHbkvy5tNOaYeG4dX3vF5b1H+zqSFrRgyZzqdKzxs4/y/kXaUlR8o
	lZGg==
X-Gm-Message-State: ALoCoQnbEHQoEAkE81wBTAbYywvSjPnAHR52we9AjBZhpyp2XVbdAq5nqfn7nr+sDiCd3e2TYR4m
X-Received: by 10.140.109.181 with SMTP id l50mr6354249qgf.80.1414065345526;
	Thu, 23 Oct 2014 04:55:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Thu, 23 Oct 2014 04:55:25 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AABD53050B@ALA-MBB.corp.ad.wrs.com>
References: <1413966997-3361-1-git-send-email-jackie.huang@windriver.com>
	<CAP9ODKpSoNU5CgCYngdJ3=FJf-T11CX+F=0365k1zK53zw1F9g@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AABD53050B@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Oct 2014 12:55:25 +0100
Message-ID: <CAJTo0Lae9GFbkf=p-Qa9=gmFT=+KTmjKdOugJKj_18t4xED-TA@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: resolve linux-firmware and microcode-ctl file conflicts
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
X-List-Received-Date: Thu, 23 Oct 2014 11:55:53 -0000
Content-Type: multipart/alternative; boundary=001a113ba04c9c17b2050615be3f

--001a113ba04c9c17b2050615be3f
Content-Type: text/plain; charset=UTF-8

On 23 October 2014 06:14, Huang, Jie (Jackie) <Jackie.Huang@windriver.com>
wrote:

> > * microcode-ctl-firmware seems useless if you can rely on linux-firmware
> to provide the file.
>
> Maybe, but someone may choose to use the one provided by
> microcode-ctl-firmware.


Would they intentionally pick the file in your microcode-ctl-firmware
package, and if they do so because it's a newer/better/faster microcode,
why isn't that upstreamed into linux-firmware?

Ross

--001a113ba04c9c17b2050615be3f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 October 2014 06:14, Huang, Jie (Jackie) <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Jackie.Huang@windriver.com" target=3D"_blank">Jackie.Huang@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">&gt; * microcode-ctl-firmware seems useless if you can rely on lin=
ux-firmware to provide the file.<br>
<br>
</span>Maybe, but someone may choose to use the one provided by microcode-c=
tl-firmware.</blockquote><div><br></div><div>Would they intentionally pick =
the file in your microcode-ctl-firmware package, and if they do so because =
it&#39;s a newer/better/faster microcode, why isn&#39;t that upstreamed int=
o linux-firmware?</div><div><br></div><div>Ross</div></div></div></div>

--001a113ba04c9c17b2050615be3f--
