Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTVM-0007nt-7C
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:13:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2012 12:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="177970570"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2012 12:02:06 -0700
Message-ID: <5011941E.2060003@linux.intel.com>
Date: Thu, 26 Jul 2012 12:01:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
In-Reply-To: <cover.1343199345.git.Xin.Ouyang@windriver.com>
Subject: Re: [PATCH 0/1] mtools: add glibc-gconv-* to RDEPENDS/RRECOMMENDS
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
X-List-Received-Date: Thu, 26 Jul 2012 19:13:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2012 12:02 AM, xin.ouyang@windriver.com wrote:
> From: Xin Ouyang <Xin.Ouyang@windriver.com>
>
> [YOCTO #2829]
>
> mtools commands use cp850 as the "mtools_default_codepage", they would
> use this to do some coverting tasks.
>
> So, add glibc-gconv-ibm850 to RDEPENDS for mtools commands to run
> correctly.
>
>
>
>
> The following changes since commit 0ffb02eec2beaea27ff0ec9d3d31b0a09e675a4c:
>
>    documentation: Updated the h6 style to use a larger font (2012-07-24 10:35:34 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib xouyang/master
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xouyang/master
>
> Xin Ouyang (1):
>    mtools: add glibc-gconv-* to RDEPENDS/RRECOMMENDS
>
>   meta/recipes-devtools/mtools/mtools_3.9.9.bb  |   20 +++++++++++++++++++-
>   meta/recipes-devtools/mtools/mtools_4.0.17.bb |   20 +++++++++++++++++++-
>   2 files changed, 38 insertions(+), 2 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



