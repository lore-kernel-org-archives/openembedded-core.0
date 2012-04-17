Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SK9P6-0000uR-NI
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 16:29:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Apr 2012 07:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154671861"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2012 07:19:45 -0700
Message-ID: <4F8D7C01.6060400@linux.intel.com>
Date: Tue, 17 Apr 2012 07:19:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334594354.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1334594354.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix perl re-execution issues
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
X-List-Received-Date: Tue, 17 Apr 2012 14:29:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/16/2012 09:43 AM, Paul Eggleton wrote:
> Fix re-execution issues within perl.
>
> Note: I identified that some references to /usr/include are still not
> being substituted before or after this patch - you can see these by
> doing "grep -rI '/usr/include' *" in WORKDIR after do_configure(). I do
> not know enough about how we build perl to know if these are an issue or
> not, thus I left them alone.
>
>
> The following change since commit 4e1a8ed1ab7e7bd950e511c79ddfe072cb280a6e:
>
>    bitbake.conf: Include abi_version.conf in a early stage (2012-04-16 12:51:50 +0100)
>
> is available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/perl-reexec
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/perl-reexec
>
> Paul Eggleton (1):
>    perl: fix re-execution of patch/configure
>
>   meta/recipes-devtools/perl/perl_5.14.2.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


