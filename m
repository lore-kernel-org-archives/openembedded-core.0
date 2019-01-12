Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF917C13C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 15:30:00 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z18so8250347qkj.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 07:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7i/LuDG9khSLrjSIILYDDd3AHWSiwxnsPM1YNkGv5bo=;
	b=Te+UidSz706rQh1iehAnLZ6k3ADEfiTbEPtrbEojZ6px2hmquc+pWTBSYudJw+w92x
	QoA7bqXb1gF9mHeeYzq3a1JCkbYCATnrvF2t74VFulY8VXSvN5Ni0816iVunhoYKz82h
	LOQevA2FfgGeLlW+v7/XyvJOnsIy8KWP6d9cjWKFPTuFeM6DA32S1nB+umO8MsD5R3f2
	k2mV+dDwFe9ocK12wnc6aTM4APItNh6A+cMAJIxyczxaBnK5FDLEmjc/j1bejUzSZgMy
	w1aS15GZzEXx/4ZhSwCkMhCfO3OJ9TqeEbeQoK3/Tpk7TM/yzT/DLD/ZutHWy8oaycoC
	WN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7i/LuDG9khSLrjSIILYDDd3AHWSiwxnsPM1YNkGv5bo=;
	b=hZfikY7QxKmQin5wID08VnEsRok+BHMOPo2eC3EGQdwLWDJW8a01/dC7xs/Chmilvf
	XU5MyjhdDpNIL46xdmDrv5CbTXvQuSJBSiOap+rx8J8tsGlWMgpRdxKpAZwAtA7m0Dzg
	MOfpWs7mpQAKhFsOks2xjr2idxWMf562tBWFF0sExHAWiC4vXJPRlgTIhGXT2AviHxaJ
	wfyNKpx3dehTN4a90L2HFZ3iNDU4uKb59MHCCIu732cAvHJn3lCQtnS4rbg0rMskDGnC
	pMUe81E+ZwwVewSQyzlaYWHisX8zafcR+wbol3Q/dn8BVJJ6hGXNoK0OUY84PiOb/KRu
	WTHw==
X-Gm-Message-State: AJcUuke/otiXyuY8EgTqNNVZeymFyifL6D5IMO+2xHhIw+uyL+Dw5YsB
	PxqH90KTSrOqPftkEmJdgUpWD3p7uiQ5KDVs6Tnyfy0s
X-Google-Smtp-Source: ALg8bN4Jr6wVE+YPY64mK+/nX3SPAlMr9Y3lEI4JuXgmicGpMzwMYNFACBTo1GdPwKT3hdJ/VJZb+/H2jkrgoj3kY/Q=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr17350024qkm.102.1547307001262; 
	Sat, 12 Jan 2019 07:30:01 -0800 (PST)
MIME-Version: 1.0
References: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
	<1547284970-20783-5-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1547284970-20783-5-git-send-email-serhe.popovych@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 07:29:35 -0800
Message-ID: <CAMKF1spcERO0rDuBS4ynFPRaNWa34dqTcYuxgzQ=+HQ=M6tmZg@mail.gmail.com>
To: Serhey Popovych <serhe.popovych@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] valgrind: Mark powerpc64 with musl as incompatible
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
X-List-Received-Date: Sat, 12 Jan 2019 15:30:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 1:23 AM Serhey Popovych
<serhe.popovych@gmail.com> wrote:
>
> Building musl for powerpc64 enforces elfv2 ABI since commit 68c964185519
> ("arch-powerpc64.inc: Use elfv2 ABI when building with musl") that is
> not compatible with valgrind.
>
> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.14.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
> index 4d15a50..d882319 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
> @@ -58,6 +58,9 @@ COMPATIBLE_HOST_linux-muslx32 = 'null'
>  COMPATIBLE_HOST_mipsarchr6 = 'null'
>  COMPATIBLE_HOST_linux-gnun32 = 'null'
>
> +# Disable for powerpc64 with musl
> +COMPATIBLE_HOST_libc-musl_powerpc64 = 'null'

lets do it for powerpc64el too
> +
>  inherit autotools ptest multilib_header
>
>  EXTRA_OECONF = "--enable-tls --without-mpicc"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

