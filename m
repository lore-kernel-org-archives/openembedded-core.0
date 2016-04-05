Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id BE145602D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 03:24:40 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a140so725781wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 20:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=K5TIaykpDq/di5lG/6hgcHtO6Z9P8GAHmBCO1c6vMUk=;
	b=y3QYMJVJBb6x7cfepVKJnudp0idhVsJHa1QEFsGS76RibHYOcVEskiu2dxSUQ2tI/Z
	5R4racW72VvuNMTSD/1J0/NQ+Zo+ywQIoEWVwm+YDhmxWm2AcclUlmDZy6fWXYJJpyU3
	uaDyxErrmcjU1PwSSe04iXgv7nFr7NxE0qTDt74yq+WNM1gChgmmBSeePfl1KpRoZi0c
	U3EQ7heUO46e8u+QPk+yz228Rd/+fvF4QimwNnK9RfV8ww3cKleE+73esjyZYrh8E0r4
	X3TWG019M42SqEBVq2wUlLO5YVz58jbgavMCjwvxrdS7bIuRnoUNivO7iHeSZROsP7hx
	yFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=K5TIaykpDq/di5lG/6hgcHtO6Z9P8GAHmBCO1c6vMUk=;
	b=iG3cINwSyQgA0NmWO3XiIadUF7MgwCSEK97lu7srV7W1EsxZS8cioCAy8N+hrwcANK
	exfHuJ0ukTB+d91wrx70Y/E+un3ehymmqhYSDp+AF6r/IiXu+3try59J4m72z+dCM3IQ
	5XvMu+xlrLSikbR28sQr0MO9vxdL4q8Y0Zbg4cFjYH7zWuOlxlxOUSBI+omewIwCrX+s
	Ey8XVbHfFTOX6THsj9SUn6PB3v8APKB3eYj6WLuLsNw5ZwxWIfVH/h77GufQqVWa+UWw
	YYsn8bQsIFBMAG4N3+hQ1s2ySIt8FZiz/IMwzuSLWVDEcBh1xjirwtkFirAddHv57+RI
	JdWQ==
X-Gm-Message-State: AD7BkJLeN5kg8OAWLLeuVh59ABybtac2KOoW5mUrQCkCmhDW+LmkzmMnc535p3cmEMw6rMehBBQHI1l8HlA8Jg==
MIME-Version: 1.0
X-Received: by 10.194.57.168 with SMTP id j8mr10825942wjq.43.1459826680440;
	Mon, 04 Apr 2016 20:24:40 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Mon, 4 Apr 2016 20:24:40 -0700 (PDT)
In-Reply-To: <2d362ec67807bce526f2ceb11f5275aa05fc829b.1459825756.git.Qi.Chen@windriver.com>
References: <cover.1459825756.git.Qi.Chen@windriver.com>
	<2d362ec67807bce526f2ceb11f5275aa05fc829b.1459825756.git.Qi.Chen@windriver.com>
Date: Mon, 4 Apr 2016 20:24:40 -0700
Message-ID: <CAJ86T=WwK3o+8tF6yvZGAzKdv8b9Raa_2ONDZdZRWrPJKGXJyQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] grub_git: remove armv7a from COMPATIBLE_HOST
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
X-List-Received-Date: Tue, 05 Apr 2016 03:24:42 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 4, 2016 at 8:10 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> grub_git recipe supports arm architectures. However, when building against
> armv7a arch, we would meet the following error.
>
> | build-grub-module-verifier: error: unsupported relocation 0x2b.
> | make[3]: *** [disk.mod] Error 1
> | make[3]: *** Waiting for unfinished jobs....
> | build-grub-module-verifier: error: unsupported relocation 0x2b.
> | make[3]: *** [cat.mod] Error 1
> | build-grub-module-verifier: error: unsupported relocation 0x2b.
> | make[3]: *** [cmp.mod] Error 1
>
> This address, along with 0x2c, is not supported yet, according to grub
> upstream.
>
> So remove armv7a from COMPATIBLE_HOST for now.

Unless you have verified that armv4, armv5, armv6 and armv7ve all work
correctly then blacklisting only armv7a is probably not the correct
approach.

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-bsp/grub/grub_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
> index 3ebab7f..2b435b7 100644
> --- a/meta/recipes-bsp/grub/grub_git.bb
> +++ b/meta/recipes-bsp/grub/grub_git.bb
> @@ -18,6 +18,7 @@ SRC_URI = "git://git.savannah.gnu.org/grub.git \
>  S = "${WORKDIR}/git"
>
>  COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
> +COMPATIBLE_HOST_armv7a = 'null'
>
>  inherit autotools gettext texinfo
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

