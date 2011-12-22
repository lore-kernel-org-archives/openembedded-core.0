Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rdn25-0004t3-S7
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 19:06:22 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Dec 2011 09:59:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99375487"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by fmsmga001.fm.intel.com with ESMTP; 22 Dec 2011 09:59:04 -0800
Message-ID: <4EF36FE8.9050002@linux.intel.com>
Date: Thu, 22 Dec 2011 09:59:04 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323831034.git.raj.khem@gmail.com>
In-Reply-To: <cover.1323831034.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/2] Introduce cross testing driver for gcc-cross
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
X-List-Received-Date: Thu, 22 Dec 2011 18:06:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2011 06:54 PM, Khem Raj wrote:
> Hi
>
> One patch makes the eglibc testing driver a bit more informative
> and cleans the tests before running
>
> Second patch introduces generating a script which will drive
> cross testing of gcc. This script is generated as part of do_compile
> task and virtually one can test bootstrapping versions of gcc as
> well if need be but mostly gcc-cross makes most sense since thats
> the one we use all the time.
>
> The following changes since commit b9dfccc018f32a47fc045f35d5f53d7269d791ed:
>
>    gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:18 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/gcc-cross-testing
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-cross-testing
>
> Khem Raj (2):
>    eglibc-testing: Clean the test before running them
>    gcc-cross: Add cross testing driver for running regression testsuites
>
>   meta/recipes-core/eglibc/eglibc-testing.inc |   36 ++++++++++-
>   meta/recipes-devtools/gcc/gcc-cross.inc     |   91 ++++++++++++++++++++++++++-
>   2 files changed, 125 insertions(+), 2 deletions(-)
>

Merged to OE-Core

Thanks
	Sau!


