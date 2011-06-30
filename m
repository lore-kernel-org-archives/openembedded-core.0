Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc8RW-0007nj-5z
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 06:01:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2011 20:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,447,1304319600"; d="scan'208";a="24572306"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2011 20:57:32 -0700
Message-ID: <4E0BF42B.4060703@linux.intel.com>
Date: Wed, 29 Jun 2011 20:57:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308615886.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1308615886.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] login.defs move
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
X-List-Received-Date: Thu, 30 Jun 2011 04:01:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2011 05:29 PM, Scott Garman wrote:
> Hello,
>
> This pull request moves the login.defs file previously included
> with base-passwd into a more appropriate recipe, shadow-sysroot
> (I'm not married to that recipe name if someone can suggest
> something better).
>
> login.defs is part of shadow-utils and the copy included with
> base-passwd was contaminating target package installations.
> Moving it into its own recipe keeps it logically separate and
> easier to manage the requirements of useradd.bbclass.
>
> The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
>
>    systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:14:06 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/login-defs-move
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/login-defs-move
>
> Scott Garman (2):
>    shadow-sysroot: new recipe for useradd.bbclass support
>    base-passwd: remove login.defs references
>
>   .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   11 +----
>   .../shadow/files/login.defs_shadow-sysroot}        |   34 ++++++++--------
>   .../shadow/shadow-sysroot_4.1.4.3.bb               |   41 ++++++++++++++++++++
>   3 files changed, 60 insertions(+), 26 deletions(-)
>   rename meta/{recipes-core/base-passwd/base-passwd-3.5.22/login.defs =>  recipes-extended/shadow/files/login.defs_shadow-sysroot} (96%)
>   create mode 100644 meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


