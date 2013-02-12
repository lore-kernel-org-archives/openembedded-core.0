Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U5MRX-0002eV-Gy
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 21:27:25 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2013 12:10:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,652,1355126400"; d="scan'208";a="284844807"
Received: from unknown (HELO [10.255.12.113]) ([10.255.12.113])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 12:10:47 -0800
Message-ID: <511AA1C5.9000104@linux.intel.com>
Date: Tue, 12 Feb 2013 12:10:45 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Pete Kolcsar <peter.kolcsar@windriver.com>
References: <1360686690.7843.5.camel@rockMachine>
In-Reply-To: <1360686690.7843.5.camel@rockMachine>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] - squashfs add missing SQUASHFS_FILE_MAX_LOG define in squashfs_fs.h file to fix unsquashfs build.
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
X-List-Received-Date: Tue, 12 Feb 2013 20:27:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


This seems to be an incomplete patch and will not patch anything in 
OE-Core directly, maybe you really mean to patch the Squashfs-tools recipe.

Sau!


On 02/12/2013 08:31 AM, Pete Kolcsar wrote:
> --- a/squashfs_fs.h	2011-02-11 17:49:24.000000000 +0200
> +++ b/squashfs_fs.h	2013-02-12 15:53:04.360256607 +0200
> @@ -36,9 +36,9 @@
>
>   /* default size of data blocks */
>   #define SQUASHFS_FILE_SIZE		131072
> -#define SQUASHFS_FILE_LOG		17
>
>   #define SQUASHFS_FILE_MAX_SIZE		1048576
> +#define SQUASHFS_FILE_MAX_LOG		20
>
>   /* Max number of uids and gids */
>   #define SQUASHFS_IDS			65536
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


