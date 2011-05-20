Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNE0C-0006Mg-AE
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 02:55:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 May 2011 17:52:43 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2011 17:52:42 -0700
Message-ID: <4DD5BB59.7010709@linux.intel.com>
Date: Thu, 19 May 2011 17:52:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305693096.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1305693096.git.jessica.zhang@intel.com>
Subject: Re: [PATCH 0/2] adt-installer cleanup for latest oecore changes
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
X-List-Received-Date: Fri, 20 May 2011 00:55:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2011 09:36 PM, Jessica Zhang wrote:
> From: Jessica Zhang<jessica.zhang@intel.com>
>
> The change set includes extract bitbake config setting into data_define,
> use config setting variables replace hardcode values, and add adt repo checking
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: jzhang/oe-rename
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jzhang/oe-rename
>
> Thanks,
>      Jessica Zhang<jessica.zhang@intel.com>
> ---
>
>
> Jessica Zhang (2):
>    extract bitbake config setting into data_define, use more variables
>      replacing hardcoded values
>    Add adt repo checking
>
>   .../installer/adt-installer/adt_installer          |   15 +++++++++++++--
>   .../installer/adt-installer/adt_installer.conf     |    2 +-
>   .../adt-installer/scripts/adt_installer_internal   |    4 ++--
>   .../installer/adt-installer/scripts/data_define    |    1 -
>   .../installer/adt-installer_1.0.bb                 |    4 +++-
>   5 files changed, 19 insertions(+), 7 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into oe-core and poky

Thanks
	Sau!



