Return-Path: <ola.redell@retotech.se>
X-Greylist: delayed 965 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Jan 2017 14:16:50 UTC
Received: from mailrelay4.public.one.com (mailrelay4.public.one.com
	[195.47.247.71])
	by mail.openembedded.org (Postfix) with ESMTP id 9B17860603
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=retotech.se; s=20140924;
	h=from:subject:date:message-id:to:mime-version:content-type:
	content-transfer-encoding:in-reply-to:references;
	bh=OnytjhywIJ0TjvilFlOVhm/kujJILHGPzD3fVGEauPQ=;
	b=IPQf3eIBovX8yNw2DlismMuqZMy63BxGtNrroU4+Epdzdme3OVyBHhmfQ4fBcjCo5wiHujIu9ukPv
	ysNvEAKIi928c1Gp0m8/3tFCe1YXXz8xP+ZMdSsJ1hdTUymVXNvY8nyaXnGTx/thp+wR4KBPyl8dpd
	MY1W1uAeot/UvrKs=
X-HalOne-Cookie: 11e151387d91241ee9a82bc3cd25ae79aa980ae8
X-HalOne-ID: 053f17d4-d1bd-11e6-9cd7-b8ca3afa9d73
Received: from [192.168.1.3] (unknown [81.230.13.64])
	by smtpfilter1.public.one.com (Halon) with ESMTPSA
	id 053f17d4-d1bd-11e6-9cd7-b8ca3afa9d73;
	Tue, 03 Jan 2017 14:00:44 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <1483450976-22741-1-git-send-email-ola.redell@retotech.se>
	<1483450976-22741-2-git-send-email-ola.redell@retotech.se>
	<2be3f63c-6e0b-27a9-970e-718ba4afe58c@gmail.com>
From: Ola Redell <ola.redell@retotech.se>
Message-ID: <630e4245-5e0f-a696-e22b-15c47c27d8d8@retotech.se>
Date: Tue, 3 Jan 2017 15:00:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <2be3f63c-6e0b-27a9-970e-718ba4afe58c@gmail.com>
Subject: Re: [PATCH] Append KERNEL_VERSION string to kernel module package names
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
X-List-Received-Date: Tue, 03 Jan 2017 14:16:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Thanks, that was a mistake. I did this change in Jethro originally where 
the prefix does not appear. I will prepare a v2.

Ola


On 2017-01-03 14:56, Mats Karrman wrote:
> -    module_pattern = module_pattern_prefix + 'kernel-module-%s'
>> +    module_pattern = 'kernel-module-%s-' + 
>> d.getVar("KERNEL_VERSION", True)
> Why did you drop 'module_pattern_prefix'?
>>         postinst = d.getVar('pkg_postinst_modules')
>>       postrm = d.getVar('pkg_postrm_modules')
>


