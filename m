Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1D10160BB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 19:45:23 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id r18so8330557edl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 11:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1l9iP2gy9560UzIp4+V2coEnB0PTRxyxjuoJeIYe+EI=;
	b=FVkq8yXhoTnZHDjbd1JN9JZ0/6jJD0iA90B9HWIMNKF6LuTgmPhXfPuaf7UE24mIU8
	NoSJ8C/dj1RvQCjFwbTRODc9Cg7Hom84h/ZynkGA2h0x13eRukv3RWXmaWzwEERRX5nM
	458br9kyliT14wp9dMUsdRZMcG1shL2DhqTYpPEeaQCd1OXK5DAYKsnM5SL/G4D3Xw2l
	K9WKQ6sxNLVHV3aWGQMWMlPWxc+OscMipWxVa+0K5JG43ktSc5fuPCn8edmA1d12JHbB
	uJBvxIglufNoc4GkxTu01an0F5Ftde+fuBPR5G+JPOo5IlTVJQfKlCyGUc/CQ3TH5pjY
	sG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1l9iP2gy9560UzIp4+V2coEnB0PTRxyxjuoJeIYe+EI=;
	b=stQuAda4o/NfTQ/rHROO/kr8BZTxq3e58ZA7NunLxU9T9M0wbTyEp4H5DpoR2a7g/v
	Ugn6lHfrnHXcNW602Z08KXQOWFWWB2Qgm7CtO9d2cfzJr9io2kErT9WOjkkhIKb7+pjv
	ekgPeX29gGZIKn4ZXTC14+BzKDoaCFGfCbxslmAEh7i7thBI2W0qPXmN8O/W3uVQkyLC
	2UpkJgVg3tMU4K35LhILekIMJZ8CmoGmOl7DITwW7WFSpAiVNSxKj79/Y46Lt1BzbMg6
	m/4A7ZaJxVAU0vCu6ER0bqmP94WQUaNuE2ynbfANu+J3gC683LdS0yaFZR/CPhsYO3dg
	bJfQ==
X-Gm-Message-State: APjAAAXmeNEyC+Xyjpt2U6yq9uBRzrU6SjeLImn6t3OVUB8vb33AUOeU
	5CfQPHHGeAwwKfB6Rw92bB+KyNVZujsdZdCO2nQ=
X-Google-Smtp-Source: APXvYqwrwbndGvkLJarVhiDgKbgWvURUEOqTw19qN/caTiEAixBVTlyU3ILJsvu9jE2t/M+jvjdIWhI5ezdtna25aKw=
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr16730223edx.234.1581623123674; 
	Thu, 13 Feb 2020 11:45:23 -0800 (PST)
MIME-Version: 1.0
References: <1581619124-194740-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1581619124-194740-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 13 Feb 2020 14:45:12 -0500
Message-ID: <CADkTA4PW0AOzNNUi3wn2appucVFEDLn-eiGtMzOWw--dfP_Xpg@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Correct the substitution of python shebangs
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
X-List-Received-Date: Thu, 13 Feb 2020 19:45:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 1:39 PM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> To make the native python3 are always used,
>

FWIW, a very similar patch was sent 10 days ago. Did you confirm that it isn't
in master-next already ?

see: "[OE-core] [PATCH] perf: Additional fixes for 5.5+"

Bruce

> - Move the substitution of /usr/bin/python3 to first, otherwise the
>   possible original /usr/bin/python3 would be changed to
>   /usr/bin/env python33.
> - Add substitution for ${S}/scripts/
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 6d1b066..14a9090 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -240,10 +240,17 @@ do_configure_prepend () {
>
>      # use /usr/bin/env instead of version specific python
>      for s in `find ${S}/tools/perf/ -name '*.py'`; do
> +        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
>          sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>          sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
>          sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
> +    done
> +
> +    for s in `find ${S}/scripts/ -name '*.py'`; do
>          sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>      done
>
>      # unistd.h can be out of sync between libc-headers and the captured version in the perf source
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

