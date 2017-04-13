Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9132D77E44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:38:05 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id o36so8111985qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=McRTWn+uJnJU/WY6uPS8PXekJO5lpRkUggvUyAnCgj8=;
	b=iJJ8+0bXrcgJxTZULmrfXfv+Qy8ZeBmGpFY6ojGMFhttfbcf86P/DxMGYr71uc14ui
	vHKris/kFzLNdr6BA6ClerMCcp6HSZ5YRm0n7oI0af3S2XU80bYupAPAvgAx84Xx3VAT
	CYELvXBHJftSDBmR4hFlySFQTjQ7gzVOvWSjPweq/5EhPB/3inGz9IUQFTSxuZweVRQu
	NwwfjWBosLb5d3P/eU0/Q7aKhojGWxqqMd9aQ/R/8TbTslCu1qLce3PGH+FkkEm0J42/
	3b499wXP+si0yFDEqNnI5OwNMb+ZD4dmvWkV6h4C4JlnioxCVe8n9Aa2ahFwp3SqnUzp
	/hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=McRTWn+uJnJU/WY6uPS8PXekJO5lpRkUggvUyAnCgj8=;
	b=SotZcxxdWHXLJXN4wOrJypjGpp5C8QIPIh76nzodAk1ZR6EjWXxGX87euiPe6+O22r
	eIR4uH6zPZ7znUhsJC62EVFDccq/aN5EzoWzTXoWyD3s1hb7M89SADdbCBDv55LOc375
	jfQY+IqQDRpQned9Mf5gye6AQg/DUaRrb3beagwdruOZfrYxjui372yMfPaV13Hx64Sl
	XmL/m0WNAe9r0nq+GLR64wIg4Hvsko6KK9AFjOCD0GM2dgOrJFI2uB5BRAYdQzIzLCK2
	W8xPmdQiIZloY4DUDqVWlB77GI6k1Aeyi562+P4O3UVT5iKyfM8eqR8FM54BXew/ayJj
	ritw==
X-Gm-Message-State: AN3rC/54JnhXHEu07Vft607KucVI45+jBgajtxxWCuAE5y5IBs71X3AT
	Gzajg9Fv/Sglo4/YMZM=
X-Received: by 10.237.59.198 with SMTP id s6mr2718394qte.126.1492094286215;
	Thu, 13 Apr 2017 07:38:06 -0700 (PDT)
Received: from [10.5.3.6] ([189.114.111.135]) by smtp.gmail.com with ESMTPSA id
	127sm15842411qkf.64.2017.04.13.07.38.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 07:38:05 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20170405120916.17095-1-fabio.berton@ossystems.com.br>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Organization: OS Systems
Message-ID: <3dc24028-e55b-8a62-c10c-d370cffcf37c@ossystems.com.br>
Date: Thu, 13 Apr 2017 11:37:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170405120916.17095-1-fabio.berton@ossystems.com.br>
Subject: Re: [PATCH 1/2] wpa-supplicant: Use systemd-tmpfiles to create volatiles files and dirs
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
X-List-Received-Date: Thu, 13 Apr 2017 14:38:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 04/05/2017 09:09 AM, Fabio Berton wrote:
> Volatiles files are installed in different locations depending on
> distro feature update-rc.d or systemd. For update-rc.d volatiles
> configuration files are installed in /etc/default/volatiles and
> for systemd in /etc/tmpfiles.d/. So, we need to install volatiles
> files in correct location depending on what distro feature is used.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../wpa-supplicant/wpa-supplicant/wpa_supplicant.tmpfiles.d       | 1 +
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb    | 8 +++++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.tmpfiles.d
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.tmpfiles.d b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.tmpfiles.d
> new file mode 100644
> index 0000000000..5b27498b8e
> --- /dev/null
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.tmpfiles.d
> @@ -0,0 +1 @@
> +d /var/run/wpa_supplicant   0700    root    root    -   -
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
> index 146bccfaa7..ff4ad34d51 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
> @@ -24,6 +24,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
>             file://wpa_supplicant.conf \
>             file://wpa_supplicant.conf-sane \
>             file://99_wpa_supplicant \
> +           file://wpa_supplicant.tmpfiles.d \
>            "
>  SRC_URI[md5sum] = "091569eb4440b7d7f2b4276dbfc03c3c"
>  SRC_URI[sha256sum] = "b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450"
> @@ -93,10 +94,11 @@ do_install () {
>  	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>  		install -d ${D}/${systemd_unitdir}/system
>  		install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}/${systemd_unitdir}/system
> +		install -Dm 0644 ${WORKDIR}/wpa_supplicant.tmpfiles.d ${D}${sysconfdir}/tmpfiles.d/wpa_supplicant.conf
> +	else
> +		install -d ${D}/etc/default/volatiles
> +		install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
>  	fi
> -
> -	install -d ${D}/etc/default/volatiles
> -	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
>  }
>
>  pkg_postinst_wpa-supplicant () {
>

