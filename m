Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMOyW-0002ni-Du
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:26:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 May 2011 11:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="2918025"
Received: from unknown (HELO [10.255.12.160]) ([10.255.12.160])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 11:23:32 -0700
Message-ID: <4DD2BD23.3010901@linux.intel.com>
Date: Tue, 17 May 2011 11:23:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305577030.git.tom_rini@mentor.com>
In-Reply-To: <cover.1305577030.git.tom_rini@mentor.com>
Subject: Re: [PATCH 0/2] Minor fixes
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
X-List-Received-Date: Tue, 17 May 2011 18:26:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2011 01:18 PM, Tom Rini wrote:
> The following series brings in two minor fixups I've pushed into openembedded
> master recently.  openssh was being silly and using ${libdir}exec rather
> than ${libexecdir} and we weren't wrapping perl${PV} which breaks relocated
> caches where perl-native exists and perl doesn't.
>
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>    Branch: trini/minor-fixes-16may2011
>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/minor-fixes-16may2011
>
> Thanks,
>      Tom Rini<tom_rini@mentor.com>
> ---
>
>
> Tom Rini (2):
>    openssh: Don't use ${libdir}exec
>    perl-native: create_wrapper on perl${PV} too
>
>   meta/recipes-connectivity/openssh/openssh_5.6p1.bb |    4 ++--
>   meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    3 ++-
>   2 files changed, 4 insertions(+), 3 deletions(-)
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



