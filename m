Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5CECF72263
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 03:24:23 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id w10so10985142pde.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 19:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=dDVC1GhRcJrjUVZy9wRQZJ6rwi81A5l6ckxynE0dnoU=;
	b=Y1Ju6pZKfVWNeFiiPLyvbjcqgokjxW4XW0IrBVzL9oVFACWfZJrugFMruOJhFwJFin
	MVOPfFuAg78R5i+J5CZDDanvX7hiLnDiCORld3tCPJoP8qwsVejTSztV8tcqqzel1ePo
	EuoX3bGuTPyfaeR60lCBvRahxie1EQduFPfcmmzskZtjS+g6C44Mk1YGJTx+kpUhzrDJ
	RPf8/Jxp3tIcu0SkJkGV0qjkRrQ/AgpZlch/4QLgtfdYrfp3YilPD80mhyrwNlq9MuZa
	e02t87+25TVFMgZhGRAmFn7RAb+ZqOwmrDeOsgOdctKYnyG31zM0HeQEncEjkd3GIjq8
	5ocg==
X-Received: by 10.68.69.37 with SMTP id b5mr38168054pbu.102.1416885864183;
	Mon, 24 Nov 2014 19:24:24 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:e95a:607d:d083:a0f9?
	([2601:c:9380:601:e95a:607d:d083:a0f9])
	by mx.google.com with ESMTPSA id
	lr4sm13794887pab.42.2014.11.24.19.24.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Nov 2014 19:24:23 -0800 (PST)
Message-ID: <5473F665.2060307@gmail.com>
Date: Mon, 24 Nov 2014 19:24:21 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "mark.hatle@windriver.com >> Mark Hatle" <mark.hatle@windriver.com>
References: <1416364883-213938-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1416364883-213938-1-git-send-email-mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][dizzy] qemu: disable the build for mips
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
X-List-Received-Date: Tue, 25 Nov 2014 03:24:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Thanks,

stagging for dizzy merge.

- Armin
On 11/18/2014 06:41 PM, Mark Hatle wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> Disable it since ICE on mips with wr toolchain only:
>    translate.c:7838:1: internal compiler error: Segmentation fault
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu_2.1.0.bb | 1 +
>   meta/recipes-devtools/qemu/qemu_git.bb   | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> index a82d052..e58829e 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> @@ -13,6 +13,7 @@ SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
>   SRC_URI[sha256sum] = "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802"
>
>   COMPATIBLE_HOST_class-target_mips64 = "null"
> +COMPATIBLE_HOST_class-target_mips = "null"
>
>   do_sanitize_sources() {
>       # These .git files point to a nonexistent path "../.git/modules" and will confuse git
> diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
> index a30932a..cefed90 100644
> --- a/meta/recipes-devtools/qemu/qemu_git.bb
> +++ b/meta/recipes-devtools/qemu/qemu_git.bb
> @@ -13,3 +13,4 @@ S = "${WORKDIR}/git"
>   DEFAULT_PREFERENCE = "-1"
>
>   COMPATIBLE_HOST_class-target_mips64 = "null"
> +COMPATIBLE_HOST_class-target_mips = "null"
>

