Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 924937FD4F;
	Fri, 24 Jan 2020 19:27:48 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y8so1174227pll.13;
	Fri, 24 Jan 2020 11:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Hi4yRFdmSWpyEzmB+ac7FqvT/PeM0YyqQ5j/uGhaiJg=;
	b=KUsZNXkEv1PTW1F7ZmhcInxvHUzEXDhX4x5VvavnyvIJtFEIYmMNUnI/Hlczp5XkSe
	TMnbjsoQbOQob2Qp4uk36J3zmz+D75LuTWDtgYa+j/IImhkmkbJlgqHsgr6PavP7MN8s
	V3EPiFo8U9b0I92j1iWI6OC/Iz5BiBtl5ozsgOfuursCeIcRCwvUNb6FCOrPWQKTD/eZ
	WPOXjjiFfQvU+IwyXhF3jKdIFwlORqoHJeOiMm2/yplVdOAGMvQsZk2mntZrrzyzQ1s8
	yo1CgLkSTNsvVuLuiCtp0wY1lvgeZFl1V92uPte9M6SfSADhr1zL+htZLPNB3xwl76WU
	Wk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Hi4yRFdmSWpyEzmB+ac7FqvT/PeM0YyqQ5j/uGhaiJg=;
	b=qiMJOK3/uLSuvW60MShLpyNZ6XS771NOWWgSQNzUOGAj2Gy7278xALANMBOiQdW8Xz
	ReyQbyE9DmH2nVSlbrqI9oi6v521BKlz5ijMvYO2ob3k3tHsFfUjGiUIQQ7EVYQfjUfp
	GQLCh+zFGSjH/gJrF0j8f40j+9DlCKQt4F03nSbNuOZuvkEtrsgs3q8jykTZXWMdCa1k
	t0xzFgc/16Tn/5ziWIjz1GiJdoCA04lYfaVZZwYXhsfWSGZkzm5DpZQHZYjWQQ6OxtLA
	vLZEWGyzGHAfRhw8Zxx4RXx8BWduh4Mv4Tly/iQJfzf08G1ggWMlZR2yGZgnW4FsheDb
	9+5w==
X-Gm-Message-State: APjAAAWqxIrnQ8Sze63YhCadMtZX+4az15KIqZEsJ0wX1NlcrAfnZn2I
	st/A0LReY+XkQGb5TvZ57Nntuq8DiUk=
X-Google-Smtp-Source: APXvYqxLa9CcnyRck8l7G9aJtLoB3PsOhHnNbruraNN5dh8+ZRTp91UsfJLQuGV17DGw9XxyAzsTmg==
X-Received: by 2002:a17:90a:3ae5:: with SMTP id
	b92mr841421pjc.26.1579894068918; 
	Fri, 24 Jan 2020 11:27:48 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:5dac:ba30:48e4:cb20?
	([2601:646:9200:4e0:5dac:ba30:48e4:cb20])
	by smtp.gmail.com with ESMTPSA id x21sm182668pfq.76.2020.01.24.11.27.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 24 Jan 2020 11:27:47 -0800 (PST)
To: Andrey Zhizhikin <andrey.z@gmail.com>
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
	<CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
Date: Fri, 24 Jan 2020 11:27:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: python2-less meta-openembedded build results
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
X-List-Received-Date: Fri, 24 Jan 2020 19:27:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/20/20 8:51 AM, Andrey Zhizhikin wrote:
> On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Hi all
>>
>> Recently py2 is removed from oe-core, So I did quick patches to get a
>> world build going. And
>> here are initial failures, please help out with recipes your can or
>> care for. Eventually, the remaining
>> ones we can blacklist for 3.1 release.
>>
>> http://errors.yoctoproject.org/Errors/Build/97185/
>>
>> I will post more arches as they become available. If you want to try
>> the same for machines/distros you can try yoe/mut for meta-oe
> 
> I've actually asked Ross about similar failures, specifically in
> [meta-openembeeded/meta-python] where there is a good mix of Pytho2
> and Python3 still present. I've started to remove those yesterday, and
> would continue with that layer further.
> 
>>
>> https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
>>

All these changes are now in master and its again buildable, with or 
without meta-python2, with meta-python2, its back to where it was with 
everything  building however, without py2 layer we have some work to do 
so if you are interested in this here [1] is initial list of failures
I will keep posting more as we go along.

[1] 
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/steps/8/logs/errors

