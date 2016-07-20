Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 130406067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 00:54:39 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q62so2752760qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 17:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ERi9UJfgGAd5mFLybA/8vDQ/ctp5QAh3FEOpKBIb5vs=;
	b=OL/dsZkWzWD5XIoOBGlKj5CJL7uarfIeZbGB3AezzlOB04MZ3mCl8J3SP5AxVA284a
	ME51k0ulYOhER16c0vg2BpDorD7qXim0oBjBQDStEAykhFKXH/OQovIEK+YSp/W5vL7N
	UWXcTWRHxOhBY54btNGVkK3rCh+8636/nYP1KW0uN5CE32C45/g0qU81D8uS+nbgNjtR
	z/6Fda1p52F1rnaPfrFlzO6lx3oTzzLmV2UqV8WyDiXJiD8Q19RoL8Is+ED/ZQIxjf53
	CG+4Tsek8fW6UEpHnHOhqNYbvpEDOskFse6PxqDUm9h+Vnzhj5Pm5gzZCestA9Jn7MS+
	WaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ERi9UJfgGAd5mFLybA/8vDQ/ctp5QAh3FEOpKBIb5vs=;
	b=h4breB2xbPu4+nn9YZkCDCG4odqBwN+HPam9XJqmPPk+HToLmyO2ZrGPZY1E3zW9M7
	HvRDOAUOkU55kptwxO1VW2wauAZSFk/vuxXJUkhxUtic72+NnVpml3auw+w2ryVguL23
	hUG8qeQmsd7C5XuYOLHLnq05xGs15pbEjDH+du7yyFDkvraFyGZPedJGicvxWmQFUFTK
	Ty7myCamcg/UmJTmn8qRYb9QNuwv+aEMWMgTTZn/1Bg9CoNAUzvOoRUn/T51PweDdttt
	5JgvyQ8nvFdXNVnMbRLljyxzITlYSiKQHfwqaq0dsj+O40JG8aA7+zwbZHLs+OMRjkmV
	qU3A==
X-Gm-Message-State: ALyK8tI7W+4Qdptjn4aPYXV+80G0WTATr6ZWiq19LJ1I6vGjexYmYrztUeu0lWLfatuVHdwXcWf2uxx+u7uglw==
X-Received: by 10.55.178.195 with SMTP id b186mr52538146qkf.81.1468976079969; 
	Tue, 19 Jul 2016 17:54:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Tue, 19 Jul 2016 17:54:10 -0700 (PDT)
In-Reply-To: <425887ce6e0187155974cabc2071f5189f7cc1a1.1468973641.git.tanuk@iki.fi>
References: <cover.1468973641.git.tanuk@iki.fi>
	<425887ce6e0187155974cabc2071f5189f7cc1a1.1468973641.git.tanuk@iki.fi>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2016 17:54:10 -0700
Message-ID: <CAMKF1sr8p21xDXNMScg8MUdRFh3=8O+zuxL--_A-jV52Dez1wQ@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] pulseaudio: disable WebRTC code
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
X-List-Received-Date: Wed, 20 Jul 2016 00:54:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 19, 2016 at 5:20 PM, Tanu Kaskinen <tanuk@iki.fi> wrote:
> When updating pulseaudio to 9.0, I noticed webrtc-audio-processing is
> a potential floating dependency. It's not an issue right now, because
> webrtc-audio-processing isn't packaged for OpenEmbedded, but it would
> become an issue if anyone added the library to OE.
>
> Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index accafe1..2cf3fb4 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -37,6 +37,10 @@ EXTRA_OECONF = "\
>  # oe-core nor meta-oe, so let's not add a PACKAGECONFIG entry for it for now.
>  EXTRA_OECONF += "--without-soxr"
>
> +# The WebRTC echo canceller depends on the webrtc-audio-processing library,
> +# which is not yet packaged for OpenEmbedded.
> +EXTRA_OECONF += "--disable-webrtc-aec"
> +

may be turn it into a packageconfig ?

>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

