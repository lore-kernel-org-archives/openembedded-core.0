Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 181A760110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 14:11:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jun 2017 07:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,306,1493708400"; d="scan'208";a="96161083"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2017 07:11:24 -0700
Message-ID: <1496758810.26945.120.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: liu.ming50@gmail.com
Date: Tue, 06 Jun 2017 09:20:10 -0500
In-Reply-To: <1496719226-3132-1-git-send-email-liu.ming50@gmail.com>
References: <1496719226-3132-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildstats.sh: add ELAPSED option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jun 2017 14:11:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-06 at 05:20 +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> This allows users to be able to get the elapsed time of specific
> tasks from buildstats, sometimes could be useful.
> 
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  scripts/contrib/bb-perf/buildstats.sh | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/contrib/bb-perf/buildstats.sh b/scripts/contrib/bb-perf/buildstats.sh
> index 8d7e248..caf34a6 100755
> --- a/scripts/contrib/bb-perf/buildstats.sh
> +++ b/scripts/contrib/bb-perf/buildstats.sh
> @@ -40,6 +40,7 @@
>  
>  # Stats, by type
>  TIME="utime:stime:cutime:cstime"
> +ELAPSED="Started:Ended:Elapsed time"

This is useful, thanks. Just keep in mind that this is not wall time:
these timestamps come from the bitbake engine (not from /proc/[PID]),
which depending on the build parallelisms, times can change. 


Leo

>  IO="IO wchar:IO write_bytes:IO syscr:IO read_bytes:IO rchar:IO syscw:IO cancelled_write_bytes"
>  RUSAGE="rusage ru_utime:rusage ru_stime:rusage ru_maxrss:rusage ru_minflt:rusage ru_majflt:\
>  rusage ru_inblock:rusage ru_oublock:rusage ru_nvcsw:rusage ru_nivcsw"
> @@ -113,6 +114,9 @@ for stat in ${STATS}; do
>  	    TIME)
>  		stats="${stats}:${TIME}"
>  		;;
> +	    ELAPSED)
> +		stats="${stats}:${ELAPSED}"
> +		;;
>  	    IO)
>  		stats="${stats}:${IO}"
>  		;;
> -- 
> 2.7.4
> 



