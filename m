Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjF7P-0007Pb-9B
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:34:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jul 2011 11:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,229,1309762800"; d="scan'208";a="29863246"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2011 11:29:37 -0700
Message-ID: <4E25CD11.3090306@linux.intel.com>
Date: Tue, 19 Jul 2011 11:29:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310511423.git.josh@linux.intel.com>
In-Reply-To: <cover.1310511423.git.josh@linux.intel.com>
Subject: Re: [PATCH 0/2] Hob integration patches
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
X-List-Received-Date: Tue, 19 Jul 2011 18:34:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2011 04:24 PM, Joshua Lock wrote:
> Hob is the BitBake GUI I've been working on, the following pair of patches
> make it a little more nicely integrated into OE-Core.
>
> The first adds a variable to image_types.bbclass that the GUI can use to
> determine what image types are available.
>
> The second adds a wrapper script to call the GUI with a postfile, if the UI
> can find hob.local.conf any configuration settings made in the UI will be
> written to that file, rather than local.conf, ensuring that configuration
> changes made in the GUI don't affect CLI builds.
>
> The following changes since commit a6e9edb7b4b5b0bdb067a59d691d33fba8948963:
>
>    sato-sdk: add clutter for sato-sdk image (2011-07-12 15:23:35 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/hob
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/hob
>
> Joshua Lock (2):
>    classes/image_types: add a variable to list available IMAGE_FSTYPE's
>    scripts/hob: wrapper script to run hob gui with a UI specific config
>      file
>
The scripts/hob patch has been merged, but the image_types is pending a 
v2 I believe.

Thanks
	Sau!


>   meta/classes/image_types.bbclass |    2 ++
>   scripts/hob                      |   18 ++++++++++++++++++
>   2 files changed, 20 insertions(+), 0 deletions(-)
>   create mode 100755 scripts/hob
>


