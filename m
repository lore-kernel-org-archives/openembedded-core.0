Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0C66AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 21:35:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Aug 2013 14:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,848,1367996400"; d="scan'208";a="360422486"
Received: from unknown (HELO [10.255.14.176]) ([10.255.14.176])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2013 14:34:39 -0700
Message-ID: <5205606F.4020002@linux.intel.com>
Date: Fri, 09 Aug 2013 14:34:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1375941355.git.Qi.Chen@windriver.com>
	<6bab50b7175af465199fd8efd3f1ff402b7e375d.1375941355.git.Qi.Chen@windriver.com>
In-Reply-To: <6bab50b7175af465199fd8efd3f1ff402b7e375d.1375941355.git.Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 04/10] populate-volatile.sh: use $ROOT_DIR/var/volatile/tmp as TMPDIR
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
X-List-Received-Date: Fri, 09 Aug 2013 21:35:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2013 11:16 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> It's possible that a 'No such directory' error occurs when doing
> check_requirement in populate-volatile.sh at rootfs time. This is
> because the $ROOT_DIR/var/tmp might be a dead link.
>
> Use $ROOT_DIR/var/volatile/tmp as the TMPDIR instead to avoid this
> error.
>
Can you use /run here instead it should be mounted early in the process 
also?

Sau!

> [YOCTO #4883]
> [YOCTO #4103]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../initscripts-1.0/populate-volatile.sh           |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index 392879f..253fe1b 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -23,7 +23,7 @@ ROOTFS_READ_ONLY=`is_rootfs_readonly`
>   [ "$ROOTFS_READ_ONLY" = "yes" ] && VOLATILE_ENABLE_CACHE=no
>
>   CFGDIR="${ROOT_DIR}/etc/default/volatiles"
> -TMPROOT="${ROOT_DIR}/var/tmp"
> +TMPROOT="${ROOT_DIR}/var/volatile/tmp"
>   COREDEF="00_core"
>
>   [ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
>

