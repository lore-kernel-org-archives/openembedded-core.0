Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rk7sY-0007o3-1h
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 06:34:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jan 2012 21:27:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93743729"
Received: from unknown (HELO [10.255.13.28]) ([10.255.13.28])
	by azsmga001.ch.intel.com with ESMTP; 08 Jan 2012 21:27:13 -0800
Message-ID: <4F0A7AB1.1090306@linux.intel.com>
Date: Sun, 08 Jan 2012 21:27:13 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325785538.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325785538.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/4] buildhistory analysis
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
X-List-Received-Date: Mon, 09 Jan 2012 05:34:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 09:56 AM, Paul Eggleton wrote:
> The first part of the buildhistory analysis functionality (command-line
> only at the moment). It hasn't been heavily tested "in anger" yet (I
> hope we will start to use it on the Yocto Project autobuilder fairly
> soon) but it is functional.
>
> There are also a couple of improvements to buildhistory.bbclass itself.
>
> The following changes since commit 563828bad19a242bba9ce3db461bb5807037dfdf:
>
>    multilib: Abstract class extension code into classextend.py (2012-01-05 12:36:08 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-analysis
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-analysis
>
> Paul Eggleton (4):
>    buildhistory: add script to check for significant changes
>    classes/buildhistory: add hostname to commit message
>    classes/buildhistory: make the package version backwards error
>      non-fatal
>    classes/buildhistory: remove redundant package history checking stub
>
>   meta/classes/buildhistory.bbclass    |   16 +--
>   meta/lib/oe/buildhistory_analysis.py |  240 ++++++++++++++++++++++++++++++++++
>   scripts/buildhistory-diff            |   43 ++++++
>   3 files changed, 286 insertions(+), 13 deletions(-)
>   create mode 100644 meta/lib/oe/buildhistory_analysis.py
>   create mode 100755 scripts/buildhistory-diff
>

Merged into OE-Core

Thanks
	Sau!


