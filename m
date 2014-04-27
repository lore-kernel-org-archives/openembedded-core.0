Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id DE5F065DFA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 11:22:54 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sun, 27 Apr 2014 13:22:47 +0200 (CEST)
Received: from webmail.binero.se (unknown [195.74.38.9])
	(Authenticated sender: petter@technux.se)
	by smtp-06-01.atm.binero.net (Postfix) with ESMTPA id 47D323A137;
	Sun, 27 Apr 2014 13:22:47 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 27 Apr 2014 13:22:47 +0200
From: petter@technux.se
To: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BF130C0B-D4B9-42EF-A130-5B58E02054F4@dominion.thruhere.net>
References: <cover.1398462168.git.petter@technux.se>
	<535BB044.6030502@mlbassoc.com>
	<a39a653b557587457fa05eeb545d7d87@technux.se>
	<BF130C0B-D4B9-42EF-A130-5B58E02054F4@dominion.thruhere.net>
Message-ID: <5d7763811b6b6ab4b4a2a5174bf8164e@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] x-load: fix broken beaglebone support and FILEPATHS usage
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
X-List-Received-Date: Sun, 27 Apr 2014 11:22:58 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

2014-04-27 11:52 skrev Koen Kooi:

> Op 26 apr. 2014, om 20:39 heeft petter@technux.sehet volgende 
> geschreven:
>
>> 2014-04-26 15:10 skrev Gary Thomas:
>>
>>> On 2014-04-25 16:11, Petter Mabäcker wrote:
>>>
>>>> The following changes since commit
>>>> c446d4edca3b4edfcdee48247391bfb306aab4c2: default-distrovars.inc:
>>>> Add libgcc-initial to the GPLv3 whitelist (same as libgcc)
>>>> (2014-04-25 18:00:38 +0100) are available in the git repository 
>>>> at:
>>>> git://git.yoctoproject.org/poky-contrib petmab/fix_xload
>>>
>>
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/fix_xload
>>> [1]
>>>
>>>> [1] Petter Mabäcker (2): x-load: fix broken beaglebone support
>>>> x-load: remove usage of FILESPATH
>>>> .../x-load/x-load-git/beagleboard/name.patch | 18 ----------
>>>> .../0001-Change-omap3530beagle-target-name.patch | 37
>>>> ++++++++++++++++++++ meta/recipes-bsp/x-load/x-load_git.bb | 6 
>>>> ++--
>>>> 3 files changed, 39 insertions(+), 22 deletions(-) delete mode
>>>> 100644 meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
>>>> create mode 100644
>>
>
meta/recipes-bsp/x-load/x-load/beaglebone/0001-Change-omap3530beagle-target-name.patch
>>
>>
>>> These changes don't seem quite correct since the beagleboard wasn't
>>> renamed to be beaglebone - they are separate entities and there are
>>> still beagleboard(s) out there (supported by meta-ti) At most, your
>>> changes should simply add support for beaglebone, not remove 
>>> support
>>> for beagleboard. --
>>> ------------------------------------------------------------ Gary
>>> Thomas | Consulting for the MLB Associates | Embedded world
>>> ------------------------------------------------------------
>> Hi, Thanks for your input. Beagleboard is not longer supported in 
>> YP.
>> See: Yocto Bug #2444, that results in for example: 9680453
>> yocto-project-qs: Substituting Beaglebone for Beagleboard. and 
>> 7254dfb
>> Drop beagleboard, replaced by beaglebone And usage of meta-ti layer 
>> to
>> build beagleboard will override the x-load version within meta layer
>> (from oe) anyway
>>
>
(seehttp://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/x-load/x-load_git.bb).
>> So my opinion is that it's correct to replace beagleboard with
>> beaglebone in this commit. But if you have any other opinion, please
>> let me know and I will of course consider them. Anyone else who have
>> any comments about this?
>
> X-load shouldn't be used anymore, it has been superseded by u-boot 
> SPL
> some years ago for all cortex based TI SoCs.

So we have another option here, that we should remove the recipe 
completely from meta layer. Since possibly users probably are using 
legacy boards together with meta-ti (that already has it's own version 
of x-load), I guess it might be a possible way forward.

Anyone else with any comments about this? If no objections exists I 
guess I can send up a new changeset that removes x-load instead, 
otherwise I vote for go forward with this changeset until someone 
decides that it's OK to remove x-load support.

/P


Links:
------
[1] 
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/fix_xload

