Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 673D775583
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 06:04:12 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id n10-v6so5389827plp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 23:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wGHCAU2SPkQlfUlSPpQSAKN3PA7DFP55BQ6Q7ApSz7Y=;
	b=iPRziGJ9NcC/E+7jVQ2zvk6RGrQ1YccYpfom9Iq4Ea+G6ZrG9dRqZMOWltJdDTzIIb
	v4G41KfQ6R8stbA8BcN4geng++qVKCHClHJ71ozrExXpsJRTVnl1xwZsxYQC7z8c/ZbL
	BZ+E5yjpnz00Gbi6MDX4KFUKf/+AUUDsFJ/kehmlWVi90bCqkd03hV1eQCweMwB9O/FZ
	NYKix4oInJOJVy5XfAlaOf/9ebGTQo75fOLB0GhUc5MV56FO6Mkm0UAG3Ee5kjcitc1m
	pG/OkxrQlkETdbP3WrUJniUCsKkx8898EgIRe8XzAbqGiC06WA8QYiWTFLcTv5P3n3Yk
	NmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wGHCAU2SPkQlfUlSPpQSAKN3PA7DFP55BQ6Q7ApSz7Y=;
	b=rpb+v88RObxBrxa5nBKQlKlFmlO7BySoE+P8yDNL+UGSYarxOWzSvDfu0VuNaSS8MV
	36uM9qNxifoExVKpZc5PaH3ve7Uow7+Dno3oS+LtAMgb61ihSi6wQ8vUwcGz+7Ywi+d9
	cDcKcnqzcA/8bYCve9uPfk1NOA68Skq5zcy0lcUDZ3iqAqCoUSh1S3od3Wwf9aT49tPB
	lwrF56CEaLklamD4HtXnlZ2BJTgbtG/xWHpk7RM/qWLHIj1hubF+i9mhs7RUoZMzyvUv
	iKUCk7tNONoE6xwC0FyAEAzw7FISqJrCmZcJl+d7cwbvGO5MaABdXfLeWHQpdvXjSUsI
	rsag==
X-Gm-Message-State: APt69E1mx+z/hoH81msq6BaxJ33bEeFwaIgPJyLRkCkdPyWj9cNDSqJ0
	2B81F0Kp9MJAsyAozDzGd8g9sOp+
X-Google-Smtp-Source: ADUXVKKcUg3Q7syuhMC0PES+Dgz3QJttd9LI+Nq+LGyq9dJrEBCTWZCFaXXk921Rayf+ZqKogD4Lmw==
X-Received: by 2002:a17:902:d886:: with SMTP id
	b6-v6mr576834plz.361.1528351453160; 
	Wed, 06 Jun 2018 23:04:13 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:da1:5310:5059:8f85])
	by smtp.gmail.com with ESMTPSA id
	d6-v6sm36082122pgc.38.2018.06.06.23.04.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 23:04:12 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1528346078-20408-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <09084de7-92b5-ae25-06b9-63d97cdd35df@gmail.com>
Date: Wed, 6 Jun 2018 23:04:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1528346078-20408-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH] gcc-target.inc: configure gcc for armv7ve targets to default to armv7ve
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
X-List-Received-Date: Thu, 07 Jun 2018 06:04:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/6/18 9:34 PM, Andre McCurdy wrote:
> Originally these ARM specific EXTRA_OECONF options were applied to
> both gcc for the target and gcc-cross. That lead to a compromise
> being made: gcc on the target was configured to default to an ARM
> architecture which was at least compatible with the target (but not
> necessarily an exact match) and gcc-cross was configured default to
> armv7a for both armv7a and armv7ve (to avoid gcc-cross rebuilds when
> switching between the two).
> 
> However, when these ARM specific EXTRA_OECONF options were moved from
> gcc-configure-common.inc into gcc-target.inc (ie they were made to
> apply only to gcc on the target) the compromise no longer needed to
> be made.
> 
>    http://git.openembedded.org/openembedded-core/commit/?id=851937dde81de2a9ef54c5f19a78fb12fb82afd4
> 

this was done with a purpose so we can avoid gcc complaining about 
incompatible architectures when building programs on device.
probably testing compiling some c++ apps on device might be good to 
validate this if at all this is working.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-target.inc | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> index b6e31f5..56e4b95 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -9,13 +9,14 @@ EXTRA_OECONF_PATHS = "\
>   
>   EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>   
> -# ARMv6+ adds atomic instructions that affect the ABI in libraries built
> -# with TUNE_CCARGS in gcc-runtime.  Make the compiler default to a
> -# compatible architecture.  armv6 and armv7a cover the minimum tune
> -# features used in OE.
> +# Configure gcc running on the target to default to an architecture which will
> +# be compatible with that of gcc-runtime (which is cross compiled to be target
> +# specific). For example, for ARM, ARMv6+ adds atomic instructions that may
> +# affect the ABI in the gcc-runtime libs. Since we can't rely on gcc on the
> +# target to always be passed -march etc, its built-in default needs to be safe.
>   EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
>   EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
> -EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
> +EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve"
>   
>   # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
>   # set in subdir gcc, so subdir libcc1 can't use it, export it here to
> 

