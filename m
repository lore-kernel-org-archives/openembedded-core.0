Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xRY-0002rT-KM
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 17:40:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Mar 2012 08:32:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115392724"
Received: from unknown (HELO [10.255.15.180]) ([10.255.15.180])
	by azsmga001.ch.intel.com with ESMTP; 06 Mar 2012 08:32:14 -0800
Message-ID: <4F563C0E.9060903@linux.intel.com>
Date: Tue, 06 Mar 2012 08:32:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331050108-21460-1-git-send-email-j-lance1@ti.com>
In-Reply-To: <1331050108-21460-1-git-send-email-j-lance1@ti.com>
Cc: Jeff Lance <j-lance1@ti.com>
Subject: Re: [PATCH] trace-cmd: modifying License information
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
X-List-Received-Date: Tue, 06 Mar 2012 16:40:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 08:08 AM, Jeff Lance wrote:
> * Adding LGPLv2.1 to GPLv2 to create a dual license to cover the libraries.
> * Bump up PR
>
> Signed-off-by: Jeff Lance<j-lance1@ti.com>
> ---
>   meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb |    8 +++++---
>   1 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
> index d40dc6e..007cad2 100644
> --- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
> @@ -1,10 +1,12 @@
>   DESCRIPTION = "User interface to Ftrace"
> -LICENSE = "GPLv2"
> +LICENSE = "LGPLv2.1 GPLv2"

Is this an & or an | ?

Sau!

>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> -                    file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
> +                    file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
> +                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
> +                    file://trace-input.c;beginline=5;endine=8;md5=c9c405aaf5cfc09582ec83cf6e83a020"
>
>   SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
> -PR = "r1"
> +PR = "r2"
>   PV = "1.2+git${SRCPV}"
>
>   inherit pkgconfig


