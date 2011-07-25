Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlNxk-0000W9-1o
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:25:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Jul 2011 09:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,262,1309762800"; d="scan'208";a="31199450"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2011 09:20:36 -0700
Message-ID: <4E2D97D4.9050509@linux.intel.com>
Date: Mon, 25 Jul 2011 09:20:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311574519.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1311574519.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/3] Adding pam supporting
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
X-List-Received-Date: Mon, 25 Jul 2011 16:25:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2011 01:23 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Hi Saul,
>
> I modified my patches according to your suggestion.
> - Using spaces instead of tab

Xiaofeng,

As Richard already pointed out you changed the white space incorrectly, 
there are 2 types of white space used in recipe files.  For things that 
are shell commands, we use TAB (as the file originally was doing), for 
python fragments 4 spaces are used. For recipe metadata, spaces are used 
to line up indentation of lists (Such as SRC_URI, EXTRA_OEMAKE, ...)

Please review

https://wiki.yoctoproject.org/wiki/Best_Known_Methods_%28BKMs%29_for_Package_Updating#White_Space_Management

I am sorry that was not clear from my email.

Sau!

> - The patches can work only when pam is enabled
> - Using OE-Core instead of poky
>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/pam
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/pam
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (3):
>    openssh: Support PAM
>    polkit: Support pam
>    dropbear: Support pam
>
>   .../openssh/openssh-5.8p2/sshd                     |   10 +++
>   meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   77 +++++++++++---------
>   meta/recipes-core/dropbear/dropbear.inc            |   78 +++++++++++---------
>   .../dropbear/dropbear/dropbear-enable-pam.patch    |   22 ++++++
>   meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
>   .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 ++++++
>   meta/recipes-extended/polkit/polkit_0.101.bb       |    7 +-
>   7 files changed, 146 insertions(+), 73 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
>   create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


