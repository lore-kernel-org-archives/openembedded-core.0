Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3529C6C4E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 17:09:55 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t13so10269418pgr.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 09:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=krXsUeOV2c18jmCO8qUDn4cd4gCTVt6hYk4djqjq+ZI=;
	b=mrmR6hRcmOr0Ckk1rL9+Uuv7sfqARzWO4+R46JERyiwBw7MTibO4RX9PvvWBUJ5OqX
	4tNjP8jpQH4FWgdeuchYn3GsPzFCiPFSPDIZfGI+H11Buh43mHPDPewydrGSv0De0z+E
	tFpB5hMj6Ozo4ALpQcbUKWU5FBTAyDAUHgN9wORsqJh7dBOHMV8bNAc7UGHKGM5x/lS6
	vJWstkEEE+6DmrEQHSuHG9JhP+UACKZb+f0SWLXXcLhQaQFWtkth59U9gkaZQJuJUdG3
	UiuI5m0Koa9/ZZgO6BtpvbMrRLdwcTEinUrc2rxkXaeNzQaZSSO3lZYD9RPMxWp34zu2
	Wx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=krXsUeOV2c18jmCO8qUDn4cd4gCTVt6hYk4djqjq+ZI=;
	b=SUX1aDi6XNRX+N8HAHB9q3+a0fnYDz996ZAsJjGJupyQO0BYlY5p77I0kI3VaGSbb1
	Odc4+IJg7hwkA64uadh0SpbNciT3C1khDy8ax+NnMvwwVAhe6ZN1AhQl+lVW83JtHyHb
	qP97UVXm5gO50LUqC8j+DVmVqQkVWC9DARGF2fxOGspENVCjcnePAkqw5Nb8KFlQnB6K
	tjQO9C0iL3GGx2/3PgrMcKtQi6GrRlG2mNuY8r+FDCMUVziMrIFcQL9UKecpRwF3RQAF
	WXNwxaT7pJijEkKX5mkPT19a5QvtHt6GkRtsWUS7S+rkpgrV4I4aYmMoI/CPmFmpXTLd
	EPiw==
X-Gm-Message-State: AJcUukckCaPRAf0ql4sJNYqOO0HdOcPlJxdht88ZtwtKdPpOCiGscRnD
	fOGLIxc73Frp3Xo9NrsrrJfNuzKJulY=
X-Google-Smtp-Source: ALg8bN6PKtQHF8Wkf3IiWFqvstSkFMiZdj72g3SUh8tvZAMIWDJMHeakC4DPgUxa7yIqMWbECaUriQ==
X-Received: by 2002:a63:e5c:: with SMTP id 28mr25252413pgo.369.1546016995638; 
	Fri, 28 Dec 2018 09:09:55 -0800 (PST)
Received: from hermes.local ([2601:646:877f:9499:3c66:e24:63f5:7a43])
	by smtp.gmail.com with ESMTPSA id
	h69sm49283889pge.4.2018.12.28.09.09.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Dec 2018 09:09:55 -0800 (PST)
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>,
	openembedded-core@lists.openembedded.org
References: <CAMKF1srgZnSdeikUO0TvBk4vVrzU4vVMps_=VJ+7Se7A3AOPdQ@mail.gmail.com>
	<20181228162718.18815-1-alejandro.delcastillo@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <1cb7b6c1-7df0-8b73-0907-95d287d5bde9@gmail.com>
Date: Fri, 28 Dec 2018 09:09:51 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0)
	Gecko/20100101 Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <20181228162718.18815-1-alejandro.delcastillo@ni.com>
Subject: Re: [PATCH 3/3 v2] package_ip.bbclass: add xz threading
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
X-List-Received-Date: Fri, 28 Dec 2018 17:09:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/28/18 8:27 AM, Alejandro del Castillo wrote:
> Before, threading was enabled via a patch to opkg-build. Now that
> opkg-build provides a hook for extra arguments, use that.
> 
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>   meta/classes/package_ipk.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index 5eb910ca31..acc8245ffb 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -8,7 +8,7 @@ IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
>   PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
>   
>   # Program to be used to build opkg packages
> -OPKGBUILDCMD ??= "opkg-build -Z xz"
> +OPKGBUILDCMD ??= "opkg-build -Z xz -a '--threads 0'"
>   
>   OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
>   OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> 

thanks for addressing this.

