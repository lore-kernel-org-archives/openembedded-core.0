Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Skhab-0004Up-BZ
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 22:14:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5TK3o5M003443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jun 2012 13:03:50 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 29 Jun 2012 13:03:50 -0700
Message-ID: <4FEE0A17.1030102@windriver.com>
Date: Fri, 29 Jun 2012 16:03:35 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1340998763.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1340998763.git.dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org, Poky <poky@yoctoproject.org>
Subject: Re: [PATCH 0/5 V2] Enable building modules on target
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
X-List-Received-Date: Fri, 29 Jun 2012 20:14:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-06-29 03:54 PM, Darren Hart wrote:
> This series simplifies the include mechanisms for the linux-yocto recipes
> and adds support for a kernel-headers package which enables the building
> of modules on the target.
>
> Sending to both oe-core and poky as this series touches files in both
> and I didn't want to confuse the intent or the dependency by splitting
> them up.
>
> V2:
> o Add files to kernel-dev rather than create a new kernel-headers package
> o Move the location to /usr/src/kernel from /usr/src/kernel-headers
> o Eliminate the kernel-misc package as kernel-dev covers it now
> o Fix a bug with linux-yocto-custom exposed during testing
>
> The following changes since commit 4d48398798c898c5db08294ba64d9bfc7daca19c:
>
>    local.conf.sample.extended: Add filtering function to archiver.bbclass (2012-06-28 16:32:58 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib dvhart/modules
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/modules
>
> Darren Hart (5):
>    linux-libc-headers-yocto: Do not include linux-yocto
>    linux-yocto: Use INC_PR and move kernel require to linux-yocto.inc

These already merged. :)

>    kernel: Add kernel headers to kernel-dev package
>    tasl-core-sdk: Add kernel-dev to task-core-sdk RDEPENDS

task ?

>    linux-yocto-custom: Remove linux-tools

And these look fine to me.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>



>
>   .../recipes-kernel/linux/linux-yocto-custom.bb          |    2 --
>   .../linux-libc-headers/linux-libc-headers-yocto_git.bb  |    3 ++-
>   meta/classes/kernel.bbclass                             |   15 +++++++--------
>   meta/conf/bitbake.conf                                  |    2 +-
>   meta/recipes-core/tasks/task-core-sdk.bb                |    5 +++--
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb         |    3 +--
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb         |    3 +--
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb         |    3 +--
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb       |    3 +--
>   meta/recipes-kernel/linux/linux-yocto.inc               |    3 +++
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb            |    3 +--
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb            |    3 +--
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb            |    3 +--
>   13 files changed, 23 insertions(+), 28 deletions(-)
>



