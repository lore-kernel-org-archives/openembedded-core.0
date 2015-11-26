Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1936012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 11:00:10 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so84054097pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 03:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=UPc5LRuq7mgA9UWxOMN9RIfDfqhT67XnAb7zpfjlTTU=;
	b=fWxSQ+NWx1m4Lq03LQNatb0vL1Gk0sOjzDSIIp1P2qXfKucbo54JsTB9FGzUXYnuLQ
	6LMyd5H+kqLMdA3gzwJXdarTpkWg+XKUKHF4YAs+QfhrGlvaWfraZdBSdqUhBs69F1TQ
	AfGctfsXLqClV1fxJ4X6Fg1zGs6oMj44yOV2L63s+tl0eg3y8Jec25Do/Qf7oj0qonev
	BBvk3BpjcrtUpEfXBjNc/DlIrt3IRVg60L1akR/NdOcbsTUbzQdSpEse8ge36bHqbRJ8
	jdQxJn1ag+QdbtOiWfYD6A/u6w0TF7P2s4KcaxnFp7kHO9mL2yeLse8NIKbVkdaR63xZ
	ADZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=UPc5LRuq7mgA9UWxOMN9RIfDfqhT67XnAb7zpfjlTTU=;
	b=lu7D8rZAAyaaagXMjyb0gujOOCqh8g+BagpkOvfIQnEXQhugIpwA6nmbXdvZFV2GfG
	Ns8Kg6yxx3C5aIj1kJ03ZABTbiKaAhScdK+tjLCEsmcYsAyCeWtx/MKx1Lfo43EPl5IM
	rNcuhtzRJP6mRpp9s3Bkt4Ye0jyQtjiZb26eyeCWWjQsS/8Ckq06x6ETosGAjbOFcrJg
	JzM5QrbbSf4IiRglbfJ7YDyF8Qy+yH+bmLehlSala2xcIeu7fgD8yfUjmVsEUwpT/+Ej
	cRZIMEjyQB6v34IAVk+lT/Az4fraDc+uk4x7UvVtAPr5WeKjkdBp8YYl7bO8KxNyshqX
	jiDA==
X-Gm-Message-State: ALoCoQlwcUzo1li//qmNJuaBP5ngP4a2op6uKjgp+s8yBgOFOgdGFgTiTXow2Z7EiOScjbQ+f7wj
X-Received: by 10.98.1.6 with SMTP id 6mr38847517pfb.132.1448535611602;
	Thu, 26 Nov 2015 03:00:11 -0800 (PST)
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com.
	[209.85.220.50]) by smtp.gmail.com with ESMTPSA id
	w8sm26770846pfi.41.2015.11.26.03.00.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Nov 2015 03:00:10 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabfh17 with SMTP id fh17so86521020pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 03:00:09 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.243.3 with SMTP id wu3mr58904690pac.135.1448535609944;
	Thu, 26 Nov 2015 03:00:09 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Thu, 26 Nov 2015 03:00:09 -0800 (PST)
In-Reply-To: <1448493420-2011-1-git-send-email-tom.hochstein@freescale.com>
References: <1448493420-2011-1-git-send-email-tom.hochstein@freescale.com>
Date: Thu, 26 Nov 2015 09:00:09 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpk+Fde9J33sDbE9QO19btcg4QfzjAj+vtA+gqMr-hJyA@mail.gmail.com>
Message-ID: <CAP9ODKpk+Fde9J33sDbE9QO19btcg4QfzjAj+vtA+gqMr-hJyA@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@freescale.com>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston-init: Use weston-launch for XWayland
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
X-List-Received-Date: Thu, 26 Nov 2015 11:00:13 -0000
Content-Type: text/plain; charset=UTF-8

Hello Tom,

Thanks for working with Prabhu on this. I am adding Ross on Cc so he
can comment on this as well.

On Wed, Nov 25, 2015 at 9:17 PM, Tom Hochstein
<tom.hochstein@freescale.com> wrote:
> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>
> When XWayland is configured, Weston must be started using the
> weston-launch utility.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
> ---
>  meta/recipes-graphics/wayland/weston-init/init | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
> index 2e938f4..1d4e577 100644
> --- a/meta/recipes-graphics/wayland/weston-init/init
> +++ b/meta/recipes-graphics/wayland/weston-init/init
> @@ -38,7 +38,16 @@ case "$1" in
>                  chmod 0700 $XDG_RUNTIME_DIR
>          fi
>
> -        openvt -s weston -- $OPTARGS
> +        # If weston-launch exists, we're configured for XWayland.
> +        if [ -f /usr/bin/weston-launch ]; then
> +            echo "Starting Weston in XWayland"
> +            export XDG_CONFIG_HOME=/etc
> +            openvt -v -- weston-launch -- --log=/var/log/weston.log $OPTARGS
> +        else
> +            echo "Starting Weston"
> +            openvt -s weston -- --log=/var/log/weston.log $OPTARGS
> +            #grep console to look for gal2d-renderer.so. if no failed

This comment is no sense for the common script; please drop this.

> +        fi
>    ;;
>
>    stop)
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

