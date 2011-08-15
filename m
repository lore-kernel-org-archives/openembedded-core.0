Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qt0dR-0007Z7-MV
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 19:07:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 10:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,375,1309762800"; d="scan'208";a="39716323"
Received: from unknown (HELO [10.255.14.242]) ([10.255.14.242])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2011 10:02:56 -0700
Message-ID: <4E495140.6040808@linux.intel.com>
Date: Mon, 15 Aug 2011 10:02:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313143473.git.tong.lin@intel.com>
In-Reply-To: <cover.1313143473.git.tong.lin@intel.com>
Subject: Re: [PATCH 0/1] [PULL] valgrind: fix bug 1129 for supporting kernel 3.x
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
X-List-Received-Date: Mon, 15 Aug 2011 17:07:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2011 03:21 AM, Lin Tong wrote:
> Hi Saul,
>
> This pull requests to add 3.x kernel supports in valgrind's configure.in,
> which fixed bug 1129. Please help to review and pull.
>
> [YOCTO #1129]
>
> Thanks,
> Tong
>
> The following changes since commit a92d56058b21913570bb17ae416c3b00afce055e:
>    Kumar Gala (1):
>          gnome-doc-utils: respect python-dir setting EXTRA_OECONF
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib tlin100/bug1129-v2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=tlin100/bug1129-v2
>
> Lin Tong (1):
>    valgrind: supporting on Linux kernel 3.x
>
>   .../valgrind-3.6.1/fix_unsupporting_kernel_3.patch |   26 ++++++++++++++++++++
>   meta/recipes-devtools/valgrind/valgrind_3.6.1.bb   |    3 +-
>   2 files changed, 28 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_unsupporting_kernel_3.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


