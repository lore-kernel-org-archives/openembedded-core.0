Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RiqwD-0007VF-Hw
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:17:14 +0100
Received: by qabg14 with SMTP id g14so532135qab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 09:09:49 -0800 (PST)
Received: by 10.224.220.14 with SMTP id hw14mr3770460qab.42.1325783389880;
	Thu, 05 Jan 2012 09:09:49 -0800 (PST)
Received: from [128.224.170.134] ([89.121.200.106])
	by mx.google.com with ESMTPS id co15sm20179321qab.1.2012.01.05.09.09.48
	(version=SSLv3 cipher=OTHER); Thu, 05 Jan 2012 09:09:49 -0800 (PST)
Message-ID: <4F05D95B.5090604@gherzan.ro>
Date: Thu, 05 Jan 2012 19:09:47 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1325781559-18967-1-git-send-email-andrei@gherzan.ro>
	<1325781698.28005.132.camel@phil-desktop>
	<4F05D5CB.2070404@windriver.com>
	<1325782829.28005.136.camel@phil-desktop>
In-Reply-To: <1325782829.28005.136.camel@phil-desktop>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: Patch this recipe order to remove a duplicate defconfig file
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
X-List-Received-Date: Thu, 05 Jan 2012 17:17:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 07:00 PM, Phil Blundell wrote:
> On Thu, 2012-01-05 at 18:54 +0200, Andrei Gherzan wrote:
>> On 01/05/2012 06:41 PM, Phil Blundell wrote:
>>> On Thu, 2012-01-05 at 18:39 +0200, Andrei Gherzan wrote:
>>>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>>>
>>>> Instead of having two defconfigs we can have only one and append this file with de specific
>>>> CONFIG if GPLv3 packages are allowed.
>>> As I said the other day, I think it would be better to just have one
>>> defconfig and turn off the GPLv3 stuff entirely.  Do you know of anybody
>>> who actually wants to use it?
>>>
>>> p.
>>>
>>>
>> Now about that extra config. The idea of having it into a a build were
>> gplv3 are allowed,was support for TLS/IA which was designed to be used
>> in the EAP-TTLSv1
>> https://lists.yoctoproject.org/pipermail/poky/2011-December/007386.html
> Well, right.  But the point I was making in my previous email
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/015375.html
>
> is that nobody seems to be using TLS/IA, the code in wpa-supplicant was
> apparently never all that well tested, and support for it has been
> removed entirely in the latest versions of all the relevant software
> (and hence, barring heroic efforts, we will lose it anyway next time
> wpa-supplicant is upgraded).
>
> So, unless you know of anybody who actually has a requirement for that
> protocol today, I would be inclined to just turn it off unconditionally
> rather than adding some mechanism to turn it on and off based on
> INCOMPATIBLE_LICENSE.
>
> p.
>
>

I didn't see that message of yours. And actually you are right. I 
haven't seen any req for that protocol and never heard of any. So in my 
opinion a complete removal of this option would remain the best 
approach. I can undo all the changes and add this config disabled.


