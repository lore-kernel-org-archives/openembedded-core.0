Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S1TOu-0006k3-Dg
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 02:59:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2012 17:51:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111897704"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2012 17:51:22 -0800
Message-ID: <4F49901A.2000403@linux.intel.com>
Date: Sat, 25 Feb 2012 17:51:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330121220.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1330121220.git.elizabeth.flanagan@intel.com>
Subject: Re: [PATCH 0/3] License Related Patches
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
X-List-Received-Date: Sun, 26 Feb 2012 01:59:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2012 02:17 PM, Beth Flanagan wrote:
> A few license related patches:
>
> 1. Per a request from Mark Hatle, adding the email from Mark Nudelman to me
> which allows us to use BSD license as opposed to the less license within the
> recipe.
>
> 2. Next patch looks for package level LICENSE. If it finds it, it uses it. If
> not it falls back to LICENSE.
>
> 3. A bit of space optimization around copying licenses to the image. When
> COPY_LIC_MANIFEST and COPY_LIC_DIRS are set we copy the generic licenses once if
> found and then symlink to it from each /usr/share/common-licenses/${pkg}
> directory.
>
> The following changes since commit 21ddc964ced18d4f1058c003f46acc2c7f1f1fe3:
>
>    scripts/hob: Launch the new hob (2012-02-24 18:09:20 +0000)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib eflanagan/license_fixes
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_fixes
>
> Elizabeth Flanagan (3):
>    less_444.bb: Adding license email from author
>    license.bbclass: Gather Pkg level licenses
>    license.bbclass: Symbolic links of generic license
>
>   meta/classes/license.bbclass           |   32 +++++++++++++++++++++++---------
>   meta/recipes-extended/less/less_444.bb |   15 ++++++++++++---
>   2 files changed, 35 insertions(+), 12 deletions(-)
>
Merged into OE-core

Thanks
	Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


