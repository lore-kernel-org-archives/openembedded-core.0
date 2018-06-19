Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id A5D0875552
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 18:09:54 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id n24-v6so911709lfh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 11:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/q1L5PeUO12R6xpTBNFt5Yyg7y/2u+T8b6PNATjOiVU=;
	b=b5AbH1BsGn2u4/D6Wgzukb4AMdA5XhmS3FhQeGPA4yp+5gtoMDFi7YCNbsbD3l1sAX
	nov/g+tFQjLjMYapPdcJ4SAss1dMTDApNyTenxax6lY04+h/0DYLm4CCZLLWFkGIB7Ug
	e1oziQeThvNCrg/v90h6SFW1n4z/WuSw19K4PgrRegOMGJQiww2iZRiSNWSd8RSwSAss
	PqW5S5yos6fz0pp2OuxQk7SU+RbSxFzdKD0S/oucjaz7NIBR64cIea5dsMAF96ARUKxC
	3D5UZ8hqWkaWgaysSRvrqJyRA4wIgkOyI4q9jSxAEmbr14Rr9mrjMaP7sE9ab0Jf4/oz
	Dr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/q1L5PeUO12R6xpTBNFt5Yyg7y/2u+T8b6PNATjOiVU=;
	b=fX6pbrlXe3NNoBLMukuZ4c8zqNWbWyWy/cd+qcO1AzmpSDugT3wyxKb4GYP6oHRDQQ
	AK9aXZaeNdcJ7+t01dZSVakJX83RloFqdl82HnkhVDD0wTNjsuBJ7DaUtTyUeV0peXF0
	l9CNVAyhGgjO+AkeKXlW0UXQnmjvupyD/5dMrad86CJGbuOpfHJqnjj/bHdsQXUYjjoL
	SFzQW+gydrgC9CbB0gIpx0UG32jHaOEPO5QDbrb3jjMHcUGpo9nuZpSvYE2zBj8gyB+J
	rdYot6eg0gJVwOJbNDIy3tz7nudrjHwTj/+u78csHIDB9TbChvi6bbDZM1Q4Y7iSFbIQ
	Rqjw==
X-Gm-Message-State: APt69E1Yj3Aq1y0MTs0fviW8KH67/JIjjfsWTB1t/KfsU86AmAqQQKTk
	rr7Pcr7UPKZbRDVnG8bNLyq0RPtT5aPM/cdTYNk=
X-Google-Smtp-Source: ADUXVKINuLt1yO9Tj78utnqExHk0Oq4PfbXw8dXTrqOYqG9kBqNZvWYveK0FcrWsM/+EV2lHLKP/Dwr13ucUbHepcqE=
X-Received: by 2002:a2e:934d:: with SMTP id
	m13-v6mr11491098ljh.78.1529431795113; 
	Tue, 19 Jun 2018 11:09:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3218:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 11:09:24
	-0700 (PDT)
In-Reply-To: <20180525155636.116866-1-alistair.francis@wdc.com>
References: <20180525155636.116866-1-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jun 2018 11:09:24 -0700
Message-ID: <CAKmqyKPDm7i+9xbuFy0BinoT5fGDj6+rUEK5XDyow0NcE-biqA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Tue, 19 Jun 2018 18:09:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 25, 2018 at 8:56 AM, Alistair Francis
<alistair.francis@wdc.com> wrote:
> If the user has set numa in their MACHINE_FEATURES we should enable
> NUMA support in the kernel config.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Ping!

Alistair

> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 3bb872a32a..a8ac237656 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -28,6 +28,8 @@ KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>
>  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>
> +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> +
>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>  # by the kernel. This is typically the branch that should be built,
>  # and it can be specific to the machine or shared
> --
> 2.17.0
>

