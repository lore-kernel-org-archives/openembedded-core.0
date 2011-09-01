Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qz9k7-00012R-RD
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 18:03:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Sep 2011 08:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,313,1312182000"; d="scan'208";a="47609407"
Received: from scimitar.jf.intel.com (HELO [10.24.5.88]) ([10.24.5.88])
	by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2011 08:57:50 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 01 Sep 2011 08:57:50 -0700
In-Reply-To: <1314889432.19905.189.camel@phil-desktop>
References: <1314889432.19905.189.camel@phil-desktop>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1314892671.3449.0.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH] useradd.bbclass: remove hardcoded reference to /usr/bin
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
X-List-Received-Date: Thu, 01 Sep 2011 16:03:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-01 at 16:03 +0100, Phil Blundell wrote:
> Otherwise the class doesn't work if ${bindir} is set to a different value;
> likewise for /var vs ${localstatedir}.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>

Good find!

Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/classes/useradd.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index ba8d8dc..5f5b68d 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -74,8 +74,8 @@ fi
>  }
>  
>  useradd_sysroot () {
> -	export PSEUDO="${STAGING_DIR_NATIVE}/usr/bin/pseudo"
> -	export PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}/var/pseudo"
> +	export PSEUDO="${STAGING_DIR_NATIVE}${bindir}/pseudo"
> +	export PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}${localstatedir}/pseudo"
>  
>  	# Explicitly set $D since it isn't set to anything
>  	# before do_install

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



