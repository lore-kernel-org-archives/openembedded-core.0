Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F47472EA2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 20:06:10 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id w194so30432945vsc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=19XIzQMi3+iXuLqligifaMfC5+OactFehWyXyuTjhgE=;
	b=c+bIOGEnLlZ9TWZNTa0WbIAyYjrWdCgS/g9GVyY2xdwIV2SmgPcO4H3HkOg/ZqjXJF
	pim94ZpdBDtGVC+++0zZSGq19pY8R9tj+Fm+0wPCEQT6TR9oOkq9xuJSzgMg7NzqJ4u/
	lcKiWEm7I9eKFrES/EczNv3zs+Tnl3yUyFMDjwbj7Fc/93HmC9DwwcgYASAl3SAol7QJ
	2oShdlAtqYRjyaTF57kXvN1MHRVi7FL4iJKv7P/SB5NJHRuCox9YIpFadcAmzHymHFEn
	Mlv67Nq0S9MvH6pPW4uA80bxH/NbjgKvon4dcvQDf89q299yBXOhjAPt20V6aXWxe0mY
	hVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=19XIzQMi3+iXuLqligifaMfC5+OactFehWyXyuTjhgE=;
	b=ZeW8a93o6PW0eWyVMB68BWwzsO7qLdQW/oFhC/iKRLkRnfvWlP3QkxGfa1NhoO20WI
	Y1sD5WS41SEs5/uFOGTXVnWAsp90LGbRCAV4siEUQtyXYyBrl47XsTaRLNwMzjxWda2m
	+sJa4fvy9iWAEG237/6vGav9OlHi+ikaIWFZl4yG8yVHFNKFPsna56cTmnroNrL2n6d1
	HPlTccAjYhwy8Sl3D8GU4zKfAWKSVeIF3Ytxw+wqeWxtQt7Rj1prEHoC8H+UecCSGgCV
	PtV0CsHEeQ/ipNUKh5JG/Decftjk3joh4AnEu1HbOCAzCwK2KsVJe/YnVapg2nt/twmI
	N5fg==
X-Gm-Message-State: ABuFfohZWcxqd6lAv3qtmxWiYhlZLc92BKW5b+OJOwCVldBdJmkX2leh
	F6sa4g+Htd8pQD9kJuxfmbc6mMdb09qxt1aUVPo=
X-Google-Smtp-Source: ACcGV63VldHgLLOCD9JTZOGUcHVlcZAECgl3GPkDyZSbEoXIDN0qZy84/l/sLdn8ftUKTk8lZ1ykrIH9BGYNUxbn/d0=
X-Received: by 2002:a67:d69e:: with SMTP id o30mr17990664vsj.11.1540238770704; 
	Mon, 22 Oct 2018 13:06:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2748:0:0:0:0:0 with HTTP; Mon, 22 Oct 2018 13:06:10
	-0700 (PDT)
In-Reply-To: <1540217112-24479-4-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
	<1540217112-24479-4-git-send-email-akuster808@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 22 Oct 2018 13:06:10 -0700
Message-ID: <CAJ86T=WVfW1E_4OStVRu8TN03hhnQB0Z0d8M6PnqEgkqR-SK3A@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/13] gnutls: update to 2.6.4
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
X-List-Received-Date: Mon, 22 Oct 2018 20:06:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 22, 2018 at 7:05 AM, Armin Kuster <akuster808@gmail.com> wrote:
> Notable change:
>
> libgnutls: Added the final (RFC8446) version numbering of the TLS1.3 protocol.
> see: https://lists.gnupg.org/pipermail/gnutls-help/2018-September/004457.html

Subject mentions 2.6.4 instead of 3.6.4

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} (93%)
>
> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.3.bb b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
> similarity index 93%
> rename from meta/recipes-support/gnutls/gnutls_3.6.3.bb
> rename to meta/recipes-support/gnutls/gnutls_3.6.4.bb
> index 441bbec..6d2a11d 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.6.3.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
> @@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>             file://arm_eabi.patch \
>  "
>
> -SRC_URI[md5sum] = "d3b1b05c2546b80832101a423a80faf8"
> -SRC_URI[sha256sum] = "ed642b66a4ecf4851ab2d809cd1475c297b6201d8e8bd14b4d1c08b53ffca993"
> +SRC_URI[md5sum] = "63363d1c00601f4d11a5cadc8b5e0799"
> +SRC_URI[sha256sum] = "c663a792fbc84349c27c36059181f2ca86c9442e75ee8b0ad72f5f9b35deab3a"
>
>  inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

