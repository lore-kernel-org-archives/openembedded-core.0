Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 45D317E073
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 21:18:21 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id g3so7846130pfi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DpRVNYHiWZ91jUbCwiQfoHD+cFI5mhQU4cH0FvG0kkc=;
	b=FUJeZunLd1ulJaCiED/BKSET8mbNjiL0Gnmj4ayqCNGwoiFZqjNz8MfvwP2FJ2YiUe
	4gQmHRjfQWn8ucFMu5eG9Ydrv7WpvQNeBL6TVYUXp6sbHSou3zsZqVk8tmZQ+Mhf0Tt7
	OgxygiN7MoNDvIC89m9yjYV5hrSK400HpaHwm650ApBjVRO6vyGCMiGSvA0jAcOtpK/g
	JEIBWA9NZudef2ZJQOr6FvwjvI8zhNcQu5xNxVba1HqU7Y/swsHMk2q/f6eL9gzw04vE
	lUA3aDnxs3QuaKVn5BQ16HAobDrMiMCIa52bJ9AZi0SwbDrnNEs3qnFQ6k3GubHi2z1V
	hJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=DpRVNYHiWZ91jUbCwiQfoHD+cFI5mhQU4cH0FvG0kkc=;
	b=LeUKg/LANKFBgx+ExV8e5JqOfUfesplXWLoZgFFphjIihuOf1XurelrVgzt2xhKNEJ
	7YQFCFhHrIdL7wvOd8xWe3HOBOm5gq+6nDfVUZjRCwsMB+Sy086/ZN6ALj5FXLMvZoD8
	oPIMS2n3ai3a+xuPPKpElvIC9l9aFfv9e6/kSaVEndzR1EKi4WDi8VBCxrYgJ0e4rC6Q
	eqh8+Irs7vmiFSWXrZHJLcb8HeV1mL5TbZ2vJfBTezaD0RbO12Vu4Kg9Ccm+icr84EMH
	Yc8NsMnPR3Jl94ieDX6J51+gF/XuokXtvHfdRdbqwPV5oJxEcqFKUhHLqaJW/PJh6tlu
	3S3A==
X-Gm-Message-State: APjAAAW72IgiJRs3G9jh41c893luQu38YTuklq6OSfOtB5+/kZ45BZJ3
	mSyXnwIP5uXJ52TvVBaqSrk9lsnv1J4=
X-Google-Smtp-Source: APXvYqyzewuZ10auyUFvL4KAeF0kPHK/Sz9x+6sGANsOcAhd5An0Fig5thMzwRvvmP/10ZhJ4b25aA==
X-Received: by 2002:a63:2107:: with SMTP id h7mr5354771pgh.330.1558387102110; 
	Mon, 20 May 2019 14:18:22 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	m1sm37022968pga.22.2019.05.20.14.18.21
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 14:18:21 -0700 (PDT)
To: Liwei Song <liwei.song@windriver.com>,
	oe-core <openembedded-core@lists.openembedded.org>
References: <1557974500-224120-1-git-send-email-liwei.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9ad65fe0-8a88-9413-7f2d-0cc855395721@gmail.com>
Date: Mon, 20 May 2019 14:18:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <1557974500-224120-1-git-send-email-liwei.song@windriver.com>
Subject: Re: [PATCH] mdadm: install the systemd service through Makefile
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
X-List-Received-Date: Mon, 20 May 2019 21:18:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/15/19 7:41 PM, Liwei Song wrote:
> The original mdadm service may include variable like BINDIR,
> It should use the real value of it, since the install method
> "install-systemd" in Makefile can easily do such work, so don't
> install it in bb file manually, use "make install-systemd" to
> install all the service of mdadm.
> 
> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> ---
>   meta/recipes-extended/mdadm/mdadm_4.1.bb | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
> index 4168ce4d0cb8..a4b9ef94799f 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
> @@ -55,13 +55,15 @@ do_install() {
>   do_install_append() {
>           install -d ${D}/${sysconfdir}/
>           install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
> -        install -d ${D}/${systemd_unitdir}/system
> -        install -m 644 ${WORKDIR}/mdmonitor.service ${D}/${systemd_unitdir}/system
> -        install -m 644 ${S}/systemd/mdmon@.service ${D}/${systemd_unitdir}/system
>           install -d ${D}/${sysconfdir}/init.d
>           install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
>   }
>   
> +do_install_append() {
> +        oe_runmake install-systemd DESTDIR=${D}
> +}

perhaps this should be guarded with systemd being in DISTRO_FEATURES check.

> +
> +
>   do_compile_ptest() {
>   	oe_runmake test
>   }
> @@ -88,3 +90,5 @@ RRECOMMENDS_${PN}-ptest += " \
>       kernel-module-raid10 \
>       kernel-module-raid456 \
>   "
> +
> +FILES_${PN} += "/lib/systemd/*"
> 

