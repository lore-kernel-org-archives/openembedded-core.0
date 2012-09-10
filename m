Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6M6-00062m-UI
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 17:56:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2012 08:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="200837319"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2012 08:44:27 -0700
Message-ID: <504E0ADB.9010507@linux.intel.com>
Date: Mon, 10 Sep 2012 08:44:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1346406022.git.kai.kang@windriver.com>
In-Reply-To: <cover.1346406022.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] Patches for LSB perl test
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
X-List-Received-Date: Mon, 10 Sep 2012 15:56:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2012 03:00 AM, Kang Kai wrote:
> The following changes since commit b4c5725af4cd85d5644f0373e2674e903c4eab2b:
>
>    yocto-bsp: add missing xserver-xf86-config .bbappend for qemu (2012-08-25 14:47:07 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/lsb
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lsb
>
> Kang Kai (8):
>    libclass-isa-perl: add it
>    perl: package modules Pod-Html and Tie-Hash-NamedCapture
>    libpod-plainer-perl: add it
>    libdumpvalue-perl: add it
>    libenv-perl: add it
>    libfile-checktree-perl: add it
>    libi18n-collate-perl: add it
>    task-core-lsb: add packages
>
>   meta/recipes-devtools/perl/perl-5.14.2/config.sh   |    2 +-
>   .../perl/libclass-isa-perl_0.36.bb                 |   32 +++++++++++++++++++
>   .../perl/libdumpvalue-perl_1.16.bb                 |   20 ++++++++++++
>   meta/recipes-extended/perl/libenv-perl_1.03.bb     |   22 +++++++++++++
>   .../perl/libfile-checktree-perl_4.41.bb            |   33 ++++++++++++++++++++
>   .../perl/libi18n-collate-perl_1.02.bb              |   22 +++++++++++++
>   .../perl/libpod-plainer-perl_1.03.bb               |   24 ++++++++++++++
>   meta/recipes-extended/tasks/task-core-lsb.bb       |    9 +++++-
>   8 files changed, 162 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/perl/libclass-isa-perl_0.36.bb
>   create mode 100644 meta/recipes-extended/perl/libdumpvalue-perl_1.16.bb
>   create mode 100644 meta/recipes-extended/perl/libenv-perl_1.03.bb
>   create mode 100644 meta/recipes-extended/perl/libfile-checktree-perl_4.41.bb
>   create mode 100644 meta/recipes-extended/perl/libi18n-collate-perl_1.02.bb
>   create mode 100644 meta/recipes-extended/perl/libpod-plainer-perl_1.03.bb
>

This was merged into recipes-lsb4 (instead of meta-lsb) so that we know 
to remove it when lsb5 appears

Thanks for dealing with the shifting sands!

Sau!



