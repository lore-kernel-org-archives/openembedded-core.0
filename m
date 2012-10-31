Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TTSRn-0006Gi-8N
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 08:10:43 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Oct 2012 23:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,685,1344236400"; d="scan'208";a="240656157"
Received: from unknown (HELO [10.255.14.124]) ([10.255.14.124])
	by fmsmga001.fm.intel.com with ESMTP; 30 Oct 2012 23:57:04 -0700
Message-ID: <5090CBC1.7050501@linux.intel.com>
Date: Tue, 30 Oct 2012 23:57:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1351532198.13864.18.camel@phil-desktop>
In-Reply-To: <1351532198.13864.18.camel@phil-desktop>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] polkit: remove license.html from LIC_FILES_CHKSUM
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2012 07:10:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/2012 10:36 AM, Phil Blundell wrote:
> This is a generated file and gets removed by "make clean" which then
> causes subsequent rebuilds to fail.  Also, the content in this file
> is taken verbatim from COPYING (which is already in LIC_FILES_CHKSUM)
> so checking it for a second time doesn't accomplish much.
>
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>   meta/recipes-extended/polkit/polkit_0.104.bb |    3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
> index 52e6618..67c375a 100644
> --- a/meta/recipes-extended/polkit/polkit_0.104.bb
> +++ b/meta/recipes-extended/polkit/polkit_0.104.bb
> @@ -3,8 +3,7 @@ DESCRIPTION = "The polkit package is an application-level toolkit for defining a
>   HOMEPAGE = "http://code.google.com/p/polkit/"
>   LICENSE = "LGPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
> -                    file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4 \
> -                    file://docs/polkit/html/license.html;md5=d85a36709a446c10f4ee123f9dda0e38"
> +                    file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
>
>   DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub"
>
>

Merged into OE-Core

Thanks
	Sau!



