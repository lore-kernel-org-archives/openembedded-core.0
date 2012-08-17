Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2V8c-0002Ht-OR
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 00:35:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2012 15:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,788,1336374000"; d="scan'208";a="135556604"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 15:23:28 -0700
Message-ID: <502EC460.1030609@linux.intel.com>
Date: Fri, 17 Aug 2012 15:23:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1345155936.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345155936.git.andrei@gherzan.ro>
Subject: Re: [V2 PATCH 0/6] Don't have hwclock init scripts for machines without rtc
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
X-List-Received-Date: Fri, 17 Aug 2012 22:35:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2012 03:28 PM, Andrei Gherzan wrote:
> V2:
> Remove: 3f88694 subversion: Add gettext to DEPENDS as msgfmt is needed at compile time
> Sent as (it should be) a different pull request.
>
> I dropped the idea of maching Busybox HW dependent. A bad idea indeed.
> Now, hwclock init script is packaged separately and pulled into image
> only if MACHINE_FEATURES contains rtc value. The inclusion of rtc is
> done in a BACKFILL way.
>
> The following changes since commit af847d36375aa53f0c1ee2a00c97ba9f38837d1b:
>
>    bitbake: bitbake: build.py: Add stampdir argument to cached_mtime_noerror (2012-08-16 12:27:41 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ag/backfill-busybox
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/backfill-busybox
>
> Andrei Gherzan (6):
>    utils.py: Modify and rename distro_features_backfill python function
>    bitbake.conf: Use the new form of features_backfill function
>    bitbake.conf: Add MACHINE_FEATURES_BACKFILL and append to
>      MACHINE_FEATURES
>    bitbake.conf: Add rtc to MACHINE_FEATURES_BACKFILL
>    task-core-boot: Add busybox-hwclock if MACHINE_FEATURES contains rtc
>    busybox: Package hwclock.sh initscript separately
>
>   meta/conf/bitbake.conf                    |    5 ++++-
>   meta/lib/oe/utils.py                      |    9 ++++++---
>   meta/recipes-core/busybox/busybox.inc     |    5 +++--
>   meta/recipes-core/tasks/task-core-boot.bb |    1 +
>   4 files changed, 14 insertions(+), 6 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



