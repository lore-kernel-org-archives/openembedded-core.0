Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 175AA74579
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 02:42:51 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id u86so4550152pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qbpF0VpJoZT/sGsT6evi6EQapsW6tEVUKLG9sOAxito=;
	b=QcLGQU8uJfxHxk+RXgiGhoiZhCMKEge+1PYrjLXu5pxVS7N9qxZuHtF5iLCGvazjCL
	O2bRaWw9gDafEbjwGeKTy7C0X+ChgFzfkcsgHv/snvyHRMmfEiBv0fMX865UO4isUQd/
	XWlqQU09m9IOELQCTwERsYPTvpSnRD4vTz8VeChchVukVKw74s2cnQFrC0vk2lHjTRTA
	KJQPG2X/OxVsxeFKj5UyQEjqdXpxDMabnp3CxAkyeZnQXuHeBbX6TxMGYqJx2A7mmJFo
	EWgAAivJ5Vy5N702JhNn4KjMaTn2AfGU+XOsZBo4IAs8QtmsPoAgL7VJBHLPEDxDJRMp
	owYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=qbpF0VpJoZT/sGsT6evi6EQapsW6tEVUKLG9sOAxito=;
	b=rW3WdpuSEqdjra+IvghuwAGWNSEchJaTnq6b25eXEGPUNjjWWWxKgPgTJCxyq3qGSB
	8Z3rkf8sRmu0hT0CacJa+mXb4hCkc1aRdUyhJIcGvyliQtPW5IWUvTQ2azVrJXQtzzCd
	piEuU+ti6ch5LciiWsQq0rWR8fgt+GNg9TO8WPHWmTnfHpbjdjVw1uIsNAHAN84r1GmJ
	6Ko5wRRrO4q3JAM+tA11LA9RTNdqgjFGxSLK34yXUoCymsEyZtURviEkFS7Gb9PVYgJg
	QQTOPMVQLul7VStDHKm3hYT3CJrmzA06eYZS7/BimnAdfvXp9NvDFUkUEaDJP7qTm02k
	L4Ww==
X-Gm-Message-State: AElRT7GFrxWZ2lQ7k132GBmhVJVyDx3IYURd7A4oBl7VJejtoJCJWVNi
	zOCQWrAH4hcSUcs3LxF62E4z8ALv
X-Google-Smtp-Source: AIpwx4+9Z65WHuna/NB74Bw/ckdmQaxQJGezcjXjB4SWwXo2PJzKiI+ouWxizwuCBadvwwX/MHmIzQ==
X-Received: by 10.99.164.18 with SMTP id c18mr7212421pgf.85.1522377772727;
	Thu, 29 Mar 2018 19:42:52 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:5848:7757:d324:b89f])
	by smtp.gmail.com with ESMTPSA id
	d12sm13142861pfn.42.2018.03.29.19.42.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Mar 2018 19:42:51 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>
References: <cover.1521507765.git.denys@ti.com>
	<20180329224129.GK2786@denix.org>
	<CAJ86T=Xi01mESEX8D3YAXo1OXj5d93y8wXz5qJw1ffKqHeXjQQ@mail.gmail.com>
	<20180330001724.GL2786@denix.org>
	<CAMKF1soF7xRREZJAD65MpWQ+doNSfu=GwJcMVzNbA1nen3NcUg@mail.gmail.com>
	<20180330023408.GM2786@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c49fc448-a79d-1492-a5d9-398968aacd83@gmail.com>
Date: Thu, 29 Mar 2018 19:41:46 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180330023408.GM2786@denix.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Fri, 30 Mar 2018 02:42:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/29/18 7:34 PM, Denys Dmytriyenko wrote:
> On Thu, Mar 29, 2018 at 06:38:58PM -0700, Khem Raj wrote:
>> On Thu, Mar 29, 2018 at 5:17 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>> On Thu, Mar 29, 2018 at 04:39:27PM -0700, Andre McCurdy wrote:
>>>> On Thu, Mar 29, 2018 at 3:41 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>>>> Ping. It's been 10 days - are there any issues with these updates?
>>>>
>>>> Only 10 days? :-)
>>>
>>> Yeah, I know, I'm too demanding... :)
>>
>> Ross does pick the patches from ml fairly quickly so always check
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=ross/mut
>>
>> or OE-Core's master-next
>>
>> http://git.openembedded.org/openembedded-core/log/?h=master-next
>>
>> from mut to master it might take a while since there are many patches coming in
>> so integration takes time and sometimes there are issues with infra
>> which can delay
>> things,
> 
> Yes, I'm quite aware of all the above - you don't have to mention all the
> details to me. 

I am glad thats the case. It was not clear from the message and some 
times this can be misconstrued.

Still, it's a standard practice to inquire about own patches
> once in a while. Especially since other similar non-critical updates are
> merged right away. This is the only way to know if there were any issues with
> the patches themselves, but Ross forgot or didn't have time to follow up yet.
> 
> 
>> 10 days seems pretty darn good in some cases its years see
>>
>> https://github.com/projectNe10/Ne10/pull/143
>>
>> in the end as long as it makes upstream.
> 
> Heh, I don't think we should take that as an example to follow... :)
> 

