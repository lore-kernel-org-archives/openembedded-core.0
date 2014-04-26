Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 789C465D6C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:10:21 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 2BF29F811F8; Sat, 26 Apr 2014 07:10:22 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 12938F811F7;
	Sat, 26 Apr 2014 07:10:21 -0600 (MDT)
Message-ID: <535BB044.6030502@mlbassoc.com>
Date: Sat, 26 Apr 2014 07:10:28 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1398462168.git.petter@technux.se>
In-Reply-To: <cover.1398462168.git.petter@technux.se>
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
X-List-Received-Date: Sat, 26 Apr 2014 13:10:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2014-04-25 16:11, Petter Mabäcker wrote:
> The following changes since commit c446d4edca3b4edfcdee48247391bfb306aab4c2:
>
>    default-distrovars.inc: Add libgcc-initial to the GPLv3 whitelist (same as libgcc) (2014-04-25 18:00:38 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib petmab/fix_xload
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/fix_xload
>
> Petter Mabäcker (2):
>    x-load: fix broken beaglebone support
>    x-load: remove usage of FILESPATH
>
>   .../x-load/x-load-git/beagleboard/name.patch       |   18 ----------
>   .../0001-Change-omap3530beagle-target-name.patch   |   37 ++++++++++++++++++++
>   meta/recipes-bsp/x-load/x-load_git.bb              |    6 ++--
>   3 files changed, 39 insertions(+), 22 deletions(-)
>   delete mode 100644 meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
>   create mode 100644 meta/recipes-bsp/x-load/x-load/beaglebone/0001-Change-omap3530beagle-target-name.patch
>

These changes don't seem quite correct since the beagleboard
wasn't renamed to be beaglebone - they are separate entities
and there are still beagleboard(s) out there (supported by
meta-ti)

At most, your changes should simply add support for beaglebone,
not remove support for beagleboard.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

