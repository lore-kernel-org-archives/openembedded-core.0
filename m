Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2F10774D9C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 00:18:33 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id k6-v6so11466795pls.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 17:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=p+6CLnyw/P9tA9lGGxqJSxNPseBlIiSHokbQL31MlAo=;
	b=MrK2uoRvn9giHjuuwDoFVSWkZEAv4IvQSFU0r10Xl6COy3yXJfGz2tTj2FnrNQ+Ta8
	zmkAuar4KhMR0V8xB4LvPGlzA6wnaUmLJZvzLKqfR2o2nA4O8qdzGXzMkKRmjSGgXl7q
	tP3ZoJAs7yEiXUkH1Q7nr4YO6VXtHAIz9UA/rdxGw1qc2f2HQ0a6B3Km+LKjHOlAxQjr
	MPMw3lm/CbBbA/DfhAhlWFHdjD+NJ5CJlq81DlyX/MgvyoSqJ3WUkazEDc0w7DDG2dwS
	XG5KgBTG34Zneys/LiTh/PGLIZ+rbkbkPPJIBKvMxl2DDEgS5Gl+WCPsD6HTnlTFuZZU
	mZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=p+6CLnyw/P9tA9lGGxqJSxNPseBlIiSHokbQL31MlAo=;
	b=MDsj0bm/TWZWMXgwrKUhKqgcRUt7CaL1mc/K4re40yxhNiiEep2NSBWAFBuDD/BIjL
	XrbG4ybo0joVXV/y6vsSX8BIr6+kH7R1eIUkdqEYmt2VVUPqTssekH1TP1kQ8yVri90y
	bUBN7A9HPCGhc22kwWLl2wgd/MAMjLsucR0zc+a8o4kTFX66ZcKcaDYO8yn8N/Jy+IFg
	gx4g3o9oLMxynUeqqfgnacsWtAjfJuU0yfBHA+VIyOm22e1X1ahKcgJu8tvrXNsQP9YP
	tBSywd4/g1ylMxsOyYs/QZkJf7gKf8beWgKOnnNVEEZ/QaWq704pNf9blySypEaN9qZX
	Yr9w==
X-Gm-Message-State: AElRT7HVD1I7N8XkvfGsk5z+rk+QTBAHepezF2iEPm0rMaO2EOJQGJAL
	z2xUJ7DGUTNAX7gvyA15VrngedRr
X-Google-Smtp-Source: AIpwx4/sHSVn9gRawIqyVlHWflfbWTBrQC+iVxtJGcdH+eH0sT/gRwX5gRmlBQTPxH0b3syINCQXpg==
X-Received: by 2002:a17:902:5305:: with SMTP id
	b5-v6mr15350647pli.326.1522887514729; 
	Wed, 04 Apr 2018 17:18:34 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:fde8:8784:7436:3e7a?
	([2601:646:8880:466c:fde8:8784:7436:3e7a])
	by smtp.gmail.com with ESMTPSA id
	v12sm9302117pgs.21.2018.04.04.17.18.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 17:18:33 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-8-alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <bac40368-2bea-05d5-63b7-2f887a1dce1c@gmail.com>
Date: Wed, 4 Apr 2018 17:18:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20180404111321.10824-8-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 08/22] bash-completion: update to 2.8
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
X-List-Received-Date: Thu, 05 Apr 2018 00:18:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/4/18 4:13 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../{bash-completion_2.7.bb => bash-completion_2.8.bb}              | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/bash-completion/{bash-completion_2.7.bb => bash-completion_2.8.bb} (86%)
> 
> diff --git a/meta/recipes-support/bash-completion/bash-completion_2.7.bb b/meta/recipes-support/bash-completion/bash-completion_2.8.bb
> similarity index 86%
> rename from meta/recipes-support/bash-completion/bash-completion_2.7.bb
> rename to meta/recipes-support/bash-completion/bash-completion_2.8.bb
> index f519b3f3da4..85064343e30 100644
> --- a/meta/recipes-support/bash-completion/bash-completion_2.7.bb
> +++ b/meta/recipes-support/bash-completion/bash-completion_2.8.bb
> @@ -9,8 +9,8 @@ SECTION = "console/utils"
>  
>  SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
>  
> -SRC_URI[md5sum] = "28117492bdc9408438e6041683a423ce"
> -SRC_URI[sha256sum] = "41ba892d3f427d4a686de32673f35401bc947a7801f684127120cdb13641441e"
> +SRC_URI[md5sum] = "201b6ae62f7d5fb5b1b25e34427db919"
> +SRC_URI[sha256sum] = "c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6e349bd903375f54d"
>  UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
>  UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
>  
> @@ -25,7 +25,7 @@ do_install_append() {
>  
>  	# Delete files already provided by util-linux
>  	local i
> -	for i in mount umount rfkill; do
> +	for i in mount umount; do

where did rfkill go ?

>  		rm ${D}${datadir}/${BPN}/completions/$i
>  	done
>  }
> 


