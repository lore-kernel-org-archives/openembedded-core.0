Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 070176F578
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 07:40:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Mar 2014 00:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,653,1389772800"; d="scan'208";a="499703582"
Received: from unknown (HELO [10.255.13.124]) ([10.255.13.124])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2014 00:40:15 -0700
Message-ID: <5322B25F.7040301@linux.intel.com>
Date: Fri, 14 Mar 2014 00:40:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Valentin Popa <valentin.popa@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1394710133-18659-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1394710133-18659-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH] Set ac_cv_sizeof_ssize_t
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
X-List-Received-Date: Fri, 14 Mar 2014 07:40:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2014 04:28 AM, Valentin Popa wrote:
> Set ac_cv_sizeof_ssize_t for mips64;
> mips-common will not overwrite it.
>

This really needed a little more about "why" this change is needed.

Sau!

> [YOCTO #5935]
>
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>   meta/site/mips64-linux | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
> index 4449c96..ed0fbbe 100644
> --- a/meta/site/mips64-linux
> +++ b/meta/site/mips64-linux
> @@ -35,6 +35,7 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
>   ac_cv_alignof_guint32=4
>   ac_cv_alignof_guint64=8
>   ac_cv_alignof_unsigned_long=8
> +ac_cv_sizeof_ssize_t=8
>
>   # libpcap
>   ac_cv_linux_vers=${ac_cv_linux_vers=2}
>

