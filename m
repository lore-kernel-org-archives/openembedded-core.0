Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SIdCy-0004pC-30
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 11:54:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3D9j2gW010829
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 02:45:02 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 13 Apr 2012 02:45:02 -0700
Message-ID: <4F87F59C.7050404@windriver.com>
Date: Fri, 13 Apr 2012 17:45:00 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1334308316.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1334308316.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] grub 1.99: fix build for gcc 4.7
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
X-List-Received-Date: Fri, 13 Apr 2012 09:54:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/13/2012 05:41 PM, Robert Yang wrote:
> I've done a "bitbake world" on Fedora 17 64bit (MACHINE = qemux86-64),

The MACHINE is qemux86 (not qemux86-64), sorry for the mistake.

> the failed pkgs are mklibs-native (have sent patch) and grub as far as
> I know.
>
> Will try "bitbake core-image-sato" with MACHINE = qemuarm/qemuppc/qemux86
> and "bitbake world" with MACHINE = qemux86 on Fedora 17 64bit this

Here should be: MACHINE = qemux86-64

// Robert

> night.
>
> Test info:
> Have tested on:
> Ubuntu 10.10
> Fedora 13/16/17 x86_64
>
> // Robert
>
> The following changes since commit 71e95c744eaa4dda1b3237db2e13f666f121c92b:
>
>    package_rpm.bbclass: Set tmppath for rpm to somewhere which won't conflict with the rootfs (2012-04-12 21:24:55 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/grub
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/grub
>
> Robert Yang (1):
>    grub 1.99: fix build for gcc 4.7
>
>   meta/recipes-bsp/grub/grub_1.99.bb |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


