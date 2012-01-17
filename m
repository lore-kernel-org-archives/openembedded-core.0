Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnFVq-0003qr-7l
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:20:10 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 12:12:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57383361"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 12:12:29 -0800
Message-ID: <4F15D62D.9090803@linux.intel.com>
Date: Tue, 17 Jan 2012 12:12:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326476501.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326476501.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/4] Error message fixes / cleanup
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
X-List-Received-Date: Tue, 17 Jan 2012 20:20:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2012 09:42 AM, Paul Eggleton wrote:
> A trio of of minor improvements to error messages as well as the removal
> of packagehistory.bbclass.
>
> The following changes since commit bd047935305c872b565f30b46c94b7077e5fb3a2:
>
>    patch.bbclass: Ensure the DATE and SRCDATE variable exclusions apply to the correct function (2012-01-13 16:56:20 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/fixes10
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes10
>
> Paul Eggleton (4):
>    classes/base: note variable name in COMPATIBLE_* skip messages
>    conf/bitbake.conf: allow wget to output error messages
>    classes/package: remove out-of-date notice referring to the OE
>      bugtracker
>    classes/packagehistory: remove now obsolete class
>
>   meta/classes/base.bbclass           |    4 +-
>   meta/classes/package.bbclass        |    3 -
>   meta/classes/packagehistory.bbclass |  249 -----------------------------------
>   meta/conf/bitbake.conf              |    6 +-
>   4 files changed, 5 insertions(+), 257 deletions(-)
>   delete mode 100644 meta/classes/packagehistory.bbclass
>

Merged into OE-Core

Thanks
	Sau!


