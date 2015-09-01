Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 277D676A51
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 14:46:09 +0000 (UTC)
Received: by ioii196 with SMTP id i196so3415970ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YYOe+czedo97i9QkI/ATPtKXm3eLzPEUaXypW68uBo0=;
	b=ZnvWFOdrI2QS+rWwWonUSPAmmvh4Y92RHiyQKlAwySRDV47zLnYnFehZu4rw0CMjhJ
	ffsunWPWm9B5PvmjTJCOqw0o/b8MDj/nwE6Gu26snM5+Xe/0vEulHtdmnZta29y//DVd
	YERU9H2GBcKOawtRizJK4TWKanm1FQ7HuJhWr4nGRk54gishcUvxdt8W9h9fxkjY8KwY
	p9gpfSGOfOGu9mFdb9GAunoG15Uvbxsa9tNAI3+WlvsOZbR3coh41KoVBs3iJyRKR1HH
	Wf5mGrWYnKiazbboksENM+qKh7pfMoIGf6cdeOe/UHMj1YCzJti0zVcU45rPMnb/wg5B
	mgaQ==
X-Received: by 10.107.149.77 with SMTP id x74mr4041288iod.112.1441118770053;
	Tue, 01 Sep 2015 07:46:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.202 with HTTP; Tue, 1 Sep 2015 07:45:40 -0700 (PDT)
In-Reply-To: <CAHiDW_Hf=bYWFaReJRnk3WyqB+uPNtKAS=C3EqQfbGgfpBoR3w@mail.gmail.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
	<1440843517.32588.7.camel@linuxfoundation.org>
	<CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
	<1441029218.26554.21.camel@linuxfoundation.org>
	<CAMKF1sphYcMNjCOqgT5+yc0uWnpmjrAVBcxhbnczAZT1prY1qw@mail.gmail.com>
	<CAHiDW_Hf=bYWFaReJRnk3WyqB+uPNtKAS=C3EqQfbGgfpBoR3w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Sep 2015 07:45:40 -0700
Message-ID: <CAMKF1sqq8zvDEyCei=qYUnip61r6XauFtjOt=gKQbd7+ZGa=_w@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Tue, 01 Sep 2015 14:46:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 1, 2015 at 4:21 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> On 31 August 2015 at 17:38, Khem Raj <raj.khem@gmail.com> wrote:
>> There is alternative suggestion. I think all this is happening for
>> nettle which we have GPLv2 version in core. There doesnt seem to be a
>> full use of libgmp elsewhere.
>> nettle can be built using mini-gmp, as well I think that route should
>> be explored. That also keeps the us honest with our motive of moving
>> all gplv2 legacy packages to layer of its own in future.
>
> Is it actually possible to build a working LGPL2 version of nettle with
> mini-gmp? I did look at that option (and the "--with-mini-nettle" option for
> gnutls) but couldn't figure it out.
>
> With our current nettle (2.7.1) the problems are
> A) it doesn't actually have a "--enable-mini-gmp" option: only one test
> binary seems use mini-gmp

yes I did not consider its old version of gmp

> B) the gmp files that are included are actually LGPL3 (so even if we could
> use them, it would not help the end goal much)

Yes.  Let merge it in. I would have preferred to call it gmp42 or
something in recipe
so it does not cause toolchain problems. but thats a  combination of
GPLv2 building toolchain for target with whitelisting gcc and
binutils.

>
> - Jussi

