Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.6798.1608867770412250178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 19:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uleBr3H6;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id h10so1103768pfo.9
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 19:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BPmFva5qaEmSNZJv1K0+AKtU/Hv1/6kkeovR2NDtrQg=;
        b=uleBr3H6a9Wf+h64GPpley4YpTO0nv+pS+ribSiyxf1pH4ZXaMK4vz3+I20v3Y2mb2
         7+DhqfpySd7I0Q6DUtqxeE1RPXD98Oikru+QiosjmfMsWDU7cs3NN7zHHzc4kn13R0Mn
         G50WBXgSMKimrwfLN/K35NY8aWMwnIVH+Yp+vzCjS+PsNtSK+O3HVDc9APHHOHFzdXb1
         LPvBgl8krKdDYxfVAyh/1RDqqw/Gsyva13X+Kegt9FzWItZuXJ4QFP12PzwAMlOheUDe
         6JvVHbXFJuXvuNB5Tu9WgkVQjWhIJ5jQhONV/wkkJHGAxuz2cmIaYFryeKhxWB0+sPCy
         BfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BPmFva5qaEmSNZJv1K0+AKtU/Hv1/6kkeovR2NDtrQg=;
        b=IWtT9edbhGBytAKGZBr8Ojj3XHYcutPUydtw25SEzbKN0AZEEOgC+uIUo9qyaZFQB+
         qO0ylf1mEt9BSFuq++wtc/DkPEFI/AhTkofgO34HWzJ21WpBY40Hq+EE7uUB73qjbQCF
         S3uIi8Dosg8jymVuG81UEZk/P8isxNtP+KWJrqcvDP/KyyeuWteOFR/W4d4lrJfAucpB
         V1yT1C7u2rELgQmjJanttcRSY8Kxux5p0HJWBdMVBLztEja+hbDfL3Tnzv5L60+3YpRB
         egWg/56/QoTgzZhei9OphouHPNAghcHScSnNA1ylXQ16rvdnRxGErIJLTyFeAK/YIIxX
         hMIw==
X-Gm-Message-State: AOAM533NzajJpIWeoegQtSfw2YexUi0at9BkLMC2V+mN4GfMFSaWPyny
	OybrTtTk26LXWDmI0hS/5aMu75LALM9SUw==
X-Google-Smtp-Source: ABdhPJwGl0/p3FN5nXkD4EQmjpM6GqDPI36SLy60ieAlcOMfuQCcqqOkSIA9dLGQZwCAawDNp5Ku9g==
X-Received: by 2002:a65:434c:: with SMTP id k12mr29794473pgq.373.1608867769738;
        Thu, 24 Dec 2020 19:42:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::79a8? ([2601:646:9200:a0f0::79a8])
        by smtp.gmail.com with ESMTPSA id t12sm28463703pgu.75.2020.12.24.19.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Dec 2020 19:42:49 -0800 (PST)
