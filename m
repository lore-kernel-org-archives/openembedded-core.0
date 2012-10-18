Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwJb-0004ZW-N4
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:03:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Oct 2012 12:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,608,1344236400"; d="scan'208";a="235683642"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2012 12:50:14 -0700
Message-ID: <50805D76.8090103@linux.intel.com>
Date: Thu, 18 Oct 2012 12:50:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Colin Walters <walters@verbum.org>
References: <1348530882.25427.1.camel@lenny>
In-Reply-To: <1348530882.25427.1.camel@lenny>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add packagegroup-core-buildessential
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
X-List-Received-Date: Thu, 18 Oct 2012 20:03:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2012 04:54 PM, Colin Walters wrote:
> [Not heavily tested, but sent for discussion]
>
> task-core-sdk is too big - for example, I simply don't want to ship tcl, ever =)
> Historically distcc caused a large dependency graph explosion because it has
> a utility which uses gtk+, although that was fixed.
>
> packagegroup-core-sdk also includes coreutils, which is a bit
> confusing; conceptually things dependent on coreutils should pull it
> in explicitly, or possibly we just declare coreutils to be in the
> minimal build set.
>
> So packagegroup-core-buildessential is intended to be similar to
> Debian's "build-essential" package.  It's the stuff needed by say 80+%
> of components, not worth repeating over and over.
>
> Signed-off-by: Colin Walters <walters@verbum.org>
> ---
>   .../packagegroup-core-buildessential.bb            | 30 ++++++++++++++++++++++
>   .../packagegroups/packagegroup-core-sdk.bb         | 17 +-----------
>   2 files changed, 31 insertions(+), 16 deletions(-)
>   create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
>
>
Merged into OE-Core

Thanks
	Sau!

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


