Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SsNbM-0005Ua-I2
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 02:31:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Jul 2012 17:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171027767"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by azsmga001.ch.intel.com with ESMTP; 20 Jul 2012 17:19:55 -0700
Message-ID: <5009F5AB.1080707@linux.intel.com>
Date: Fri, 20 Jul 2012 17:19:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342772908.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1342772908.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] package_rpm and createrepo fixes
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
X-List-Received-Date: Sat, 21 Jul 2012 00:31:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2012 02:49 AM, Robert Yang wrote:
> Hi Saul,
>
> For the error:
>
> dbconfig.c:493: db3New: Assertion `dbOpts != ((void *)0) && *dbOpts != '\0'' failed.
>
> The dbOpts is the value of _dbi_config_ or _dbi_config which are defined
> in tmp/sysroots/i686-linux/usr/lib/rpm/macros, I can't reproduce it in
> a normal build (on Ubuntu 10.10, Fedora 17 64bit, Ubuntu 12.04 64bit),
> the error would happen when manually remove i686-linux/usr/lib/rpm/macros,
> (but it should be there since the librpmdb-5.4.so is ready in a normal
> build).
>
> These two patches are used for fixing other issues of createrepo.
>
Turns out the real problem is that one machine was running Suse and the 
other Fedora and mixing the binaries via nfs and sstate was causing the 
real problem.

I made a note about the DEPENDS for createrepo, really should be part of 
package_rpm.bbclass

> // Robert
>
> The following changes since commit 64f7feb5c37d06e1985c59106cf2f7cd286fd0b8:
>
>    EFI: Make installer EFI aware (2012-07-19 17:49:48 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/createrepo
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/createrepo
>
> Robert Yang (2):
>    package_rpm: DEPLOY_DIR_RPM must exist before make index
>    createrepo 0.4.11: fix the RDEPENDS
>
>   meta/classes/package_rpm.bbclass                   |    4 ++--
>   .../createrepo/createrepo_0.4.11.bb                |    4 +++-
>   2 files changed, 5 insertions(+), 3 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Merged into OE-Core

Thanks
	Sau!



