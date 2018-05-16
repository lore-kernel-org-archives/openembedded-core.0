Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id A03F774778
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 11:10:15 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id e185-v6so397109ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 04:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iDZQwadHbpWX1j8vYR3Vh4Og6QXbBc3dbvivSWUbVj4=;
	b=tcuR71NsBbowANESMX9RhNTnVDVmq/1ZNJVyPeb3Sjn3AvKnCoomGb2yXNcgQq1O9i
	7UJ8XPRQisutb3n6VY4Cdv7jU3BkbjSmFH0yBwL49ZitM2SIIvx1Ea5CT3ptj0gKQ8Ds
	Sbv0Il/P+5PVyDWbvY1oVd59Kd7ulo1qnIEpQKjFoMd4O/kg9r/vHXNiSbKvo2RNoBV6
	YSVCbU6eO1C/AIRYk7JJ3V586O913eBesVx86F1tOPr9UG7wt3svP+XBjuawpC/vt+6k
	RgLbb6oTpYv9N+kdVWwc8CtvoZbU7rnBIFhfrBRXy4whUBP3zeIE/oPovywWfdkPO5Jw
	09NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iDZQwadHbpWX1j8vYR3Vh4Og6QXbBc3dbvivSWUbVj4=;
	b=FKTX8Q1DAv3jOnLHV+jtiR2MfoabNsqq5hu1I5CzBThGQKbYUEcBmZUzjnxTZtYGhv
	IkvOF+2AWsaqyYC/Vx1x3mkhnSxVdxmvBAjN1BrppcQLm5wMpuuWH/Sr/s8ulKKRJhPp
	6D7xpIUsgR3NaSqLCLuX4AsLTOCAnl1HS2lau78yA13PA55V0RLIjo5uTiYr414lGtje
	0WXAUa7iMyfS87+jgGflTV+KVV6hJXS4y2tq6bphiz1HfI3QjBLpfyz0zU0P+KQBzndC
	xVAw9HlG/n0bud2dC4oJcEDW4m44SfORMINJZwLNVacs5IeWBU40r6Ieq57FXvW6eXAA
	a8Tw==
X-Gm-Message-State: ALKqPweBYRQrd6WYtojIDHU0thbJ05bBkKQVlZmehKWKaVyOruEgNlHc
	RkJuNKWjCsRIqH8gqxszvgW7xPbHaSsevUxAholFtg==
X-Google-Smtp-Source: AB8JxZoutRAdwkFHE6OgitoZQb5FNf/voHtXzB3gJltncKs4LYOP6pHiT1T3yXzIRJ8a0tIMi1e3qKfGWYXhW1cHJiY=
X-Received: by 2002:a24:3a0a:: with SMTP id m10-v6mr430607itm.45.1526469016393;
	Wed, 16 May 2018 04:10:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Wed, 16 May 2018 04:09:55 -0700 (PDT)
In-Reply-To: <13936651721b14a74b51c673c35c2b514299ca6c.1526452205.git.raj.khem@gmail.com>
References: <cover.1526452205.git.raj.khem@gmail.com>
	<13936651721b14a74b51c673c35c2b514299ca6c.1526452205.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 May 2018 12:09:55 +0100
Message-ID: <CAJTo0LZL0Fs7i-+tm2KVw7htYkgFJFpYfEkCq1=Dda_0n9rpYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] musl: Make dev package rdep on staticdev
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
X-List-Received-Date: Wed, 16 May 2018 11:10:15 -0000
Content-Type: text/plain; charset="UTF-8"

Surely if you want to support static linking in the SDK, you just need
to add staticdev-pkgs to the SDKIMAGE_FEATURES?

Ross

On 16 May 2018 at 07:32, Khem Raj <raj.khem@gmail.com> wrote:
> This is needed for enabling static linking with SDK
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index a0a098f5b4..d7d201df9d 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -66,7 +66,7 @@ do_install() {
>         done
>  }
>
> -RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
> +RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev ${PN}-staticdev"
>  RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>  RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

