Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SEKPm-0004rV-BK
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 15:01:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q31CqcHL006589
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Apr 2012 05:52:38 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.18.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 1 Apr 2012 05:52:38 -0700
Message-ID: <4F784F92.5020908@windriver.com>
Date: Sun, 1 Apr 2012 08:52:34 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1333264701.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1333264701.git.dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] tiny: Update linux-yocto-tiny to 3.2
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
X-List-Received-Date: Sun, 01 Apr 2012 13:01:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-04-01 3:19 AM, Darren Hart wrote:
> The following changes since commit c97f7f4e4ecd6c431712059c34ebc17b68b055ae:
>
>    cross-canadian.bbclass: fix rpath for sdk executables (2012-03-31 18:00:36 +0100)

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> are available in the git repository at:
>    git://git.infradead.org/users/dvhart/oe-core.git dvhart/tiny
>    http://git.infradead.org/users/dvhart/oe-core.git/shortlog/refs/heads/dvhart/tiny
>
> Darren Hart (1):
>    tiny: Update linux-yocto-tiny to 3.2
>
>   meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg |    9 -
>   .../recipes-kernel/linux/linux-yocto-tiny/core.cfg |   19 -
>   .../linux/linux-yocto-tiny/debug.cfg               |    5 -
>   .../linux/linux-yocto-tiny/devtmpfs.cfg            |    6 -
>   .../linux/linux-yocto-tiny/e1000.cfg               |    7 -
>   .../recipes-kernel/linux/linux-yocto-tiny/ext2.cfg |    1 -
>   .../recipes-kernel/linux/linux-yocto-tiny/ext3.cfg |    2 -
>   .../recipes-kernel/linux/linux-yocto-tiny/lzma.cfg |    3 -
>   meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg |   26 -
>   .../linux/linux-yocto-tiny/qemux86/defconfig       |  613 --------------------
>   .../linux/linux-yocto-tiny/ramfs.cfg               |    6 -
>   .../linux/linux-yocto-tiny/rtc-pc.cfg              |   13 -
>   .../linux/linux-yocto-tiny/serial.cfg              |    7 -
>   meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg |    7 -
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |   39 --
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |   25 +
>   16 files changed, 25 insertions(+), 763 deletions(-)
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
>



