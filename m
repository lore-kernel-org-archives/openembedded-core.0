Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9903A7769E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 21:54:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n11so525017wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q85uN+l5/dyxVU/hG3tcv2vNpDKZMMsnWYgZsPxYVCo=;
	b=OLEur4yqjGjSIsvYUE6RQ1qIqE97yNALWc9ZOyjvqpTpzG0R4cDNoZ/sTrn65vZOCy
	FLJy/m7gpj4KOKuIBDzQWPMVHf4MEtjS8qdkwI0gdx11kGIVuWQpTvE/vQSRQICFHxqp
	3JP7kr31phi2CPk7l0YxP/jPVKPfHY4II6mASKFv9SLIV3i0t2DQ0s39MfIA61w9HGM1
	ISs+28slpSjoR36/1S8pGqvHt7Gi6W+4zOsTrHyAWgZHa0z8dISZ5E2iCeGAyAmizDTT
	5F47C9PlwgyYOjB6PfnURM5tGpCE4RlNmdeLE7VAJbfVmr5iCQzkW3BHW839QtUDb6in
	8CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q85uN+l5/dyxVU/hG3tcv2vNpDKZMMsnWYgZsPxYVCo=;
	b=sJpz5PvbycqCfwrmb8gjgw6XRNp6wLoFA8fCBAquedObOxm7nssHkWXqbTqBO/QaH+
	E6EaufgJoxmFrTgT64mHq9T/IeaqvEbhHjYlY8ww8pK6uFOvEUBFZ/2Uy4WRf6VwMoR4
	VvBYqv5cgAcMNDX94SFpk8cvXdMA0Zp3ffB10UuqefLI+3s4F0blgm5bP89MjuDvj34h
	xCYTeh3jzy4VZbk9tYv6Hmwxm3NBcAe7ITnkf2geI8N7l98kyDdVNNmo36uh/VOgdc8g
	3q4Bj1ufb/oBx/n/4eYwcyNJ2My+MYIWuF8gk8hO4cxA6C7nIfDPBI8SXOPsI7xgfbnJ
	srUQ==
X-Gm-Message-State: AFeK/H1yU12Zxe8u637uWuQ1OuJxXLgc+o6AKxfVJ4floXWxND0UGw1tyClbD/ODf2FhLIQRPEgRV30qx8Y9eg==
X-Received: by 10.28.229.78 with SMTP id c75mr13650wmh.20.1489701245171; Thu,
	16 Mar 2017 14:54:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.179.24 with HTTP; Thu, 16 Mar 2017 14:54:04 -0700 (PDT)
In-Reply-To: <20170316214239.16243-1-raj.khem@gmail.com>
References: <20170316214239.16243-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Mar 2017 14:54:04 -0700
Message-ID: <CAJ86T=VgRt+tvWgT-_JbDuxw5ft2hGFi8jYTjzBDEkGvLjooPQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go: Remove mips32r2 from mips
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
X-List-Received-Date: Thu, 16 Mar 2017 21:54:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 16, 2017 at 2:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
> mips32r1 is only one supported for mips32
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/go/go_1.8.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/go/go_1.8.bb b/meta/recipes-devtools/go/go_1.8.bb
> index e7a6ab277e..091b1318af 100644
> --- a/meta/recipes-devtools/go/go_1.8.bb
> +++ b/meta/recipes-devtools/go/go_1.8.bb
> @@ -1,2 +1,3 @@
>  require go-${PV}.inc
>  require go.inc
> +TUNE_CCARGS_remove = "-march=mips32r2"

Do you need to add "-march=mips32" ? Or do the go Makefiles etc
provide that by default?

> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

