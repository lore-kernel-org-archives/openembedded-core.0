Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 15A927C345
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 01:27:34 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h1so3814209pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 18:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XQduhJsBEr9m05JPXoGXDCjRbiMfipKS06v0P+az/Jo=;
	b=iLTa8RqcS/wbRrPpPioKNnme1TSRKpH2QdsmZSHW8sxJjNxRTY5IYxkf0eRoihilFw
	msRRBMWgbNTFfhnfEfNIwhWF06XpF2LMf1QZN4UjxVFfYmV13FI2UiumFNV+4v2pb5Hp
	o/Ad8dp28dxGXKDHXqaTrvpjiGrAQetm+mCrPpC+7ltuqHYo4Zz4E14r3tIUNycBLmJP
	1GB7CWRswElXSIcYCvuCTL8AIlpghKYbXYJO28l5PjURQHy7Teuf1C61F6zOBCj78Egj
	vc70zEWe0ZPxfKYKbjJ4nWqFW2lYjC/pNJnjePljlEa3kwP3P6q5NDVCO73FKZShHuYO
	zkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=XQduhJsBEr9m05JPXoGXDCjRbiMfipKS06v0P+az/Jo=;
	b=totQ5XhGoih7BO7ptgFu16aH2DFS/pm9l+5wq2pmDKr1n1YKTNSwIaQckX+59ruJbi
	y8Bsn90J3jVkxAIQaeEF2MynScTIO/WG68UHlfskEhIc+uc1uG3PrAMWRDRR5L2ZSEVm
	hb7MBSz2mEwrZ4M5kmgfd+ZJ0MFZq6JglL7xoUmhqSlEfxtv4QWN7T5JPIf5ldMoWzO8
	k4fwC/6+Ge67DhC46by6Df7jA3EFMfcvaikxtN5WCHeJuBubapipsMvDGM/A0optfamf
	zWKIbwPuUecCIa3GIM412oH3/StCr4DXbu7RgNRJG888KCpGgfGC+NLj/g1xsxD9Svrq
	IM1Q==
X-Gm-Message-State: APjAAAUCN6Yzsj38msBSMItf401xpeQGA6jQ+j+ZE46ALVqmrSb7cC9T
	ixdh2lbwaMXv3OMSPMy9oE40kIWcuAM=
X-Google-Smtp-Source: APXvYqwsqBSz9PQr0JRgLtR9WGsdKZOcAuafBF1Uz2faiP9Pez52K4cOdu0RmxM95ERy3cOtWn9pUw==
X-Received: by 2002:a62:6fc6:: with SMTP id
	k189mr18083649pfc.154.1557538055475; 
	Fri, 10 May 2019 18:27:35 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:6095:8839:3497:2f69])
	by smtp.gmail.com with ESMTPSA id c5sm7172038pgh.86.2019.05.10.18.27.34
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 18:27:34 -0700 (PDT)
To: mingli.yu@windriver.com, richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <5CB80B5D.40800@windriver.com>
	<1556095261-171895-1-git-send-email-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <cd89447f-ff89-4f84-be9b-4a1c61f5941a@gmail.com>
Date: Fri, 10 May 2019 18:27:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <1556095261-171895-1-git-send-email-mingli.yu@windriver.com>
Subject: Re: [PATCH v4 1/2] nettle: fix the Segmentation fault
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
X-List-Received-Date: Sat, 11 May 2019 01:27:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/24/19 1:41 AM, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> The commit[8ac8fa8ee1 nettle: update to 3.4.1]
> add CFLAGS_append = " -std=c99" to silence the
> below error for native build:
> | ../nettle-3.4.1/rsa-sign-tr.c: In function 'sec_equal':
> | ../nettle-3.4.1/rsa-sign-tr.c:243:3: error: 'for' loop initial declarations are only allowed in C99 mode
>     for (size_t i = 0; i < limbs; i++)
>     ^
> | ../nettle-3.4.1/rsa-sign-tr.c:243:3: note: use option -std=c99 or -std=gnu99 to compile your code
> | Makefile:263: recipe for target 'rsa-sign-tr.o' failed
> 
> But the above change will trigger below Segmentation
> fault:
>   # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
>   [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip 00007f3332256998 sp 00007fff60d44410 error 4 in libnettle.so.6.5[7f3332244000+1d00]
>   [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68 ff f
>   Segmentation fault
> 
> So update the logic to CFLAGS_append = " -std=gnu99"
> to fix the issue.
> 
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   meta/recipes-support/nettle/nettle_3.4.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
> index dd49c30..8375fcf 100644
> --- a/meta/recipes-support/nettle/nettle_3.4.1.bb
> +++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
> @@ -30,7 +30,7 @@ inherit autotools ptest multilib_header
>   EXTRA_AUTORECONF += "--exclude=aclocal"
>   
>   EXTRA_OECONF = "--disable-openssl"
> -CFLAGS_append = " -std=c99"
> +CFLAGS_append = " -std=gnu99"

Is this flag needed for native build on distros using really old gcc ?

then I think we should add it to BUILD_CFLAGS and let default standard 
prevail that gcc/clang selects in target case.

>   
>   do_compile_ptest() {
>           oe_runmake buildtest
> 

