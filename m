Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3164F71E15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 15:45:54 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 194so16980458pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 07:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=aUnluupgg8ptRV5ycbvT8InJOODbVbd2gRjmqn0SdOU=;
	b=dKCEZbXrT+1qj9Mkf4tAzoHsC6THosrN4TtmTspABu84f3aYmVCSbQVn95WAon0bpt
	voZPFcxgBJwjFRFlfNYeyD4vohko8arr345OW7KERGrSUHSvOkkFJEbBLsSAnTottK3h
	LP9RRbjD9PTFywhcJ/nIPJCok1QSVyFnG7Wl/keDdxFgkIsLwtNYRkAHO1Wnc1WUPGgi
	R/HYyDD0/tgKNg5s7L1h3A4ghMns7gyhCP5CaLN+C7MyWf2KwYr02kAiAWEfKbAkwHub
	QrU0LUETm8VLJRfY3+qi/eimxahKUU0LloRaT8NivE+jTajIFJkygoZIx+opO5Y+/q10
	5/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=aUnluupgg8ptRV5ycbvT8InJOODbVbd2gRjmqn0SdOU=;
	b=LBILLbRBGIhigMOz0WSZm43aB5CtdtVg1O0cxezPjMER/Twhpa/o8LzeVqV73fTRzJ
	JOIG7TEVd7uvezTFIeuUrttkpXHUJLfSxBS27HcYpFiPlh96FCKv7AD8SWFMHsmBSxBz
	or2KyCo164I3eiLztrtnJQAFvtVNxFrxOABr4gh0wRQ4Q8Zw/srXOcLgBGski4kgGCmk
	tPu5l6Bh297ymOlAawWWedogZIUGMxc/hHyuNTHedaXwAcRAJ5La8J7Zm1qb/2wHcAcQ
	IlicMc3Qn4DcegoS7VhvWXkwqDticPeIHi2v6EcXIo2QqVxs3XJ/3sZAtPnx1oxNjSQh
	mh1g==
X-Gm-Message-State: AIkVDXLr8FPVMbzs+lsGlbUpj90QH9LGvcPPV8hnsidykPTmwoNMFz15kNrlE38Ua2cVLA==
X-Received: by 10.98.95.70 with SMTP id t67mr36571568pfb.37.1485272755376;
	Tue, 24 Jan 2017 07:45:55 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	u75sm6731372pgc.31.2017.01.24.07.45.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jan 2017 07:45:54 -0800 (PST)
To: Mike Looijmans <mike.looijmans@topic.nl>,
	Nathan Rossi <nathan@nathanrossi.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2453DBB31E@XSJ-PSEXMBX01.xlnx.xilinx.com>
	<05c7dfd0-38f3-b684-db94-38121b086a67@topic.nl>
	<CA+aJhH03XW19tEX5nP7WgoV6au9xmms6GuASEHMmRvA-1qhh8w@mail.gmail.com>
	<ee6f0244-0fb1-ad27-6056-a358b5eb0112@gmail.com>
	<1efda273-0a0f-e75d-1364-6ac1815154fe@topic.nl>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d176c428-1cd5-02dd-d49e-c3299128f529@gmail.com>
Date: Tue, 24 Jan 2017 07:45:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1efda273-0a0f-e75d-1364-6ac1815154fe@topic.nl>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Tue, 24 Jan 2017 15:45:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/23/2017 10:48 PM, Mike Looijmans wrote:
> On 18-01-17 17:09, akuster808 wrote:
>>
>>
>> On 01/18/2017 04:08 AM, Nathan Rossi wrote:
>>> On 18 January 2017 at 19:37, Mike Looijmans 
>>> <mike.looijmans@topic.nl> wrote:
>>>> Could someone at least please say "yes" or "no"?
>>>>
>>>> I now have three projects waiting for this patch to be included in 
>>>> morty. If
>>>> it's not going to happen, I'll have to add a bbappend to these 
>>>> layers to fix
>>>> it.
>>>>
>>>> On 16-01-17 18:49, Manjukumar Harthikote Matha wrote:
>>>>> Ping, this has been applied to master
>>> Armin, you mentioned on IRC ~1 week ago that you had merged it to your
>>> staging branch? Any updates?
>>> Also I had a look and could not find the change in
>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akuster/morty-next? 
>>>
>>>
>>> Maybe I am looking in the wrong place though for your staging tree?
>> I forgot to press go. Its there now.
>
> Much appreciated.
>
> Who's next in line to press "go" now? I still have three projects 
> waiting.
Richard or one of his minions.

>
> Apparently the ARM64 isn't very popular, no one seems to care about 
> its build failures...
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>


