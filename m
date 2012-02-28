Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2S7J-00023v-4o
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 19:49:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2012 10:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122684722"
Received: from unknown (HELO [10.255.15.37]) ([10.255.15.37])
	by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2012 10:41:02 -0800
Message-ID: <4F4D1FBE.5050600@linux.intel.com>
Date: Tue, 28 Feb 2012 10:41:02 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330066564.git.yi.zhao@windriver.com>
In-Reply-To: <cover.1330066564.git.yi.zhao@windriver.com>
Subject: Re: [PATCH V2 0/3] lsbtest: Add recipe for LSB tests and automate test
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
X-List-Received-Date: Tue, 28 Feb 2012 18:49:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/23/2012 11:02 PM, Yi Zhao wrote:
> Hi,
>
> The pull request is to address [YOCTO #1567] - "Add recipe for lsb tests and automate test".
> LSB testing is different from LTP or POSIX testing. We don't need to build the cases from sources but need to install a set of pre-build binary packages in lsb image.
> I add a script and 2 list files in this recipe. The script is used for setting up lsb test environment, download lsb rpm packages from remote, install packages, execute the test and collect the results.
> When run this script in the target, the lsb will be downloaded, installed and executed automatically.
> The version 2 patch add a RDEPENDS_${PN} in .bb file.
>
> The following changes since commit 5aca6a7e940d2d0878279b47db0c399d92d5b4f6:
>
>    update-rc.d.bbclass: do nothing for extended cross packages (2012-02-24 00:47:51 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib yizhao/bug1567v2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=yizhao/bug1567v2
>
> Yi Zhao (3):
>    lsbtest: Add recipe for LSB tests and automate test
>    distro_tracking_fields: add information for lsbtest
>    task-core-lsb: add lsbtest to RDEPENDS_task-core-misc list
>
>   .../conf/distro/include/distro_tracking_fields.inc |    4 +
>   meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      |  510 ++++++++++++++++++++
>   meta/recipes-extended/lsb/lsbtest/packages_list    |   50 ++
>   meta/recipes-extended/lsb/lsbtest/session          |  194 ++++++++
>   meta/recipes-extended/lsb/lsbtest_1.0.bb           |   37 ++
>   meta/recipes-extended/tasks/task-core-lsb.bb       |    3 +-
>   6 files changed, 797 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
>   create mode 100644 meta/recipes-extended/lsb/lsbtest/packages_list
>   create mode 100644 meta/recipes-extended/lsb/lsbtest/session
>   create mode 100644 meta/recipes-extended/lsb/lsbtest_1.0.bb
>
>
Merged into OE-core

Thanks
	Sau!


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


