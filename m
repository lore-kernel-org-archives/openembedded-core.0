Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RcczG-000806-Ab
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 14:10:38 +0100
Received: by eaal1 with SMTP id l1so4721125eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 05:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=AKqXHyHnLk+miAYkhCMJ+X6e/zB5kWjjJ4uvs714kD4=;
	b=o4s/8VpV46CgIFJAYWDgae63kVaomg/RSgJuPytoh6LrokKiHhxhfvdYx+Gu6H2h7q
	U7OcP854q1Nlh1zAny6Wr7Aq5Luas9otETklKUIBqG+mbgCtKfVQTh32JztVKToyQk8j
	uAg3gAepMq+H53FPeUkdHUw5e4c8f+NVblRpw=
Received: by 10.205.122.138 with SMTP id gg10mr1481386bkc.94.1324299813997;
	Mon, 19 Dec 2011 05:03:33 -0800 (PST)
Received: from [137.202.140.192] (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id l5sm40967477bkv.9.2011.12.19.05.03.31
	(version=SSLv3 cipher=OTHER); Mon, 19 Dec 2011 05:03:32 -0800 (PST)
Message-ID: <4EEF35C8.3030607@gmail.com>
Date: Mon, 19 Dec 2011 17:02:00 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>, 
	openembedded-core@lists.openembedded.org
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
	<5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
	<4EEF324E.8060203@gmail.com>
	<D018C1C3-1814-4EB5-BB3D-87002117514E@dominion.thruhere.net>
In-Reply-To: <D018C1C3-1814-4EB5-BB3D-87002117514E@dominion.thruhere.net>
Subject: Re: [PATCH 1/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Mon, 19 Dec 2011 13:10:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/2011 04:54 PM, Koen Kooi wrote:
>
> Op 19 dec. 2011, om 13:47 heeft Dmitry Eremin-Solenikov het volgende geschreven:
>
>>
>>
>> On 12/19/2011 12:13 AM, Koen Kooi wrote:
>>>
>>> Op 18 dec. 2011, om 20:47 heeft Dmitry Eremin-Solenikov het volgende geschreven:
>>>
>>>> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
>>>> separate task from do_deploy. This way the do_install task can also
>>>> benefit from generated uImage.
>>>>
>>>> The only major feature of oe-core's version (not to recreate uImage
>>>> if it exists) is retained in this patch.
>>>
>>> I still don't agree with that behaviour. The in-kernel uImage code is just like the in-kernel defconfigs: useless for people who aren't kernel developers.
>>
>> Koen, that was addressed with KERNEL_RECREATE_UIMAGE variable.
>> Probably I should document it somewhere (in the commit message?
>> documentation.conf? smwh. else?). Would you agree with this patch + docs?
>
> No. If the machine.conf sets the UBOOT_* variables I should not need some magic unbreak-me variable to get kernel.bbclass to use them.

I see your point. I'll redo it so.

-- 
With best wishes
Dmitry


