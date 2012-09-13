Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCGOx-0006FV-Q9
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 22:52:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Sep 2012 13:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,419,1344236400"; d="scan'208";a="144824256"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2012 13:40:04 -0700
Message-ID: <505244A3.2000400@linux.intel.com>
Date: Thu, 13 Sep 2012 13:40:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1347568349-28024-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1347568349-28024-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH] perf: Refactor code so it is easier to read
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
X-List-Received-Date: Thu, 13 Sep 2012 20:52:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 01:32 PM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta/recipes-kernel/perf/perf_3.4.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> index decc911..6e1c746 100644
> --- a/meta/recipes-kernel/perf/perf_3.4.bb
> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> @@ -74,7 +74,7 @@ do_compile() {
>   do_install() {
>   	oe_runmake DESTDIR=${D} install
>   	# we are checking for this make target to be compatible with older perf versions
> -	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
> +	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" ] && ! grep -q install-python_ext ${S}/tools/perf/Makefile  ]; then

Is this missing a [ or is there an extra ]?

Also is that dash compliant?

And of course you need a PR bump (well maybe not in this case)


Sau!

>   		oe_runmake DESTDIR=${D} install-python_ext
>   	fi
>   }
>


