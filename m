Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T248x-00077Z-4i
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 19:46:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 10:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="181875890"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by azsmga001.ch.intel.com with ESMTP; 16 Aug 2012 10:33:34 -0700
Message-ID: <502D2EEE.4090702@linux.intel.com>
Date: Thu, 16 Aug 2012 10:33:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1345115839-26492-1-git-send-email-andrei.gherzan@windriver.com>
In-Reply-To: <1345115839-26492-1-git-send-email-andrei.gherzan@windriver.com>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] bitbake: build.py: Add stampdir argument to cached_mtime_noerror
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
X-List-Received-Date: Thu, 16 Aug 2012 17:46:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2012 04:17 AM, Andrei Gherzan wrote:
> After commit 2718537b4b04eb3d80ab4d74171b58e7b8dd68b8 (bitbake:
> build.py: Only execute mkdirhier if stampdir doesn't exist) build
> failes as cached_mtime_noerror needs an argument - stamp dir. This
> argument was forgotten.
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>   bitbake/lib/bb/build.py |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
> index d64077e..b484d19 100644
> --- a/bitbake/lib/bb/build.py
> +++ b/bitbake/lib/bb/build.py
> @@ -465,7 +465,7 @@ def stamp_internal(taskname, d, file_name):
>       stamp = bb.parse.siggen.stampfile(stamp, file_name, taskname, extrainfo)
>
>       stampdir = os.path.dirname(stamp)
> -    if bb.parse.cached_mtime_noerror == 0:
> +    if bb.parse.cached_mtime_noerror(stampdir) == 0:
>           bb.utils.mkdirhier(stampdir)
>
>       return stamp
>
Merged into OE-Core

Thanks
	Sau!



