Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 751B260102
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Aug 2017 14:55:56 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u185so6455930pgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Aug 2017 07:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=H3Sloas+eljg8jgIwwB6PtqWDfmRuHMurvpDGKR3A0s=;
	b=OjUEnZMwmUUTnvrsOMsp819r46W5dP8uZckKk5FjjiOZeR95USs1hWlfBeR0g1Q4Aw
	bFcO4oJrk16+rOTl6z32pG4poRHl6f1GzJriUY+Duspq0nbukd+YQXTDzlVkr2gQt1lw
	GiWffYbpf3UgAi+mfgcPddcXFepKPSLAN+ZPfZusSLha3PUxvPO6NwY+QrJe6c0J41Kr
	ylukYmOc8l97bFrvd4iPwlN3mfv750bwlGfzRurxTw4eRcTIbpmhYYgYTMu6Y4BJLt/K
	xzGFEyweaomMeUM6d42hawPZYqDibnx8bcYqssc5gR43dojUjzQqWvWfN4zidxP3j8CT
	8rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=H3Sloas+eljg8jgIwwB6PtqWDfmRuHMurvpDGKR3A0s=;
	b=a3dVuqvREE3JQHxKuogevDVkKuU2qtqiHhwJ32DFjoFbGWddDYTg0UXOWX1RWmqEkR
	ilHDGCOSyzTX85MfJexxGbfyF/7SnWkI8xsbbGIm8ZGpLt7mk5ngzk3l09bOcqRNB+Ce
	QwuCNgjI7vrzvSoFM42TpyQxzaLP2kIk43N28AUk+LfE4JrTNBcDDtUKQO31f6K81TFu
	rpEKkgc12HfAgqJzwjX9gzuljnqJ9P6yJf0JJg9VFKiUWalTR/mAGWWkUAS3NVQDvGdD
	hOEXjfSzOjI76Eio8dvQH9EsLjYAYTZPS7zI3HgJ7sE1MhFRbjtfIp3vmiWCcaf7qmQ8
	4OpQ==
X-Gm-Message-State: AIVw1126ZSrPE55FCgnBRRHbCIbMb84uC1JxJ+hSxLDjKhhx5WHzVKST
	dD4KphW+V0fJB88k
X-Received: by 10.84.218.136 with SMTP id r8mr10429678pli.111.1502031357597;
	Sun, 06 Aug 2017 07:55:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:2c74:fedb:e59f:1991?
	([2601:202:4001:9ea0:2c74:fedb:e59f:1991])
	by smtp.gmail.com with ESMTPSA id
	b6sm13494207pgn.67.2017.08.06.07.55.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Aug 2017 07:55:57 -0700 (PDT)
To: Anton Novikov <a.novikov@yadro.com>
References: <14e5f528-a64b-94e2-4e86-7a22770623d6@yadro.com>
	<9d9d1ea9-d594-e08d-9e17-858b10a1aeca@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <51be8a79-1ea5-0387-4c06-43048a48e728@gmail.com>
Date: Sun, 6 Aug 2017 07:55:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9d9d1ea9-d594-e08d-9e17-858b10a1aeca@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] (morty) Arch Linux build fixes
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
X-List-Received-Date: Sun, 06 Aug 2017 14:55:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/01/2017 02:50 AM, Ian Arkver wrote:
> On 21/06/17 10:05, Anton Novikov wrote:
>> [3 patch attachments]
>
> Any word on getting these patches applied to Morty? Is anything blocking
> them? Maybe they need resubmitted as individual patches?
>
They do seem to apply cleanly on the current tip of morty
> (7d5822bf4c) and do fix various automake and gcc7 host build failures.

The gcc fix was already back ported

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/morty-next&id=dc4cf876f594240f7fe893a2bba43484f94dc7ac

and so is the perl fix.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/morty-next&id=dc4cf876f594240f7fe893a2bba43484f94dc7ac

the elfutils too

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/morty-next&id=de3c26330b277d217d14116f80c7d2ac712ce954

they have been sitting in my contrib branch for awhile now, we hare 
having issues getting a clean build out of the AB.

- armin
> Regards,
> Ian


