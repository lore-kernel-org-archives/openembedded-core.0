Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QK7DD-0008DP-B4
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 13:04:15 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 440C7166037F; Wed, 11 May 2011 05:01:29 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5E79A166023D;
	Wed, 11 May 2011 05:00:48 -0600 (MDT)
Message-ID: <4DCA6C60.6050203@mlbassoc.com>
Date: Wed, 11 May 2011 05:00:48 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
References: <4DB99F31.4000308@mlbassoc.com>	<BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>	<BANLkTi=G-4UfXNdnJSy7qF3gb0-xLr6+4Q@mail.gmail.com>
	<4DBEAA2C.1020601@mlbassoc.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D88F0101@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94D88F0101@orsmsx504.amr.corp.intel.com>
Cc: Poky Project <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] GCC 4.6.0 on ARM?
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
X-List-Received-Date: Wed, 11 May 2011 11:04:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2011 09:28 PM, Kamble, Nitin A wrote:
>
>
>> -----Original Message-----
>> From: poky-bounces@yoctoproject.org [mailto:poky-
>> bounces@yoctoproject.org] On Behalf Of Gary Thomas
>> Sent: Monday, May 02, 2011 5:57 AM
>> To: Khem Raj
>> Cc: Poky Project; Patches and discussions about the oe-core layer
>> Subject: Re: [poky] GCC 4.6.0 on ARM?
>>
>> On 04/30/2011 04:10 PM, Khem Raj wrote:
>>> On Thu, Apr 28, 2011 at 11:23 AM, Khem Raj<raj.khem@gmail.com>
>> wrote:
>>>> On Thu, Apr 28, 2011 at 10:09 AM, Gary Thomas<gary@mlbassoc.com>
>> wrote:
>>>>> I got my OMAP target to build with GCC-4.6.0 using the latest
>>>>> Poky tree after a fresh rebuild.  Sadly, the Linux kernel
>> (2.6.37.3)
>>>>> does not run correctly when built with this compiler.  It
>>>>> fails when enumerating the USB bus :-(
>>>>>
>>>>> Are there known issues with the Linux kernel on ARM and GCC-4.6?
>>>>>
>>>>
>>>> There has been fixes on top of 4.6.0 the one we have right now is
>> vanilla
>>>> 4.6.0 release. I plan to add second set of patches but you have to
>> dig a bit
>>>> more to identify the problem
>>>>
>>>
>>> I have some updates for gcc 4.6.0
>>> they are staged in
>>>
>>> http://git.openembedded.org/cgit.cgi/openembedded-core-
>> contrib/log/?h=kraj/gcc-4.6
>>>
>>> (top 3 patches)
>>>
>>> Please test them out and if you are lucky
>>> your problem might be fixed too.
>>>
>>> All, please try these patches and provide any feedback
>>
>> I was able to build my kernel (ARM OMAP/3530 based) using this, but
>> the USB still doesn't work, so no improvement, sorry.
>
> Gary,
>   Is the USB breakage is due to gcc 4.6.0 ?

Yes, that's the only change.  Building the kernel from the same
source repository with 4.5.2 (using patches from you and Khem Raj)
works perfectly.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


