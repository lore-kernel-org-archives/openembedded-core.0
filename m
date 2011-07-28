Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QmELz-0005oI-S7
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:21:32 +0200
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 27 Jul 2011 17:16:10 -0700
Received: by gxk10 with SMTP id 10so2710952gxk.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:16:09 -0700 (PDT)
Received: by 10.143.6.18 with SMTP id j18mr237630wfi.348.1311812169618;
	Wed, 27 Jul 2011 17:16:09 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net
	[71.193.189.117])
	by mx.google.com with ESMTPS id m12sm220243wfh.19.2011.07.27.17.16.06
	(version=SSLv3 cipher=OTHER); Wed, 27 Jul 2011 17:16:07 -0700 (PDT)
Message-ID: <4E30AA46.6050309@intel.com>
Date: Wed, 27 Jul 2011 17:16:06 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311605321.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1311605321.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/1] machine/qemu: set preferred linux-yocto kernel version
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
X-List-Received-Date: Thu, 28 Jul 2011 00:21:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2011 07:51 AM, Bruce Ashfield wrote:
> The staging of the linux-yocto-3.0 kernel is taking
> precedence over the 2.6.37 variant. We want the known
> good 2.6.37 to still be the default for a while longer.
>
> I'm making this change in qemu.inc, if anyone has a
> better idea or alternate preferred approach, let me
> know and we can update this change.
>
> The following changes since commit b3dffd26d650444883a2563b25da420d96712e09:
>
>    Merge branch 'master' of git://git.pokylinux.org/poky (2011-07-25 09:03:19 -0400)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    machine/qemu: set preferred linux-yocto kernel version
>
>   meta/conf/machine/include/qemu.inc |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



