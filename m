Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UKXa2-0008Mv-EW
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:22:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2QH5aCr008933
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 10:05:36 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 26 Mar 2013 10:05:37 -0700
Message-ID: <5151D55D.4050300@windriver.com>
Date: Tue, 26 Mar 2013 12:05:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1364316411.git.ross.burton@intel.com>
	<cb33f47af852b62bcb4cc816b10bcbe425bb5f34.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cb33f47af852b62bcb4cc816b10bcbe425bb5f34.1364316411.git.ross.burton@intel.com>
Subject: Re: [PATCH 05/24] core-image-minimal-initramfs: don't install busybox-syslog
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
X-List-Received-Date: Tue, 26 Mar 2013 17:22:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/13 11:50 AM, Ross Burton wrote:
> This uses BAD_RECOMMENDATIONS which isn't supported by all package backends, but
> it's a start.

Since it's not supported in all backends, can you add a bugzilla to add support 
to the various backends?

--Mark

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-core/images/core-image-minimal-initramfs.bb |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> index 7f6826c..6de24b3 100644
> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> @@ -17,3 +17,5 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
>   inherit core-image
>
>   IMAGE_ROOTFS_SIZE = "8192"
> +
> +BAD_RECOMMENDATIONS += "busybox-syslog"
>




