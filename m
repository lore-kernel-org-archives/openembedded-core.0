Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 24D6661BCB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 17:40:40 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 7so1593435pgr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 10:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=QweLrtiO0Pu5rT9wQ+frUccMC7jad2uAqrQPcs3Wlso=;
	b=d5Nm2z4fA8BmG7xzkcz19DTxPgdlnh46fQ2XKmZSCNf78UQTDPnZuNpKcwxWVsbRuX
	w+E5TrYabd/lz3PLkmRLUkXOvPvBXB++lKX0+a+B/y70wx1wdF/zGjNhC7Qbaz1NkhmG
	kl4du6qSr8EE4W/4Jz8lnkjWmaxTLTsDGD0WsK/c5KKilYD2/VZr8eHZ0j2WSL9OCFUh
	B8Bc5YmaMjctUfnr9/gBxSTvT5dteiTVuBNxLsYm9PuvrND/uAOqofFXyPW35mD70ikB
	WDSiMMjnX4BaUKZQMJoVwK/ajWJEcz56ggOOwbVh58Ul96AuyDvN7EAZOlWxktPDPWeX
	qRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QweLrtiO0Pu5rT9wQ+frUccMC7jad2uAqrQPcs3Wlso=;
	b=kW7J7e2MaFtBC3YjpqE4f/9+931fK3uluDk9RTZHR2328kf6nJ24SB6vS4m7M3NWGo
	txsf5x6oQS8Q2hm5TmT/3MeTw4wMteqexKyJl8NxyVMDYlhhn5dGVyPc9C8FjXL6plCa
	YTHAOR06wu1qZkAoO9qcRnNKsqVyPeob8/YH821Vqs9wgV4Qzbxofd9B9KgMlPYzKf1t
	nvaSq68Fq5hoZLX858ZiIVVnw5C+uIB8e8MVbEc2X4CWjsEhmBrPZmCInlx2M4Zc57G5
	arYe9MHUPhfso9GFeJjt8x+3ijp5p012DaLL4rMXqbuiydwkcI+WcGUY+yRQ8BkOLnww
	4Huw==
X-Gm-Message-State: ANhLgQ3kWMAhJHkiQ2eWBTIBTQ8TCKJtNpTxWfM/il3lyVv7YcXuqf5J
	cOdP24RQN6ga56RhvEFWfL/shtDSxm8=
X-Google-Smtp-Source: ADFU+vvBpLOR9jXQDmvE1iRNnNA2ATVj+JT9XkOuI526Fl+YmPG1jQSRGXH8LZ4b3bMtZ3IIM6i8Zw==
X-Received: by 2002:a63:3f88:: with SMTP id m130mr3796070pga.337.1583948441234;
	Wed, 11 Mar 2020 10:40:41 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:e8b9:f87c:18f3:1405?
	([2601:646:9200:4e0:e8b9:f87c:18f3:1405])
	by smtp.gmail.com with ESMTPSA id
	e14sm1266145pfn.196.2020.03.11.10.40.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 10:40:40 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
	<20200310232814.48572-5-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <2b8111a2-1722-5d2a-0942-aad6555a08f8@gmail.com>
