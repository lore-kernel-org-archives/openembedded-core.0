Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlFFQ-0002RY-6E
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 08:38:56 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2012 23:31:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106287536"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2012 23:31:09 -0800
Message-ID: <4F0E8C3D.7040507@linux.intel.com>
Date: Wed, 11 Jan 2012 23:31:09 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	wenzong.fan@windriver.com, "Yan, Xiaofeng" <Xiaofeng.Yan@windriver.com>,
	Mark Hatle <mark.hatle@windriver.com>
References: <cover.1326266933.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1326266933.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH v2 0/1] archive.bbclass: archive work directory
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
X-List-Received-Date: Thu, 12 Jan 2012 07:38:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2012 11:34 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> v2 updates:
>
> 1) Remove the special-casing for gcc, checking for any packages under
> 'tmp/work-shared';
>
> 2) Remove some bash-specific code, replase the '[[regular-expression]]'
> with isovalent 'grep' statement.
>
>
So how is this work different than that of Xiaofeng's doing the 
tar_archive?  Can these two be merged somehow?  We also have something 
called copyleft complaince, is this similar or somehow different?

We also have src_distribute.bbclass and sourcepkg.bbclass, seems like we 
have a more ways to package up source code than we know what to do with.

Mark, we might want to sync up on this and figure out what we really 
have and what's really needed here.

Thanks
	Sau!




> The following changes since commit 4a8a3c503fd896593b787c26edbe46a7324e494e:
>    Richard Purdie (1):
>          Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works"
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/1590
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/1590
>
> Wenzong Fan (1):
>    archive.bbclass: archive work directory
>
>   meta/classes/archive.bbclass |   49 ++++++++++++++++++++++++++++++++++++++++++
>   1 files changed, 49 insertions(+), 0 deletions(-)
>   create mode 100644 meta/classes/archive.bbclass
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


