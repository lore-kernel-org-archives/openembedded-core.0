Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RnEqZ-0002J3-Kv
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:37:31 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 17 Jan 2012 11:28:47 -0800
Received: by iaby26 with SMTP id y26so3913873iab.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 11:28:47 -0800 (PST)
Received: by 10.50.51.199 with SMTP id m7mr16327926igo.23.1326828527310;
	Tue, 17 Jan 2012 11:28:47 -0800 (PST)
Received: from [10.6.18.223] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id l35sm80347407ibj.0.2012.01.17.11.28.45
	(version=SSLv3 cipher=OTHER); Tue, 17 Jan 2012 11:28:45 -0800 (PST)
Message-ID: <4F15CBEC.3080607@intel.com>
Date: Tue, 17 Jan 2012 11:28:44 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326307011.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1326307011.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 17 Jan 2012 19:37:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2012 10:52 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Since this is a stabilization week, this probably can't be merged
> immediately, but I've been working with this enough to call it
> good enough, and me sitting on them longer doesn't help.
>
> The first change in this series is the switch of qemuppc from prep to
> mac99. With this, we'll close a whole set of issues (slow bootup) and
> close a feature gap that has existed for a while.
>
> I'm seeing a bit of strangeness with the mouse in my sato testing,
> but that's about it. Liming hasn't seen the same issues, so getting
> this into the tree will allow us to incrementally improve and debug
> this.
>
> The second change is a SRCREV update pulls in the forward looking
> fix from Khem and a fix from Zumeng that fixes a failed ltp/mm test
> that was found on the routerstationpro.
>
> Cheers,
>
> Bruce
>
> cc: Khem Raj<raj.khem@gmail.com>
> cc: Zumeng Chen<zumeng.chen@windriver.com>
> cc: Liming Wang<liming.wang@windriver.com>
>
> The following changes since commit 18c88fcec85f96d2495457928be913807971aea7:
>
>    package.bbclass: per recipe PRSERV_HOST support (2012-01-11 10:37:43 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto: consolidated fix SRCREV updates
>
> Liming Wang (4):
>    qemuppc: replace emulation of qemuppc from prep to mac99
>    qemuppc: add pointercal file
>    qemuppc: add machconfig
>    tslib: enable big endian support for qemuppc
>
>   meta/conf/machine/qemuppc.conf                     |    2 +-
>   .../formfactor/files/qemuppc/machconfig            |   10 ++++++++++
>   .../pointercal/files/qemuppc/pointercal            |  Bin 0 ->  36 bytes
>   meta/recipes-graphics/tslib/tslib_1.0.bb           |    1 +
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    6 +++---
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   15 ++++++++-------
>   scripts/runqemu                                    |    7 +------
>   scripts/runqemu-internal                           |   16 ++++++++--------
>   8 files changed, 32 insertions(+), 25 deletions(-)
>   create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc/machconfig
>   create mode 100644 meta/recipes-bsp/pointercal/files/qemuppc/pointercal
>
Merged into OE-Core

Thanks
	Sau!



