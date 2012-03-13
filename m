Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UdI-0003UB-5z
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:31:32 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Mar 2012 09:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77003269"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 09:20:27 -0700
Message-ID: <4F5F73CB.7040602@linux.intel.com>
Date: Tue, 13 Mar 2012 09:20:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331060029-6748-1-git-send-email-j-lance1@ti.com>
In-Reply-To: <1331060029-6748-1-git-send-email-j-lance1@ti.com>
Cc: Jeff Lance <j-lance1@ti.com>
Subject: Re: [PATCH 1/1 v2] trace-cmd: modifying License information
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
X-List-Received-Date: Tue, 13 Mar 2012 16:31:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 10:53 AM, Jeff Lance wrote:
> * Adding "GPLv2&  LGPLv2.1" to create a dual license to cover the libraries.
> * Bump up PR
>
> Signed-off-by: Jeff Lance<j-lance1@ti.com>
> ---
> Updated in version 2:
>    Added '&' to indicate both licenses apply
> ---
>   meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb |    8 +++++---
>   1 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
> index d40dc6e..7f6f6cf 100644
> --- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
> @@ -1,10 +1,12 @@
>   DESCRIPTION = "User interface to Ftrace"
> -LICENSE = "GPLv2"
> +LICENSE = "GPLv2&  LGPLv2.1"
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

Merged into OE-Core

Thanks
	Sau!


