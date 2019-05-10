Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 92DCE7C39B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 20:18:23 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x15so3308642pln.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 13:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nnpvx+LIVw6b7a2/3Du3aRCeRnxx368bwH824JVQj8o=;
	b=qcaRzMTPX9r1uyEt8z4KHOkDtnIc9QWVNMHsj1GOZiBoTJRjcjnAwGcicxTIqsp+LS
	XHa+JHegupOX+rDdhvGl4abMVJJ9j5dMxw73/4fWDmI64Q5e/35T5GGJ79hqMeSSMJOt
	aPDewIqqaD6V2Z2wBiioE5C3GGfxnfnGhDV1ZUNdmPGPin725lFeVHtnhF2mWYuOexH0
	K3hk/YIhSNPRPVStM8aVxFnFFMKe3pcyxfeL3wBwFuCZMRt6ZlTTdgMR9dHPiWi8kpSS
	REicpuYj+yyG3fX01+ZvvQMymMTET0FEucpVXgotahuG0NGKYfbfQkjuKADtrkQUtP7m
	MVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=nnpvx+LIVw6b7a2/3Du3aRCeRnxx368bwH824JVQj8o=;
	b=nccZeitPFmCYAHulA77y+tEDCjgcxvSdw55VHPS8KXePTsemlEZsM6Ck4tOXwPIqQ/
	sPRkYT71uwrsVYP7Kz00OPuwngnOdsTzlZefAIYzRugTTxvmPN6jbM32W8DCbSlko079
	yhF2WoVHonWPm8Iuh5Ht7VTApH5vp6XdlP/fjXnySFmMVud8JrAHKDvv+nkZqzIk7b2c
	4eVP7LEcZmyDtgVx1aPVqQPoEdVLYUuKU0x2x8BWlzXhnSuEiv9MhXMhSt0eCQ7G0Rps
	Vy2W8iL71yiETh0OQR17LYERSaIo5qeuOt4AabUi+7LrNoV9Ss2F1N8PweuKWvHXOME+
	upwA==
X-Gm-Message-State: APjAAAVhprfv4Pc5PiQg/R/WJVykZNLHrm7UuxaYfBL91wnJ4BwTHNfl
	N0peWMAqaX2czXRdWJSlPpO3osx3wkw=
X-Google-Smtp-Source: APXvYqwftl7wSwd2922yucLa0X8+0cmrfCc3k407fQoL8iUtR9DAmLZaR2JROTutID7GHFmvsM31GA==
X-Received: by 2002:a17:902:7241:: with SMTP id
	c1mr15437131pll.326.1557519503674; 
	Fri, 10 May 2019 13:18:23 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:6095:8839:3497:2f69])
	by smtp.gmail.com with ESMTPSA id
	v64sm8223083pfv.106.2019.05.10.13.18.22
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 13:18:23 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
References: <20190507211954.10762-1-open.source@oleksandr-kravchuk.com>
	<20190508131225.GB25917@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8fa36d98-3590-e106-30ce-9f3a6fbee532@gmail.com>
Date: Fri, 10 May 2019 13:18:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190508131225.GB25917@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: remove GPE_MIRROR
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
X-List-Received-Date: Fri, 10 May 2019 20:18:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/8/19 6:12 AM, Adrian Bunk wrote:
> On Tue, May 07, 2019 at 11:19:54PM +0200, Oleksandr Kravchuk wrote:
>> The site is down and no recipe is this variable.
>> ...
> 
> Not in OE-Core, but
> meta-openembedded/meta-oe/classes/gpe.bbclass:SRC_URI = "${GPE_MIRROR}/${BP}.tar.${GPE_TARBALL_SUFFIX}"
> meta-openembedded/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb:inherit distro_features_check gpe
> 

ltg.org is long dead, this patch should go in.
I think meta-oe recipes should be changed and pointing to something 
accessible, we have copies of the tars in sources.openembedded.org


> 
> cu
> Adrian
> 

