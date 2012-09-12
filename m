Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqBq-0001kq-AV
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 18:53:26 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Sep 2012 09:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="192122759"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by orsmga001.jf.intel.com with ESMTP; 12 Sep 2012 09:40:52 -0700
Message-ID: <5050BB13.4060907@linux.intel.com>
Date: Wed, 12 Sep 2012 09:40:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1347055413.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1347055413.git.mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Enhancement / bug fixes to the complementary install
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
X-List-Received-Date: Wed, 12 Sep 2012 16:53:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2012 03:05 PM, Mark Hatle wrote:
> This is one bug fix and one enhancement to the complementary install.
>
> We have a use where we would like to call the complementary install directly
> with a set of parameters, the enhancement allows us to do this.
>
> The bug fix is specific to the implementation within the RPM rootfs generation.
> Without the fix, a suboptimal installation is generated and performed.
>
> The following changes since commit 0de1827a9601143b090f751ea702fdb65a936b77:
>
>    classes/mirrors: remove bogus gnutls mirror (2012-09-07 14:51:10 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib mhatle/comp_install
>    http://git.yoctoproject.org/cgit.cgi//log/?h=mhatle/comp_install
>
> Mark Hatle (2):
>    image.bbclass: Enable the complementary install to be called w/
>      globbing params
>    package_rpm.bbclass: Avoid unnecessary installs in complementary pass
>
>   meta/classes/image.bbclass       |    4 +++-
>   meta/classes/package_rpm.bbclass |    9 ++++++++-
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



