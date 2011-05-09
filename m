Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJTxK-0003s0-Oc
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 19:09:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 May 2011 10:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,341,1301900400"; d="scan'208";a="433078412"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 10:06:26 -0700
Message-ID: <4DC81F11.3090401@linux.intel.com>
Date: Mon, 09 May 2011 10:06:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <BANLkTi=EENCHs5vHLhf3L6s2ACRbABFkFw@mail.gmail.com>
In-Reply-To: <BANLkTi=EENCHs5vHLhf3L6s2ACRbABFkFw@mail.gmail.com>
Subject: Re: Pull request with misc fixes
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
X-List-Received-Date: Mon, 09 May 2011 17:09:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2011 12:14 PM, Otavio Salvador wrote:
> Hello,
>
> I have sent those patches to mailing list some days ago but they
> haven't been merged since it and some merged changes has conflicts
> that need to be fixed. So I did.
>
Octavio,

I am working on reviewing and staging them.  I did not see a patch for 
the libxbkfile, did I miss that email?

Sau!

> The following changes since commit 4f4bac0a459fe238e105e96b2b59b6af88e639c4:
>
>    sanity.bbclass: Add cpio to list of required utilities tested for
> (2011-05-07 09:05:57 +0100)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core.git master
>
> Otavio Salvador (5):
>        meta/conf/local.conf.sample: fix mklibs comment line split and typo
>        scripts/oe-setup-builddir: fix typo
>        syslinux: improve packaging
>        busybox: add support to mdev
>        libxkbfile: disable xcb
>
>   meta/conf/local.conf.sample                        |    7 ++--
>   meta/recipes-core/busybox/busybox.inc              |   14 +++++++-
>   meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +
>   meta/recipes-core/busybox/files/mdev               |    7 ++++
>   meta/recipes-core/busybox/files/mdev.conf          |   35 ++++++++++++++++++++
>   meta/recipes-devtools/syslinux/syslinux_4.03.bb    |   12 ++++++-
>   meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb |    4 ++-
>   scripts/oe-setup-builddir                          |    2 +-
>   8 files changed, 75 insertions(+), 8 deletions(-)
>   create mode 100755 meta/recipes-core/busybox/files/mdev
>   create mode 100644 meta/recipes-core/busybox/files/mdev.conf
>
>


