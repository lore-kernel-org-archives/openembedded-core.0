Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 68C127907E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 17:16:49 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id e139-v6so2981639vkf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 10:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qBXJlzfPLgk0jEz9ax7szzyl87zVeJceZmdIjHwhNkw=;
	b=DNe2PaJIdG2RZ5RKJf4E9y30kFTuH7ANJfRV+674h+8XNHF7X2jB97CrX0I3YViKFC
	M/rMYE9u/p6yLieL8+LpSvldKWMteap8LOZcafrWxZGsgjxiv9bBeVazOPSB7ckD7zIK
	GNiCiPyBlUZ+jW3998wPEBKNR40JHJgtTlJDK1hoCqrEhf37l5YzSIONSlST2eIPB7wl
	g55Y+4COPe49lmzZcN8A/yESPTq9LU3yGNaD6SuCUc3xAXJrxSjsq/khR+IOJkgk95uS
	GHJ+p7LC2h3MKkO2yVKP5Dq/a+XDtBR34qoIUgCZMED/fhqvHiuamh5zY0kqaUjKmTnc
	0LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qBXJlzfPLgk0jEz9ax7szzyl87zVeJceZmdIjHwhNkw=;
	b=QOGiG+FrgTykfIbKbxqST8IpcqpCBOAYeHklv495WEyN2FpjCUdfqqNhyXxEusJNMQ
	5unurd3i3hujAD7id/kYTRwtG+MMUpY2RkhHz+gGq64hrl7VsauHsEqp7Y8r5bcWvTFa
	/wEl+qAVNGBuMxVA5v5s3K5pKq/aPDIAu9zbHxUXaDG68QrZ5Oy5fk3QLjsSsIQdDjHv
	/fRFT92q4d475HxYuaM4quloip6xGcSAc7TZCVMTG69DwBHiQgacsFe3LFQFO2kHXV2d
	iLxZ3ybTqW7lh1GaJh1i9ngZS7rlCymASeNclS0PKKyIvWTKvxGFXu0aGO8c7JrTU7MJ
	unTg==
X-Gm-Message-State: APzg51CGMNv72PhR+J8Y1XeqKCGqdRkHPRvnZAJ98VC8nhjPfsZkpbBX
	nl7rr6np0J6MlXuIp6roStphJj3T+Ar16vZB4nI=
X-Google-Smtp-Source: ANB0VdbP5wCSX7TSugzkQJUdRsYQSm7C+1Q9tyhAKxKUIKPVsYhYAzvXZcJ1v2KXHWcGMPJXRx7zQaXv+PHtydpUD4c=
X-Received: by 2002:a1f:50c7:: with SMTP id
	e190-v6mr17975939vkb.86.1536167809666; 
	Wed, 05 Sep 2018 10:16:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 10:16:49 -0700 (PDT)
In-Reply-To: <20180905165227.29435-2-richard.purdie@linuxfoundation.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<20180905165227.29435-2-richard.purdie@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 5 Sep 2018 10:16:49 -0700
Message-ID: <CAJ86T=Wam53MwCr-=NCkLNEbbKOEfwjB0Z3Pbkf+Q+BVEZhpyg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] os-release: fix to install in the expected location
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
X-List-Received-Date: Wed, 05 Sep 2018 17:16:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 9:52 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> From: Joshua Lock <joshua.g.lock@intel.com>
>
> os-release (5) recommends that the os-release file be installed in
> /usr/lib/os-release and that /etc/os-release be a relative symlink to it.
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/os-release/os-release.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
> index f9887047561..dae5748ba7a 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -1,7 +1,7 @@
>  inherit allarch
>
>  SUMMARY = "Operating system identification"
> -DESCRIPTION = "The /etc/os-release file contains operating system identification data."
> +DESCRIPTION = "The /usr/lib/os-release file contains operating system identification data."
>  LICENSE = "MIT"
>  INHIBIT_DEFAULT_DEPS = "1"
>
> @@ -42,6 +42,9 @@ python do_compile () {
>  do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
>
>  do_install () {
> -    install -d ${D}${sysconfdir}
> -    install -m 0644 os-release ${D}${sysconfdir}/
> +    install -d ${D}${libdir} ${D}${sysconfdir}
> +    install -m 0644 os-release ${D}${libdir}/
> +    lnr ${D}${libdir}/os-release ${D}${sysconfdir}/os-relea

Typo.

Please add the rm too when you fix that.

>  }
> +
> +FILES_${PN} += "${libdir}/os-release"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

