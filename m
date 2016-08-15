Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8487773204
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 20:58:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h186so4240337pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=YjXFMJhT7uVjngsLRwxRg66FE0qGo6RhJ4Ckvh/UsXw=;
	b=tOluGfdMrpi6geSuPlAO91hsdbIkva/hc+mfR4YcBY9TWbjdIXYt1QECOtlYuvxMth
	jv0a/Zp5nAfHXcvftZ92OIbx387+oYdta+q/LsFVwLY/8vg1GGBofzsK7kFzjSvsdmao
	ghbJHYwh0H0cgnMRswSSvdksuER79vbN58mgXDmEY8zoliQ/oHKVOWtnLuEA4+jSpMxM
	VgCT/77FL7K5q+wW0VHLcWwICB336ip2c5tOUzUDtcnGJecTMZ/Cn958wxiW/TusC9af
	KyWaEbwte9cWlzVliKrxfA1eV0Z/SRQkFZifN8sBkaYxP38HdSTP5wwUqTNffnqVDrZL
	4nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=YjXFMJhT7uVjngsLRwxRg66FE0qGo6RhJ4Ckvh/UsXw=;
	b=LYaWDK6EkueW40KqndewiaG4M3cv0OAv7Xlh5Lv55bXOid+OPoXvDKD8l5FRstkw6g
	CDra2xw/dXWZBnRe3pFtimab/NBJGJkdV4lFgPeB2r78f9CkP2kZ8SRIkzE2y/5gwhmp
	Zu0ft4OvhorCcmes1tfa/sf+R2EIdVkq7pUAwyLSukMYTWYYxgLi0WutOxcQFUDFVa3m
	zUv9wtrRl0KjDTlLcOJ+LelH1G7cd3WVDdiHw8gJAxFgFdskeZLIAWA6851Apa9kF+x5
	+xUnCF09mNHhWTL35d7pbPmQ53Ej03g3Vc36Viy3dBYjwnhAQ5fdD7llYt5ocEe6mBAF
	tPkg==
X-Gm-Message-State: AEkoousHzoUoBvOQsknsoZQpoh3qNXQysdbsy+LZUbB27fthMy83ify+6P98tAguv3Ak7g==
X-Received: by 10.98.88.131 with SMTP id m125mr5937369pfb.63.1471294683210;
	Mon, 15 Aug 2016 13:58:03 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:94d9:eae7:71b3:4646?
	([2601:202:4001:9ea0:94d9:eae7:71b3:4646])
	by smtp.googlemail.com with ESMTPSA id
	q4sm33557608pfb.18.2016.08.15.13.58.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 13:58:02 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1468588941-2574-1-git-send-email-pascal.bach@siemens.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57B22CD8.2020908@gmail.com>
Date: Mon, 15 Aug 2016 13:58:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1468588941-2574-1-git-send-email-pascal.bach@siemens.com>
Subject: Re: [krogoth][PATCH] gcc, qemuppc: Explicitly disable forcing SPE flags for 4.9
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
X-List-Received-Date: Mon, 15 Aug 2016 20:58:03 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 07/15/2016 06:22 AM, Pascal Bach wrote:
> This ports the missing changes from commit: 7a51776a830167e43cbd185505f62f328704e271
> from 5.3 to 4.9 so that qemuppc can be compiled.
> 
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>

merged to staging

thanks,
Armin
> ---
>  ...Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> index b98f8ff..77fa18a 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> @@ -37,6 +37,17 @@ index cb7a94e..d392c2b 100644
>   	extra_options="${extra_options} rs6000/sysv4.opt"
>   	tmake_file="rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-ppccomm"
>   	case ${target} in
> +Index: gcc-4.9.3/gcc/config/rs6000/linuxspe.h
> +===================================================================
> +--- gcc-4.9.3.orig/gcc/config/rs6000/linuxspe.h
> ++++ gcc-4.9.3/gcc/config/rs6000/linuxspe.h
> +@@ -27,6 +27,3 @@
> + #undef	TARGET_DEFAULT
> + #define TARGET_DEFAULT MASK_STRICT_ALIGN
> + #endif
> +-
> +-#undef  ASM_DEFAULT_SPEC
> +-#define	ASM_DEFAULT_SPEC "-mppc -mspe -me500"
>  -- 
>  1.7.9.5
>  
> 

