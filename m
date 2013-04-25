Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UVIVZ-0003Z0-Pg
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 11:30:33 +0200
Message-ID: <5178F38C.3010100@communistcode.co.uk>
Date: Thu, 25 Apr 2013 10:12:44 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Guo Chunrong-B40290 <B40290@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1366813574-21199-1-git-send-email-ml@communistcode.co.uk>
	<B21730BB6DA1D24B83348D9301EA417E068280D6@039-SN2MPN1-022.039d.mgd.msft.net>
	<5178EAFC.5040704@communistcode.co.uk>
	<5178EDDA.30601@communistcode.co.uk>
	<B21730BB6DA1D24B83348D9301EA417E06828262@039-SN2MPN1-022.039d.mgd.msft.net>
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E06828262@039-SN2MPN1-022.039d.mgd.msft.net>
Subject: Re: [PATCH] connman: update to 1.13
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
X-List-Received-Date: Thu, 25 Apr 2013 09:30:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Interesting, could you check the following for me please:

1) p5020ds-64b/usr/include/sys/ioctls.h and see if it includes bits/ioctl-types.h

2) p5020ds-64b/usr/include/bits/ioctl-types.h and see if it includes asm/ioctls.h

3) p5020ds-64b/usr/include/asm/ioctls.h and see if it includes includes asm-generic/ioctls.h


Thanks,
Jack.


On 25/04/13 09:59, Guo Chunrong-B40290 wrote:
> Hello,
> I can find a reference to TCGETS2 in my sysroot
>
> The following information:
> p5020ds-64b/usr/include/asm-generic/ioctls.h:60:#define TCGETS2         _IOR('T', 0x2A, struct termios2)
> p5020ds-64b/usr/src/kernel/include/asm-generic/termios.h:114:#ifdef TCGETS2
> p5020ds-64b/usr/src/kernel/include/asm-generic/termios.h:138:#else /* TCGETS2 */
> p5020ds-64b/usr/src/kernel/include/asm-generic/termios.h:150:#endif /* TCGETS2 */
> p5020ds-64b/usr/src/kernel/include/asm-generic/ioctls.h:60:#define TCGETS2              _IOR('T', 0x2A, struct termios2)
> p5020ds-64b/usr/src/kernel/arch/parisc/include/asm/ioctls.h:49:#define TCGETS2          _IOR('T',0x2A, struct termios2)
> p5020ds-64b/usr/src/kernel/arch/xtensa/include/asm/ioctls.h:95:#define TCGETS2          _IOR('T', 42, struct termios2)
> p5020ds-64b/usr/src/kernel/arch/sh/include/asm/ioctls.h:82:#define TCGETS2              _IOR('T', 42, struct termios2)
> p5020ds-64b/usr/src/kernel/arch/sparc/include/asm/ioctls.h:18:#define TCGETS2           _IOR('T', 12, struct termios2)
> p5020ds-64b/usr/src/kernel/arch/mips/include/asm/ioctls.h:80:#define TCGETS2            _IOR('T', 0x2A, struct termios2)
> p5020ds-64b-tcbootstrap/usr/include/asm-generic/ioctls.h:60:#define TCGETS2             _IOR('T', 0x2A, struct termios2)
>
>
> thanks,
>
> chunrong
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Jack Mitchell
> Sent: Thursday, April 25, 2013 4:48 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] connman: update to 1.13
>
> On 25/04/13 09:36, Jack Mitchell wrote:
>> On 25/04/13 03:13, Guo Chunrong-B40290 wrote:
>>> Hello,
>>>    I build connman with toolchain(64bit).
>>>
>>> [snip]
>>>
>> Looks like one for upstream, I'll chase it up.
>>
>> Cheers,
>> Jack.
>>
> Could you do me a favour and see if you can find a reference to TCGETS2 in your sysroot?
>


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



