Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RupBC-0003NE-Ig
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 18:50:10 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Feb 2012 09:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104181330"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by azsmga001.ch.intel.com with ESMTP; 07 Feb 2012 09:21:40 -0800
Message-ID: <4F315DA4.50106@linux.intel.com>
Date: Tue, 07 Feb 2012 09:21:40 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<2f04aa9f17c455c3d42ecb81975e425746973bef.1328510189.git.raj.khem@gmail.com>
In-Reply-To: <2f04aa9f17c455c3d42ecb81975e425746973bef.1328510189.git.raj.khem@gmail.com>
Subject: Re: [PATCH 19/20] gcc-cross-testing: Fix evaluation of user and target name
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
X-List-Received-Date: Tue, 07 Feb 2012 17:50:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/05/2012 10:40 PM, Khem Raj wrote:
> Dont use -q to grep we pipe to /dev/null anyway all we
> care is the return status of grep
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>
> xxx
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>

The patch seem valid, but the commit message needs to be cleaned up.


Sau!

> ---
>   meta/recipes-devtools/gcc/gcc-cross.inc |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index 6acf8c5..b16c57d 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -65,11 +65,11 @@ then
>   	exit 1;
>   fi
>
> -echo "\$target" | grep −q "@">&  /dev/null
> +echo "\$target" | grep "@">&  /dev/null
>   if [ "x\$?" = "x0" ]
>   then
> -   user=echo \$target | cut -d '@' -f 1
> -   target=echo \$target | cut -d '@' -f 2
> +   user=\$(echo \$target | cut -d '@' -f 1)
> +   target=\$(echo \$target | cut -d '@' -f 2)
>   else
>      user=\$USER
>   fi


