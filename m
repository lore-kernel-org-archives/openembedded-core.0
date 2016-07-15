Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC246E660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:20:03 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hh10so6188804pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=h/jy6s1JAlRmRqTFOwCRFx/hBItUSXWhZvJDKTQNu6A=;
	b=mNUsMY3bIKVY/94oUP3Di2YPqfxka7wPIxZKAQkuh5FIlY5+MOYMrWtXtpzBVOcYV7
	6LLGTbmuFc3qWCmhwiVXMPfBhqWg1oAWpHtGZ0wLasdM2J+wpBJYF5PROPuws1ILodrt
	rvvp6/qX6FHaLTWuUC0PMzqW7nAxmlMe0smb+8YzvfhNy3SkjhtZITM01u6/75zFQPpv
	5QoYbJzThzOLdIRbv6ebkNDGvIUOP4MrHSaXuQenhxI0gMtFhDRcScdDRB3d7Nj61cLS
	LDu5bhs8U307qYgSWVvmR7a9mF/GyhfN7/s9snSmOClicJZJRkjH/EJyEqk8XpfH6wX9
	OFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=h/jy6s1JAlRmRqTFOwCRFx/hBItUSXWhZvJDKTQNu6A=;
	b=cFKEJT3A30/RDjqaQGqCimE9Q3OypUcl/owjQ9wVHmgvSrWNtHZhUEmCfbXMS35341
	9ekdkXXCpB7mQHONvbMM9FeDJ+zbWT7H1Z59JMaiI+qnMonGwrVMxKLTHXFTAfXZAN5i
	PYXm+clZKRnppBOPJFgBxVXGAi1f0bEFtc1s9POBEhGmAAkJOM87iLNieBKgF85Xn7iW
	dBDZd02AMwtPdDN1vHbE8etopOFGLV9eCvklo5Efcx5BB2pjcB4+pOhvKNgq+jOH8H++
	1fC1n/2jX3ls+MLPOH8rp0h4Niq984xPBXUHYqZBpxf/mQOO9PKBkb6GDeTiW2zszJ/n
	s3Aw==
X-Gm-Message-State: ALyK8tJQSh8E5pTyFTL8SCvbBh72rCyWbywl4D2KHbr4NKuXfX6HtnYw0jrmk3W60HezIw==
X-Received: by 10.66.80.136 with SMTP id r8mr12535762pax.72.1468592404191;
	Fri, 15 Jul 2016 07:20:04 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:194d:2232:d2ef:3b9c?
	([2601:202:4001:9ea0:194d:2232:d2ef:3b9c])
	by smtp.googlemail.com with ESMTPSA id
	p9sm4451615pfj.3.2016.07.15.07.20.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 07:20:02 -0700 (PDT)
To: Pascal Bach <pascal.bach@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <1468588941-2574-1-git-send-email-pascal.bach@siemens.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5788F111.9060305@gmail.com>
Date: Fri, 15 Jul 2016 07:20:01 -0700
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
X-List-Received-Date: Fri, 15 Jul 2016 14:20:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Pascal,

The "0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch" is
missing the OE patch standard header information.

please see http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Also, there is no .bb update so this patch will be applied.

regards,
Armin

On 07/15/2016 06:22 AM, Pascal Bach wrote:
> This ports the missing changes from commit: 7a51776a830167e43cbd185505f62f328704e271
> from 5.3 to 4.9 so that qemuppc can be compiled.
> 
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
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

