Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHQI-0005gC-Hk
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:06:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Jul 2012 09:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120398840"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 09:55:40 -0700
Message-ID: <4FFB0D0C.4030201@linux.intel.com>
Date: Mon, 09 Jul 2012 09:55:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341574354.git.ross.burton@intel.com>
In-Reply-To: <cover.1341574354.git.ross.burton@intel.com>
Subject: Re: [PATCH 0/2] Fix QA warnings from ConnMan
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
X-List-Received-Date: Mon, 09 Jul 2012 17:06:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2012 04:39 AM, Ross Burton wrote:
> ConnMan warns that /usr/lib/connman/plugins isn't shipped, so ship the empty
> directory in the main package.  Whilst there, remove some entirely pointless
> entires in FILES.
>
> The following changes since commit 5051e9837fa698e03d0a7a8a918ee7aa98409ce1:
>
>    bitbake: usermanual: Fix missing markup (2012-07-06 09:41:56 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/connman
>
> for you to fetch changes up to e7d865a01ec2b7f0aaf8bfd38d1604e9c1764207:
>
>    connman: ship the empty plugins directory in the connman package (2012-07-06 12:30:41 +0100)
>
> ----------------------------------------------------------------
> Ross Burton (2):
>        connman: remove some obviously wrong (circa early-GNOME 2?) directories from FILES
>        connman: ship the empty plugins directory in the connman package
>
>   meta/recipes-connectivity/connman/connman.inc |    8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> Ross Burton (2):
>    connman: remove some obviously wrong (circa early-GNOME 2?)
>      directories from FILES
>    connman: ship the empty plugins directory in the connman package
>
>   meta/recipes-connectivity/connman/connman.inc |    8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