Subject: Re: [OE-core] [PATCH] ell: upgrade 0.33 -> 0.35
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-core@lists.openembedded.org
References: <1608859814-70850-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <47c12c7e-9476-cdb2-4b9f-edc728fde815@gmail.com>
Date: Thu, 24 Dec 2020 19:42:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608859814-70850-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/24/20 5:30 PM, zangrc wrote:
> Add the following patch to solve the compilation error when using musl:
> 0001-Fix-bug-caused-by-missing-types.h-file.patch
> 0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>   ...x-bug-caused-by-missing-types.h-file.patch | 48 +++++++++++++++++++
>   ...ed-by-using-functions-not-provided-b.patch | 26 ++++++++++
>   .../ell/{ell_0.33.bb => ell_0.35.bb}          |  9 +++-
>   3 files changed, 81 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.patch
>   create mode 100644 meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch
>   rename meta/recipes-core/ell/{ell_0.33.bb => ell_0.35.bb} (70%)
> 
> diff --git a/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.patch b/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.patch
> new file mode 100644
> index 0000000000..6f26ec4e7d
> --- /dev/null
> +++ b/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.patch
> @@ -0,0 +1,48 @@
> +Subject: [PATCH] Fix bug caused by missing types.h file.
> +
> +Fix the following error:
> +../ell-0.35/ell/dhcp-private.h:75:2: error: unknown type name '__be32'
> +|    75 |  __be32 xid;
> +|       |  ^~~~~~
> +| ../ell-0.35/ell/dhcp-private.h:76:2: error: unknown type name '__be16'
> +|    76 |  __be16 secs;
> +|       |  ^~~~~~
> +| ../ell-0.35/ell/dhcp-private.h:77:2: error: unknown type name '__be16'
> +|    77 |  __be16 flags;
> +|       |  ^~~~~~
> +| ../ell-0.35/ell/dhcp-private.h:85:2: error: unknown type name '__be32'
> +|    85 |  __be32 magic;
> +
> +Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> +---
> + ell/dhcp-private.h  | 1 +
> + ell/dhcp6-private.h | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/ell/dhcp-private.h b/ell/dhcp-private.h
> +index 204e54e..b418535 100644
> +--- a/ell/dhcp-private.h
> ++++ b/ell/dhcp-private.h
> +@@ -19,6 +19,7 @@
> +  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> +  *
> +  */
> ++#include <linux/types.h>
> +
> + struct l_dhcp_client;
> + struct l_dhcp_server;
> +diff --git a/ell/dhcp6-private.h b/ell/dhcp6-private.h
> +index 2bbd1d3..14dd85c 100644
> +--- a/ell/dhcp6-private.h
> ++++ b/ell/dhcp6-private.h
> +@@ -19,6 +19,7 @@
> +  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> +  *
> +  */
> ++#include <linux/types.h>
> +
> + struct l_dhcp6_client;
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch b/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch
> new file mode 100644
> index 0000000000..da0018a8df
> --- /dev/null
> +++ b/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch
> @@ -0,0 +1,26 @@
> +Subject: [PATCH] Fix the bug caused by using functions not provided by musl.
> +
> +Fix the following error:
> +/usr/src/debug/ell/0.35-r0/build/../ell-0.35/ell/pem.c:227: undefined reference to `rawmemchr'
> +
> +Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> +---
> + ell/pem.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ell/pem.c b/ell/pem.c
> +index 790f2c2..27d47a0 100644
> +--- a/ell/pem.c
> ++++ b/ell/pem.c
> +@@ -224,7 +224,7 @@ static uint8_t *pem_load_buffer(const void *buf, size_t buf_len,
> +
> + 		/* Check that each header line has a key and a colon */
> + 		while (start < end) {
> +-			const char *lf = rawmemchr(start, '\n');
> ++			const char *lf = strchr(start, '\n');

Lets make this patch like below

#if defined(__GLIBC__)
                         const char *lf = rawmemchr(start, '\n');
#else
                        const char *lf = memchr(start, '\n', end - start);
#endif


> + 			const char *colon = memchr(start, ':', lf - start);
> +
> + 			if (!colon)
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/ell/ell_0.33.bb b/meta/recipes-core/ell/ell_0.35.bb
> similarity index 70%
> rename from meta/recipes-core/ell/ell_0.33.bb
> rename to meta/recipes-core/ell/ell_0.35.bb
> index 2fa05104fb..718b01f5cb 100644
> --- a/meta/recipes-core/ell/ell_0.33.bb
> +++ b/meta/recipes-core/ell/ell_0.35.bb
> @@ -13,8 +13,13 @@ DEPENDS = "dbus"
>   
>   inherit autotools pkgconfig
>   
> -SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "d9e40e641164150394b74b719b9726fc734f24b2cde679cf5f3be6915c34eded"
> +SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
> +           file://0001-Fix-bug-caused-by-missing-types.h-file.patch \
> +"
> +
> +SRC_URI_append_libc-musl = "file://0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch"

Provided the patch is done like I mentioned this patch is not needed to 
be musl specific anymore.

> +
> +SRC_URI[sha256sum] = "2bfe9da7781f65f1cb1595a5a068a3ae74d4b68b74f287c6f0c892cfe623913f"
>   
>   do_configure_prepend () {
>       mkdir -p ${S}/build-aux
> 
> 
> 
> 
> 
