Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.6.1602000863804398336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a2p9Bosu;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id q5so17292534qkc.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 09:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fgZ+cg+ZaXwdqw/p7TW+BSiJCJWzqCUQZ65Xhq8s194=;
        b=a2p9BosuRpo9fohmPySaQuhT/AF4cr4nHfdvCylLjrAwBeIgAn5oCY7zGqLC5V20AQ
         ac1IXxG8S+7n/ntwGItWoqxorfT8z/+Nh/cNQF3Ae65WyPSmUURs6qbdDb6dR482JhV2
         IqA6/aJlLgsnK9ZHUNl1+nFOJU1eXkzC9+ebF0j4PlFYeGapwLC9gVfX2zn8tV/lqEpo
         FRUsX23oap7YSmskUV6C9AImx/ugj49k6Fgsz6TJI7X/YH9fTIc6fkNzLa+XTkIDnGEV
         98EGvsyrOjKCEQPeBXi4xH2mhW2FsxVwPRgKJMaj3odiQXqdWOvlwejUyE1wLtOx9NNf
         VEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fgZ+cg+ZaXwdqw/p7TW+BSiJCJWzqCUQZ65Xhq8s194=;
        b=WA2yXAP3JrN83t2EItCiehG4B0LLqOD3Sjo7ghEaTatiGWK6X+BLBg7X9zNNotuO8p
         KtZw8uUtEfd3UdiOJ6DZKjcHsqWNfBONBb7YczLYjBvfY4ZPJ40OH+th1Qo4SDdmSHnH
         Q+DPs57jbeyGLI2HIEEP/5hOWdE3Q2rY5i9ZnUWPm83gURuJe6YtGEwb+ghJHVlxBIcj
         eLM5rZurIP80YJd1jOMnDM3/L1KP5IORbCYYkwt6POYR86Jhj/vcbAbfbVP+NK+3cO+j
         VpK/OosAUos6E7RLAN7KVce4zVKCKAHg7VkIyJMQ8v5WdAN4Ti7HiHWFjQ62wsdzfGN6
         V4Qg==
X-Gm-Message-State: AOAM533R+bMLrXEgKChwA4MucY5t26o1MjgFI7GhSefTEhVAFfMuaCRS
	FXJMDHsiV0H6yuANtL57yAU0CSiuHDtlFqulDmwGeigDlbo=
X-Google-Smtp-Source: ABdhPJzf3RjKgugHzk6YajrFaYdh7hvpMzG7V67CjAluu6CXooZVGYyHeSe5fWvJLu+uQjoAn/YWYhcv5S9ecgdZUHo=
X-Received: by 2002:a05:620a:1670:: with SMTP id d16mr6185371qko.474.1602000862780;
 Tue, 06 Oct 2020 09:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201006111444.3952584-1-ross.burton@arm.com> <20201006111444.3952584-2-ross.burton@arm.com>
In-Reply-To: <20201006111444.3952584-2-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Oct 2020 09:13:56 -0700
Message-ID: <CAMKF1spSQo7vi9qVN5TMHJ4QrcLj2sw4VJXMxcM0sSiFf9OvaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] boost: don't specify gcc version
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 4:14 AM Ross Burton <ross@burtonini.com> wrote:
>
> From: Ross Burton <ross.burton@intel.com>
>
> There's no need to specify an ancient GCC version here as Boost will
> probe it.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/boost/boost.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index e74c7d6f7d..89df754744 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -169,7 +169,7 @@ do_configure() {
>
>         # D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
>         rm -f ${WORKDIR}/user-config.jam
> -       echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${WORKDIR}/user-config.jam
> +       echo 'using gcc : : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${WORKDIR}/user-config.jam
>

does it probe the version from cross compiler now and not the host compiler ?

>         # If we want Python then we need to tell Boost *exactly* where to find it
>         if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
> --
> 2.25.1
>
>
> 
>
