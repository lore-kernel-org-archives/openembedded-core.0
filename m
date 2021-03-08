Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.37839.1615219689065475497
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 08:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=agJcPf8y;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so3391944pjv.1
        for <Openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 08:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kMGLcPQKl6MaM9V64czYzdDN6LeqBoddllhz4LyDz6w=;
        b=agJcPf8y5Zo+u6cMegeSrbS0anxcToQIzYDyPDe6r980dOJ0Hx2a4zSA3EAXN4LUpq
         qFmbB46rXnLHvq+6wP+d8oTxN0boy2ggKat6c1E8VR8bnIH1IvVNsQa/6USdxBbA8doy
         WYtq1E5HrHsrjSABw+X1++kv56V0IpC+PeDCi+rr/nIU+Dwz6W0Am4r/ys9ehN7lAyzX
         7X2zB2tEh9Ub+Uf0N3FjSnCcqPwd8SXtjYlHbw1zfaHPu3OibMfORTUbNAP0da7kf0J0
         EeK5xebA38gUQ5HtTQBfRCBHSU0QDfJhBgpJh+PA0jj6WKl3J6T827oHv8lmx6CQIuBz
         yaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kMGLcPQKl6MaM9V64czYzdDN6LeqBoddllhz4LyDz6w=;
        b=X6G+3OQ09OBDLRcxItyqqqYyhwm1Gvbw72ynIGix+8gP7Uh2l942DMedkxbx0PeBBi
         S76gGHdXl5WYKR3zd+qHuR3ZPk3nlXIOqiXYcgxMWFbw12ORtaQWIx++ucwcxrKvub28
         Th8M/v5sPhBgF3tSyyZC01tnC0mt3fT1hO42lkedRDoQy2F6HgfqTkasL2CD0NqARFYX
         sM/g5TrOMRYwn3mag8+cesXX9tSlxKA1ctfcJeGuBGVS+AVCZWm7mGog3afMysFx7sBb
         n0Vqh+FiiWHB2ZjV2JLUmc59+MyUXqBbzv6rh3qXvrclCq8nvTb7Uobq6+gyrG/rODYo
         4V5A==
X-Gm-Message-State: AOAM532OvDmaWnjBjylctDOJFpeVSipX2s0dFgpVJJQCWTgCzBAMNZq/
	HZRgk6uPTYA1a8B4eTXhYW4=
X-Google-Smtp-Source: ABdhPJxtyjmlGIHYo5tGkn2dpkmSNMSIP60jjkXbtMU9bKo3GVqiFmI11ApfkGbrlFk2blqlWSRk3A==
X-Received: by 2002:a17:902:c192:b029:e4:5c61:3883 with SMTP id d18-20020a170902c192b02900e45c613883mr21567640pld.69.1615219688363;
        Mon, 08 Mar 2021 08:08:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::d2c6? ([2601:646:9200:a0f0::d2c6])
        by smtp.gmail.com with ESMTPSA id v2sm11263895pjg.34.2021.03.08.08.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 08:08:08 -0800 (PST)
Subject: Re: [OE-core][meta-oe][dunfell][PATCH] mdns: Whitelisted CVE-2007-0613 for mdns
To: Sana Kazi <Sana.Kazi@kpit.com>, Openembedded-core@lists.openembedded.org
Cc: nisha.parrakat@kpit.com, Aditya.Tayade@kpit.com,
 Harpritkaur.Bhandari@kpit.com
References: <20210308055859.8945-1-Sana.Kazi@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3e757411-d7d9-1676-d7b4-9cce94ab98bb@gmail.com>
Date: Mon, 8 Mar 2021 08:08:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308055859.8945-1-Sana.Kazi@kpit.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Sana

Thanks for your contribution. this patch needs a bit of rework, please 
apply it to master branch of meta-openembedded repository, this recipe 
is from meta-networking layer therefore prefix your subject line with 
[meta-networking] and meta-openembedded repo patches are sent to 
oe-devel mailing list not oe-core

here are OE patch submission guideline whic h will be helpful

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


On 3/7/21 9:58 PM, Sana Kazi wrote:
> CVE-2007-0613 is not applicable as it only affects Apple products
> i.e. ichat,mdnsresponder, instant message framework and MacOS.
> Also, https://www.exploit-db.com/exploits/3230 shows the part of code
> affected by CVE-2007-0613 which is not preset in upstream source code.
> Hence, CVE-2007-0613 does not affect other Yocto implementations and
> is not reported for other distros can be marked whitelisted.
> Links:
> https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
> https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
> https://security-tracker.debian.org/tracker/CVE-2007-0613
> https://ubuntu.com/security/CVE-2007-0613
> https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
> ---
>   .../recipes-protocols/mdns/mdns_878.270.2.bb        | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb b/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb
> index 0f8dc92df3..ce31233264 100644
> --- a/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb
> +++ b/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb
> @@ -26,6 +26,19 @@ SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${P
>   SRC_URI[md5sum] = "4e139a8e1133349006b0436291c9e29b"
>   SRC_URI[sha256sum] = "2cef0ee9900504c5277fb81de0a28e6c0835fe482ebecf1067c6864f5c4eda74"
> 
> +# CVE-2007-0613 is not applicable as it only affects Apple products
> +# i.e. ichat,mdnsresponder, instant message framework and MacOS.
> +# Also, https://www.exploit-db.com/exploits/3230 shows the part of code
> +# affected by CVE-2007-0613 which is not preset in upstream source code.
> +# Hence, CVE-2007-0613 does not affect other Yocto implementations and
> +# is not reported for other distros can be marked whitelisted.
> +# Links:
> +# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
> +# https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
> +# https://security-tracker.debian.org/tracker/CVE-2007-0613
> +# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
> +CVE_CHECK_WHITELIST += "CVE-2007-0613"
> +
>   PARALLEL_MAKE = ""
> 
>   S = "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
> --
> 2.17.1
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
> 
