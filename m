Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id C975B65D72
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Apr 2014 18:39:11 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:39:02 +0200 (CEST)
Received: from webmail.binero.se (unknown [195.74.38.9])
	(Authenticated sender: petter@technux.se)
	by smtp-02-01.atm.binero.net (Postfix) with ESMTPA id 02DFB3A125
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:39:03 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 26 Apr 2014 20:39:02 +0200
From: petter@technux.se
To: <openembedded-core@lists.openembedded.org>
In-Reply-To: <535BB044.6030502@mlbassoc.com>
References: <cover.1398462168.git.petter@technux.se>
	<535BB044.6030502@mlbassoc.com>
Message-ID: <a39a653b557587457fa05eeb545d7d87@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
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
X-List-Received-Date: Sat, 26 Apr 2014 18:39:18 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

2014-04-26 15:10 skrev Gary Thomas:

> On 2014-04-25 16:11, Petter Mabäcker wrote:
>
>> The following changes since commit
>> c446d4edca3b4edfcdee48247391bfb306aab4c2: default-distrovars.inc: 
>> Add
>> libgcc-initial to the GPLv3 whitelist (same as libgcc) (2014-04-25
>> 18:00:38 +0100) are available in the git repository at:
>> git://git.yoctoproject.org/poky-contrib petmab/fix_xload
>>
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/fix_xload
>> [1] Petter Mabäcker (2): x-load: fix broken beaglebone support 
>> x-load:
>> remove usage of FILESPATH 
>> .../x-load/x-load-git/beagleboard/name.patch
>> | 18 ---------- .../0001-Change-omap3530beagle-target-name.patch | 
>> 37
>> ++++++++++++++++++++ meta/recipes-bsp/x-load/x-load_git.bb | 6 ++-- 
>> 3
>> files changed, 39 insertions(+), 22 deletions(-) delete mode 100644
>> meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch create 
>> mode
>> 100644
>>
>
meta/recipes-bsp/x-load/x-load/beaglebone/0001-Change-omap3530beagle-target-name.patch
>
> These changes don't seem quite correct since the beagleboard
> wasn't renamed to be beaglebone - they are separate entities
> and there are still beagleboard(s) out there (supported by
> meta-ti)
>
> At most, your changes should simply add support for beaglebone,
> not remove support for beagleboard.
>
> --
> ------------------------------------------------------------
> Gary Thomas | Consulting for the
> MLB Associates | Embedded world
> ------------------------------------------------------------

Hi,

Thanks for your input. Beagleboard is not longer supported in YP. See: 
Yocto Bug #2444, that results in for example:

9680453 yocto-project-qs: Substituting Beaglebone for Beagleboard.
and
7254dfb Drop beagleboard, replaced by beaglebone

And usage of meta-ti layer to build beagleboard will override the 
x-load version within meta layer (from oe) anyway (see 
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/x-load/x-load_git.bb). 
So my opinion is that it's correct to replace beagleboard with 
beaglebone in this commit. But if you have any other opinion, please let 
me know and I will of course consider them.

Anyone else who have any comments about this?

BR,
Petter

Links:
------
[1] 
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/fix_xload

