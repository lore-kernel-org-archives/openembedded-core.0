Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 87B3F787C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 18:43:17 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y5so6404327pff.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 10:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=mfriUtYfIJjzUTIMdgxZPIQKoR0EY6UXMlnKXitJYbU=;
	b=DRytkhMjmkzrbNVaqd+jQOIK/ZtP+tTMIroLBj+rQYzLsCC1Qogujlm99Ehgh19c23
	Fu1NH34mOAvH0nu8vFGF3zaVMN/veVw83lDKEiDt+2AkNKBGaZk1Z4sjfDa5AOELhTIc
	DbmtUq9sUV2HejYlbskGSk+P2dnGeA164MGPc8TuYIuNHXt62oFNkyLuVw5J4rGPRRW3
	OlJXWJ4sYz6POySFO28PYZX3TIe2If+P9/JaPt8TzqHL2QkR+T9HV6IvZ7Zp5ZOhsYbZ
	PvFdw3vcmEgsED4/MeMwiEjsGTRk23sEMRe7FQI62ahBCPuM3gNAMLApZEoqlJrtHmhm
	gvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mfriUtYfIJjzUTIMdgxZPIQKoR0EY6UXMlnKXitJYbU=;
	b=BO1IPdn9lyIoCWG7g1S4FAhoWnqp5Jn999Ie3Wzvv2KSM2p9HyBvp4msLFJDf9GA30
	yDSszNsiJrSbXKlDul9nJy35nli7jKaj3uzZCmw5mTl3MKjh41NC2NSy9VAhqxB+PBKC
	UV0wrERAn74271s84jVXvBEDjIJNJcEiO5f7kBEEbtVpvULmbRLUUIEW2Vqq5wAM+dH9
	sIr4rtHKtE1+fTmK8T9G21LjJ+s8SX3mEFvYHEHiMbn/tKtQlY/R2gKAWXZvypyapITr
	WFvv+jx9OAqiShpmBhqzduWvyK7yEV1ty7pfeDj7AnXweRUL3/V9+h4WIucRzozJ5ZL4
	lnCg==
X-Gm-Message-State: AKwxytdnmeUtYbEMFpFOaL5qbea+KPUWTKjeitVrZJQjLk+iooJEdKkt
	o/kYr1uSo4+lEDT0A5P+j851AZg6
X-Google-Smtp-Source: AH8x2260kPKDfT3HX8/zcBHuJiNTpW+nl48ptIuoJfetiTf3abj0ym6fK0hGEXyVopQzg06PoCEsxQ==
X-Received: by 2002:a17:902:2cc1:: with SMTP id
	n59-v6mr11829260plb.153.1516905799264; 
	Thu, 25 Jan 2018 10:43:19 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:c139:8d30:e308:8c2a?
	([2601:646:8880:466c:c139:8d30:e308:8c2a])
	by smtp.gmail.com with ESMTPSA id
	w63sm17330764pfa.173.2018.01.25.10.43.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jan 2018 10:43:18 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20180112130644.21313-1-alex.stewart@ni.com>
	<CABcZANms2fcX1rmeY_vGsCmMcxhicCKEtDs0mOaX8uCt=8fgLA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <8fc59c03-627a-78f3-70c7-cbcb97f90c60@gmail.com>
Date: Thu, 25 Jan 2018 10:43:16 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <CABcZANms2fcX1rmeY_vGsCmMcxhicCKEtDs0mOaX8uCt=8fgLA@mail.gmail.com>
Subject: Re: [PATCH v2] recipes-core: move hwclock.sh to util-linux
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
X-List-Received-Date: Thu, 25 Jan 2018 18:43:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/12/18 7:45 PM, Christopher Larson wrote:
> On Fri, Jan 12, 2018 at 6:06 AM, Alex Stewart <alex.stewart@ni.com
> <mailto:alex.stewart@ni.com>> wrote:
> 
>     * Move the hwclock.sh initscript from the busybox recipe to util-linux.
>       This script is generally useful for distros that get their hwclock
>       implementation from sources other than busybox and we follow debian's
>       example by providing it in util-linux.
> 
>     :busybox/*
>     * Remove the busybox-hwclock package, as it no longer has a purpose.
>     * If busybox is configured to include hwclock, the busybox package will
>       RDEPEND on util-linux-hwclock-init.
> 
>     :util-linux/*
>     * Provide the hwclock.sh script in util-linux-hwclock-init, which can be
>       pulled by any packages that depend on its functionality.
>     * util-linux-hwclock RDEPENDS on util-linux-hwclock-init for its
>       initscript.
> 
>     Signed-off-by: Alex Stewart <alex.stewart@ni.com
>     <mailto:alex.stewart@ni.com>>
>     Acked-by: Haris Okanovic <haris.okanovic@ni.com
>     <mailto:haris.okanovic@ni.com>>
>     Acked-by: Adrian Ratiu <adrian.ratiu@ni.com
>     <mailto:adrian.ratiu@ni.com>>
>     Acked-by: Ken Sharp <ken.sharp@ni.com <mailto:ken.sharp@ni.com>>
>     Natinst-ReviewBoard-ID: 214983, 215755
> 
> 
> Just a note that this will slow down the build for targets that wouldn’t
> otherwise build the util-linux recipe.

there is initscripts recipes, perhaps thats a better place for this.

> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
> 


