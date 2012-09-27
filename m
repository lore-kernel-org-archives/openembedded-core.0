Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGV3-00016l-1E
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:59:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Sep 2012 08:46:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="214466466"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2012 08:46:45 -0700
Message-ID: <506474E4.6000605@linux.intel.com>
Date: Thu, 27 Sep 2012 08:46:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1348585112-2458-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1348585112-2458-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] layer.conf: allow other layers to depend on this version
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
X-List-Received-Date: Thu, 27 Sep 2012 15:59:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 07:58 AM, Paul Eggleton wrote:
> Set LAYERVERSION and rename the collection to "core". Given changes such
> as the tabs to spaces cleanup for python functions in the current
> version, this allows other layers to depend on this version of OE-Core
> specifically should they choose to do so, by specifying the following
> in their own layer.conf:
>
> LAYERDEPENDS_layername = "core:1"
>
> Where layername is whatever value is being added to BBFILE_COLLECTIONS.
>
> (This change does nothing unless a layer has LAYERDEPENDS set.)
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/conf/layer.conf |   10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index ed50f1c..78ceae9 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -3,9 +3,13 @@ BBPATH .= ":${LAYERDIR}"
>   # We have a packages directory, add to BBFILES
>   BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
>
> -BBFILE_COLLECTIONS += "normal"
> -BBFILE_PATTERN_normal := "^${LAYERDIR}/"
> -BBFILE_PRIORITY_normal = "5"
> +BBFILE_COLLECTIONS += "core"
> +BBFILE_PATTERN_core := "^${LAYERDIR}/"
> +BBFILE_PRIORITY_core = "5"
> +
> +# This should only be incremented on significant changes that will
> +# cause compatibility issues with other layers
> +LAYERVERSION_core = "1"
>
>   # Set a variable to get to the top of the metadata location
>   COREBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
>

Merged into OE-Core

Thanks
	Sau!



