Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA4C61773
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:23:19 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e10so4209565edv.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 14:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OAvbSsj0RuwHTG5Bx73vdzSA3r6oqlUBg1KvcLk441s=;
	b=tk3BljOtei2TbqnhsKqGGzfvUTW2TTh18wB7eEQCD3YOf86YwkCmo0sICBVqWJ9Il7
	hstkkwPPWw6zMiV7qDHjfrQbAFhVG6eTxF0az/Z2UmeM4F4sAMDj5KKx+4hF396uaKid
	6ZkUQ08z/BUqjk5W3eyiCuPE/k7N8DjnxihVK8ON0aW03vgGb+7cpMa9wAA49IhHV+iy
	qdCzLbJB2BE7771r+h2ZclMxIzzh/ddBAzoCXBz+wsanFsTnTL2Wj5YIUAQi6dpR50hx
	czKl9A9ss19yIgIQcaDUUqAcrUa3RTfr72LftUZGTZBdDP+FvHpfvy3ianlkIU0b3ynU
	Nf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OAvbSsj0RuwHTG5Bx73vdzSA3r6oqlUBg1KvcLk441s=;
	b=UvbTZFvQ4S9TmTsxWEKX1AfLiY3KUlmFmXr7wb96ZKfZupBGaUJZ/WOuOtoKP4GASr
	cYzUuQzmh62i0H7SWenBss18xm7l/Yf80UzTZnhQBXzphsilz8ukkjl838BF/qWPi4rj
	qO08CJMpGpbe1CHyY6gCEAZZs0xpPOkA4S5aj35Xc8CHXZAxsZ18n7ac4Ps5ctyM+0aS
	5tvEFU+/5Oo0wYDwjKQ7izFl+3Xz/MsAcmcK7vb3RWTchoKiq1KPYZz0Rd9tJHI8wL0w
	7LwgMlpDW1pqY6eCXxiwvOcpkgntH8LNZAuk5OHYyTA55pb0eOD48KsoSVl0XPAI/YiA
	AO/A==
X-Gm-Message-State: APjAAAWCMo0Fg2+g5zDxcb4EZg7deyTUkM259Ic9940/be1L881Kpp+T
	FKxLJeuu3iwMcC6Pwd6hDvRFVlDtqEBcbAhnpDfY61VNrOGC+A==
X-Google-Smtp-Source: APXvYqytsObC1TnLUp6oB1qcrVj3Z64QYmajqmiGdfJ+mW8dp7G99kMml3HR8Q27OFIC3rXP4281kDFih7uicUUh3FE=
X-Received: by 2002:a50:aacd:: with SMTP id r13mr34664580edc.129.1582323799884;
	Fri, 21 Feb 2020 14:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20200214035737.9975-1-zhe.he@windriver.com>
	<CAJdd5GZPffGwjXH+RWxBtLwDcgR2p+4KbsNLqc7WUBWKo1fGQQ@mail.gmail.com>
	<74a29374-e918-807e-c01d-ff29132f0c82@gmail.com>
In-Reply-To: <74a29374-e918-807e-c01d-ff29132f0c82@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Feb 2020 17:23:08 -0500
Message-ID: <CADkTA4PRZsy2yvQ8rG8V=vXYhwFrBPTi63XsN+t=HPesAv9Wzg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 21 Feb 2020 22:23:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 21, 2020 at 5:16 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 2/21/20 1:43 PM, Joshua Watt wrote:
> > On Thu, Feb 13, 2020 at 9:58 PM <zhe.he@windriver.com> wrote:
> >>
> >> From: He Zhe <zhe.he@windriver.com>
> >>
> >> To make the native python3 is always used,
> >>
> >> - Use sed one-liner instead
> >> - Add substitution for ${S}/scripts/bpf_helpers_doc.py to fix the
> >>    following warning.
> >>
> >> File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
> >> _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
> >> ModuleNotFoundError: No module named '_sysconfigdata'
> >>
> >> This issue is first reported by Joel Stanley <joel@jms.id.au>
> >> The sed one-liner is credited to Anuj Mittal <anuj.mittal@intel.com>
> >>
> >> Signed-off-by: He Zhe <zhe.he@windriver.com>
> >> ---
> >>   meta/recipes-kernel/perf/perf.bb | 7 ++-----
> >>   1 file changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> >> index 6d1b06693d..a6fb51d3db 100644
> >> --- a/meta/recipes-kernel/perf/perf.bb
> >> +++ b/meta/recipes-kernel/perf/perf.bb
> >> @@ -239,11 +239,8 @@ do_configure_prepend () {
> >>       fi
> >>
> >>       # use /usr/bin/env instead of version specific python
> >> -    for s in `find ${S}/tools/perf/ -name '*.py'`; do
> >> -        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
> >> -        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
> >> -        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
> >> -        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
> >> +    for s in `find ${S}/tools/perf/ -name '*.py'` ${S}/scripts/bpf_helpers_doc.py; do
> >
> > Do we have to hard code bpf_helpers_doc.py? It doesn't exist in older
> > versions (e.g. 4.14) and causes do_configure to fail.
>
> Probably not, I also stumbled into this problem.

Yah,

We can either just do the entire directory (but during the review, we
were talking about the fact that since we aren't using them, we don't
actually know if they are py3 safe, so blindly converting the shebang
isnt' a great idea either).

But the solution we use in the devsrc recipe would work easily enough
here, just do $(find . -name ${S}/scripts/bpf_helpers_doc.py) and let
it return nothing for those older kernels.

Bruce

>
> >
> >> +        sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}
> >>       done
> >>
> >>       # unistd.h can be out of sync between libc-headers and the captured version in the perf source
> >> --
> >> 2.24.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

