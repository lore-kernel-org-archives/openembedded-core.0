Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1U3nIY-000199-Pd
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:43:24 +0100
Received: from [192.168.0.2] (host86-137-74-187.range86-137.btcentralplus.com
	[86.137.74.187]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id D214D9BF8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2013 12:27:30 +0000 (GMT)
Message-ID: <5114EF31.6000304@r-finger.com>
Date: Fri, 08 Feb 2013 12:27:29 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1360323133-28592-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LaOcn5Kr64Ga7zfuP5q1ixO8Ag4Uy+JrOmDe7AEhDDmpQ@mail.gmail.com>
	<CAP9ODKomOChKyoVD=-O9vNpnRFSyj+N+bz8C=mSLV3rky-hD2Q@mail.gmail.com>
	<CAJTo0LbOcirp-VJT1u9g9Xp8jTREb=UD+dJRftidVpt6tQ3HRg@mail.gmail.com>
	<5114E8E5.70203@r-finger.com>
	<CAP9ODKqRoNRNKqeZ6AyLd_ALjVu3Zo-7ZDtsmmvdj=m5CGwQWQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqRoNRNKqeZ6AyLd_ALjVu3Zo-7ZDtsmmvdj=m5CGwQWQ@mail.gmail.com>
Subject: Re: [PATCH] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 12:43:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/02/13 12:07, Otavio Salvador wrote:
> On Fri, Feb 8, 2013 at 10:00 AM, Tomas Frydrych
> <tf+lists.yocto@r-finger.com> wrote:
>> On 08/02/13 11:55, Burton, Ross wrote:
>>> On 8 February 2013 11:38, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>>> Can you fix the code to symlink instead of copy?  systemd and more
>>>>> needs a symlink so that it can identify the name of the timezone from
>>>>> the link target.
>>>>
>>>> You mean inside the if?
>>>
>>> I mean in general /etc/localtime should be a symlink and not a copy.
>>
>> /etc/localtime is a real file so that /etc is not containing a link to a
>> file in /usr; this has historically been the case unless I am not
>> mistaken. systemd should grow up and read the contents :).
> 
> In fact a lot of software expects it to be a symlink so it shouldn't be a copy.

Lot of software does thing without understanding what it is doing,
that's the nature of software. :) My point is that the code in the
current recipe is not doing the unconditional copy by mistake, it is
doing so intentionally so that local clock can work without /usr. Only
systems that mandate the presence of /usr can use a symlink -- so this
is not a bug fix but a change in an established system behaviour. If
nothing else, the commit message should be clear in this regard.

Tomas


-- 
http://sleepfive.com


