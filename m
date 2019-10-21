Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 819237F555
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 14:51:09 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id k7so6742144pll.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 07:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=epnrygr+cxgygRJzu1KDdBl2s1xYv/OEdXknIQQKCW8=;
	b=iNvofL0UvofMcGl4CL8btNqIfhTOVt/rjparWJl4C+CAN31tXiZKBqhBFXcZBaFR2m
	yfT/sWioHmAmJjom1E/h2JvMIYZxeI2i2odIkiSmH/b8dhcTDsCktPVjrEe8br9xulCd
	UtDBV7LGtAVaU2DT7ViKzyorqb1z5hul+GQ6x5I4pCTGTQQaq4wserf96Vp99Gg3uqMk
	JrhFBH2p8CDb/dQcQIPHYZy3i1l7ouseUnAuQ7Dbbq9qCoZXTB3q5WAm7s7wEUE8vbEF
	PRQKHk3aHQrziKrbkbTFYfptQ+/FPvumcLbViaa1Uv6gq4q73Ntq+5D6X/QNfIx9Hojh
	SF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=epnrygr+cxgygRJzu1KDdBl2s1xYv/OEdXknIQQKCW8=;
	b=CAM50IpYXr40pHAImGUsjKE0doszW+2HLj/ZI6CaDaEXQp3q155YqxJuj3hmS7ToND
	NDNQdRuj6CkfhNLbf1++D1HwaizKAKYzaKW/aPinIJzeAf00/7wmrrkjqX90X6p5XVTn
	U0zjlHVSNUYtvRJPkYYtSF5EUYfN/SI7Hlt5rEKdH4GqjMfisi5mI9G1NL6gHsa/NrzO
	YNZcGFvS1GyWr4vVwvJ4DpGuR1dy6aMwouVGjL11nV+7nrI4e5k8cYfmONwFclzX4TR3
	Ksq1JY9oP3WnrA93EoCcZWp00plvGBj4OIJjGQ2DARtbu6rUJc4+3pdGPQMMKYyzeZfY
	F+fQ==
X-Gm-Message-State: APjAAAUlwccooJyxmmYgedIHnyY0DF2y4isllP37AfoMEli09F6UQS3n
	4CBOVurB2UI+zGXZZH9DtQRPOwwd
X-Google-Smtp-Source: APXvYqzA2XBxiFT0d2iTsn0AH5pXA+7RTa5wXfR8Jh63N4f8SUmf7DFd2wa1kAFieF+qsvvjYHobGg==
X-Received: by 2002:a17:902:bc81:: with SMTP id
	bb1mr25407874plb.244.1571669469705; 
	Mon, 21 Oct 2019 07:51:09 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:157f:ce57:c70b:4024?
	([2601:202:4180:a5c0:157f:ce57:c70b:4024])
	by smtp.gmail.com with ESMTPSA id
	q76sm26575539pfc.86.2019.10.21.07.51.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Oct 2019 07:51:08 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-core@lists.openembedded.org
References: <20191021104659.27059-1-git@andred.net>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <45a4bfc3-db54-3aa0-bab9-85ddde056c1d@gmail.com>
Date: Mon, 21 Oct 2019 07:51:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021104659.27059-1-git@andred.net>
Subject: Re: [PATCH] connman: mark connman-wait-online as SYSTEMD_PACKAGE
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
X-List-Received-Date: Mon, 21 Oct 2019 14:51:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/21/19 3:46 AM, André Draszik wrote:
> The connman-wait-online package currently isn't marked as
> systemd-enabled package. This means it is impossible to
> auto-enable the service during image creation or package
> installation, as no preset files and no pkg_postinst()
> snippet is being created.
>
> This change should have been done as part of the
> upgrade to v1.31

With backport to zeus?

- armin
>
> Note:
> connman-wait-online is needed when connman is in use
> in more complex network/interface setups for systemd's
> network-online.target to report success.
> systemd-networkd's systemd-networkd-wait-online.service
> alone doesn't work in such scenarios and simply times
> out, as it know nothing about the expected network/
> interface configuration, meaning the target doesn't
> boot successfully (systemctl list-units --failed),
> and long delays are seen, caused by waiting for the
> systemd-networkd-wait-online.service timeout.
>
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta/recipes-connectivity/connman/connman.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index ee00479926..fb38ab4fc1 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -59,7 +59,7 @@ INITSCRIPT_NAME = "connman"
>  INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
>  
>  python __anonymous () {
> -    systemd_packages = "${PN}"
> +    systemd_packages = "${PN} ${PN}-wait-online"
>      pkgconfig = d.getVar('PACKAGECONFIG')
>      if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
>          systemd_packages += " ${PN}-vpn"


