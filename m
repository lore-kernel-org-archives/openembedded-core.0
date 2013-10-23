Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 52B2B6D2CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 17:18:29 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 36B74F8120A; Wed, 23 Oct 2013 11:18:30 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8009EF8120A;
	Wed, 23 Oct 2013 11:18:28 -0600 (MDT)
Message-ID: <526804E7.3020406@mlbassoc.com>
Date: Wed, 23 Oct 2013 11:18:31 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <5267D269.2020701@mlbassoc.com>
	<CAJTo0LYaqs00v5XUf+wRtaKytZy1-8VDuPcEyawYU8UXxzPUGw@mail.gmail.com>
	<526803BD.8010106@mlbassoc.com>
In-Reply-To: <526803BD.8010106@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Mesa mess
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Oct 2013 17:18:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-10-23 11:13, Gary Thomas wrote:
> On 2013-10-23 08:07, Burton, Ross wrote:
>> On 23 October 2013 14:43, Gary Thomas <gary@mlbassoc.com> wrote:
>>> With the current master (Poky ffb440c37c), I can't build anything
>>> with a virtual/mesa requirement.  This seems to bring in both mesa
>>> and mesa-gl, which fight to the death, killing the build :-(
>>
>> Presumably you want just mesa-gl?
>>
>> I guess your distro is setting a preferred provider for
>> virtual/something to mesa-gl, and something else is pulling in mesa,
>> probably through a default.  Can you check that all of the
>> mesa-related virtual/* lines are set in your distro, my hunch is that
>> you don't have virtual/mesa set to mesa-gl.

I also compared all of the PREFERRED_PROVIDERs between my build and a stock
poky build and they are identical.

>>
>> If the distro looks right then try using depexp to see what is pulling
>> in mesa when it shouldn't be?
>
> I looked through this and nothing was obvious.  According to depmod, neither
> mesa nor mesa-gl have any direct "reverse depends", i.e. packages that depend
> on them.  As far as I can see, it's just coming from the xserver-xorg dependency
> on virtual/mesa.
>
> Which led me to another experiment which I truly do not understand.  I removed
> the mesa-gl recipe and now when I try to build 'virtual/mesa' I get a message
> that there is no provider :-(  However, I *can* build mesa with no problems.
> I also checked it against the other PROVIDES from mesa.inc and all of them
> except for virtual/mesa work.  How can this possibly be?

To be clear, 'bitbake virtual/libgl' (or any of its friends except virtual/mesa)
will cause 'mesa' to be built, but 'bitbake virtual/mesa' fails.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

