Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFCOY-00052I-Hb
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 00:40:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2012 15:31:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149319068"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2012 15:30:59 -0700
Message-ID: <4F7B7A23.4000705@linux.intel.com>
Date: Tue, 03 Apr 2012 15:30:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332831633.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1332831633.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/2] contacts: fix build error and schema installation
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
X-List-Received-Date: Tue, 03 Apr 2012 22:40:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/27/2012 12:01 AM, Robert Yang wrote:
> The following changes since commit d3e0beed9eef53018158c9f999cd20b44629aa61:
>
>    guile: Deal with hardcoded path issues (2012-03-27 00:29:00 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/contacts
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/contacts
>
> Robert Yang (2):
>    contacts 0.9: failed to build
>    contacts.inc: conditionally install shema
>
>   meta/recipes-sato/pimlico/contacts.inc             |    4 ++-
>   .../contacts-conditionally-install-schema.patch    |   37 ++++++++++++++++++++
>   meta/recipes-sato/pimlico/contacts_0.9.bb          |   15 +++++++-
>   3 files changed, 54 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-sato/pimlico/contacts/contacts-conditionally-install-schema.patch
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


