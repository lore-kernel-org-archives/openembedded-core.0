Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SRRRp-0003sI-4f
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 19:10:16 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 07 May 2012 10:00:15 -0700
Received: by pbbro8 with SMTP id ro8so23413695pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 10:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=+Mhwbicv1R4r6EX2Nk1Oh0GPLcXxQqyXzT6gMJq7IJU=;
	b=KFsKqAgnfAbx8t4tu0no/fAI4lM2ArJnjQvzKi2u3LWkD0YeowIn8+87mx5q8i+RK5
	jdFyRmgR4Go4N5LK47Mk3gworXC26ztRH8l99R9dotFvF2vFzqlldJr2t3Se0FW/A3Kx
	6MUcurUyOG86L3EBdD3JoYmYZz1Sf06h8AQaYVvPsaaso1YUNVUZt5Fl+0FEUkf/IRbs
	AIq0NqvPk8R3Lovyn6XaDvwyYlF+Ox7h9rzaA7Pv5gX+SWZ2KSjpcnprDZUqZN+K2VsY
	r5ZDtOFF9KIHb1PzKXSSqrwPHC6dZf8bDeb+IZtaTgZmRwzTXO3nsDLMpQzkvkk5A1mi
	dH0g==
Received: by 10.68.220.134 with SMTP id pw6mr46861520pbc.149.1336410015017;
	Mon, 07 May 2012 10:00:15 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id os7sm13194669pbb.67.2012.05.07.10.00.13
	(version=SSLv3 cipher=OTHER); Mon, 07 May 2012 10:00:13 -0700 (PDT)
Message-ID: <4FA7FFA9.1090001@intel.com>
Date: Mon, 07 May 2012 10:00:25 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1336138307.git.paul.eggleton@linux.intel.com>
	<372b4f451158c03f0d62bf406db1a16a883faa80.1336138307.git.paul.eggleton@linux.intel.com>
	<020C25C7-7981-4351-9AC3-F666A813A35A@dominion.thruhere.net>
	<3787476.jCWbAWHvna@helios>
	<EE194B64-5A8F-40B6-B59E-222D3754F7E2@dominion.thruhere.net>
	<1336144438.23777.22.camel@ted>
	<5FC2CA51-59D7-43CA-8FDB-13B7E97D08E6@dominion.thruhere.net>
	<4FA44961.4090409@intel.com>
	<A366210D-D188-4B36-8074-F51C538194C6@dominion.thruhere.net>
	<4FA7EEA7.5070209@intel.com>
	<DE0A7E5C-90AF-4379-B962-DC7B6FBD1E64@dominion.thruhere.net>
In-Reply-To: <DE0A7E5C-90AF-4379-B962-DC7B6FBD1E64@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnjEh9v1vVEMkoAeXKYBFhgm5mFzvp3sRk9saCZYutaHBVzitmo7nqoq6YmDyZgg/FUQmC3
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
X-List-Received-Date: Mon, 07 May 2012 17:10:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2012 09:03 AM, Koen Kooi wrote:
>
> Op 7 mei 2012, om 17:47 heeft Scott Garman het volgende geschreven:
>
>> On 05/04/2012 11:55 PM, Koen Kooi wrote:
>>>
>>> Op 4 mei 2012, om 23:25 heeft Scott Garman het volgende geschreven:
>>>
>>>> On 05/04/2012 08:16 AM, Koen Kooi wrote:
>>>>>>>> On Friday 04 May 2012 15:50:16 Koen Kooi wrote:
>>>>>>>>> Looks good to me. If this goes in, can it go on the
>>>>>>>>> denzil shortlist as well?
>>>>>>>>
>>>>>>>> I hope so, hence I've CC'd Scott Garman who is pulling
>>>>>>>> together a branch for 1.2.1.
>>>>>>>
>>>>>>> oe-core or poky? I only care about oe-core.
>>>>>>
>>>>>> Both. Nothing goes into poky these days unless it comes from
>>>>>> one of the appropriate trees.
>>>>>
>>>>> That's not what I was asking. I was asking it scott is doing a
>>>>> poky or oe-core effort. From Scotts emails it seems like a poky
>>>>> effort.
>>>>
>>>> Hi Koen,
>>>>
>>>> I apologize for having made some confusing comments earlier about
>>>> rebasing a denzil-next branch on my poky-contrib repo from being
>>>> based on oe-core to poky. Since then, Richard has given me access
>>>> to the oe-core-contrib repo, and I am now maintaining two
>>>> denzil-next branches.
>>>>
>>>> This one is based on oe-core:
>>>>
>>>> http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next
>>>
>>>>
>>> When is that going to get merged into denzil? I'm in serious need of
>>> that connman tests fix, so I have been using
>>> http://cgit.openembedded.org/openembedded-core/log/?h=denzil-next
>>> locally.
>>
>> The commit just got into master, so I'm hoping to pull it into my denzil-next-testing branch and run some build tests overnight tonight, then merge it if all goes well tomorrow.
>
> Merge it into the oe-core 'denzil' branch, right?

No. I do not have commit access to the oe-core repository, just the 
oe-core-contrib repo, where my sgarman/denzil-next branch lives.

Richard is on holiday until tomorrow, can you hold on until then and 
maybe he can help clear up the remaining confusion?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


