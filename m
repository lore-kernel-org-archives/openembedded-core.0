Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 78A3171994
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 21:53:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b76so12464674wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 13:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PUj7lRDRZejF1BckZv1/MCidsACYm3dmEEbuSY0fvJE=;
	b=Y44Gk0PFV0hmOi5WxYrGXZ6Msf4nWlf1QnW1mSR4/yRt2g42eQVmcFjG7NH8/w8lMh
	gF6WvmOM9ks1WOJ8X9xrB9RpMTxGhhJYDffVuRk5OgESpPZgfhhyfWxzQ8c0kGGnSiQd
	o31zCyFKmHAZgET5uw07PQ/N2+jhrdD711rG1y3swQkjDKKqvEB8I9wdQXsRH29FEHuF
	itmyZFRluNJPR1OWK+4TF4hFk1rvLLvkckTaDe4RRVsc2Szpo7IlSBY9shKY9hMafKaS
	iQMOnMkS+T1qX4nx/5d9uJL00tsrZHsgIif/PPVyi4A2I3yl3gyTuG/EBj5Viro8afki
	6PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PUj7lRDRZejF1BckZv1/MCidsACYm3dmEEbuSY0fvJE=;
	b=WMSy85kMXACV4blGq/Hs0PRUSy4RKBeJ/vIYpGf3tUSv8CHGuzAq2p+ifh3IbhLIjt
	ieMkWBrjny7xxkqudQbi5LYtwq+zbpDfZjVmmcjjk13WrbOix+J8XYpcq8DHObEUIx2h
	UKPtXPfB8JiL9pTvNUNPZvwMPuFM9IU0Ikamh8Uk4tEuOj5j/IFpAiuObZm88fMfcgAX
	n2wJa0I0OTrPUPmFb2fLuOHZnqgzey6om2F5QISYwMopWzVC53uXJA/kbXS133PqOXfJ
	sy81NuJHXnOFbS/6uaDV5WQ0v4xn2xKIMqQoF9iJlbE/yr9Le6YRT+KBgm6SQc5z47PG
	MmWA==
X-Gm-Message-State: AKGB3mLtX2DojDRX1Kio7+IuCTqQAUM04WDFwelXl84AY6J+w5P+UqML
	6/HaNAjUvxzptaA+xLwJGQfsC1KzZU7KoRr0JeU=
X-Google-Smtp-Source: ACJfBoulGHumHleWjflrAYJVNYKq+sbVq27ra+grpq0A88CLE9WZRhgUJLhV3/KlBGcfjO6vrna4TWTYIIT1hCJNXr8=
X-Received: by 10.28.172.202 with SMTP id v193mr8509753wme.10.1513806827522;
	Wed, 20 Dec 2017 13:53:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.184.47 with HTTP; Wed, 20 Dec 2017 13:53:46 -0800 (PST)
In-Reply-To: <effbd3d25e0509d870f5a658dd24c93c27924cba.1513734733.git.liezhi.yang@windriver.com>
References: <cover.1513734733.git.liezhi.yang@windriver.com>
	<effbd3d25e0509d870f5a658dd24c93c27924cba.1513734733.git.liezhi.yang@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 20 Dec 2017 13:53:46 -0800
Message-ID: <CAJ86T=WQbgUJ9ZXy79WXq8pPtySnxDH6Swi+KC9=3MJ4PzftBg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: inherit distro_features_check
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
X-List-Received-Date: Wed, 20 Dec 2017 21:53:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 19, 2017 at 5:53 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Use distro_features_check so that we can have a uniform controller.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd-serialgetty.bb | 10 ++++------
>  meta/recipes-core/systemd/systemd_234.bb         | 13 +++++--------
>  meta/recipes-core/udev/eudev_3.2.2.bb            |  9 +++------
>  3 files changed, 12 insertions(+), 20 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
> index d934716..d67a3c9 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -11,6 +11,10 @@ SRC_URI = "file://serial-getty@.service"
>
>  S = "${WORKDIR}"
>
> +# As this package is tied to systemd, only build it when we're also building systemd.
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES = "systemd"
> +

"inherit distro_features_check" needs to be added too.

>  do_install() {
>         if [ ! -z "${SERIAL_CONSOLES}" ] ; then
>                 default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
> @@ -43,10 +47,4 @@ do_install() {
>  FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -# As this package is tied to systemd, only build it when we're also building systemd.
> -python () {
> -    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
> -        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
> -}
> -
>  ALLOW_EMPTY_${PN} = "1"

