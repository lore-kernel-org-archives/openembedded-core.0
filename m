Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3qqt-000802-8J
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 17:58:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by fmsmga102.fm.intel.com with ESMTP; 21 Aug 2012 08:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,802,1336374000"; d="scan'208";a="136544763"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Aug 2012 08:46:34 -0700
Message-ID: <5033AD5A.1090907@linux.intel.com>
Date: Tue, 21 Aug 2012 08:46:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: jackie.huang@windriver.com
References: <cover.1345534679.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1345534679.git.jackie.huang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] coreutils: fix to build with acl support
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
X-List-Received-Date: Tue, 21 Aug 2012 15:58:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2012 12:42 AM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Fix the issue that coreutils was built without acl support:
>
> configure: WARNING: libacl development library was not found or not usable.
> configure: WARNING: GNU coreutils will be built without ACL support.
>
> which will cause ls and cp commands don't have the ACL related behaviors:
> ls -l: no plus sign(+) after the permission string for files that have ACL
> cp -p: can not preserves the ACLs.
>
> [YOCTO #2959]
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
> The following changes since commit 04568d1f18250d531aad5d286157d2d559083520:
>
>    qemu: Fix broken accidental path move (2012-08-20 17:25:21 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib jhuang0/bug2959_acl_0821
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/bug2959_acl_0821
>
> Jackie Huang (1):
>    coreutils: fix to build with acl support
>
>   .../coreutils-6.9/coreutils-build-with-acl.patch   |   28 ++++++++++++++++++++
>   .../coreutils-8.14/coreutils-build-with-acl.patch  |   28 ++++++++++++++++++++
>   meta/recipes-core/coreutils/coreutils_6.9.bb       |    1 +
>   meta/recipes-core/coreutils/coreutils_8.14.bb      |    1 +
>   4 files changed, 58 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch
>   create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch
>
Merged into OE-Core

Please remember to add PR Bumps for recipe changes.

Thanks
	Sau!



