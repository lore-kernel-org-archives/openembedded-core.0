Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qvd8t-0000Dc-W1
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 00:38:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2011 15:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40752598"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2011 15:34:06 -0700
Message-ID: <4E52D95D.1020106@linux.intel.com>
Date: Mon, 22 Aug 2011 15:34:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313421687.6733.183.camel@phil-desktop>
In-Reply-To: <1313421687.6733.183.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] libproxy: remove dependency on X libs
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
X-List-Received-Date: Mon, 22 Aug 2011 22:38:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/15/2011 08:21 AM, Phil Blundell wrote:
> Nothing in the source refers to libX11 or libXmu so there would appear to be
> no good reason for them to be in DEPENDS.  It looks as though these are perhaps
> a relic from an earlier version which did need those libraries.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-support/libproxy/libproxy_0.4.6.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.6.bb b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> index 5ee4979..d907c55 100644
> --- a/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
>                       file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
>
>
> -DEPENDS = "virtual/libx11 xmu gconf"
> +DEPENDS = "gconf"
>
>   SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
>

Merged into OE-Core

Thanks
	Sau!


