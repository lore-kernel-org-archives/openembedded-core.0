Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SQQAD-0000HM-PQ
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:35:45 +0200
Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 04 May 2012 14:25:57 -0700
Received: by dadv2 with SMTP id v2so4623871dad.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 14:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=fPxHVXQUEGbvE8An8Iuy+nl6IlunW7mztysCDUeyeb8=;
	b=hg136HEo3ejfxjcwpYtpgJMprmcUe9LFk9384AaOgAwuNY8xU2wZLpa2u97N7yiIp4
	BngfR4Y8bhvTKGrNJ1FZ5DPsd8K4BhZjJ48Klq3YjwtF49COqN7zn0aj/B0aLmlXWkQa
	X0xGd0H9TzGzvWB0draoFxHtK1LSc30nz/vx6ZLEXuF9u4ga2Ev2zrdyEde21f9Sm9bZ
	qDz2QamhIeKmy9KjPGeFvATnO/FicTW85OAYbPVVZ2HveEqQNGtDniIY+IGbiDqoEX4k
	PASar/sx8luSHal6FTO3GbciN4uJiFjbv/f+Xone9u5YXWtUYczETR39vabogyK8f/PA
	/Qxw==
Received: by 10.68.221.227 with SMTP id qh3mr14992687pbc.43.1336166757070;
	Fri, 04 May 2012 14:25:57 -0700 (PDT)
Received: from [192.168.10.254] (c-98-246-229-6.hsd1.or.comcast.net.
	[98.246.229.6])
	by mx.google.com with ESMTPS id og6sm9684322pbb.42.2012.05.04.14.25.55
	(version=SSLv3 cipher=OTHER); Fri, 04 May 2012 14:25:56 -0700 (PDT)
Message-ID: <4FA44961.4090409@intel.com>
Date: Fri, 04 May 2012 14:25:53 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1336138307.git.paul.eggleton@linux.intel.com>
	<372b4f451158c03f0d62bf406db1a16a883faa80.1336138307.git.paul.eggleton@linux.intel.com>
	<020C25C7-7981-4351-9AC3-F666A813A35A@dominion.thruhere.net>
	<3787476.jCWbAWHvna@helios>
	<EE194B64-5A8F-40B6-B59E-222D3754F7E2@dominion.thruhere.net>
	<1336144438.23777.22.camel@ted>
	<5FC2CA51-59D7-43CA-8FDB-13B7E97D08E6@dominion.thruhere.net>
In-Reply-To: <5FC2CA51-59D7-43CA-8FDB-13B7E97D08E6@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmOFjTkAniagqo+4IRT7KZ27EDvG6wVz0vUHkNpdfNeQZnDMHCWV2x1jx4jGk4VHs1f+Ctw
Subject: Re: [PATCH 1/1] buildhistory: fix multiple commit of images and packages at the same time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 21:35:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 08:16 AM, Koen Kooi wrote:
>>>> On Friday 04 May 2012 15:50:16 Koen Kooi wrote:
>>>>> Looks good to me. If this goes in, can it go on the denzil
>>>>> shortlist as well?
>>>>
>>>> I hope so, hence I've CC'd Scott Garman who is pulling together
>>>> a branch for 1.2.1.
>>>
>>> oe-core or poky? I only care about oe-core.
>>
>> Both. Nothing goes into poky these days unless it comes from one of
>> the appropriate trees.
>
> That's not what I was asking. I was asking it scott is doing a poky
> or oe-core effort. From Scotts emails it seems like a poky effort.

Hi Koen,

I apologize for having made some confusing comments earlier about 
rebasing a denzil-next branch on my poky-contrib repo from being based 
on oe-core to poky. Since then, Richard has given me access to the 
oe-core-contrib repo, and I am now maintaining two denzil-next branches.

This one is based on oe-core:

http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next

and this one is based on poky:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgarman/denzil-next

My workflow will continue to be based on how Richard pulls commits into 
Poky master - which only happens after they have been merged into 
oe-core first.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