Date: Wed, 11 Mar 2020 10:40:38 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310232814.48572-5-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 5/6] glibc: Update nativesdk locale relocation patch
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
X-List-Received-Date: Wed, 11 Mar 2020 17:40:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/10/20 4:28 PM, Richard Purdie wrote:
> The locale binary reported incorrect locale lists in relocated toolchains
> as some path references were not relocated by this patch. Fix this missing
> relocations so the locale binary correctly reports the locales.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   ...Make-relocatable-install-for-locales.patch | 62 ++++++++++++++-----
>   1 file changed, 47 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
> index d9985c2fdc8..27cd17cdcdf 100644
> --- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
> +++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
> @@ -17,11 +17,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    locale/localeinfo.h  | 2 +-
>    3 files changed, 4 insertions(+), 4 deletions(-)
>   
> -diff --git a/locale/findlocale.c b/locale/findlocale.c
> -index 9cd3b71a6d..84272310e0 100644
> ---- a/locale/findlocale.c
> -+++ b/locale/findlocale.c
> -@@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
> +Index: git/locale/findlocale.c
> +===================================================================
> +--- git.orig/locale/findlocale.c
> ++++ git/locale/findlocale.c
> +@@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attr
>       which are somehow addressed.  */
>    struct loaded_l10nfile *_nl_locale_file_list[__LC_LAST];
>    
> @@ -30,7 +30,7 @@ index 9cd3b71a6d..84272310e0 100644
>    
>    /* Checks if the name is actually present, that is, not NULL and not
>       empty.  */
> -@@ -166,7 +166,7 @@ _nl_find_locale (const char *locale_path, size_t locale_path_len,
> +@@ -166,7 +166,7 @@ _nl_find_locale (const char *locale_path
>    
>          /* Nothing in the archive.  Set the default path to search below.  */
>          locale_path = _nl_default_locale_path;
> @@ -39,10 +39,10 @@ index 9cd3b71a6d..84272310e0 100644
>        }
>      else
>        /* We really have to load some data.  First see whether the name is
> -diff --git a/locale/loadarchive.c b/locale/loadarchive.c
> -index ba0fe45648..9737fd4cda 100644
> ---- a/locale/loadarchive.c
> -+++ b/locale/loadarchive.c
> +Index: git/locale/loadarchive.c
> +===================================================================
> +--- git.orig/locale/loadarchive.c
> ++++ git/locale/loadarchive.c
>   @@ -42,7 +42,7 @@
>    
>    
> @@ -52,11 +52,11 @@ index ba0fe45648..9737fd4cda 100644
>    
>    /* Size of initial mapping window, optimal if large enough to
>       cover the header plus the initial locale.  */
> -diff --git a/locale/localeinfo.h b/locale/localeinfo.h
> -index 1bfe22aa7f..fdc283c69a 100644
> ---- a/locale/localeinfo.h
> -+++ b/locale/localeinfo.h
> -@@ -331,7 +331,7 @@ _nl_lookup_word (locale_t l, int category, int item)
> +Index: git/locale/localeinfo.h
> +===================================================================
> +--- git.orig/locale/localeinfo.h
> ++++ git/locale/localeinfo.h
> +@@ -331,7 +331,7 @@ _nl_lookup_word (locale_t l, int categor
>    }
>    
>    /* Default search path if no LOCPATH environment variable.  */
> @@ -65,3 +65,35 @@ index 1bfe22aa7f..fdc283c69a 100644
>    
>    /* Load the locale data for CATEGORY from the file specified by *NAME.
>       If *NAME is "", use environment variables as specified by POSIX, and
> +Index: git/locale/programs/locale.c
> +===================================================================
> +--- git.orig/locale/programs/locale.c
> ++++ git/locale/programs/locale.c
> +@@ -632,6 +632,7 @@ nameentcmp (const void *a, const void *b
> + 		  ((const struct nameent *) b)->name);
> + }
> +
> ++static char _write_archive_locales_path[4096] attribute_hidden __attribute__ ((section (".gccrelocprefix"))) = ARCHIVE_NAME;

is this .gccrelocprefix limited to nativesdk case in general ? I think 
this binds us into gcc quite a bit, so I would like to see if we can do 
it more generic ways which can work for say clang as well.

> +
> + static int
> + write_archive_locales (void **all_datap, char *linebuf)
> +@@ -645,7 +646,7 @@ write_archive_locales (void **all_datap,
> +   int fd, ret = 0;
> +   uint32_t cnt;
> +
> +-  fd = open64 (ARCHIVE_NAME, O_RDONLY);
> ++  fd = open64 (_write_archive_locales_path, O_RDONLY);
> +   if (fd < 0)
> +     return 0;
> +
> +@@ -700,8 +701,8 @@ write_archive_locales (void **all_datap,
> + 	  if (cnt)
> + 	    putchar_unlocked ('\n');
> +
> +-	  printf ("locale: %-15.15s archive: " ARCHIVE_NAME "\n%s\n",
> +-		  names[cnt].name, linebuf);
> ++	  printf ("locale: %-15.15s archive: %s\n%s\n",
> ++		  names[cnt].name, _write_archive_locales_path, linebuf);
> +
> + 	  locrec = (struct locrecent *) (addr + names[cnt].locrec_offset);
> +
> 

