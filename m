Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qw4S9-0004br-4V
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 05:48:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2011 20:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41577637"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2011 20:43:46 -0700
Message-ID: <4E547371.2010003@linux.intel.com>
Date: Tue, 23 Aug 2011 20:43:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313790985-3332-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1313790985-3332-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/3] libpcre: the generated libtool uses HOST_SYS
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
X-List-Received-Date: Wed, 24 Aug 2011 03:48:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2011 02:56 PM, Chris Larson wrote:
> From: Chris Larson<chris_larson@mentor.com>
>
> Signed-off-by: Chris Larson<chris_larson@mentor.com>
> ---
>   meta/recipes-support/libpcre/libpcre_8.12.bb |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-support/libpcre/libpcre_8.12.bb b/meta/recipes-support/libpcre/libpcre_8.12.bb
> index 9216777..24d91c3 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.12.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.12.bb
> @@ -30,11 +30,11 @@ EXTRA_OECONF = " --with-link-size=2 --enable-newline-is-lf --with-match-limit=10
>   do_compile () {
>   	# stop libtool from trying to link with host libraries - fix from #33
>   	# this resolve build problem on amd64 - #1015
> -	if [ -e ${S}/${TARGET_SYS}-libtool ] ; then
> -		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${TARGET_SYS}-libtool
> +	if [ -e ${S}/${HOST_SYS}-libtool ] ; then
> +		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${HOST_SYS}-libtool
>   	else
> -		ln -sf ${S}/libtool ${S}/${TARGET_SYS}-libtool
> -		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${TARGET_SYS}-libtool	
> +		ln -sf ${S}/libtool ${S}/${HOST_SYS}-libtool
> +		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${HOST_SYS}-libtool
>   	fi
>
>   	# The generation of dftables can lead to timestamp problems with ccache

This whole series was merged into OE-Core (3 of 3) total.

Thanks
	Sau!


