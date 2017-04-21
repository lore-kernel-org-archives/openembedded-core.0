Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D28D577A2E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 07:48:32 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u65so3264008wmu.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 00:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tqh0K4C8RZ6Wd7+/rtg+j0eXJTBryEj1NtpfOqVH0SY=;
	b=k94Gp0bAKOmbeCFxD0RSJddDHB1VWf7BjbvW09Ayz++7beDaXaYmsBUZLi1uqrPrM0
	JcSrWneMi9mpC2PWgSEClAJnJjiTZaZJVXeA0EGZvuq0wcu/90+3V8rWLKk1kLqmL6gf
	La+c2+XRfiGElk0hKqXwbRt2QIbQz1bkUJeEcwX8iv8nyjID3qbHkN7Fkin2NlcMW3pD
	6hezx6nLkvE+WG37o3HtnGGZZU18FICR4EX5RVL/a4+S7w61wXCF77OypU+tElj2F+3J
	pPkV6vL2P2dbKPJ77z4YzMoQp840riu4AmVgJVP6fB5171gckk8UrEIyu2ar3LD0JhVO
	NfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tqh0K4C8RZ6Wd7+/rtg+j0eXJTBryEj1NtpfOqVH0SY=;
	b=MY/Vt9297/IHmKXRwOCsbkh/MXdWNGSmrz65T/euOo0gG1GHZ5qlXfhK//h517v4gE
	6++K8iYefW+wc4cvdQbpuZwc8UYw65YqrmB5l7vM/9YtQpIrdJ7YjUHboI/ALIHpKXHn
	MAep3eEVAKOVnyxVaXfmpEOtoGIhY57OtLREBITeYpK7A2sMmlFx/c2DaR8vQlBsssLa
	Pc/03GIMXXly7fv6KtFApkFKSWHINQ0umXA6A25UyigdPVLipLPAXmhc3m1UPu5ny6HL
	7QHDtZuiFHs5cL9pBl71Ayir9jJCHbd4HUqIjnWPOBWllbEdbS02Qceb8/oqb7BMQZ2W
	bzEg==
X-Gm-Message-State: AN3rC/7FIx+V0uYsmMphXwLQrzSTp/9iKyvy8rUHB8t+Wuy4xtWQJ5Zk
	Nyfds1I/Mk3AvrNsdfkgvhUSq0asOA==
X-Received: by 10.28.51.9 with SMTP id z9mr6512824wmz.77.1492760913160; Fri,
	21 Apr 2017 00:48:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.24.20 with HTTP; Fri, 21 Apr 2017 00:48:32 -0700 (PDT)
In-Reply-To: <cover.1492086566.git.pkj@axis.com>
References: <cover.1492086566.git.pkj@axis.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Fri, 21 Apr 2017 09:48:32 +0200
Message-ID: <CAHvQdo3GZAKsES13uh4byUQnKX-TZHwNSrXU4G1ez7XibJh4zA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/1] Do not use command in profile
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
X-List-Received-Date: Fri, 21 Apr 2017 07:48:33 -0000
Content-Type: text/plain; charset=UTF-8

Will this patch get merge?
Or do we have to include 'command' from now on? As this commit
"busybox: In defconfig enable ASH_CMDCMD for built-in 'command'"
suggests?

Thanks,
Hannes

2017-04-13 14:30 GMT+02:00 Peter Kjellerstedt <peter.kjellerstedt@axis.com>:
> Since we apparently cannot rely on the command utility to always
> exist, it is better to avoid using it in the profile script. Rather
> than using command to detect if tty and resize exist (which obviously
> will not work if command itself does not exist), just call them
> directly while piping any output for stderr to /dev/null. This should
> actually be a little bit more efficient in the case that they do
> exist, and the same in the case that they do not exist.
>
> I leave to you to decide whether you want to revert commit e41c90b852
> that enabled the command utility in busybox or not.
>
> PATCHv2: Correct a typo in the commit message
>
> //Peter
>
> The following changes since commit fe47bff64b17562593c620d2daf748735bb5c3d6:
>
>   linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.10 (2017-04-13 10:54:37 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib pkj/profile_without_command
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/profile_without_command
>
> Peter Kjellerstedt (1):
>   base-files: profile: Avoid using "command" to determine if programs
>     exist
>
>  meta/recipes-core/base-files/base-files/profile | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

