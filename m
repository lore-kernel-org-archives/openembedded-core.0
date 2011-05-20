Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNEHj-0006yv-2s
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 03:13:47 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 May 2011 18:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,239,1304319600"; 
   d="scan'208";a="4283050"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by fmsmga002.fm.intel.com with ESMTP; 19 May 2011 18:10:49 -0700
Message-ID: <4DD5BF99.2020203@linux.intel.com>
Date: Thu, 19 May 2011 18:10:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305525725.git.raj.khem@gmail.com>
In-Reply-To: <cover.1305525725.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/2] Adjust default distrovars
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
X-List-Received-Date: Fri, 20 May 2011 01:13:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2011 11:04 PM, Khem Raj wrote:
> These changes make sure that uclibc based images still build
> and some tasks do not get added forcibly to distros
>
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>    Branch: kraj/default-distro
>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/default-distro
>
> Thanks,
>      Khem Raj<raj.khem@gmail.com>
> ---
>
>
> Khem Raj (2):
>    default-distrovars.inc: Do not add DISTRO_EXTRA_RDEPENDS and
>      DISTRO_EXTRA_RRECOMMENDS
Was merged into oe-core

>    tclibc-uclibc.inc: Append -uclibc only to target recipes
>
Clearly there has been some discussion about this one ;-)!
Richard merged the TMPDIR_append.

>   meta/conf/distro/include/default-distrovars.inc |    3 ---
>   meta/conf/distro/include/tclibc-uclibc.inc      |    5 ++---
>   2 files changed, 2 insertions(+), 6 deletions(-)
>
Thanks
	Sau!



