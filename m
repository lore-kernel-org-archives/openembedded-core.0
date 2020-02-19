Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4DAD161515
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:40:17 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z19so21686631qkj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 18:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=st/NT7Yz4vVGRDTam2usnzdUa1mI5Gj5Gp4PKPNS8X8=;
	b=S78KREDO7w6PukFwkhbSMfjALJoWS0LbrGW6uEKb6bemea2Xkx4CCQVvCffLAwr+QD
	mirMrxC7qwfIiTivmz+grOKYRcIJAo5NANiJ4fpGuxLUlczNcEB51/Qz+BIuJM0Ap3Q9
	kcilg9ME1j0DmGUGwXFisyuF2fh2Tvg3/eshPGMXLKL1sHHyFhLoekHXYY547JIibI5S
	RSvM4Mv7JHW1LbuzmlawGvEcE7fouSt/upNQuCyNFlFPAGoiB+umjkp/6qkhQOjctMaQ
	BC/gicGS7xNxj9DV0kpsuq9icYzFnogYp5RCDl4vxa03jRBDAX1fvPn/ChDk9O0rUmtq
	Z0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=st/NT7Yz4vVGRDTam2usnzdUa1mI5Gj5Gp4PKPNS8X8=;
	b=kgrv+kSm9k2MzuIFmE8IODDBgtuGBR4P4r23FMus3rFXPMlBwnugrD3bm2UZcJPjpw
	y38Ixwoi4AL2XLl4mseXtlCk8xuCnjNBpo3wjFltBX4jXg4O76mW8sfxpH4dIR4z+DeT
	7Nikx3xd+jlhA2Bu2/D1XnF1dM3mvRXFJzK9x6DhidDmptylGMx+imQA47CF/qzjpi4q
	qp4cFHzoxsnN21EXDnvTFT8DzBc67EIURGQ0QdWbVHUYJ3/OjRt0toZQ44WHEFuftgdm
	K0ZguPKPq6EGmziKMRnIkSqezy513Fus4W4kY5A4qMa7JTWgkMiB14RdOCqGnl8WZpkX
	2T0w==
X-Gm-Message-State: APjAAAWVJIoph28MLOVaVsFxMU0eyhigjzkGgXmqgwbcd5jSRO3N6NsB
	Xh50Uon+NvqKWtAorX8e5VBIck6+OXzbPw6MkxZTtEYt
X-Google-Smtp-Source: APXvYqwywoIrppcr3Jwx72kNmFDbAU0j5qadGy99pVbh3bdtnMlRXvyFSNz5yqTht1woUz1QsSqPQgksW60LPqbwSw4=
X-Received: by 2002:a05:620a:11a6:: with SMTP id
	c6mr2293038qkk.225.1582080017869; 
	Tue, 18 Feb 2020 18:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20200219023641.3308-1-anuj.mittal@intel.com>
In-Reply-To: <20200219023641.3308-1-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2020 18:39:51 -0800
Message-ID: <CAMKF1srt7WNXNxqXEAWoFM=Xqx5H4WVKHtdWNXwP8PHNpmcKdg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gstreamer1.0-plugins-good: change EXTRA_OECONF -> EXTRA_OEMESON
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
X-List-Received-Date: Wed, 19 Feb 2020 02:40:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 18, 2020 at 6:37 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> Use the correct variable so options actually get used and use the
> correct qt option name to prevent errors.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good_1.16.1.bb             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
> index a6eb9986dd..07a0bf5085 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
> @@ -55,7 +55,7 @@ PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>  # This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
>  # in a gstreamer1.0-plugins-good bbappend).
>
> -EXTRA_OECONF += " \
> +EXTRA_OEMESON += " \
>      -Daalib=disabled \
>      -Ddirectsound=disabled \
>      -Ddv=disabled \
> @@ -64,7 +64,7 @@ EXTRA_OECONF += " \
>      -Doss4=disabled \
>      -Dosxaudio=disabled \
>      -Dosxvideo=disabled \
> -    -Dqt=disabled \
> +    -Dqt5=disabled \

this perhaps should be a packageconfig so people using meta-qt5 can enable it

>      -Dshout2=disabled \
>      -Dtwolame=disabled \
>      -Dwaveform=disabled \
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

