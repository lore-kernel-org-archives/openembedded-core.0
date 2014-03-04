Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 765166EAC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 23:05:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Mar 2014 15:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,588,1389772800"; d="scan'208";a="492424843"
Received: from unknown (HELO [10.255.12.227]) ([10.255.12.227])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2014 15:05:14 -0800
Message-ID: <53165C2A.10403@linux.intel.com>
Date: Tue, 04 Mar 2014 15:05:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Andrey Belous <abelous@broadcom.com>, 
	openembedded-core@lists.openembedded.org
References: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
In-Reply-To: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
Subject: Re: [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
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
X-List-Received-Date: Tue, 04 Mar 2014 23:05:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2014 12:40 PM, Andrey Belous wrote:
> Setting of a variable PREFERRED_PROVIDER_virtual/libc only if it doesn't have a value

The format of your commit message is backwards, you need to have a short 
message with the filename:

tclibc-uclibc: <short message>

<long message>

Signed-off-by: ....


Also this kind of change is distro specific and could be in your distro 
specific information, don;'t you need to override more of what's in here 
if you are using a prebuilt library?

Sau!

> ---
>   meta/conf/distro/include/tclibc-uclibc.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
> index 9245112..a4d8c39 100644
> --- a/meta/conf/distro/include/tclibc-uclibc.inc
> +++ b/meta/conf/distro/include/tclibc-uclibc.inc
> @@ -8,7 +8,7 @@ LIBCEXTENSION = "-uclibc"
>   LIBCOVERRIDE = ":libc-uclibc"
>   OVERRIDES .= "${LIBCOVERRIDE}"
>
> -PREFERRED_PROVIDER_virtual/libc = "uclibc"
> +PREFERRED_PROVIDER_virtual/libc ?= "uclibc"
>   PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
>   PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
>   PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
>

