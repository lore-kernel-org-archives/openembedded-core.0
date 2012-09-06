Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9hYS-0003nc-EB
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 21:15:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Sep 2012 12:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,380,1344236400"; d="scan'208";a="142301539"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Sep 2012 12:03:30 -0700
Message-ID: <5048F381.1090202@linux.intel.com>
Date: Thu, 06 Sep 2012 12:03:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Ertsaas <mertsas@cisco.com>
References: <1346939964-24426-1-git-send-email-mertsas@cisco.com>
In-Reply-To: <1346939964-24426-1-git-send-email-mertsas@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rsync: Add md5sum and sha256sum for the rsync_2.6.9
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
X-List-Received-Date: Thu, 06 Sep 2012 19:15:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2012 06:59 AM, Martin Ertsaas wrote:
> rsync_2.6.9 is the only rsync recipe in openembedded without GPLv3 license, but it lacked the
> checksums for the fetcher.
> ---
>   meta/recipes-devtools/rsync/rsync_2.6.9.bb |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/rsync/rsync_2.6.9.bb b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
> index 54feada..8c8b115 100644
> --- a/meta/recipes-devtools/rsync/rsync_2.6.9.bb
> +++ b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
> @@ -10,6 +10,9 @@ SRC_URI = "http://rsync.samba.org/ftp/rsync/src/rsync-${PV}.tar.gz \
>              file://rsync-2.6.9-fname-obo.patch \
>              file://rsyncd.conf"
>
> +SRC_URI[md5sum] = "996d8d8831dbca17910094e56dcb5942"
> +SRC_URI[sha256sum] = "ca437301becd890e73300bc69a39189ff1564baa761948ff149b3dd7bde633f9"
> +
>   inherit autotools
>
>   do_install_append() {
>

It's a good fix, but you need a Signed-off-by: in the commit message please.

Thanks
	Sau!



