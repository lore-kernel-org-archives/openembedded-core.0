Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcUT-0007fv-83
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:10:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 11:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144310143"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 24 May 2012 11:00:12 -0700
Message-ID: <4FBE772C.3000609@linux.intel.com>
Date: Thu, 24 May 2012 11:00:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337733905.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337733905.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/1] updated commit for packaging mtrace seqarately
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
X-List-Received-Date: Thu, 24 May 2012 18:10:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2012 05:46 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit 39a9267dee0a0ee4d87ed51d4a0272549c462b02:
>
>    Hob: add '--select a machine--' and '--select a base image--' to GUI (2012-05-22 14:56:17 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/mtrace
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/mtrace
>
> Nitin A Kamble (1):
>    eglibc: package mtrace separately
>
>   meta/recipes-core/eglibc/eglibc-package.inc      |    7 ++++++-
>   meta/recipes-core/eglibc/eglibc_2.13.bb          |    2 +-
>   meta/recipes-core/eglibc/eglibc_2.15.bb          |    2 +-
>   meta/recipes-core/tasks/task-core-tools-debug.bb |    4 ++++
>   4 files changed, 12 insertions(+), 3 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


