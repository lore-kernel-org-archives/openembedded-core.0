Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.1127.1618525080140390905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 15:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LoabC4u1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id k128so13258223wmk.4
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 15:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kyD0skrvo35DGZbxu8kXVKCzk/LRSp4aJq0WUZ3ERzQ=;
        b=LoabC4u1uypx0VvUaSTK3sgDQm+d9Xz6UsfvnB99siSBc6e7IHB/3LOaSd5L6262dN
         QOWNnOg1JUwlOd/difgip+BGbMiQafBWWz/YQ98Zol7xR/O5vZL2fqnWnY5ZJHCY5pT5
         MIUxiFQ8rVqulnH8JSQe5Lopr4KDGgPhbbhAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kyD0skrvo35DGZbxu8kXVKCzk/LRSp4aJq0WUZ3ERzQ=;
        b=euZ1H/DDyTddy1nQEOI+wSvPOerdLT0ai7GROQoIzNVb2K9rk9hczqvEs8QY/uB/W9
         FKAhZQi27mbFY+dyN7MnH11HFyPoy3QFcy1Q+WJj0iQ2QXejm5MHHxm6fE3krRanK0Kb
         N3PqkOhTU+3q+QOyVLAFMCsE7GW/lz3kHzdPmJgrGlMswmnt/PN0uM3wD2HiHc/ubESC
         uRqktCZjG+X7F7Zcz9GQDsDLGr0ZMxTn2EV9T/xtflXeJ/7jIH2nDcOTmGdBUz+6K1/e
         wnx6vwIb8su9mBJyie9RNk4s0+AmyEGSsD0sGjKp+2rwc0Za8AgrbB3EQ8uxuf5W+MPw
         QQQg==
X-Gm-Message-State: AOAM531OmKvDLwGWPj2P+vkklmD2SVmSG3zNHVvUzTbyF4XkQRneTlyW
	K1IiTbKAT2ywesp5815ZXP0P4w==
X-Google-Smtp-Source: ABdhPJyQLOe8ACloPZPpz76sG8YbWRWb0puuamjbNphtIsMyvxi8PNF2+vGFlA+cp/gF4U9sczZJjQ==
X-Received: by 2002:a1c:ddd5:: with SMTP id u204mr5229817wmg.148.1618525078645;
        Thu, 15 Apr 2021 15:17:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b9e0:fe1a:1091:177b? ([2001:8b0:aba:5f3c:b9e0:fe1a:1091:177b])
        by smtp.gmail.com with ESMTPSA id o5sm4975290wmc.44.2021.04.15.15.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 15:17:58 -0700 (PDT)
Message-ID: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/8] There are some error messages like, "error: linker `cc` not found" got fixed by adding "cc" in hosttools.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vinay Kumar <vinay.m.engg@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 15 Apr 2021 23:17:55 +0100
In-Reply-To: <20210415093227.175608-5-vinay.m.engg@gmail.com>
References: 
	<CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
	 <20210415093227.175608-1-vinay.m.engg@gmail.com>
	 <20210415093227.175608-5-vinay.m.engg@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-04-15 at 02:32 -0700, Vinay Kumar wrote:
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3438be92b7..83e1b68071 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -483,7 +483,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
>  HOSTTOOLS += " \
>      [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
> -    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> +    fgrep file find flock g++ gawk gcc cc getconf getopt git grep gunzip gzip \
>      head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
>      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
>      python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \

I definitely agree this should be fixed elsewhere to use BUILD_CC. We've managed
without 'cc' for this long, we shouldn't need to start now!

Also, I noticed your patches don't have shortlog entries so the subject lines
in these emails are rather long. We'd need to have that fixed to be able to
handle the patches.

Cheers,

Richard

