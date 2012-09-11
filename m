Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TBYNh-0004Mi-V0
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 23:52:30 +0200
Received: from localhost ([127.0.0.1]:57336 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TBYBa-0003Rb-Hn
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=orKclfz99BbJ3Rbc9VvxTbl2Agw=; b=gZIYmyyGqKr+SKAadtWKvRXiLiQc
	oDwI/6p0aUS5rP6aY6QG6W5qJTZP2Rq9E3TNRW8geAnnL7SO2rAC4Cx9Dn/W8S2i
	IrWzYxkWB3p0BKqWjhl62gTgICna3swRnTKmsATx1ONA/dD68sEBmqJmT8T8P3bC
	wlC6NgsZDtMNsUg=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:50403 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1TBYBa-0003RW-FK for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:39:58 +0000
Message-ID: <504FAFAD.3050600@communistcode.co.uk>
Date: Tue, 11 Sep 2012 22:39:57 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
CC: openembedded-core@lists.openembedded.org
References: <504F05A8.3000207@communistcode.co.uk>
	<504F36CA.9060007@windriver.com>
	<504F3E85.6030302@communistcode.co.uk>
	<CAMKF1srgD9eXY+hxmzfXwT8L1WmFNQBHGgA9T5xNiiQb5GJZsg@mail.gmail.com>
In-Reply-To: <CAMKF1srgD9eXY+hxmzfXwT8L1WmFNQBHGgA9T5xNiiQb5GJZsg@mail.gmail.com>
Subject: Re: /usr/bin/python is needed by git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 21:52:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2012 22:02, Khem Raj wrote:
>> HI Mark,
>>
>> I sent a patch (see above) which added python as a dependency and that
>> seemed to fix it. Whether or not this is the right fix I don't know...
>> should git require the python binary to run? I really don't know much about
>> it...
>
> I wonder what needs python in git. Can you inspect ?
>
>>
>> --
>>
>>    Jack Mitchell (jack@embed.me.uk)
>>    Embedded Systems Engineer
>>    http://www.embed.me.uk
>>
>> --
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

I'll try and pin some time for it tomorrow and see if it's anything obvious.

Cheers,


