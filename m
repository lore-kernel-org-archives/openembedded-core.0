Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1UcXCf-0001Do-Ve
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 10:36:55 +0200
Received: from atl4mhob09.myregisteredsite.com
	(atl4mhob09.myregisteredsite.com [209.17.115.47])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4F8IhS9002285 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 04:18:43 -0400
Received: from mail.hostingplatform.com ([10.30.71.210])
	by atl4mhob09.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4F8Igua031434 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 04:18:42 -0400
Received: (qmail 16720 invoked by uid 0); 15 May 2013 08:18:41 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 15 May 2013 08:18:41 -0000
Message-ID: <519344E1.3020704@topic.nl>
Date: Wed, 15 May 2013 10:18:41 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Yi Qingliang <niqingliang2003@gmail.com>
References: <3388285.jCfN1Lj2u9@yiqingliang-pc> <519341D9.6080104@topic.nl>
	<1875466.EG2CYrV9ea@yiqingliang-pc>
In-Reply-To: <1875466.EG2CYrV9ea@yiqingliang-pc>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt keyboard problem
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
X-List-Received-Date: Wed, 15 May 2013 08:37:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2013 10:10 AM, Yi Qingliang wrote:
> On Wednesday, May 15, 2013 10:05:45 AM Mike Looijmans wrote:
>> On 05/15/2013 08:19 AM, Yi Qingliang wrote:
>>> I'm running qt application on yocto's qt image. cpu is s3c2442, like
>>> mini2440.
>>>
>>> the problem is:
>>>
>>> key event issued by pressing gpio-key eat by 'getty' (from busybox),
>>> my application can't receive input event,
>>> if I remove respawn 'getty' for tty1 in /etc/inittab, everything ok.
>>
>> I solved it by no longer starting the console login. Set the following
>> in one of your .conf files (distro or local.conf):
>>
>> USE_VT = "0"
>> SYSVINIT_ENABLED_GETTYS = ""
>>
>> You may need to rebuild initscripts for this to have effect.

Alternatively, you could disconnect the console when the GUI starts. You 
probably have some script that sets things up and starts the GUI, so you 
could extend it with the console on/off function.

That allows you to see the boot log on the screen for example, and debug 
things via the console when the GUI isn't running.

I forgot how to do that though, I think is was something in /proc/.

Mike.



