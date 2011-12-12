Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaF79-00089H-6f
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 00:16:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Dec 2011 15:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="85782336"
Received: from unknown (HELO [10.255.12.64]) ([10.255.12.64])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2011 15:09:59 -0800
Message-ID: <4EE689C6.9070407@linux.intel.com>
Date: Mon, 12 Dec 2011 15:09:58 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323536396.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1323536396.git.elizabeth.flanagan@intel.com>
Subject: Re: [PATCH 0/1] [YOCTO #1819] License addtask PR bump failure
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
X-List-Received-Date: Mon, 12 Dec 2011 23:16:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2011 09:03 AM, Beth Flanagan wrote:
> Changing back addtask of do_populate_lic as it does not need to be
> before do_compile and the change causes updated recipes to fail,
> requiring a clean.
>
> The following changes since commit 924b1e47ab7895e42dd6a56952beb2ef2f61e4fe:
>
>    license/copyleft: exception for ast parse (2011-12-10 00:18:15 +0000)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib eflanagan/license_1819
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_1819
>
> Elizabeth Flanagan (1):
>    [YOCTO #1819] license: PR bump failure
>
>   meta/classes/license.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged with minor tweak to the commit message

Thanks
	Sau!


