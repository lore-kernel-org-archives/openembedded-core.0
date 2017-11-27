Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA5B7834E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 17:59:47 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id m88so17691528pfi.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 09:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cuKJy74svxYm5XCGberHuiBljUgPn0iPAb5dUMg+QV0=;
	b=fMlRsI8yRKNLz/ep/IkABUJnvoYt8DU0fq2ETKp5o6ChkgKV5bNDAz5MaMIyoOeksY
	Kg2efsRkC/6gS/KJ21hvQd6Tbhv6wWHeNgs//WYW7zpcUUISfcLa8JWuhb/cAZii4kPQ
	GDvunYJoCCaGsZ2kdcHSiqMYF6/raSIcv2BX0gxE3bRO/ZSVhOSL8u+vbq2kyc8JovrW
	56L3Q9J8+nrpvKLsqtXb7FfQLh75YoNk+TPySq3zUBenaI5h4slc5vVsjLutxZnrSww8
	MpT00pxNtkvyj0Tz40fNQHHn24f+UmI4tjIu+8oIvgE+omZt2PNCTMYRJgdEKFsxhh5K
	i4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=cuKJy74svxYm5XCGberHuiBljUgPn0iPAb5dUMg+QV0=;
	b=ObMQ5FCsqu/kswGzKMWJbeoOtkCKwNNxTHN6QMHBRTXnduVcxlBUH5XYl6vKSLsUZW
	Ef013FouluNEBHfi9HzBCOqEZwnV2T8CPvchFu7nKnpUpP/blW4HfG5KAaoA6577AU1c
	lqDj+1QIuUwxO+hijqzVmQxks3FcrA6Sizo9bXAKyQIrMGrwKYaDU16Cu9QOzxEmhDMk
	ICWjcsX9EoRBhNWlpWOaJPjb/Y7XdwMs6HbaPLaKYRzIQ6cBLFlEp2x43NXo5tQra48R
	zy2gDZqDFkiu/ibT6fx+frhQB2i3iXRNf90LQ9UhO3+4JvETaxjSeImj8MKxheHe4Dcl
	Gk7A==
X-Gm-Message-State: AJaThX5Hw8+m4y3eQVkCpnpmmPTNPSVshJJ2FN6W5oM1L3sB6/nQs0CS
	zzrhfL0BljrttByMzYYdIZLWpk6o
X-Google-Smtp-Source: AGs4zMaJ4u0ulI96pXghfq/8qAXtfeCnDyWPigZOGizVqnNSWizCEY1Kz/3dWGVDGxMwPzE3J4ecEA==
X-Received: by 10.98.201.29 with SMTP id k29mr12250408pfg.27.1511805588181;
	Mon, 27 Nov 2017 09:59:48 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:f197:f068:b85:adc4])
	by smtp.gmail.com with ESMTPSA id
	q83sm17033112pfk.68.2017.11.27.09.59.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 09:59:47 -0800 (PST)
To: Tanu Kaskinen <tanuk@iki.fi>, openembedded-core@lists.openembedded.org
References: <20171127163934.31597-1-tanuk@iki.fi>
	<20171127163934.31597-6-tanuk@iki.fi>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <57394a76-7a9d-9e1d-46db-b50eb88714b4@gmail.com>
Date: Mon, 27 Nov 2017 09:59:46 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <20171127163934.31597-6-tanuk@iki.fi>
Subject: Re: [PATCH 5/6] alsa-tools: 1.1.3 -> 1.1.5
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
X-List-Received-Date: Mon, 27 Nov 2017 17:59:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/27/17 8:39 AM, Tanu Kaskinen wrote:
> Changes:
> http://www.alsa-project.org/main/index.php/Changes_v1.1.4_v1.1.5
> 
> Rebased autotools.patch and makefile_no_gtk.patch.
> 
> Dropped 0001-as10k1-Make-output_tram_line-static-inline.patch with the
> assumption that it's not needed any more. The patch added a "static"
> qualifier to a function. According to the commit message, this was done
> to improve optimization. Upstream removed the "inline" qualifier from
> that same function, because it caused some trouble with clang. My guess
> is that the patch author actually ran into the same clang problem as
> upstream, but came up with a different fix. It doesn't seem like a
> function whose optimization anyone would really be interested in.
> 

