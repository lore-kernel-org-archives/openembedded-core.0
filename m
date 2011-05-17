Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMPA8-0004Fy-1z
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:38:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 May 2011 11:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="2924743"
Received: from unknown (HELO [10.255.12.160]) ([10.255.12.160])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 11:35:37 -0700
Message-ID: <4DD2BFF9.2010508@linux.intel.com>
Date: Tue, 17 May 2011 11:35:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305291184.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1305291184.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 0/3] Misc fixes
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
X-List-Received-Date: Tue, 17 May 2011 18:38:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2011 05:54 AM, Martin Jansa wrote:
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>    Branch: jansa/pull
>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
>
> Thanks,
>      Martin Jansa<Martin.Jansa@gmail.com>
> ---
>
>
> Martin Jansa (3):
>    lib/oe/process.py: import from OE
>    glib-2.0: use PN instead of glib-2.0 in PACKAGES and FILES
>    bitbake.conf: move VENDOR variables from bitbake.conf to
>      defaultsetup.conf
>
>   meta/conf/bitbake.conf              |    4 --
>   meta/conf/distro/defaultsetup.conf  |    5 ++-
>   meta/lib/oe/process.py              |   74 +++++++++++++++++++++++++++++++++++
>   meta/recipes-core/glib-2.0/glib.inc |    4 +-
>   4 files changed, 80 insertions(+), 7 deletions(-)
>   create mode 100644 meta/lib/oe/process.py
>
Merged into oe-core with a tweak or two by RP

Thanks
	Sau!



