Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SJoBl-00008t-Rp
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 17:50:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2012 08:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="130198399"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by orsmga001.jf.intel.com with ESMTP; 16 Apr 2012 08:40:10 -0700
Message-ID: <4F8C3D59.9060703@linux.intel.com>
Date: Mon, 16 Apr 2012 08:40:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334346682.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1334346682.git.tom.zanussi@intel.com>
Subject: Re: [PATCH 0/2] systemtap doc build fix
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
X-List-Received-Date: Mon, 16 Apr 2012 15:50:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2012 12:55 PM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi<tom.zanussi@intel.com>
>
> This patchset fixes a documentation build problem with docproc, then
> turns documentation generation off by default, since when it works,
> it adds a lot to the build time.
>
> The following changes since commit 04b16f1038f7cae445d741e86c2cc19c70f991c1:
>    Andrei Gherzan (1):
>          rpm-native: Compile python rpm module (with-python)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/2193-fix
>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/2193-fix
>
> Tom Zanussi (2):
>    systemtap: fix docproc build error
>    systemtap: disable document generation by default
>
>   .../systemtap/systemtap/docproc-build-fix.patch    |   19 +++++++++++++++++++
>   meta/recipes-kernel/systemtap/systemtap_git.bb     |   10 +++++++++-
>   meta/recipes-kernel/systemtap/systemtap_git.inc    |    4 +++-
>   3 files changed, 31 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core with additional patch from RP as noted.

Thanks
	Sau!


