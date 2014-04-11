Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B76565DFD
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 17:48:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3BHmD3c010780
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Apr 2014 10:48:13 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 11 Apr 2014 10:48:12 -0700
Message-ID: <53482AD6.3090205@windriver.com>
Date: Fri, 11 Apr 2014 13:48:06 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <nitin.a.kamble@intel.com>, <Openembedded-core@lists.openembedded.org>,
	<darren.hart@intel.com>, <richard.purdie@linuxfoundation.org>
References: <cover.1397235602.git.nitin.a.kamble@intel.com>
	<f1c400fe717177e267c91a497143bc0267b5fe17.1397235602.git.nitin.a.kamble@intel.com>
In-Reply-To: <f1c400fe717177e267c91a497143bc0267b5fe17.1397235602.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 1/1] meta-skeleton: linux-yocto-custom.bb: use machine overrides
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Apr 2014 17:48:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-04-11 01:05 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Use machine overrides for variables for this skeleton recipe so that
> people following skeleton do it right at the beginning.
>
> The machine overrides for the variables reduces pollution of name space
> and avoid unintentional influences on other layers.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> index c329106..76457ca 100644
> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> @@ -46,10 +46,10 @@ require recipes-kernel/linux/linux-yocto.inc
>
>   # Override SRC_URI in a bbappend file to point at a different source
>   # tree if you do not want to build from Linus' tree.
> -SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
> +SRC_URI_machine = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
>
> -LINUX_VERSION ?= "3.4"
> -LINUX_VERSION_EXTENSION ?= "-custom"
> +LINUX_VERSION_machine ?= "3.4"
> +LINUX_VERSION_EXTENSION_machine ?= "-custom"

For some reason, I thought you meant ${MACHINE} instead of _machine .. which
is what I use for machine specific overrides.

But assuming this works, i have no objections.

Bruce

>
>   # Override SRCREV to point to a different commit in a bbappend file to
>   # build a different release of the Linux kernel.
> @@ -61,4 +61,4 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   # Override COMPATIBLE_MACHINE to include your machine in a bbappend
>   # file. Leaving it empty here ensures an early explicit build failure.
> -COMPATIBLE_MACHINE = "(^$)"
> +COMPATIBLE_MACHINE_machine = "(^$)"
>
z

