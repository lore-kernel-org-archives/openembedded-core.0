Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id E261C6D2AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 14:57:01 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id E7814F81239; Mon, 28 Oct 2013 08:57:03 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 02FEFF81201;
	Mon, 28 Oct 2013 08:57:03 -0600 (MDT)
Message-ID: <526E7B4A.3050606@mlbassoc.com>
Date: Mon, 28 Oct 2013 08:57:14 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <5267D269.2020701@mlbassoc.com>
	<CAJTo0LYaqs00v5XUf+wRtaKytZy1-8VDuPcEyawYU8UXxzPUGw@mail.gmail.com>
	<526803BD.8010106@mlbassoc.com> <526804E7.3020406@mlbassoc.com>
	<52687085.9060605@mlbassoc.com>
	<CAJTo0LYawHSPoR0zSpuG202-kp9T_=K=eMgD9GqCtH=KAU9+qQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYawHSPoR0zSpuG202-kp9T_=K=eMgD9GqCtH=KAU9+qQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 28 Oct 2013 14:57:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-10-28 08:54, Burton, Ross wrote:
> On 24 October 2013 01:57, Gary Thomas <gary@mlbassoc.com> wrote:
>> I found the cause :-)  In addition to OE-core, I am using meta-ti on an
>> OMAP3 target.
>> In meta-ti, there is this line:
>>    meta-ti/recipes-graphics/mesa/mesa-omap3-common.inc:PROVIDES_omap3 =
>> "virtual/libgl"
>> I added virtual/mesa to this list and it now builds again.  I'm not sure
>> that this is
>> 100% correct though.
>
> That's correct - did you send a patch to meta-ti?

There was a discussion about this on meta-ti and it was decided to
fix it (rather drastically by removing these overrides) when the core
mesa recipe is upgraded (already proposed).

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

