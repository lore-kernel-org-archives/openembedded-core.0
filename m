Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id AB9B661115
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 13:08:54 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id n18so13955998ljo.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 05:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=O5B4xe9pNdCMD/0UO98847yCzhyYIn7iBhC6P3Hcd40=;
	b=bUDSd/8LZEjvtDKk29E4Mx5QG5dDdSl8+9spteEPtrwYYzWAZQ9aujsLO8wOcKvbSs
	aWtTkU4kX/GN4go/QSlDpiJ0wdx8xAODukbFkAlbnggRmyH8+rJCXbSnk160g484TjH4
	KbdIw2ieAeHl1VZhISZ7j10hakaUIEcvY9Pq/T1+/AyNN9hVNwHnINn5T+sZPkayxP8t
	4WUUJOECtLgbkGmLoLh3Sf1tRfquGfzK4EzhcABuEjImcT2Q7pfklKIC7DtC8kVE9nQ/
	7mN+JUi0V6o//5CU1z+kKXXdOKWy0BftRUcwZZE6LaElUox2ScgwQJWuoCEpMJkPMyn2
	3Mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=O5B4xe9pNdCMD/0UO98847yCzhyYIn7iBhC6P3Hcd40=;
	b=Vs1s8aL8oO8q3k3QIjchAJSSfGAu613dtZQ0RtJb8ERFCZrZJ/ZxCaZcXIJFzmMuqJ
	fXacg/RhJ+EIB7ygIW8EWsNkYeMB+NAGQEKzFPxaL6oNKJ5tEnrx25VZO1+AaO2kC1AF
	WXS4vWeMPm7c26xGgWPLJZl9qNZJEjQrCU1m38k8DoauK2iRg0vylZz7O3AAbt5AkS1O
	8DM71TPvKxM107ffrQhb8VoG/7k5Tx7E+/eDlseNVJA7Vk3cyF48wO62FXeBffBiDWAr
	13dm2ROKs65zkv7y6XSlqDvEWDN1vfgQ48+ZHZF22fmBk1cVicixD7ljgr65Mz63mAVo
	CP3Q==
X-Gm-Message-State: APjAAAWBsUrwQrSNwVLfsd01gRgpB22BDPZrL+f46uSE5VrLVmtgtnWw
	nUxbUhVUHZ8ZtsqtermJz/Wo909H
X-Google-Smtp-Source: APXvYqyjsIEYArMYeS5fCIVoPGPMGsEi0lMe+RTnl0Eaj+HP/WVGq+Hmjsl46/lMU76PLhNt+5T0fA==
X-Received: by 2002:a2e:b007:: with SMTP id y7mr32039542ljk.215.1582636134753; 
	Tue, 25 Feb 2020 05:08:54 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id w6sm7346500lfq.95.2020.02.25.05.08.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 05:08:53 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20200222185400.32136-1-jpuhlman@mvista.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <a133657b-8b8f-a4e9-5999-41781f74db6d@gmail.com>
Date: Tue, 25 Feb 2020 14:08:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200222185400.32136-1-jpuhlman@mvista.com>
Subject: Re: [PATCH] readline/ediline: Fix conflicting manpages.
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
X-List-Received-Date: Tue, 25 Feb 2020 13:08:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/22/20 7:54 PM, Jeremy A. Puhlman wrote:
> From: Jeremy Puhlman <jpuhlman@mvista.com>
> 
>    file /usr/share/man/man3/history.3 conflicts between attempted installs of libedit-doc-20191231+3.1-r0.corei7_64 and readline-doc-8.0-r0.corei7_64
> 
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>   meta/recipes-core/readline/readline.inc               | 8 +++++++-
>   meta/recipes-devtools/libedit/libedit_20191231-3.1.bb | 6 ++++++
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
> index 07f54a76f1..4babcbd69a 100644
> --- a/meta/recipes-core/readline/readline.inc
> +++ b/meta/recipes-core/readline/readline.inc
> @@ -44,7 +44,13 @@ BBCLASSEXTEND = "native nativesdk"
>   
>   CONFFILES_${PN} += "${sysconfdir}/inputrc"
>   
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE_${PN} = "history.3"
> +ALTERNATIVE_LINK_NAME[history.3] = "${mandir}/man3/history.3"
> +
>   # OpenSuse injects versions into libreadline leading to conficits between our native one and theirs
>   # see their spec file for where this is injected. Extra versioning is harmless so we just do the same.
>   SRC_URI_append_class-native = " file://rl-native.map"
> -LDFLAGS_append_class-native = " -Wl,--version-script=${WORKDIR}/rl-native.map"
> \ No newline at end of file
> +LDFLAGS_append_class-native = " -Wl,--version-script=${WORKDIR}/rl-native.map"
> diff --git a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb b/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
> index 7116c9ddbc..267fdcc54a 100644
> --- a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
> +++ b/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
> @@ -17,3 +17,9 @@ SRC_URI[md5sum] = "2e22a51131de94ff2df24901f7cfe416"
>   SRC_URI[sha256sum] = "dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071"
>   
>   BBCLASSEXTEND = "native nativesdk"
> +
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "90"
> +ALTERNATIVE_${PN} = "history.3"
> +ALTERNATIVE_LINK_NAME[history.3] = "${mandir}/man3/history.3"
> 

With this change (I think), I now get a file

> +lrwxrwxrwx root       root               38 ./usr/share/man/man3/history.3 -> /usr/share/man/man3/history.3.readline

in my rootfs, which is wierd since I don't have any other man pages in 
my image..

/Jacob

