Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UFCoO-0005ol-Cm
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 01:11:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Mar 2013 16:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,825,1355126400"; d="scan'208";a="268882150"
Received: from unknown (HELO [10.255.13.68]) ([10.255.13.68])
	by azsmga001.ch.intel.com with ESMTP; 11 Mar 2013 16:54:43 -0700
Message-ID: <513E6EC3.7090905@linux.intel.com>
Date: Mon, 11 Mar 2013 16:54:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: tom.zanussi@linux.intel.com
References: <4293cea264609a122b9cc05831fe598fcb3ff677.1362702690.git.tom.zanussi@linux.intel.com>
	<957507c1d36185cf5c6a1ac9b5781c3344d5a40d.1362702690.git.tom.zanussi@linux.intel.com>
In-Reply-To: <957507c1d36185cf5c6a1ac9b5781c3344d5a40d.1362702690.git.tom.zanussi@linux.intel.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] perf: rename perf_3.4 to perf
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
X-List-Received-Date: Tue, 12 Mar 2013 00:11:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2013 04:39 PM, tom.zanussi@linux.intel.com wrote:
> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>
> There's nothing kernel-version-specific about the perf_3.4 recipe, so
> it's actually misnamed and misleading now that it also gets used with
> the 3.8 kernel.
>
> Since the recipe isn't tied to a specific PV, and simply uses
> whatever's in STAGING_KERNEL_DIR, there's no reason to add anything
> else either to the bare PN, so just use that as the recipe name.
>
This did not quite work out correctly, since the package name has now 
gone backwards since the default PV for a recipe is 1.0 when nothing is 
set on the recipe file name.

Is there a way to sort this out such that it picks up an incrementing PV 
from the kernel recipe?

As it stands now, the PV has gone from 3.4 -> 1.0.

Thanks for looking after this.

Sau!

> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> ---
>   meta/recipes-kernel/perf/{perf_3.4.bb => perf.bb} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta/recipes-kernel/perf/{perf_3.4.bb => perf.bb} (100%)
>
> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf.bb
> similarity index 100%
> rename from meta/recipes-kernel/perf/perf_3.4.bb
> rename to meta/recipes-kernel/perf/perf.bb
>


