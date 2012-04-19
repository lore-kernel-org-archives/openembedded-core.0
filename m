Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKlxK-0000n5-VE
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 09:39:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Apr 2012 00:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="134254141"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by orsmga002.jf.intel.com with ESMTP; 19 Apr 2012 00:29:37 -0700
Message-ID: <4F8FBEE1.4030500@linux.intel.com>
Date: Thu, 19 Apr 2012 00:29:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334229041-22552-1-git-send-email-florin.sarbu@windriver.com>
In-Reply-To: <1334229041-22552-1-git-send-email-florin.sarbu@windriver.com>
Subject: Re: [PATCH] Update intltool to version 0.50.0
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
X-List-Received-Date: Thu, 19 Apr 2012 07:39:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2012 04:10 AM, Florin Sarbu wrote:
> Uprev to version 0.50.0 and move SRC_URI from .inc into the .bb specifying the version
>
> Signed-off-by: Florin Sarbu<florin.sarbu@windriver.com>
> ---
>   .../intltool-0.40.6/intltool-nowarn-0.40.0.patch   |   52 --------------------
>   .../intltool/intltool-0.40.6/noperlcheck.patch     |   40 ---------------
>   .../intltool-0.40.6/remove-xml-check.patch         |   32 ------------
>   .../intltool/intltool-0.40.6/use-nativeperl.patch  |   20 --------
>   .../intltool-0.50.0/intltool-nowarn-0.50.0.patch   |   40 +++++++++++++++
>   .../intltool/intltool-0.50.0/noperlcheck.patch     |   40 +++++++++++++++
>   .../intltool-0.50.0/remove-xml-check.patch         |   29 +++++++++++
>   .../intltool/intltool-0.50.0/use-nativeperl.patch  |   20 ++++++++
>   meta/recipes-devtools/intltool/intltool.inc        |    1 -
>   meta/recipes-devtools/intltool/intltool_0.40.6.bb  |   19 -------
>   meta/recipes-devtools/intltool/intltool_0.50.0.bb  |   20 ++++++++
>   11 files changed, 149 insertions(+), 164 deletions(-)
>   delete mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/intltool-nowarn-0.40.0.patch
>   delete mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch
>   delete mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>   delete mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
>   create mode 100644 meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch
>   create mode 100644 meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch
>   create mode 100644 meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
>   create mode 100644 meta/recipes-devtools/intltool/intltool-0.50.0/use-nativeperl.patch
>   delete mode 100644 meta/recipes-devtools/intltool/intltool_0.40.6.bb
>   create mode 100644 meta/recipes-devtools/intltool/intltool_0.50.0.bb
>
There seems to be an additional problem that the noperlcheck patch is 
not applying correctly, so this will need to be rebased also.

Thanks
	Sau!



