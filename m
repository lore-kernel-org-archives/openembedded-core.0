Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Syt5t-0005N8-08
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 01:21:45 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 07 Aug 2012 16:09:57 -0700
Received: by yenq6 with SMTP id q6so151436yen.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 16:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=WZyWQhS4+AwrjkAkGswu8veHFN/zAwmEu6dOp42Ibh0=;
	b=Lvy7uTs6UfcvKICibOgcoiOniORiRtmzbMGqSBX+BHLUDmnjE0grVnkyvSNeBNjHbA
	Xq7pj4DCXQLZJ71v0CxWioNT0rg4OasGXeoJGF6ia29HrIbWiwVjmgFxaxWIt8RMr5j4
	nQyLkfonzya7nvNcTFiO67OZs57w3bzAtd8HMsWqy771aJdU+UN9U95Nqm78UWRo+o81
	1Rk9/zxJn248ZRUJwvn53InPXT8TaTQRDRC56YlnTa+gU3UslzXuqTSZDeDFUs2KMumR
	gCdDKPMnqLvSXtvWSXXV8ucZOg34Q8l4oJhLs3mFWv0/PTSGMUgmztt8cIVBbCtGLXqf
	dbKw==
Received: by 10.66.75.97 with SMTP id b1mr29445108paw.15.1344380996123;
	Tue, 07 Aug 2012 16:09:56 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id pe2sm8594659pbc.59.2012.08.07.16.09.54
	(version=SSLv3 cipher=OTHER); Tue, 07 Aug 2012 16:09:55 -0700 (PDT)
Message-ID: <5021A04D.9040403@intel.com>
Date: Tue, 07 Aug 2012 16:10:05 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
	<20120807081710.GQ3267@jama.jama.net>
	<9A466F05-060B-442E-ADD5-A015FE979942@dominion.thruhere.net>
	<50213D45.2070802@intel.com>
	<1E5BDEED-DBC6-463A-AE9E-2CF45C4920B6@dominion.thruhere.net>
In-Reply-To: <1E5BDEED-DBC6-463A-AE9E-2CF45C4920B6@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQknVmZfr/MYhxjAH43rR4qZ/sF0jWreI4zPw0UwZKVrL5s90Yo6HmIgTcqWJT2DP6OWkqZs
Subject: Re: [PATCH][for-denzil 1/8] opkg-utils: bump SRCREV for Packages cache fix and other fixes
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
X-List-Received-Date: Tue, 07 Aug 2012 23:21:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2012 11:19 AM, Koen Kooi wrote:
>>>>>
RDEPENDS_${PN} = "python"
>>>>> RDEPENDS_${PN}_virtclass-native = "" -SRCREV =
>>>>> "16665959c330b5958c0f0f4624a9ca7f823f98de" +SRCREV =
>>>>> "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
>>>>
>>>> Better to use latest for this (only 3 commits, 2 of them
>>>> fixing python-2.6)
>>>
>>> Should I cherry-pick them from master to keep history or just
>>> make a single, new update to latest SRCREV for the denzil
>>> branch?
>>
>> I slightly favor cherry-picks from master when possible.
>
> Since the cherry-picks would be incremental, can these 8 be queued
> and extra cherrypicks be added at a later point? I need to actually
> test those before submitting :)

Appreciate that - this works for me.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


