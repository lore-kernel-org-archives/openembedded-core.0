Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBrHj-0004Qf-M2
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 20:03:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2012 10:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="191943731"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by azsmga001.ch.intel.com with ESMTP; 12 Sep 2012 10:51:01 -0700
Message-ID: <5050CB85.7080606@linux.intel.com>
Date: Wed, 12 Sep 2012 10:51:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
References: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
In-Reply-To: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] classes/license: various bugfixes and improvements
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
X-List-Received-Date: Wed, 12 Sep 2012 18:03:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2012 06:13 PM, Vladimir Zapolskiy wrote:
> This trivial set of changes fixes several bugs including:
> * check license.manifest for multiple records about the same
> * put precise information about licensing into license.manifest
> * specify licensing of packages, where info is in form of LICENSE_${pkg}
>
> Also the change set has some intention to improve performance and
> source code readability.
>
> Vladimir Zapolskiy (6):
>    classes/license: define LICENSE_MANIFEST variable
>    classes/license: check license manifest for double records
>    classes/license: remove redundant nested if statements
>    classes/license: account LICENSE_${pkg} values in manifest
>    classes/license: correct license info in lisense.manifest
>    classes/license: place all found licenses on one line
>
>   meta/classes/license.bbclass |   55 ++++++++++++++++++++++++++----------------
>   1 file changed, 34 insertions(+), 21 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



