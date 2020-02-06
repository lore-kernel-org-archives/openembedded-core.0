Return-Path: <crg7475@mailbox.org>
X-Greylist: delayed 514 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Feb 2020 11:50:15 UTC
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4759860D57
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 11:50:15 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 48CxNQ3LZ0zQl9K
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 12:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1580989296; bh=u1uSslm/9q+OY8SpfBrCzyBWbObexfc8yVItZYnxRvQ=; b=Z
	MrtHRVrKK7ya16/h6OPpzY8lmMEev5Pj+W7UwzGWaL1BDtHfQVm6OQIsfZYpR/5L
	aDsjJZQA/uXKgd2c+iIACxTnA1gwHt4iaarf/TthZ5KWt+sCFy5+TndwHirudVyj
	BSBz1smysgygkL3xLpjuKGbYYAJOS9YFx98vLqZnWw+dCxHl+s+1QeiVFAzuD7Xs
	1UPBSZ3pwNiSYAvY5O0wIpi2CydR4hnAIzgGlxD+ENSm8032dot+Dp2tFZte3oht
	XIRMhfHRBHU3BRNlyJDd5LRYSzYowbDohA+eFMHrBroEYGFe9A0KoYEljae1PJaq
	N8a9s6R+xHrM2vZhIbl4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1580989300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=wq6CdHu9YNPYeK7f4JbmdxbKtJfiv65TGAcQT2FoA3Q=;
	b=j4n9SgTT8zyTRHqYqOoV6VOnCmzos1HVYXcsDc67vJsjTOmhS01JnTAxoczoXaAN5M4F1V
	M5bIz4q9JMa2u3Dyrz46YxhMk790bVeywFxHbWNRWn1irHWxtb29Yq0tITlWMZQhx7tvrG
	ld0LivbojlQf2ziDCi+zkN9gpU7mTPx61VWoEpaa7L0+Y/pLyGGu6yhpK7b2cr+0krqoVT
	8GmBZuZK3jrMgUdppJwIec30qUuA9lDkhDs7TTaWDjfCxxqsKm/7xngPi+Bhp3HusYOExx
	fv/5nWN70Ao5ebGtToC9GCyQqUTcSgfmuojvqyYHSq0cHGKz+XRIAfuHbH8Zvg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
	[80.241.56.123]) (amavisd-new, port 10030) with ESMTP id RtcI35nH30Bu
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 12:41:36 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <20200206075334.835418-1-anuj.mittal@intel.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <b7ce05ce-aaf7-068c-ab42-235f8844350c@mailbox.org>
Date: Thu, 6 Feb 2020 12:41:35 +0100
MIME-Version: 1.0
In-Reply-To: <20200206075334.835418-1-anuj.mittal@intel.com>
Subject: Re: [PATCH] gstreamer1.0-plugins-good: change EXTRA_OECONF -> EXTRA_OEMESON
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
X-List-Received-Date: Thu, 06 Feb 2020 11:50:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Shouldn't this be split into two commits, one that fixes EXTRA_OECONF, 
and one that fixes the qt5 support?

Also, are we sure that meson's qt5 moc/rcc/uic autodetection won't cause 
any problems in OE?
Typically, we disable such "automagical" detections to ensure 
deterministic builds.

On 06.02.20 08:53, Anuj Mittal wrote:
> Use the correct variable so options actually get used.
>
> qt5 support is currently automagically detected with meson and having an
> explicit disabled doesn't do anything. Remove it so it can be handled
> in qt layer with appropriate DEPENDS added.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>   .../gstreamer/gstreamer1.0-plugins-good_1.16.1.bb          | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
> index a6eb9986dd..e78162172a 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
> @@ -50,12 +50,12 @@ PACKAGECONFIG[vpx]        = "-Dvpx=enabled,-Dvpx=disabled,libvpx"
>   PACKAGECONFIG[wavpack]    = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
>   PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>   
> -# qt5 support is disabled, because it is not present in OE core, and requires more work than
> -# just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
> +# qt5 support is disabled by default unless dependencies are present. Enabling it requires
> +# more work than just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
>   # This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
>   # in a gstreamer1.0-plugins-good bbappend).
>   
> -EXTRA_OECONF += " \
> +EXTRA_OEMESON += " \
>       -Daalib=disabled \
>       -Ddirectsound=disabled \
>       -Ddv=disabled \
> @@ -64,7 +64,6 @@ EXTRA_OECONF += " \
>       -Doss4=disabled \
>       -Dosxaudio=disabled \
>       -Dosxvideo=disabled \
> -    -Dqt=disabled \
>       -Dshout2=disabled \
>       -Dtwolame=disabled \
>       -Dwaveform=disabled \

