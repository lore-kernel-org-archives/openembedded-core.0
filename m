Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SK9Mb-0000nQ-3P
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 16:26:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Apr 2012 07:17:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="133497303"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2012 07:17:09 -0700
Message-ID: <4F8D7B65.5030902@linux.intel.com>
Date: Tue, 17 Apr 2012 07:17:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334606582.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1334606582.git.elizabeth.flanagan@intel.com>
Subject: Re: [PATCH 0/2] Image description fixes
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
X-List-Received-Date: Tue, 17 Apr 2012 14:26:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/16/2012 01:09 PM, Beth Flanagan wrote:
> [YOCTO #2227]
>
> This changeset fixes two issues.
>
> core-image-rt* DESCRIPTION: because of the require for core-image-minimal,
> DESCRIPTION is reset to the imported value. Moved the require to the beginning.
>
> A better solution may be to set all the image DESCRIPTIONS to ?= but that
> may introduce some issues.
>
> This also fixes a small typo in core-image-sato-sdk.
>
> The following changes since commit 5326847ef821c382aac26b474ab0e35939c463b7:
>
>    Hob: fixed a little view issue about package selection page (2012-04-16 12:56:25 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib eflanagan/image_desc
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/image_desc
>
> Beth Flanagan (2):
>    core-image-rt-*.bb: require munges DESCRIPTION
>    core-image-sato-sdk: typo in DESCRIPTION
>
>   meta/recipes-rt/images/core-image-rt-sdk.bb     |    3 +--
>   meta/recipes-rt/images/core-image-rt.bb         |    3 +--
>   meta/recipes-sato/images/core-image-sato-sdk.bb |    2 +-
>   3 files changed, 3 insertions(+), 5 deletions(-)
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


