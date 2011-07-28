Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QmEMF-0005pd-BN
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:21:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2011 17:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="35302130"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2011 17:17:29 -0700
Message-ID: <4E30AA99.90806@linux.intel.com>
Date: Wed, 27 Jul 2011 17:17:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311671726.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1311671726.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/3] Adding patches to support pam
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
X-List-Received-Date: Thu, 28 Jul 2011 00:21:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2011 03:08 AM, Xiaofeng Yan wrote:
> Hi Saul&  Richard,
>
> I modified my patches about how to whitespace and tab in .bb file according to your suggestion.
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
>    dropbear: Support pam
>    polkit: Support pam
>
>   .../openssh/openssh-5.8p2/sshd                     |   10 ++++++++
>   meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   13 +++++++++-
>   meta/recipes-core/dropbear/dropbear.inc            |    8 ++++++-
>   .../dropbear/dropbear/dropbear-enable-pam.patch    |   22 +++++++++++++++++++
>   meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
>   .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 ++++++++++++++++++++
>   meta/recipes-extended/polkit/polkit_0.101.bb       |    7 ++++-
>   7 files changed, 79 insertions(+), 6 deletions(-)
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

Merged into oe-core

Thanks
	Sau!


