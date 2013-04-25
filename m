Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UVKOh-0004o9-UA
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 13:31:34 +0200
Message-ID: <51790FEB.3090406@communistcode.co.uk>
Date: Thu, 25 Apr 2013 12:13:47 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Guo Chunrong-B40290 <B40290@freescale.com>
References: <1366813574-21199-1-git-send-email-ml@communistcode.co.uk>
	<B21730BB6DA1D24B83348D9301EA417E068280D6@039-SN2MPN1-022.039d.mgd.msft.net>
	<5178EAFC.5040704@communistcode.co.uk>
	<5178EDDA.30601@communistcode.co.uk>
	<B21730BB6DA1D24B83348D9301EA417E06828262@039-SN2MPN1-022.039d.mgd.msft.net>
	<5178F38C.3010100@communistcode.co.uk>
	<B21730BB6DA1D24B83348D9301EA417E0682833A@039-SN2MPN1-022.039d.mgd.msft.net>
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E0682833A@039-SN2MPN1-022.039d.mgd.msft.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 25 Apr 2013 11:31:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/13 11:09, Guo Chunrong-B40290 wrote:
> 1) p5020ds-64b/usr/include/sys/ioctls.h and it includes bits/ioctl-types.h
> 2) p5020ds-64b/usr/include/bits/ioctl-types.h and it doesn't include asm/ioctls.h
>
> 3) p5020ds-64b/usr/include/asm/ioctls.h and it includes asm/ioctls.h
>
> BTW,  I modify TIST = "--disable-tist" in meta/recipes-connectivity/connman/connman.inc"
>        And build Connman for p5020ds-64b  successfully.
>
> -----Original Message-----
> From: Jack Mitchell [mailto:ml@communistcode.co.uk]
> Sent: Thursday, April 25, 2013 5:13 PM
> To: Guo Chunrong-B40290; Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] connman: update to 1.13
>
> Interesting, could you check the following for me please:
>
> 1) p5020ds-64b/usr/include/sys/ioctls.h and see if it includes bits/ioctl-types.h
>
> 2) p5020ds-64b/usr/include/bits/ioctl-types.h and see if it includes asm/ioctls.h
>
> 3) p5020ds-64b/usr/include/asm/ioctls.h and see if it includes includes asm-generic/ioctls.h
>
>
> Thanks,
> Jack.
>
>
> [snip]

Ok, well what that means is that as bits/ioctl-types.h doesn't include 
asm/ioctls.h, asm-generic/ioctls.h never gets included which is where 
TCGETS2 is defined. Whether this is an upstream bug or an unsupported 
feature on powerpc64 I don't know, anyone more knowledgeable care to 
chime in?

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



