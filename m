Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 677C86FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 20:33:00 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id m184so114062983iof.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 13:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OT6YzM0CTV6Myz9wuY7/KN0Zmijvv2GpCeb4p6Lhj3k=;
	b=LcXGhHhgtcuFRlpkB4P6HOo2o0aJ8V6nDFVvhGAsw1IsW+1I5yPmbH82tNNmH21g0D
	zKlrX9a1OkhoW+4wuFQuaFtuorzwzj31I/l/4wQo0xenTcmgXWmq1gJNKNAmu8XZC0Vc
	DvIyoJySr6D9FiadJkA/MjdJCcpRp7G5/+O+GHmQfJJphNSgVjLFbebrKR11VIXfscoi
	ltgcCMHI39++NPk3/WATzRmH3wADePqTqgTYgY18b6NVgo9x0Q6sW8M6LQThQsuLl9kN
	peQ7W0HfKjaOX9dDCzia07VIcNzPTW71DMyZ6nOfUiy8XZZDWLqXsayZa42GevhorhNh
	Syzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OT6YzM0CTV6Myz9wuY7/KN0Zmijvv2GpCeb4p6Lhj3k=;
	b=NfWNeH1ebofYVazT/t08h13AwjM5gFVgNKF0WejtT1et8CPuU11sKl1TfFQl98MxJ5
	LZiVdPNi3f/FgujGkv/RAR2LLyFIyI/Qw5GOdBkemMt3tv0gg/l0lIr/HyLoL9fe8wmA
	ykko9b87LyxRVbt5jOQSHqtM61pTAn4rcaDhj9Z+xBUAwyKMS7096WmKcBCi1Thgoop5
	4fJOQfO3WyE0/Zap/Qt0BDN+LzWJfr5il9ewwmKLVrcggSVlorO8DfQcg28sU4xSaVC1
	r+72GkGsL014/nffLsDQIGp/cfI8sfOROp7KQjZf4I5wix8uqKoySvW1KlM0M9ChqJfD
	PPEw==
X-Gm-Message-State: AD7BkJJaNnFDPqM00M3mX2FaP0oMpTkqe+loK9mR/DcDgFxgpsDf2tu4LUBa8y6xYxI6jxNYOm+m4O2pPi1rFXM7
X-Received: by 10.107.137.38 with SMTP id l38mr13105058iod.133.1458246781338; 
	Thu, 17 Mar 2016 13:33:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 17 Mar 2016 13:32:41 -0700 (PDT)
In-Reply-To: <1458211050-21152-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1458211050-21152-1-git-send-email-daniel.alexandrux.istrate@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Mar 2016 20:32:41 +0000
Message-ID: <CAJTo0LYpmnCX9OckD=hgt18F46wFD-9RVDESJV930sy1jzjE6Q@mail.gmail.com>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] oe-selftest: Updated --list-tests and --list-tests-by
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
X-List-Received-Date: Thu, 17 Mar 2016 20:33:02 -0000
Content-Type: multipart/alternative; boundary=001a113ec52265dce1052e4489a7

--001a113ec52265dce1052e4489a7
Content-Type: text/plain; charset=UTF-8

On 17 March 2016 at 10:37, Daniel Istrate <
daniel.alexandrux.istrate@intel.com> wrote:

> +from tabulate import tabulate
>

This isn't a core python module, so adds an external dependency.  Are we
okay with adding new dependencies to the selftest code, or should we try to
keep the dependencies down?

Ross

--001a113ec52265dce1052e4489a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 March 2016 at 10:37, Daniel Istrate <span dir=3D"ltr">&lt;<a href=3D"=
mailto:daniel.alexandrux.istrate@intel.com" target=3D"_blank">daniel.alexan=
drux.istrate@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":l6" class=3D"a3s" style=3D"overflow:hidden">+from <span cla=
ss=3D"il">tabulate</span> import <span class=3D"il">tabulate</span><br></di=
v></blockquote></div><br>This isn&#39;t a core python module, so adds an ex=
ternal dependency.=C2=A0 Are we okay with adding new dependencies to the se=
lftest code, or should we try to keep the dependencies down?</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec52265dce1052e4489a7--
