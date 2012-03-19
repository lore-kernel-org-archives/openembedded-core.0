Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S9fS1-0004Af-A2
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:28:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2012 09:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119165338"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2012 09:19:54 -0700
Message-ID: <4F675CA9.5000500@linux.intel.com>
Date: Mon, 19 Mar 2012 09:19:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331818182.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1331818182.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/3] logrotate: upgrade from 3.7.9 to 3.8.1
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
X-List-Received-Date: Mon, 19 Mar 2012 16:28:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2012 06:34 AM, Robert Yang wrote:
> Test info:
>
> * Has been tested on qemux86, qemuppc, qemuarm.
>
> // Robert
>
> The following changes since commit 1e6dce3228a483b2367286e49c4aa8a71733dcbb:
>
>    ncurses: fix install error (2012-03-15 13:14:10 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/logrotate
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/logrotate
>
> Robert Yang (3):
>    upgrade logrotate: split the old patch into 3
>    upgrade logrotate: update the recipe
>    upgrade logrotate: update the distro_tracking_fields.inc
>
>   .../conf/distro/include/distro_tracking_fields.inc |    6 +-
>   .../act-as-mv-when-rotate.patch}                   |   73 ++++----------------
>   .../disable-check-different-filesystems.patch      |   34 +++++++++
>   .../logrotate-3.8.1/update-the-manual.patch        |   42 +++++++++++
>   .../{logrotate_3.7.9.bb =>  logrotate_3.8.1.bb}     |   11 ++-
>   5 files changed, 99 insertions(+), 67 deletions(-)
>   rename meta/recipes-extended/logrotate/{logrotate-3.7.9/allow-across-different-filesystems.patch =>  logrotate-3.8.1/act-as-mv-when-rotate.patch} (54%)
>   create mode 100644 meta/recipes-extended/logrotate/logrotate-3.8.1/disable-check-different-filesystems.patch
>   create mode 100644 meta/recipes-extended/logrotate/logrotate-3.8.1/update-the-manual.patch
>   rename meta/recipes-extended/logrotate/{logrotate_3.7.9.bb =>  logrotate_3.8.1.bb} (72%)
>

Merged into OE-Core

Thanks	
	Sau!


