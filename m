Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id C4A8A7886C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 05:21:49 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id b7-v6so5516171plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2018 22:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=isanpvEyz6uKHVBaBkAel1Ed8dz1bkvxoJCHMrFn1IM=;
	b=Q5SqBt8HusRgiIy91qx6fkzF9tgnOzp4KOZVmJJQxVqTLVurJjwaIsnhd7Zyeu05Sp
	xKEOHREwnEiazK0hJXrLvb6ekmVo4Bh70lu6fnxUi3nyXz+GkE1Iht2aHkp14am/9LqN
	sJBLPkoJtciX5KWQqbV+eNhBTdQFlwlBoTqu026GjjbEDGSAZXV0cBvaojvDoDJfA3aW
	lx+keqkp4v2fgjpOxtOqH2vRX9YIu0lBlqQ6lY89BM4vRKHzCrb4/4ItwI0vk48OS8hR
	xVcbWcXrea0Bi2YOWReJAwDPRVPPSSOl/CVEPwO6xItw2ylXFvlLAMBbKr6o/50U76RD
	f3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=isanpvEyz6uKHVBaBkAel1Ed8dz1bkvxoJCHMrFn1IM=;
	b=ik6NxKjncG8uBV6Mf00HlCSKlHI96faze5lDpo5AtCJV0aAPItwemxvNwgSdBzYpMa
	szLFlEzIgS0Jg+lzTh7KLry0I2hyfnzc/rm3rNi3C3pQ+rmYlQ2sBM9szF7MIH4IK6Mz
	wuOyt+VPWClFZT5dMzppqD1K8a3zOjXjYrwfllAGJ4C7I5CtF2tTmkQhklKd33MIdol6
	S5zw2mcEd8qVKiWW+fhfWzdSlggNuW4fkRf9K6xxAI1BW0VLmgsE2fs4+CtuODJtYJRK
	1BognUFb70in1QTdLgTod/5tM1vbohA8KUJbsteAxSKPIhYPyfiPs2CmcX1qs4l/IpB7
	QXWw==
X-Gm-Message-State: AElRT7HNhAv5OMGKci0g3PypaLk15Ayc7LTE+i4UR6hUWCKd1OFpZbyR
	/d3PpuYueMpLQnK1ArUNAnDEsi2t
X-Google-Smtp-Source: AG47ELsfNHTuH97KCB8IjlqzfPf/wYz0jyfC+UzVBiqIthPb4hPzI1CBv4SEYDyiwHQH36e+QV2Ctg==
X-Received: by 2002:a17:902:6c0d:: with SMTP id
	q13-v6mr6486230plk.350.1521436910637; 
	Sun, 18 Mar 2018 22:21:50 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:88cb:1f0a:76ca:272f])
	by smtp.gmail.com with ESMTPSA id
	k67sm10131950pfj.36.2018.03.18.22.21.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 22:21:49 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<a0a682c8-6b75-2fa7-eba8-b451d09b1230@windriver.com>
	<88e2bc77-5959-fe48-6372-da4f0c017e15@linux.intel.com>
	<284e46cf-85e6-8950-396f-427085a201a8@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <7a4710db-7c9c-105e-a119-038a93352082@gmail.com>
Date: Sun, 18 Mar 2018 22:21:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <284e46cf-85e6-8950-396f-427085a201a8@windriver.com>
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Mon, 19 Mar 2018 05:21:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 3/18/18 9:53 PM, ChenQi wrote:
> On 03/17/2018 03:27 AM, Alexander Kanavin wrote:
>> On 03/16/2018 09:30 PM, Randy MacLeod wrote:
>>>> This new version has dropped ptest support, as there's no easy
>>>> way to do this in the framework of meson.
>>>
>>> Are you talking to the meson developers to see if we/they can
>>> come up with a way to do that? Is there an issue opened:
>>>     https://github.com/mesonbuild/meson/issues
>>> I didn't find one.
>>
>> Yes - please be more specific. What are the difficulties in building 
>> and packaging tests when meson is used, as compared to autotools? If 
>> you need to patch meson build files in systemd source tree, it's 
>> totally fine to do that.
>>
>> Alex
>>
> 
> Hi Randy & Alex,
> 
> For autotools,
> 1) if the test framework of some package is a standalone set of scripts 
> or it could be easily decoupled from Makefile, adding ptest support for 
> such package is easy.
> 2) if the test framework of some package is coupled with Makefile, we 
> need to adjust or replace vars in Makefile, install make on target and 
> rely on the Makefile to run tests. In such case, adding ptest is not easy.
> 
> For meson, the test framework is coupled with meson/ninja. We need to at 
> least install ninja and meson on target as a first step. Maybe we need 
> to adjust other things in do_install_ptest. That's why I said "there's 
> no easy way to add ptest support."
> 
> Why didn't I look further into this problem? Because I view ptest 
> support as optional, not necessary.
> What I thought was: "let's upgrade the package first. If ptest support 
> is required from community, deal with that in a separate patch."

ptest is quite important as we move into future. Although here in this 
particular case, where systemd has changed the build system and we are 
doing upgrade at same time, we might consider it, however, it should be 
an important thing to fix before release.

> 
> Now that I've got feedback from you, I think I'll look further into this 
> issue and try to add ptest support via a separate patch.



> 
> Best Regards,
> Chen Qi

