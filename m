Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TaPyJ-0007x8-Uw
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 12:57:05 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Nov 2012 03:42:21 -0800
Received: by mail-ia0-f197.google.com with SMTP id j38so11511432iad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 03:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=1myXfLYAlHYA1SCmOZK3ILiRM+FrA74io2JPSi9zI9s=;
	b=H6m7gKvxse9FqpseaKP2Zot1ms52y64iiYx+JIr7FU5T1I26YAtd1wvYXl7j8dUxfU
	Ct01OFyW1WXyAFJJxEyey5pXTS4I1GKC+DPdGKh3hdifJ5c+61pX+iRHdV2JnATnJTEl
	Kzr3/9WDCZu+7R4OyskSXwRr3/n6bRkgin9B01tKwJgWX0KKIuQXRh2pO6AwmGQyUeEX
	iZbPC1WsqZn1lC/BgPNPKLMoWlcsrRSSnRkQ5geMS7wQZz5yY1Ln8Pgj6UhL6SFIABAF
	idUa5u0GbUEjvGmBmbcqTNj8kEbBLOcZP6tpIMvU+nceO3fg4PFwtzEOrE1DTfIPDB+e
	857w==
Received: by 10.182.0.1 with SMTP id 1mr10116228oba.18.1353325379316;
	Mon, 19 Nov 2012 03:42:59 -0800 (PST)
Received: by 10.182.0.1 with SMTP id 1mr10116223oba.18.1353325379205; Mon, 19
	Nov 2012 03:42:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.34.138 with HTTP; Mon, 19 Nov 2012 03:42:39 -0800 (PST)
In-Reply-To: <1353131394-31310-1-git-send-email-gilbert_coville@mentor.com>
References: <1353131394-31310-1-git-send-email-gilbert_coville@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Nov 2012 11:42:39 +0000
Message-ID: <CAJTo0LaB=Qhd5wmhhJCRHqL+Fb4=AxSCaPVDi7tqoV_Giwghqw@mail.gmail.com>
To: Gilbert Coville <gilbert_coville@mentor.com>
X-Gm-Message-State: ALoCoQnKCkEkCrmpDp5DQMUchRXhE+znFPJ9ayM/WQbHUnabQrB8BLEY6g8QmjRay2X8uAmtg3MuUKLndBM94AlueQFwX70FhdYpx09mOihSM1lc4J/N4+ctoa3CknlJE7L5/+sj0jKiYVmzOb5d9/NdyBY3jt/FB/CDmzogUis/LMDdaOsnAhyGzBjptT1iLF/7o7/ToV1B
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins-base: add dep on libsm and libice
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 11:57:05 -0000
Content-Type: text/plain; charset=UTF-8

On 17 November 2012 05:49, Gilbert Coville <gilbert_coville@mentor.com> wrote:
> Signed-off-by: Gilbert Coville <gilbert_coville@mentor.com>
> ---
>  meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> index 88fa74d..2648864 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                      file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
>                      file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
>
> -DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
> +DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv libsm libice', '', d)}"

Can you say in the commit why these dependencies are required?

Ross


