Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADEA7702B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:36:34 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so27702909wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Z6KGvbfFp5WKo3u4fbUEbk+Dg57k+4x2k1ySEMGHD98=;
	b=QMeUyoK8LSa5aW6b8BTyL0NEc/HTnl++7+VO7IXDakozjdtp52/E/PpEV1XSI4tML9
	atZPPvaKVjRX9nEGfkLna3BB543H1+5MYSKW48FbjrG/aCyNZ9Nk9NJPyZazhDdprBMU
	37mWSgtfvrLK/vHKvBRYXV/3GKDX3OlFwN+6B3wcUsXy3aq4mYyvI1AAHx+IDTxpIrAA
	wAtHorOmJszA1+R/QbefOrs16zzyZbVYgv9U79CTFjzB/4sv1ge6A4ZOw34dX/OVkvGU
	+iCqEQlyUaf3kwriBl2h2rAd5HdHqXXhIigKYoYFggV6RvA3FYS7s7vIXCmXlaCWZjjm
	epLg==
X-Gm-Message-State: ALoCoQlFtyX1fKpuBZ9McvWhWzr1cfciNifUDA870GLF4i5L9JlbUOFG6TDsJUOCG7QPCKOzSndG
X-Received: by 10.180.84.99 with SMTP id x3mr8087584wiy.16.1442496994008; Thu,
	17 Sep 2015 06:36:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Thu, 17 Sep 2015 06:36:04 -0700 (PDT)
In-Reply-To: <CAP9ODKqRyVK1mrOA4ofZVN+iS8fY48dovQ8VihBPQFZT8F7DWA@mail.gmail.com>
References: <cover.1442494048.git.jussi.kukkonen@intel.com>
	<f0b5037b3efdd8498a6499690009aed1c1273315.1442494048.git.jussi.kukkonen@intel.com>
	<CAP9ODKqRyVK1mrOA4ofZVN+iS8fY48dovQ8VihBPQFZT8F7DWA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 17 Sep 2015 16:36:04 +0300
Message-ID: <CAHiDW_FKgyMNr37KSBEy=C2KJHGhRM2tJPDQgD9RRz-Vb0mi4A@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xinput-calibrator: Add a dummy calibration file for qemu
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
X-List-Received-Date: Thu, 17 Sep 2015 13:36:39 -0000
Content-Type: multipart/alternative; boundary=f46d044403a8eafa31051ff1806d

--f46d044403a8eafa31051ff1806d
Content-Type: text/plain; charset=UTF-8

On 17 September 2015 at 16:23, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:
>
> On Thu, Sep 17, 2015 at 10:00 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
> > This prevents xinput_calibrator from popping up on every boot in qemu.
> >
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>
> Why you don't provide a valid calibration for it instead?

xinput_calibrator does not actually work for xorg drivers: it fails to
write the values in xinput format for xorg devices. I was planning on
looking at that as well but since I know very little about these drivers I
was going for the low hanging fruit first...

Also, Ross pointed out that I should just add the file into
meta/recipes-graphics/xinput-calibrator/pointercal-xinput/qemuall/pointercal.xinput
and then the recipe changes become unneeded.

Jussi

--f46d044403a8eafa31051ff1806d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 September 2015 at 16:23, Otavio Salvador &lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.=
br</a>&gt; wrote:<br>&gt;<br>&gt; On Thu, Sep 17, 2015 at 10:00 AM, Jussi K=
ukkonen<br>&gt; &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi.kukko=
nen@intel.com</a>&gt; wrote:<br>&gt; &gt; This prevents xinput_calibrator f=
rom popping up on every boot in qemu.<br>&gt; &gt;<br>&gt; &gt; Signed-off-=
by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi.ku=
kkonen@intel.com</a>&gt;<br>&gt;<br>&gt; Why you don&#39;t provide a valid =
calibration for it instead?<br><br>xinput_calibrator does not actually work=
 for xorg drivers: it fails to write the values in xinput format for xorg d=
evices. I was planning on looking at that as well but since I know very lit=
tle about these drivers I was going for the low hanging fruit first...<br><=
br>Also, Ross pointed out that I should just add the file into meta/recipes=
-graphics/xinput-calibrator/pointercal-xinput/qemuall/pointercal.xinput and=
 then the recipe changes become unneeded.<div><br></div><div>Jussi</div><di=
v><br></div></div>

--f46d044403a8eafa31051ff1806d--
