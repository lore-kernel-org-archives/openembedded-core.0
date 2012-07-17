Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrAOK-0001Df-8X
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:12:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2012 09:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178850758"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2012 09:01:08 -0700
Message-ID: <50058C43.7090105@linux.intel.com>
Date: Tue, 17 Jul 2012 09:01:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342011575.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1342011575.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/3] rootfs generation improvements
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
X-List-Received-Date: Tue, 17 Jul 2012 16:12:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2012 06:04 AM, Paul Eggleton wrote:
> Fix up handling of "complementary" package installation (dev, dbg, doc,
> etc.) and introduce a staticdev-pkgs IMAGE_FEATURES feature.
>
> I've tested this with all backends using buildhistory to examine the
> changes to the image contents, and compared the lists of files in the
> SDK-from-image output with the rpm backend. Unfortunately it does
> increase the do_rootfs time slightly; one of my next tasks will be to
> try to do some optimisation here.
>
>
> The following changes since commit b76a7bc8dcb7aed7d6f026e77a226837004c50af:
>
>    libgomp: add libgomp (openmp) library, and build for powerpc targets by default (2012-07-11 11:35:16 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/rootfs
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rootfs
>
> Paul Eggleton (3):
>    classes/rootfs_deb: use more reliable check for package existence
Merged this one into OE-Core

>    Rework installation of dev, dbg, doc, and locale packages
>    classes/image: add staticdev-pkgs IMAGE_FEATURES feature
>
There was an issue with either one or both of these during build 
testing, I know you are looking into it.

Thanks
	Sau!


>   meta/classes/image.bbclass            |   89 ++++++++++++++++++++++-----------
>   meta/classes/package_rpm.bbclass      |   74 ++++++++++++++++-----------
>   meta/classes/populate_sdk_deb.bbclass |    2 +
>   meta/classes/populate_sdk_ipk.bbclass |    2 +
>   meta/classes/populate_sdk_rpm.bbclass |    3 ++
>   meta/classes/rootfs_deb.bbclass       |   14 +++---
>   meta/classes/rootfs_ipk.bbclass       |   16 +++---
>   meta/classes/rootfs_rpm.bbclass       |   29 ++++++-----
>   8 files changed, 144 insertions(+), 85 deletions(-)
>



