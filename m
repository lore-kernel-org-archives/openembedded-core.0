Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S9fTJ-0004E6-Jt
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:30:13 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Mar 2012 09:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119165933"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2012 09:21:20 -0700
Message-ID: <4F675D00.5050808@linux.intel.com>
Date: Mon, 19 Mar 2012 09:21:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331821447.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331821447.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] A couple of fixes
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
X-List-Received-Date: Mon, 19 Mar 2012 16:30:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2012 07:24 AM, Paul Eggleton wrote:
> The following changes since commit b055075ba5b9ff5250bc66be1cd8b222bdb86161:
>
>    slang: Fix rpath QA warnings (2012-03-15 00:07:43 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/fixes15
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes15
>
> Paul Eggleton (2):
>    util-linux: restore zlib and ncurses dependencies for native
>    python-imaging: bring in fixes from meta-oe
>
>   meta/recipes-core/util-linux/util-linux.inc        |    2 +-
>   meta/recipes-core/util-linux/util-linux_2.21.bb    |    2 +-
>   ...ng-setup.py-force-paths-for-zlib-freetyp.patch} |   36 +++++++++++++++----
>   .../python/python-imaging_1.1.7.bb                 |    9 +++--
>   4 files changed, 36 insertions(+), 13 deletions(-)
>   rename meta/recipes-devtools/python/python-imaging/{path.patch =>  0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch} (47%)
>

Merged into OE-Core

Thanks
	Sau!


