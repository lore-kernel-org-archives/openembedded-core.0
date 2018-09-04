Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id E0CB27458C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 19:44:47 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id b78-v6so1795221vka.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 12:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uZXVK3sRL4c2mKw9gwxo0tQh5vuF0AjeCApgE7leiEw=;
	b=oc+J+9l0bjcXOL9/ilGvmeClnms0fcSOCwtwMyXcpsxaTbMtMGNoePgBprvM3ewCRj
	lpF/SUmALZZ+bc2gDofjIb5ZWjktC7r3gK7sllpAV6dDsYp3S3DmYD2qDauLwl6Tnp7U
	XSZRYsNnao8bZ/Y5fB7ghV/sXpscYNqAtEXgsyF/anLy6ADze+JqUDpBX3hEOyo0DRkF
	vlUYORtDHyVAujIC5UqM/Lr1qHHhxI3eZFrxT7dxWx6V/Nd/TwFKLQQdHJtM0GXS1njb
	jJYJuliM/YaBddtos74t1/v9ncOcSQkigEC7nzfJQatO0ryma+jB5UPxn7QMsqtwPqOf
	VIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uZXVK3sRL4c2mKw9gwxo0tQh5vuF0AjeCApgE7leiEw=;
	b=isZyyyrjnYkvrQanr74albiu5/mqAFg9ij2/O39EGoZW2fHjCBgp78rsdInXsFJ2LT
	41KsvI5i7GHvG0yO7oP6Xh39mo16hkiv8uciJlNgLpAWGZR4RovrslDpROTM+Gqc+ifI
	tFgVHtFOhpJ//UF1JvwfUclWIl3znoZGv9rKJBkEooYPhh7dGnKNpquZ/92/P0rVRdd3
	L5XvPuHB8jAIDlwlqUdIuwe7+rw4J9MAw8CRXlupOpl/tx0N8nDy7rp6A23teWM0EMma
	ZlgzVYZD4MxLkvyeaLxHF8d2hUdcyJDQsvMHTbkx9NUFaUn7WvRQJFbvWKYlL7EMiwTu
	h8pQ==
X-Gm-Message-State: APzg51DO6+rPUNv3rW/5USt6+GJ+SSY5BCa9rKhPUhXd3y8Nfy76xvU6
	cq9ZPmwYb6BUqO7XfmmDEKYW5CoZ6RTyuEqS9R8=
X-Google-Smtp-Source: ANB0VdZYl3SFnjw2/EuMaUrJUtM/+R0Vf3+RONGgpIHsMGl/eCG2BntnQZjMP42QlWAvM0P7D8DQgA0i8mIf1ANFa2w=
X-Received: by 2002:a1f:6ac3:: with SMTP id
	f186-v6mr16764317vkc.119.1536090288723; 
	Tue, 04 Sep 2018 12:44:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:2b46:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 12:44:48 -0700 (PDT)
In-Reply-To: <20180904190027.1410-2-raj.khem@gmail.com>
References: <20180904190027.1410-1-raj.khem@gmail.com>
	<20180904190027.1410-2-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 4 Sep 2018 12:44:48 -0700
Message-ID: <CAJ86T=UuKyknCjZw2rHu7=e0tG1u2uwvasX-muVzrN8B=QmO=g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] musl: Update latest on master
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
X-List-Received-Date: Tue, 04 Sep 2018 19:44:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 12:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> hopefully last bump before 1.1.20 is released

1.1.20 has been released.

> ChangeLog
>
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=767f7a1091af3a3dcee2f7a49d0713359a81961c..64466094ede4162ddd4049cea5da09feb9abfaa6
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index f4f156042a..997eb14959 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -3,7 +3,7 @@
>
>  require musl.inc
>
> -SRCREV = "767f7a1091af3a3dcee2f7a49d0713359a81961c"
> +SRCREV = "64466094ede4162ddd4049cea5da09feb9abfaa6"
>
>  PV = "1.1.19+git${SRCPV}"
>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

