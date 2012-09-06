Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9kN2-00079j-N4
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 00:16:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2012 15:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,381,1344236400"; d="scan'208";a="219068256"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2012 15:03:53 -0700
Message-ID: <50491DC8.30607@linux.intel.com>
Date: Thu, 06 Sep 2012 15:03:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1346968713-16778-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1346968713-16778-1-git-send-email-sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-session: Should have high ALTERNATIE_PRIORITY than mini-x-session
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
X-List-Received-Date: Thu, 06 Sep 2012 22:16:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2012 02:58 PM, Saul Wold wrote:
> By having a high priority it will be installed instead of the mini-x-session
> when both are in a give set of packagegroups, as it stands now the
> mini-x-session is installed by default on sato which is wrong!
>
This issue occurred because during the packagegroup reorganization, the 
mini-x-session was added to core-x11-base

The mini-x-session is really targeted for the build appliance and maybe 
it's name caused some confusion.  I would suggest we might want to 
create a different x-session file for core-x11-base and/or rename the 
mini-x-session, since it's not appropriate.


> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   .../matchbox-session/matchbox-session_0.1.bb       |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
> index f4be279..b9e83a5 100644
> --- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
> +++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
> @@ -11,13 +11,13 @@ RCONFLICTS_${PN} = "matchbox-common"
>   SRC_URI = "file://matchbox-session"
>   S = "${WORKDIR}"
>
> -PR = "r3"
> +PR = "r4"
>
>   inherit update-alternatives
>
>   ALTERNATIVE_${PN} = "x-session-manager"
>   ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/matchbox-session"
> -ALTERNATIVE_PRIORITY = "10"
> +ALTERNATIVE_PRIORITY = "100"
>
>   do_install() {
>   	install -d ${D}/${bindir}
>


