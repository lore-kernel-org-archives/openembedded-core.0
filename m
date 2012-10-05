Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TKAeo-0003a1-Vn
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 18:21:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Oct 2012 09:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,541,1344236400"; d="scan'208";a="230424500"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2012 09:08:43 -0700
Message-ID: <506F060B.9050809@linux.intel.com>
Date: Fri, 05 Oct 2012 09:08:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1349267792.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349267792.git.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Minor fixes
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
X-List-Received-Date: Fri, 05 Oct 2012 16:21:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2012 05:37 AM, Paul Eggleton wrote:
> The following changes since commit eb96be4db46039752c44dc37ef676eaac04e3dba:
>
>    xf86-video-intel: drop libxvmc dependency (2012-10-03 12:41:03 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/fixes2
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes2
>
> Paul Eggleton (2):
>    buildhistory_analysis: update to use explode_dep_versions2()
>    rpmresolve: fix reporting of multiple matches error
>
>   meta/lib/oe/buildhistory_analysis.py              |   23 +++++++++++++++++----
>   meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c |    6 +++---
>   meta/recipes-devtools/rpm/rpmresolve_1.0.bb       |    2 +-
>   3 files changed, 23 insertions(+), 8 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



