Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 300CF7E078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:05:13 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f25so597831pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 11:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=waG4F+PaxUfKK0v1TjGfKh85QpspnXuKnR7ZqKHK0gc=;
	b=AttsK0LemoiYOSKXmLv/h8jzmmthIyMT6w2TEkNU6uoSNLTYRXy4Hz7MVBzXVf2Y6A
	y0e0+fcOKPplVmBQodpBE9uT42KtQgjAyK2uo3JWVjEjE2wXp8Bi6I7ZarfQ8qfR+vRU
	If19RtwMyyEOGuEgCoSW+aOIhKkJk7KmZ5wi4gYl1vfoq3lWQHVrREYYGB1I9wuiKSE3
	OkoiaN1Yjq2TWe8AvKuXzvbAyEA217uQeXDRCTQVanTftVhgylYzo2gaK8XJQjlqReGe
	TRycNm5LtU1u6v25T7PBFj+WAVuNLX9Z87B3bndQbWvFXsUSQVtW5jj9ZUI5d/xgqULV
	R4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=waG4F+PaxUfKK0v1TjGfKh85QpspnXuKnR7ZqKHK0gc=;
	b=rlL9KzE0uIjTy1mfLa0M/KD1phys17S98k7I6eCEKo7+JcFg/G/GMBB3sp6Nobncra
	+PJ+njXONoCsFmeVk2OssCLCce/fUTNQ3fZzUKkT4ao/ghk4swNfSTW0hkJClQVabYK+
	PB6MY5NiUYJr4acHbEOJf3SCqDSwPXGfb+PyqPnmkyFm5tnGPNyHmnOk+WJyHQ9fw0fK
	CX/Iypo3TpVfp3W0HZagH3SWqCcJsDofmqe8J/hydwudA7DtftB/tCO+f09zwXF/y6pP
	bU7H3RdebAowxInX6M34DuNP9jOGWu11BlMimjkocNbLbH64r7DJY4POCj/CJqd+9hIg
	q8wQ==
X-Gm-Message-State: APjAAAW3oDSALLhYGvnT50Av8YnstyTDhy8aW4BK4gcmH4am4v5Z/SFV
	BXTBm76OG3rpy9+WwCN0mjg=
X-Google-Smtp-Source: APXvYqykVisaNN7QTCl01IEyK/uEoCze53dVZDqnppHtRQ24kPWKXN7bV7D5PJvVtD7V9SXc1YHAWg==
X-Received: by 2002:a63:778b:: with SMTP id
	s133mr75850436pgc.198.1558375514620; 
	Mon, 20 May 2019 11:05:14 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	w66sm38702370pfb.47.2019.05.20.11.05.13
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 11:05:14 -0700 (PDT)
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
References: <20190520094621.94652-1-kai.kang@windriver.com>
	<20190520094621.94652-2-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <975c9628-c743-3445-7bfa-d1ced1e9bae2@gmail.com>
Date: Mon, 20 May 2019 11:05:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190520094621.94652-2-kai.kang@windriver.com>
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Mon, 20 May 2019 18:05:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/20/19 2:46 AM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Add a configure file for systemd.networkd to configure wired network
> interfaces with dhcp. It works with common network interfaces such eth0
> and eno1.
> 
> [YOCTO #13057]
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd-conf/dhcp.network | 5 +++++
>   meta/recipes-core/systemd/systemd-conf_242.bb       | 3 +++
>   2 files changed, 8 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd-conf/dhcp.network
> 
> diff --git a/meta/recipes-core/systemd/systemd-conf/dhcp.network b/meta/recipes-core/systemd/systemd-conf/dhcp.network
> new file mode 100644
> index 0000000000..81f36ebaa5
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-conf/dhcp.network
> @@ -0,0 +1,5 @@
> +[Match]
> +Name=en* eth*
> +
> +[Network]
> +DHCP=yes
> diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb b/meta/recipes-core/systemd/systemd-conf_242.bb
> index 96beea53a7..094f03e195 100644
> --- a/meta/recipes-core/systemd/systemd-conf_242.bb
> +++ b/meta/recipes-core/systemd/systemd-conf_242.bb
> @@ -10,12 +10,14 @@ SRC_URI = "\
>       file://logind.conf \
>       file://system.conf \
>       file://system.conf-qemuall \
> +    file://dhcp.network \
>   "
>   
>   do_install() {
>   	install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
>   	install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
>   	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
> +	install -D -m0644 ${WORKDIR}/dhcp.network ${D}${systemd_unitdir}/network/80-dhcp.network
>   }
>   
>   # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
> @@ -29,4 +31,5 @@ FILES_${PN} = "\
>       ${systemd_unitdir}/journald.conf.d/ \
>       ${systemd_unitdir}/logind.conf.d/ \
>       ${systemd_unitdir}/system.conf.d/ \
> +    ${systemd_unitdir}/network/ \
>   "
> 

Please look into

https://github.com/YoeDistro/meta-yoe/tree/master/recipes-core/systemd

this also means we need to enable networkd and resolved for this to work

