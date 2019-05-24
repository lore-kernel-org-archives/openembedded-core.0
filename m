Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id A25767D26C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 16:13:09 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id o11so691570pgm.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 09:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PJbrJOmLsEK4U4rsL1KeoYugKONcdOQZoQqFkmad12s=;
	b=uHsXjsgUXFbsBR3YFfMqcvf0D2fd+efKUsxX/Xx0ZQVO5Q0zyRFuXGvyIhdCP6g7pp
	j0pIk5osBs6b8wU5flFGuvduaOqJeRDEb6yUHjdMeXOYysKIz7/n9fH1ImU9QuJW2dEM
	Ho+V9R/92t21DKxuvqPrsMpk1ZYdQh+7sQIPwajGWnrAEcNuerQTENyUR1tNxEXDrE7d
	cUqQ8qtNyTlQK5ddKM1SON9OixDxU/IJOBsNIAuym9VvyAZNY/lycjMBDNiGxQPYWDML
	ZvSV5DUyGTeI+xHoMNtOVfSeayCwHj9CABCrOQNCaVQqRiiK/IopRGH6a1GF2VQ1E3wt
	FU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=PJbrJOmLsEK4U4rsL1KeoYugKONcdOQZoQqFkmad12s=;
	b=MhYYDE+86TdZMNM3jxoezwXMG+DA1VxQ7vzfMwUGr6zl7XfQ2XOQ2bAL5f+bVahOFz
	YM7mX4Ac0t9VBdkahm6p0kMBNHrrwEQrl+ZVS0LyQ3s77CJwDnUZ3TIWNtyQmb0CSuAw
	ByFnA2arDv+66mIkLrry5GvVB1ppbDYAnkbCPym7qW6EytKzIdj8iLsdH2Z80UtiZJPI
	F2+AIS0P+CuQU7cAVk4Baj5ul3QXxta0T5NBDuAd5lKsys7Gwzm1di437X915vQFo+jX
	2hllND9Q72uUOgvvo/2dP2gA8V3M1vggr/qGgYlDZcbxOwAn06PFpm8s4V8PaTTloYGr
	x5Og==
X-Gm-Message-State: APjAAAU+kWi6OJz/x+wHhmwhVrOxc4I67EV0y6vcyzH9Co+VSpdHsCd+
	2s27xNkSi6LpxVP2UUmR+FUsVBlm8Qo=
X-Google-Smtp-Source: APXvYqzUqX3ePC4iriREYXm2zvkcEU+idGo14DEH3DUGYghOr2sqJ2SPchK5gy2Q8idHQFth1QuhJw==
X-Received: by 2002:a17:90a:ca16:: with SMTP id
	x22mr10210001pjt.98.1558714390177; 
	Fri, 24 May 2019 09:13:10 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:90a1:c429:7580:7c44])
	by smtp.gmail.com with ESMTPSA id
	p14sm3585666pfa.112.2019.05.24.09.13.09
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 09:13:09 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190523103352.GA25084@localhost>
	<CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
	<45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
	<f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
	<20190524101211.GA25912@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
Date: Fri, 24 May 2019 09:13:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190524101211.GA25912@localhost>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Fri, 24 May 2019 16:13:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/24/19 3:12 AM, Adrian Bunk wrote:
> On Thu, May 23, 2019 at 07:16:53PM -0700, Khem Raj wrote:
>> ...
>> but I think dropping
>> systemd support completely from musl is not an option I would like to go
>> with, there are cases where this makes sense. Especially when you have to
>> cater to different set of devices from small to big, userspace remaining
>> same is big advantage atleast in the world I am in.
>> ...
> 
> That's a good point - when arguing against systemd as default init system.
> 
> systemd is bigger than glibc, therefore on very small systems where the
> size of the C library matters using systemd is usually not an option.
> 

Yes, design-wise I concur, in practice, desktop distros rule the linux 
world and systemd is quite prevalent there, so sometimes you have to 
wear the shoes of same color, atleast thats what I see. apps want to run 
uniformly on both OE and non-OE systems

> cu
> Adrian
> 

