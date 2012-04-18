Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKWg7-0004CI-LR
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:20:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Apr 2012 08:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155164556"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2012 08:10:50 -0700
Message-ID: <4F8ED97A.4070907@linux.intel.com>
Date: Wed, 18 Apr 2012 08:10:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334742865.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1334742865.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] [1.2] Fix distro checks in sanity.bbclass
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
X-List-Received-Date: Wed, 18 Apr 2012 15:20:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/18/2012 02:56 AM, Paul Eggleton wrote:
> After actually testing the distro sanity check on current distro
> versions on top of master, two issues were discovered; these
> trivial patches fix those issues.
>
>
> The following changes since commit 973351cf2e338f07c11395d494193e9c62857f2d:
>
>    libproxy: remove dependency on gconf when x11 not in DISTRO_FEATURES (2012-04-18 00:31:24 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/sanity-distro-fix
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sanity-distro-fix
>
> Paul Eggleton (2):
>    classes/sanity: trim trailing newline when reading
>      /etc/redhat-release
>    classes/sanity: import regular expression module in SuSE distro check
>
>   meta/classes/sanity.bbclass |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


