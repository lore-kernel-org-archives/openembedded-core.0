Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TSHdh-0005Hf-Dg
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Oct 2012 02:26:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Oct 2012 18:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,663,1344236400"; d="scan'208";a="212008365"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2012 18:12:24 -0700
Message-ID: <508C8678.4000703@linux.intel.com>
Date: Sat, 27 Oct 2012 18:12:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Jack Mitchell <ml@communistcode.co.uk>
References: <1351258645-14649-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1351258645-14649-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Improve x11 distro_feature checks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Oct 2012 01:26:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2012 06:37 AM, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> Improvement to the detection of the x11 distro_feature in a few recipes
> with the final achievement being that GTK+ is no longer required in
> core-image-minimal if dbg-pkgs, tools-profile and tools-debug are enabled
> when x11 is not in distro_features.
>
>
> Jack Mitchell (3):
>    latencytop: disable GTK and remove gtk+ dependacy
>    packagegroup-core-tools-profile: include sysprof only if x11 is
>      distro feature
>    babeltrace: fix depends
>

These all need PR Bumps.

Thanks
	Sau!

>   .../packagegroups/packagegroup-core-tools-profile.bb        |  4 +++-
>   .../latencytop/latencytop-0.5/latencytop-makefile.patch     | 13 +++++++------
>   meta/recipes-kernel/latencytop/latencytop_0.5.bb            |  6 ++++--
>   meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb            |  2 +-
>   4 files changed, 15 insertions(+), 10 deletions(-)
>


