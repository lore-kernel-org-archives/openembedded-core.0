Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id EE9447A03E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 23:43:32 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i62-v6so1712509pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 16:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QAr9/fAmx6iZvwBxgwVywYpnl1WLk7aVekWDBopVFnA=;
	b=veyO57xm5CDijqDR0uLyj/A03Ly/KdqfPZpsLGxl6ef3YkkxV8kwiMpDFFjJ+8HKp7
	qCk8vZWy+DZ2seaThA961aeMgiPgyTKE2GwOk/eMGXcBJO7AAKq79D1pavip9YjVilQu
	eLeJMw/HXUsdzlzEOz/qO+KNS6fsi7kZ5TCeG6K6TBvBLa3gNPGm6mJR4UTue6zHPXHq
	XoklS4/phXemDuAv1y5Nbx0Tr5R11d2qZ6uUG9DT1OKnpRMnX24RrQNJ8pN4r3JYpq1o
	uks+22T8uoSjxadBibgBdme+Jz+Q58IKhxPnX4ApXXGBKqhg2NZ8H5p1xp16uYT4ontf
	QuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=QAr9/fAmx6iZvwBxgwVywYpnl1WLk7aVekWDBopVFnA=;
	b=SKm5Jk8MNdABK0/8rFfHQ8pUE5nsDsf5ziNf+mihRMP5RJ7h3NY2Ghw2IwIXqzSoxR
	FZKyVxWVMlCjfxQ9wxCIaU3aujeM1gVnDqgM0hAIcQ4RThrVJh4GGAJIrtJ/Uva3z8EO
	V4RGVL/8s+pzW53t/BdZMWyp/5jkwdhNJB9Yo//o7A+bJbrar7zerRz0nFnQmpy0lQqo
	Zp0ayA/lvZxDl9b2IOrxtzmeGyvWNMDLjSiJzJ/qJLngMBgmE9pCo96xz0i4lO7+zNRM
	v8/JQum1eGhMQN7ciVFtS9vsfQL6nqOM/GKxBiOGr+DQk55qmOkJ1OilsYbb5Q6al2re
	5q/g==
X-Gm-Message-State: AGRZ1gJLWIokbxrduW7Gr2I8us/DgMBAG5y/2EiLvHkk/R1OvvazKYCu
	l1aCs2TKSfcCIFzZ8QGtYHW2ane5
X-Google-Smtp-Source: AJdET5dBd1jUHx56oDrrK17KdF6MXTP4fA1Jd+GHhABhJCQl3m3IjBMjXeRGVsx7/Sbe3WYbsdtafQ==
X-Received: by 2002:a62:d084:: with SMTP id
	p126-v6mr14166292pfg.147.1541202213678; 
	Fri, 02 Nov 2018 16:43:33 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d25:2e4:ba80:f9b1?
	([2601:202:4180:c33:8d25:2e4:ba80:f9b1])
	by smtp.gmail.com with ESMTPSA id
	p15-v6sm31970933pfj.72.2018.11.02.16.43.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 16:43:32 -0700 (PDT)
To: Arsalan Awan <Arsalan_Awan@mentor.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1541168618.git.Arsalan_Awan@mentor.com>
	<6bf54a814e2aaa03e262aa2edd529405d391ee22.1541168618.git.Arsalan_Awan@mentor.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c1316e3a-ec0c-3320-0972-9c7ee532aee8@gmail.com>
Date: Fri, 2 Nov 2018 16:43:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <6bf54a814e2aaa03e262aa2edd529405d391ee22.1541168618.git.Arsalan_Awan@mentor.com>
Subject: Re: [sumo][PATCH 1/1] wic/isoimage-isohybrid.py: fix booting from removable media
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
X-List-Received-Date: Fri, 02 Nov 2018 23:43:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Arsalan,


On 11/2/18 8:01 AM, Arsalan Awan wrote:
> From: "Arsalan H. Awan" <Arsalan_Awan@mentor.com>
>
> The EFI bootloader name and path for being able to boot from a
> removable storage media - such as USB - must be like:
>
>   /EFI/BOOT/boot<arch>.efi
>   /EFI/BOOT/bootx64.efi
>   /EFI/BOOT/bootia32.efi
>   /EFI/BOOT/bootaa64.efi
>
> otherwise system will not be able to boot from it.

Is this fixed in Master & Thud ?

- armin

>
> This commit fixes the grub-efi bootloader destination image name
> accordingly just like efi_populate() function does it in
> meta/classes/grub-efi.bbclass.
>
> Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
> ---
>  scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> index d6bd3bf..9a30713 100644
> --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> @@ -329,13 +329,15 @@ class IsoImagePlugin(SourcePlugin):
>  
>                  if re.match("x86_64", target_arch):
>                      grub_image = "grub-efi-bootx64.efi"
> +                    grub_image_dst = "bootx64.efi"
>                  elif re.match('i.86', target_arch):
>                      grub_image = "grub-efi-bootia32.efi"
> +                    grub_image_dst = "bootia32.efi"
>                  else:
>                      raise WicError("grub-efi is incompatible with target %s" %
>                                     target_arch)
>  
> -                grub_target = os.path.join(target_dir, grub_image)
> +                grub_target = os.path.join(target_dir, grub_image_dst)
>                  if not os.path.isfile(grub_target):
>                      grub_src = os.path.join(deploy_dir, grub_image)
>                      if not os.path.exists(grub_src):

