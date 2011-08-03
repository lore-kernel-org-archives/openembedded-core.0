Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QoiyS-0002wJ-Sq
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:27:33 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QoiuD-0006dE-RT from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 14:23:09 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 3 Aug 2011 14:23:09 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 3 Aug 2011 14:23:09 -0700
Message-ID: <4E39BC2A.6090004@mentor.com>
Date: Wed, 3 Aug 2011 14:22:50 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1312394851.git.sgw@linux.intel.com>
	<526ca905db2890c43e09f2cdc3e1e09bc38a3213.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <526ca905db2890c43e09f2cdc3e1e09bc38a3213.1312394851.git.sgw@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 03 Aug 2011 21:23:09.0678 (UTC)
	FILETIME=[8B07D0E0:01CC5223]
Subject: Re: [CONSOLIDATED PULL 22/33] tcl: Add tcl_cv_api_serial to	siteinfo
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
X-List-Received-Date: Wed, 03 Aug 2011 21:27:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 08/03/2011 02:19 PM, Saul Wold wrote:
> From: Tom Rini <tom_rini@mentor.com>
> 
> This comes from oe.dev which had this set for arm-linux only.  Bump PR
> since this changes how builds happen.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  meta/site/common-glibc  |    2 ++
>  meta/site/common-uclibc |    3 +++
>  2 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/site/common-glibc b/meta/site/common-glibc
> index 8cfa695..baca5f8 100644
> --- a/meta/site/common-glibc
> +++ b/meta/site/common-glibc
> @@ -69,3 +69,5 @@ gl_cv_func_mbrtowc_null_arg=${gl_cv_func_mbrtowc_null_arg=yes}
>  gl_cv_func_mbrtowc_retval=${gl_cv_func_mbrtowc_retval=yes}
>  gl_cv_func_mbrtowc_nul_retval=${gl_cv_func_mbrtowc_nul_retval=yes}
>  
> +# TCL
> +tcl_cv_api_serial=${tcl_cv_api_serial=termios}
> diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
> index 093f60e..002a559 100644
> --- a/meta/site/common-uclibc
> +++ b/meta/site/common-uclibc
> @@ -26,3 +26,6 @@ ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
>  # bash
>  bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
>  bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
> +
> +# TCL
> +tcl_cv_api_serial=${tcl_cv_api_serial=termios}


As Khem and I talked about on the ML, this should be replaced with:
http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/commit/?h=trini/update-siteinfo-round-2-v3&id=769fdf85b521028a3e9f4fb86a88c9a36215f75e

-- 
Tom Rini
Mentor Graphics Corporation


