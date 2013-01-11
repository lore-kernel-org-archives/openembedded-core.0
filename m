Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TthpL-000293-2b
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 17:51:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0BGaFG3020779
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 08:36:15 -0800 (PST)
Received: from msp-dhcp18.wrs.com (172.25.34.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 11 Jan 2013 08:36:14 -0800
Message-ID: <50F03F81.9070103@windriver.com>
Date: Fri, 11 Jan 2013 10:36:17 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1357921082-17180-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1357921082-17180-1-git-send-email-cristian.iorga@intel.com>
Subject: Re: [PATCH] db: upgrade to 5.3.21
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
X-List-Received-Date: Fri, 11 Jan 2013 16:51:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/13 10:18 AM, Cristian Iorga wrote:
> License file changed the year,
> triggering a change in checksum

Any change is BerkleyDB versions requires us to verify RPM and Smart 
functionality.  I don't have any objections to the change -- just pointing that out.

--Mark

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-support/db/{db_5.3.15.bb => db_5.3.21.bb} |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-support/db/{db_5.3.15.bb => db_5.3.21.bb} (93%)
>
> diff --git a/meta/recipes-support/db/db_5.3.15.bb b/meta/recipes-support/db/db_5.3.21.bb
> similarity index 93%
> rename from meta/recipes-support/db/db_5.3.15.bb
> rename to meta/recipes-support/db/db_5.3.21.bb
> index 509c567..23d6c4e 100644
> --- a/meta/recipes-support/db/db_5.3.15.bb
> +++ b/meta/recipes-support/db/db_5.3.21.bb
> @@ -14,15 +14,15 @@ HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
>   LICENSE = "Sleepycat"
>   VIRTUAL_NAME ?= "virtual/db"
>   RCONFLICTS_${PN} = "db3"
> -PR = "r9"
> +PR = "r0"
>
>   SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
>   SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.."
>
> -SRC_URI[md5sum] = "5493fb5f7cc3915887c836b096f18773"
> -SRC_URI[sha256sum] = "4f4f7d548984dde3584fcda0e4f96901cb8bafb08033a7781aec64ef2ea1f579"
> +SRC_URI[md5sum] = "3fda0b004acdaa6fa350bfc41a3b95ca"
> +SRC_URI[sha256sum] = "ddd92a930317df92021054c03992392db9ea5cddba43bef8920d392a82114fb8"
>
> -LIC_FILES_CHKSUM = "file://../LICENSE;md5=12cc3ff983ed4ecc6cc091370ee4dbc3"
> +LIC_FILES_CHKSUM = "file://../LICENSE;md5=32aefa5a8e7318be1f657432cbe2e768"
>
>   inherit autotools
>
>