Thanks, yeah its fine either way, using static inline or no inline at 
all, both will work.

> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
> ---
> 
> Khem, I added you to Cc in case you don't want the as10k1 patch to be
> removed.
> 
>   ...s10k1-Make-output_tram_line-static-inline.patch | 31 ----------------------
>   .../alsa/alsa-tools/autotools.patch                |  2 +-
>   .../alsa/alsa-tools/makefile_no_gtk.patch          |  2 +-
>   .../{alsa-tools_1.1.3.bb => alsa-tools_1.1.5.bb}   |  5 ++--
>   4 files changed, 4 insertions(+), 36 deletions(-)
>   delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch
>   rename meta/recipes-multimedia/alsa/{alsa-tools_1.1.3.bb => alsa-tools_1.1.5.bb} (87%)
> 
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch b/meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch
> deleted file mode 100644
> index d049a30d2c..0000000000
> --- a/meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 1e5926df74a35fe2cd90bc59f5264a8715c94048 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 7 Sep 2015 08:16:59 +0000
> -Subject: [PATCH] as10k1: Make output_tram_line() static inline
> -
> -The function is not used in any other file, its better to make it static
> -inline so compiler has a better chance of optimizing here
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - as10k1/as10k1.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/as10k1/as10k1.c b/as10k1/as10k1.c
> -index 96af0c3..d0766fd 100644
> ---- a/as10k1/as10k1.c
> -+++ b/as10k1/as10k1.c
> -@@ -366,7 +366,7 @@ void as_exit(const char *message)
> - 	exit(1);
> - }
> -
> --inline void output_tram_line( struct list_head *line_head, int type){
> -+static inline void output_tram_line( struct list_head *line_head, int type){
> -
> -         struct tram *tram_sym;
> -         struct list_head *entry;
> ---
> -2.5.1
> -
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
> index 319f25d27a..2e74963c89 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
> +++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
> @@ -20,7 +20,7 @@ diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
>   --- alsa-tools-1.0.24.1-orig//Makefile	2011-07-06 11:27:40.207665000 +0800
>   +++ alsa-tools-1.0.24.1/Makefile	2011-07-14 15:08:08.877665009 +0800
>   @@ -1,8 +1,8 @@
> - VERSION = 1.1.0
> + VERSION = 1.1.5
>    TOP = .
>   -SUBDIRS = as10k1 envy24control hdsploader hdspconf hdspmixer \
>   +SUBDIRS = as10k1 envy24control \
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
> index 9bd6848eda..54373d1a8f 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
> +++ b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
> @@ -14,7 +14,7 @@ index 2457a1c..72346d9 100644
>   --- a/Makefile
>   +++ b/Makefile
>   @@ -1,9 +1,9 @@
> - VERSION = 1.1.0
> + VERSION = 1.1.5
>    TOP = .
>   -SUBDIRS = as10k1 envy24control \
>   -	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.3.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
> similarity index 87%
> rename from meta/recipes-multimedia/alsa/alsa-tools_1.1.3.bb
> rename to meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
> index 9e97c0e969..1be43aa6e7 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.3.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
> @@ -12,11 +12,10 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
>              file://autotools.patch \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)} \
>              file://gitcompile_hdajacksensetest \
> -           file://0001-as10k1-Make-output_tram_line-static-inline.patch \
>              "
>   
> -SRC_URI[md5sum] = "b23eaae687d55410b92587c2053b301f"
> -SRC_URI[sha256sum] = "d88f1dcd6872121383eded5fa24e328e68c54e527db4547e1435d5eabc2b6709"
> +SRC_URI[md5sum] = "3afb92eb1b4f2edc8691498e57c3ec78"
> +SRC_URI[sha256sum] = "bc3c6567de835223ee7d69487b8c22fb395a2e8c613341b0c96e6a5f6a2bd534"
>   
>   inherit autotools-brokensep pkgconfig
>   
> 

