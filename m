Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SRQJa-0001ZO-5x
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 17:57:34 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 07 May 2012 08:47:42 -0700
Received: by pbbro8 with SMTP id ro8so23195251pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 08:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=knclVIVT64Ks0T/ED55IBFF6YKSTDQoMujI+I3rKxS4=;
	b=h3r/rNFRzoGiuXVSrBJqAnpu6LpNrsg+5isY9p0baB3Gk0kWcRuVYiuDE9jjDwyAwf
	vUmgCgd+2oKycfuEx+drdfgeU47HhnTzScl6l74s7Fy+LHWc5GDtv38Y9QTiNzJ0P/4A
	wUmyEz6eQD1WHAhsPX8d/3fFVHbqv1A8KPInJudKesXInBmOt35Zzv66+glEeJOBhuEn
	bkDPOTJo2yj0bS/41iPucfhOu520OtjWd9qvN1wax/HbG3uBvWxsflXM2sgwUaKBBlYB
	NTV2cPTNf0z2pi0t4pA7DDO/EyMytjL6oTGY/oP3OCR4W5TIp3UD/zlaL5Job5FQzMhQ
	YOtQ==
Received: by 10.68.225.170 with SMTP id rl10mr6847306pbc.76.1336405661674;
	Mon, 07 May 2012 08:47:41 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id og6sm18647775pbb.42.2012.05.07.08.47.39
	(version=SSLv3 cipher=OTHER); Mon, 07 May 2012 08:47:40 -0700 (PDT)
Message-ID: <4FA7EEA7.5070209@intel.com>
Date: Mon, 07 May 2012 08:47:51 -0700
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
In-Reply-To: <A366210D-D188-4B36-8074-F51C538194C6@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlNQiuI7G6xz3alM8/QZWzeuJOpWGkNQxS9FI4WzO8exSyEk5BEbF9g1BFOluq2oHumGVnj
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
X-List-Received-Date: Mon, 07 May 2012 15:57:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 11:55 PM, Koen Kooi wrote:
>
> Op 4 mei 2012, om 23:25 heeft Scott Garman het volgende geschreven:
>
>> On 05/04/2012 08:16 AM, Koen Kooi wrote:
>>>>>> On Friday 04 May 2012 15:50:16 Koen Kooi wrote:
>>>>>>> Looks good to me. If this goes in, can it go on the
>>>>>>> denzil shortlist as well?
>>>>>>
>>>>>> I hope so, hence I've CC'd Scott Garman who is pulling
>>>>>> together a branch for 1.2.1.
>>>>>
>>>>> oe-core or poky? I only care about oe-core.
>>>>
>>>> Both. Nothing goes into poky these days unless it comes from
>>>> one of the appropriate trees.
>>>
>>> That's not what I was asking. I was asking it scott is doing a
>>> poky or oe-core effort. From Scotts emails it seems like a poky
>>> effort.
>>
>> Hi Koen,
>>
>> I apologize for having made some confusing comments earlier about
>> rebasing a denzil-next branch on my poky-contrib repo from being
>> based on oe-core to poky. Since then, Richard has given me access
>> to the oe-core-contrib repo, and I am now maintaining two
>> denzil-next branches.
>>
>> This one is based on oe-core:
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next
>
>>
> When is that going to get merged into denzil? I'm in serious need of
> that connman tests fix, so I have been using
> http://cgit.openembedded.org/openembedded-core/log/?h=denzil-next
> locally.

The commit just got into master, so I'm hoping to pull it into my 
denzil-next-testing branch and run some build tests overnight tonight, 
then merge it if all goes well tomorrow.

As for the denzil-next branch on the main oe-core repository: I asked 
Richard about this and I believe he may end up deleting it, as I don't 
have the ability to push to that branch. The authoritative oe-core 
branch for denzil-next will be

http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next

until we're ready to do the release.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


