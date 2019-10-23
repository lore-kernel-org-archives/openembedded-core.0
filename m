Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8057CECE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 21:16:09 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l24so7932400pgh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 14:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=uHMGA7e+kxoh6f5k6FlI4Q+tGd/DgKCj6rBrUkcdsfY=;
	b=GzAT5t3i2GVJjtizsclXAVF31ibQQ5FcfzKc/ABAcJB7QBMbnsf9tAHEgkIQ3dPRg3
	2NYdDiRHP/ez1kWDIHAG67VAXYdX5L3TuLIxDN8Y680qQDZnYoaFBRaog1lYLqO+wwzk
	4FFQ59AMlFuIGURu5OpGD6WrKt/wNUT1migSCJZPVrD043sXsDDs5lypr9GIAW4xHLUo
	UFsYarufVWznM0bPlMQDXaYaCl3cVWD+iY5Y/VVBqBZE+wo0VR6cQtsE5+RNkHRUwSpr
	qJp+m9MH+2zaQh5qbaXRt/mcU1EsM6WumuACHRcoZB9D2NAGd1BgoKX7frle0+7yKAoR
	ZJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=uHMGA7e+kxoh6f5k6FlI4Q+tGd/DgKCj6rBrUkcdsfY=;
	b=h34mjG2tFNHeduHdwlwYCbEUUtDjkW6R5aXmSprkwvB1b9HDqsvBEUMits2bOCDJJM
	1UtNhZiBmjwqECEJTxrPcc/W/SqmP2kUtZZWZZAkFqSaRHj//PetQ99fwwsfOdqSYkqZ
	2ImYmFMoKId62uj+icTxOLejaQlvmloLIiasoFHMp9lwytpsl6fsFCKalOIxO4Sexswj
	J8zcvJ04CsLpWiaPPRFHTriV3Pb5KRib0zqZS4tdEzpIm9xxpU6uF5Bw5QWfuqwVns3B
	OwN/aO8VbydgUfyUcrviYLJcxHAftemJ7kzfyWBVrcCG0AKeBoydCMZUmSmzlMiKCDs5
	ROfg==
X-Gm-Message-State: APjAAAWmJCun5Mxt7qoPDcV1g1l+FA4CYwKGOUWr6AtccoK07Mk5/zyx
	SeLmB+gIZvahb96A+jabHdhO/Okp
X-Google-Smtp-Source: APXvYqwwL0JhQZjj6UAstvkacXQAZVE0Gh5AQL7sFGcPVu4FIAkh77o3hjHU/2aZXAtEKlbAN8U+5A==
X-Received: by 2002:a63:4d47:: with SMTP id n7mr12783912pgl.123.1571865369871; 
	Wed, 23 Oct 2019 14:16:09 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:d998:942e:6613:6ef4?
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	c128sm24667736pfc.166.2019.10.23.14.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Oct 2019 14:16:09 -0700 (PDT)
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>,
	openembedded-core@lists.openembedded.org
References: <20191023202511.DBC8D440DCF_DB0B727B@spamalot.elettra.eu>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f55b326f-d575-b84a-4509-4d9700b3aa97@gmail.com>
Date: Wed, 23 Oct 2019 14:16:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023202511.DBC8D440DCF_DB0B727B@spamalot.elettra.eu>
Subject: Re: [PATCH] systemtap: support usrmerge
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
X-List-Received-Date: Wed, 23 Oct 2019 21:16:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/23/19 1:25 PM, Alessio Igor Bogani wrote:
> Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>

Thanks for the patch.  Could you comment on this open Yocto bug?
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4442

I think its fixed but would like someone who is using it to comment.


- armin
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
> index 6ee3e1c0f7..2efba2e06f 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -52,10 +52,13 @@ do_install_append () {
>     fi
>  
>     # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
> -   install -d `dirname ${D}${systemd_unitdir}`
> -   mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> +   if not ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
> +      install -d `dirname ${D}${systemd_unitdir}`
> +      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> +   fi
>     rmdir ${D}${prefix}/lib --ignore-fail-on-non-empty
>  
> +
>     # Ensure correct ownership for files copied in
>     chown root:root ${D}${sysconfdir}/stap-exporter/* -R
>  }


