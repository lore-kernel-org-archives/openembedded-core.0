Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Vao-0000y8-Dd
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 05:47:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2011 20:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,348,1312182000"; d="scan'208";a="46631422"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by azsmga001.ch.intel.com with ESMTP; 07 Sep 2011 20:42:56 -0700
Message-ID: <4E6839C0.7070600@linux.intel.com>
Date: Wed, 07 Sep 2011 20:42:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1315069299.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315069299.git.sgw@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix gettext dependency issue
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
X-List-Received-Date: Thu, 08 Sep 2011 03:47:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2011 10:04 AM, Saul Wold wrote:
> Use gettext's internal libraries for libxml and libcroco to
> ensure that there is not any strange behavior if ordering of
> the build of these items changes.
>
> The gettext-tools configure script looks for a libxml and libcroco
> in sysroot and this can cause an unforseen dependency issue.
>
> Sau!
>
> The following changes since commit 0616557a8c29b42bae0ffd5fd665a046810047e4:
>
>    populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH (2011-09-02 23:38:00 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib sgw/fix
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
>
> Saul Wold (1):
>    gettext: use included libxml and libcroco
>
>   meta/recipes-core/gettext/gettext_0.18.1.1.bb |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
Merged into OE-Core

Thanks
	Myse!f


