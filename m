Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UeNFV-0004QB-Hg
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 12:23:27 +0200
Received: by mail-pd0-f177.google.com with SMTP id u11so559856pdi.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=EteY8JiPcfb8gC140stq9n/mNGqsVcuZxlhWzTtzlPM=;
	b=U80T8G3vRiNAtx/tJDBoPCJgjrcGlU3ekkhH0fGU+tZAjlsQSWziLlgjwgriNxc/3O
	MiPGUfEkKIOrNT0soGFURn9lOo5r/GF5t4fO9yAxzDvcg7rWlPu+xcI231oTPI7BAeTx
	kbAVV5D7kwaLTh4fwwjIAfAc/1vSBdt/3o9xQRltaMBprgz7Lgqc05DldcdkQ27BOOin
	RPEHXRCyCIBCYDjTmTKILGK60WLohuQttuhp8ZdaHwnpv4am6nlKEvjNAbF2um1fjmDc
	knGBbNwGxD3tG7rkjf+TWdrojjXmee4o5ptaKJ3Thia/Jbb5eeKibF/8SkGo5xjlGGsK
	4P7Q==
X-Received: by 10.66.222.69 with SMTP id qk5mr26286547pac.71.1369044304769;
	Mon, 20 May 2013 03:05:04 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	ya4sm23497347pbb.24.2013.05.20.03.05.02 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 May 2013 03:05:03 -0700 (PDT)
Message-ID: <5199F430.7060202@gmail.com>
Date: Mon, 20 May 2013 20:00:16 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1369013370-21391-1-git-send-email-net147@gmail.com>
	<1369041556.6920.182.camel@phil-desktop.brightsign>
	<5199EB97.50900@gmail.com>
	<1369042689.6920.188.camel@phil-desktop.brightsign>
In-Reply-To: <1369042689.6920.188.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate-volatile.sh: normalize repeated leading slashes in TNAME
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
X-List-Received-Date: Mon, 20 May 2013 10:23:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2013 7:38 PM, Phil Blundell wrote:
> On Mon, 2013-05-20 at 19:23 +1000, Jonathan Liu wrote:
>> On 20/05/2013 7:19 PM, Phil Blundell wrote:
>>> On Mon, 2013-05-20 at 11:29 +1000, Jonathan Liu wrote:
>>>> -		TNAME=${ROOT_DIR}/${TNAME}
>>>> +		TNAME=`echo ${ROOT_DIR}/${TNAME} | sed -e 's@^//*@/@'`
>>> Why is this a good thing?  Your commit message is rather terse.
>>>
>>> p.
>> It reduces the size of /etc/volatile.cache.
>> Otherwise for example if you have ROOT_DIR=/, TNAME=/var/log, TNAME
>> becomes ///var/log.
>>
>> Also if you have verbose mode enabled it actually prints out the extra
>> unnecessary leading slashes.
> How many bytes does it actually save on a typical system?  Is this worth
> the overhead of forking an extra 2 processes for every line in the
> file?
>
> Would it not be better fixed by requiring TNAME to start with a slash
> (which it probably does already), ROOT_DIR to not end with a slash, and
> just dropping the intermediate separator?
>
> p.
That does sound like a better solution, let's go with that.

Regards,
Jonathan


