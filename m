Return-Path: <jpuhlman@mvista.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id CC71860D27
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 22:16:26 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id v19so6262439oic.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 14:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=exqFZPzOXU2GmxUb5rbw9kB9U2RtadCs0SYMFl+1iaY=;
	b=KIKm/lDfSljSL5qzFzJR1EUjA7dGbGeHhbHCrHPquezOL2wIoX4VionYllyn62qpz8
	HYvAoeaWch0CYN0xgq7IvULhp6DU5OoEfQIX9V9Q+RX8nVbuSqC9w7VYy5ECWhSJPumv
	TFjuumj+lHaCqDagsyj6Z8dCGpSsdtHrO+EYF8IAvl99dv515ZdMsSq2r95cFtnwZQDW
	4CNEFgq8hwqro/FDPbsvRPO2tY9dARSnLalkL9h7XPl59ftST8zzEPs045MBCzOYIKbR
	icXJVjJoxYEdO/6J+5pYKOM2OY0Rz2yRSBkeUwEPC3tsa4y/Nz2XJx1QHU7N9H1XozCj
	vXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=exqFZPzOXU2GmxUb5rbw9kB9U2RtadCs0SYMFl+1iaY=;
	b=cstWVMvIoKWQ1Eg1st1H8rxWe1u3BM5u92mddZm/KGZ4ZLZw7jRQO60NN10c4hlo/s
	rirAwMW0cvdglVl/qRsxZEsui1pPuEnNzvyyoGStm+JksHp7A5LOIQVxY1QtfP9Pad5e
	N0q+zGGGwJ+H9eDuGdz0HtJHgUH1N8gyVniPVPGv42cycMHkSwmmz/VKVx+yaudel/NS
	op8Vkh3zG9/fEY2tDWjIacwRq60VJ8c4e4vdi2OKR7jJF4rL2qgzY95ltpCCAv2AnbnM
	IR2XXnryKoHDkTJ1ACMUpIhDOyVue23Kqb8I/XUp/fhhmRy9SxuV7+NSO1FZmGdbYW0N
	XDgQ==
X-Gm-Message-State: APjAAAV9Voj9aZBrrRr/EEzeJs5WdloEePT1olcLwNhz3110Hh1Qoh81
	W/TgNC529IHJXGlbrgiYj3Z3Whg72kQ=
X-Google-Smtp-Source: APXvYqy62beMkVJGy2xNMPw9MaeAvzOSSQauVr1bp4SAaPk9kxMylgQ787oMHp7lPgFR3MAyoB2/qQ==
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr90054oie.5.1581027387508; 
	Thu, 06 Feb 2020 14:16:27 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:853c:fd5c:c2af:f5f9?
	([2600:1700:4c90:60a0:853c:fd5c:c2af:f5f9])
	by smtp.gmail.com with ESMTPSA id r80sm329798oie.41.2020.02.06.14.16.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 06 Feb 2020 14:16:26 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20200206220704.1109-1-ross@burtonini.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <5bbb4e00-46c4-8196-e9ae-1b665479aa2b@mvista.com>
Date: Thu, 6 Feb 2020 14:16:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206220704.1109-1-ross@burtonini.com>
Subject: Re: [PATCH] perl: don't package the host configuration
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
X-List-Received-Date: Thu, 06 Feb 2020 22:16:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Should that bug number be 13772 not 13372?

On 2/6/2020 2:07 PM, Ross Burton wrote:
> From: Ross Burton <ross.burton@intel.com>
>
> `make install` installs xconfig.h, which is the configuration of the
> *build host* used when building miniperl, used to bootstrap the Perl
> build.
>
> As this changes depending on the build host, remove don't install it.
>
> [ YOCTO #13372 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-devtools/perl/perl_5.30.1.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
> index d4b6bb32b43..8af9dfa4a2c 100644
> --- a/meta/recipes-devtools/perl/perl_5.30.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
> @@ -139,6 +139,10 @@ do_install() {
>       # Fix up shared library
>       rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so
>       ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo ${D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so
> +
> +    # This is the native configuration for the bootstrap perl, don't need it
> +    # packaged.
> +    rm -f ${D}${libdir}/perl5/${PV}/*/CORE/xconfig.h
>   }
>   
>   do_install_append_class-target() {

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


