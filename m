Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJrBk-0007YY-8Z
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 19:57:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 May 2011 10:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; 
   d="scan'208";a="431738"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2011 10:54:53 -0700
Message-ID: <4DC97BED.6040200@linux.intel.com>
Date: Tue, 10 May 2011 10:54:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304966147.git.raj.khem@gmail.com>
In-Reply-To: <cover.1304966147.git.raj.khem@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/6] Fix recipes for uclibc and others
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
X-List-Received-Date: Tue, 10 May 2011 17:57:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2011 11:40 AM, Khem Raj wrote:
> These patches address build failures when using uclibc
> oe/patch.py fix is a backport from oe, we need to fix
> BBFILES for oe-core since some class code expects it
> to be first entry in BBFILES. gconf-dbus to dbus is needed
> for SDKs to compile for angstrom
>
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>    Branch: kraj/misc-fixes
>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes
>
> Thanks,
>      Khem Raj<raj.khem@gmail.com>
> ---
>
>
> Khem Raj (6):
>    recipes: Replace gconf-dbus with gconf
>    conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
Not merged, see Richard's follow-up
>    libgalago_0.5.2.bb: Fix compile for uclibc
>    liburcu_0.5.4.bb: Let it build on uclibc targets
>    lttng-ust_0.12.bb: Fix compilation on uclibc
>    oe/patch.py: Remove series file during Clean()
>
>   .../recipes-gnome/gnome/libgnomekbd_2.26.0.bb      |    2 +-
>   meta/conf/layer.conf                               |   10 ++++-
>   meta/lib/oe/patch.py                               |    1 +
>   .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 ++
>   meta/recipes-gnome/gnome/gnome-desktop.inc         |    2 +-
>   meta/recipes-gnome/gthumb/gthumb_2.12.2.bb         |    2 +-
>   meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    2 +-
>   .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |   50 ++++++++++++++++++++
>   meta/recipes-kernel/lttng/lttng-ust_0.12.bb        |    4 +-
>   meta/recipes-support/libproxy/libproxy_0.4.6.bb    |    2 +-
>   meta/recipes-support/liburcu/liburcu_0.5.4.bb      |    2 +-
>   11 files changed, 73 insertions(+), 8 deletions(-)
>   create mode 100644 meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
>

All but conf/layer.conf merged into oe-core

Thanks
	Sau!


