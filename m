Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHzUg-0006I5-Gm
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 17:30:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Apr 2012 08:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="152411893"
Received: from unknown (HELO [10.255.12.89]) ([10.255.12.89])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2012 08:20:41 -0700
Message-ID: <4F85A149.6030006@linux.intel.com>
Date: Wed, 11 Apr 2012 08:20:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334010389.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1334010389.git.nitin.a.kamble@intel.com>
Cc: yocto@yoctoproject.org
Subject: Re: [PATCH 0/2] Misc bugfixes
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
X-List-Received-Date: Wed, 11 Apr 2012 15:30:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2012 03:27 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit 190f6d791d51aaa4cfb9f1cf932bc205ff674fb5:
>
>    runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:47 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/bugfixes
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes
>
> Nitin A Kamble (2):
>    tclibc-eglibc.inc: make locale packages dependency conditional
>    poky-tiny.conf: adjust eglibc options for poky-tiny
>
>   meta-yocto/conf/distro/poky-tiny.conf      |    6 ++++++
>   meta/conf/distro/include/tclibc-eglibc.inc |   23 ++++++++++++++++-------
>   2 files changed, 22 insertions(+), 7 deletions(-)
>

Nitin, in the future two emails and 2 seperate branches for fixes that 
are OE-Core vs Poky.

Merged these into Poky Master and OE-Core as appropriate

Thanks
	Sau!


