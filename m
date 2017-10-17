Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id AEF55782D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:12:38 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 101so2863672ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hmAYZxKIA5ibFbCt8Ah89q5KgohVxvZ4EdaiH5A9eNE=;
	b=THIahd22pHCnq/VpFV7dQxudgFFuRFdC5DNBFBhLqDji1bSIAa7uD8H4PhSf9vvnL0
	B7vYOnsWfpZ5uzP51K1uRw+PoXtMF0HybNJdzb/TWqVhEzib0gtd4erh1F3vi15lPbi9
	r37AhRDvtQ4Q6AMt1iro/pBqQ0nOPoNuMupuASTDcMBWcxRaQgTGdxcO3JJ7DjTnRyQm
	PjY0V0uwXMLQA16s+IV8ZtVCvJz0mLFYTgTM5pl5eMWd0qVxZVmPOhjt3q1KewLfdoVc
	uApo/hrsn3kr4EdOBefL5GVQCLD4vFr6Couyc21PhynTyiVaHHzzojQPjAHutcvbAK3G
	CEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hmAYZxKIA5ibFbCt8Ah89q5KgohVxvZ4EdaiH5A9eNE=;
	b=JChUmKV9NFL0OUdqLN2F5nD5nE/8ds9C4D/8jewL6c8W5KiQppPN8iFIBu8hRutL2I
	E7q+uZ3+8X5EdmKOjSlkncUfS/123xxdz6WdrBdmi+8m3eoKbYbkCKNdlhPbXW9wnVP5
	UsDNMp2lSsHyvXCjfdChEKrSI6CFzFq0CavXxzndjRp5T9c1x7tDPPhoPm7ugve6wKyb
	uugALr3P8g+A8J0s38UEP2XOdCF4M3KnJ/8CTXQOuBEjvUoGo1QKwCZ+v18qQVKDpxoG
	sYUFh3bTcESq9r9/sd5w921B/Di3lToCcvbBT2SYrQ3Tb187EEYfTlxg5DOKA63Lp8eX
	czMQ==
X-Gm-Message-State: AMCzsaVp1lMtBMx80QFeUyhyxXZDAbGmAfs/ful5K1M6E/IU+N0Ii+Yb
	Ejjp9+Eg33D5sJ2yo9SMSZWBxuJS+tzRHwoJzbx18A==
X-Google-Smtp-Source: ABhQp+Ry+vQavs6D20Fm9tYvFqxA7jB2sKtcBCUaY0ozK14xyXgLQIMBe3V/2pNskgQL77gHwtlk6q3GQsVMKTyeaT4=
X-Received: by 10.107.18.67 with SMTP id a64mr19100210ioj.165.1508256759639;
	Tue, 17 Oct 2017 09:12:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 17 Oct 2017 09:12:19 -0700 (PDT)
In-Reply-To: <2eb0d895-21c0-e1ef-f5ef-f12ed014ac6c@linux.intel.com>
References: <20171017150506.17803-1-joshua.g.lock@intel.com>
	<20171017110002.b1a3df797fdbf5767a5e6f57@linux.intel.com>
	<2eb0d895-21c0-e1ef-f5ef-f12ed014ac6c@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 17:12:19 +0100
Message-ID: <CAJTo0LZp+kdkO3pMmqEiLUNj4i6eE_Jt08MQGFcPdUM1FZjFnA@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: ensure temp directory is created
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
X-List-Received-Date: Tue, 17 Oct 2017 16:12:38 -0000
Content-Type: multipart/alternative; boundary="001a113ee9b263a58c055bc064f2"

--001a113ee9b263a58c055bc064f2
Content-Type: text/plain; charset="UTF-8"

On 17 October 2017 at 17:02, Joshua Lock <joshua.g.lock@linux.intel.com>
wrote:

> FWIW the failure has been observed on multiple host distros (Ubuntu 16.04,
> Fedora 26, Tumbleweed) and I could replicate it very easily on my Fedora 26
> host with an use of devtool modify -x.


If you can replicate it on demand how about using a tracing tool to figure
out if a) the mkdir doesn't actually happen or b) something deletes the
directory.

Ross

--001a113ee9b263a58c055bc064f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 October 2017 at 17:02, Joshua Lock <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:joshua.g.lock@linux.intel.com" target=3D"_blank">jos=
hua.g.lock@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_ext=
ra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">FWIW the fail=
ure has been observed on multiple host distros (Ubuntu 16.04, Fedora 26, Tu=
mbleweed) and I could replicate it very easily on my Fedora 26 host with an=
 use of devtool modify -x.</blockquote><div><br></div><div>If you can repli=
cate it on demand how about using a tracing tool to figure out if a) the mk=
dir doesn&#39;t actually happen or b) something deletes the directory.</div=
><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113ee9b263a58c055bc064f2--
