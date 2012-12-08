Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1ThTLM-0004ol-54
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Dec 2012 23:58:00 +0100
Received: from mail-pa0-f69.google.com ([209.85.220.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 08 Dec 2012 14:43:30 -0800
Received: by mail-pa0-f69.google.com with SMTP id rl6so2492064pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Dec 2012 14:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=zbLwVqzDkTQ5iSoZza8N+/Lb/H76ybKmTZ+Nn/R82Bc=;
	b=ER39n+qGPIT9992KT2vCCP0IB2X72Uvs7GqKXiC8iNqjg5CmTqas2ax/sY/1haUjPF
	35T7X3q9Q7PAuTMo93hWJLQ7/ixBRdPQhXz7AkbinJYRxA0yN6xI+swHqXtD13HwKMU8
	ZhPiq7B2+PJ6ZUl8wsc0MeJeHGo05X4bESLdVYf2A09MTwAW4YE8ttKwXC/ILL4Kt55d
	jmAniB5FBNP045uSCxS+filVFg2gs8or7a1Qfw6zOz5pCYGEX4cYcy2gF5b7kNqUK4Qt
	WjTVddSM0JuE0+fFmxhWb8Ial956dlejsMtYsUM3QbpbWuPjnByphP0VvfxiZQR10mEH
	UQwQ==
Received: by 10.68.239.198 with SMTP id vu6mr26619719pbc.109.1355006609423;
	Sat, 08 Dec 2012 14:43:29 -0800 (PST)
Received: by 10.68.239.198 with SMTP id vu6mr26619695pbc.109.1355006609174;
	Sat, 08 Dec 2012 14:43:29 -0800 (PST)
Received: from [192.168.10.207] (c-71-237-161-120.hsd1.or.comcast.net.
	[71.237.161.120])
	by mx.google.com with ESMTPS id nf9sm9049160pbc.17.2012.12.08.14.43.27
	(version=SSLv3 cipher=OTHER); Sat, 08 Dec 2012 14:43:28 -0800 (PST)
Message-ID: <50C3C28E.1020409@intel.com>
Date: Sat, 08 Dec 2012 14:43:26 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1354740033-18500-1-git-send-email-cazfi74@gmail.com>
	<50C0E34E.8010108@linux.intel.com>
In-Reply-To: <50C0E34E.8010108@linux.intel.com>
X-Gm-Message-State: ALoCoQnJ8N7YM0gkfoIVFlzglrVArphSx6KpzRBEZ0ZmLdQZizaL5+xZg1QUbbuE/sNO8nO84MeAtbE2OvWNGjcG9qgF8CvlqBqZUG15KdyKKB9kFg+xBZDvf7BvWBspVta5MO6bOpCRV4ipPityZ5NwR0aGMGoJSi9wRO9UDtwskZLlZRbilywNP7cviSuGj4jiDmhWxMFg
Subject: Re: libpng-1.5.13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Dec 2012 22:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2012 10:26 AM, Saul Wold wrote:
> On 12/05/2012 12:40 PM, Marko Lindqvist wrote:
>>
>> First preparatory patch makes it easier to add multiple major versions of
>> libpng. You may choose to commit this one only.
>>
>> Second patch adds 1.5.13 recipe. This produces library named libpng15,
>> while
>> old 1.2.50 recipe produces libpng12. Some older programs (and their
>> recipes)
>> may fail to find newer library. So far I'm aware of one such case in
>> meta-openembedded; libsdl-image-1.2.10 needs update. I've already
>> submitted
>> patch for that one.
>>
> Overall, it's great to see the recipes updated, but we don't typically
> keep the older versions of recipes around.  So if you want to preserve
> the older version, it should be moved meta-oe.  The only case we keep
> older recipes is for License changes from GPLv2 -> GPLv3 where it makes
> sense.
>
> So, the request would be a v2 that also removes the 1.2.50 recipe.

libpng has an entry in upstream_tracking.inc with a 
RECIPE_NO_UPDATE_REASON of "1.4.3 and later changes the API and breaks 
libmatchbox. Sticking with the 1.2.x series instead"

So if libmatchbox now builds with 1.5, we can remove the 1.2.x recipe 
for good. Otherwise we may need both versions, and need to ensure 
libmatchbox will use 1.2.x if it still requires it.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


