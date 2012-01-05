Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rivaa-0004Ka-S3
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 23:15:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2012 14:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109218618"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 14:07:48 -0800
Message-ID: <4F061F34.9000606@linux.intel.com>
Date: Thu, 05 Jan 2012 14:07:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325792209.git.otavio@ossystems.com.br>
	<6d7ee007b25cc878d07163fcc6be964781f68ca6.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <6d7ee007b25cc878d07163fcc6be964781f68ca6.1325792209.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 10/10] udev: drop depmod handling code as it ought to be done in kernel postinst
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
X-List-Received-Date: Thu, 05 Jan 2012 22:15:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 11:38 AM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   meta/recipes-core/udev/udev_164.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
> index c89eab4..6d71f4d 100644
> --- a/meta/recipes-core/udev/udev_164.bb
> +++ b/meta/recipes-core/udev/udev_164.bb
> @@ -1,6 +1,6 @@
>   include udev.inc
>
> -PR = "r9"
> +PR = "r10"
>
>   SRC_URI += "file://udev-166-v4l1-1.patch"
>
Just a PR Bump?

Sau!


