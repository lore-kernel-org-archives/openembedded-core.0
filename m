Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 944B96101D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 13:19:08 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p23so11152915edr.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 05:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=As5oqYL6/quJvWDf1G2fWDl9mDx1L8Q2M3RnNw5hI3k=;
	b=okF/Hb7B2FAc90KFt+sC+EHPobk2TAnnZpDbv8IMTL2ua0fMb/80pJYYTpYB5Ht2MA
	kBRli6/RaLnJ1wzVM2k32oqqPgMyGTvMaMExxpl7Q6dJ5G4TdVLujgfDsKk9AGIxIoDP
	jCYmMIlDZCOeAV+d8hPdVcunpHVXggRjIEKsTrpI0St0+GTqhyZhQz7YkCrhZ26B1yac
	EdJJ+HtwICKs+WauQFj4Af2Msn98lEJD4/7OYR8RDxyzUszZtzui4LGF/8eJ8ny6Z2a5
	bHLwDqSBvPJKJFpn/+Gjfr3NEKAgQmw/zSaMAKyBTnblaL+dqWI2tY0aDgseGYiIlMpF
	Xfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=As5oqYL6/quJvWDf1G2fWDl9mDx1L8Q2M3RnNw5hI3k=;
	b=GlzfkPpLD8uIEfJBP/GreK1UTh6S35rI2rQr2yaRrjkaNvLpOxauU7K5cl3HeyVnfA
	7/b+HYYhN5Y+nwohYLeMHKXGIQIaXwVP3AtFiCjN9YxBWGDqgP687dsBGl5JWPVQwLkU
	z84LgwbYEsIbSI4SDd1XiVUEh55D4+OvkzbDE+HfREVbOtDPlVJh3EAWLXxbOT7/5J+A
	g/+OZeLBIEF93O984CFYuxuSi+JSr0PlYPN/VTvA2MHJbTCswtEbF/zpmLh0aCKtANmv
	ZXqa/T70FXX0lxbAxP8cWOeVKfU8XuZkuazZ9NXnHsbv41VyWDSiodx2TLI3GSmOcHph
	tQQw==
X-Gm-Message-State: APjAAAWxK+F8lrN+D4+lxqcIV9pz+NJTyjSE+pIgi02/05iAcL7+TgVi
	CaHMG6CWp0m9fqDZqQKMIOCh683gWs7gD54TqGw=
X-Google-Smtp-Source: APXvYqwaXTxdG93L+Ec3sPGCk+EzPtB5/3Q05cylQ0m+XA+EWjk3ONDMzu7ArrsQc8m1mbQW85AgVqfwQWYNhMlx528=
X-Received: by 2002:a17:906:260b:: with SMTP id
	h11mr3077435ejc.327.1581686349072; 
	Fri, 14 Feb 2020 05:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20200214035737.9975-1-zhe.he@windriver.com>
In-Reply-To: <20200214035737.9975-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 14 Feb 2020 08:18:57 -0500
Message-ID: <CADkTA4MS5J-xHpucB96HqwxfjMk9zVaRy2i+_vxX8iXSp3UY8A@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] perf: Correct the substitution of python shebangs
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
X-List-Received-Date: Fri, 14 Feb 2020 13:19:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 10:58 PM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> To make the native python3 is always used,
>
> - Use sed one-liner instead
> - Add substitution for ${S}/scripts/bpf_helpers_doc.py to fix the
>   following warning.
>
> File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
> _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
> ModuleNotFoundError: No module named '_sysconfigdata'
>
> This issue is first reported by Joel Stanley <joel@jms.id.au>
> The sed one-liner is credited to Anuj Mittal <anuj.mittal@intel.com>

Thanks!

This looks good to me.

Cheers,

Bruce

>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 6d1b06693d..a6fb51d3db 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -239,11 +239,8 @@ do_configure_prepend () {
>      fi
>
>      # use /usr/bin/env instead of version specific python
> -    for s in `find ${S}/tools/perf/ -name '*.py'`; do
> -        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
> -        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
> -        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
> -        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
> +    for s in `find ${S}/tools/perf/ -name '*.py'` ${S}/scripts/bpf_helpers_doc.py; do
> +        sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}
>      done
>
>      # unistd.h can be out of sync between libc-headers and the captured version in the perf source
> --
> 2.24.1
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

