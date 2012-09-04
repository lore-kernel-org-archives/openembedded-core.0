Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8up4-00044x-Fa
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 17:13:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2012 08:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="217922855"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2012 08:01:27 -0700
Message-ID: <504617C7.7090905@linux.intel.com>
Date: Tue, 04 Sep 2012 08:01:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
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
X-List-Received-Date: Tue, 04 Sep 2012 15:13:50 -0000
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

Kang,

Given that LSB 5.0 is coming out that removes many of these 
requirements, does it really make sense to add these and then remove 
them again in a future release. I understand we are trying to be as
compliant as possible to LSB, but this may best be in a meta-lsb layer.

Sau!



