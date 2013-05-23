Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 282F26098C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 19:09:26 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2013 12:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,729,1363158000"; d="scan'208";a="306977409"
Received: from unknown (HELO [10.255.12.172]) ([10.255.12.172])
	by azsmga001.ch.intel.com with ESMTP; 23 May 2013 12:09:06 -0700
Message-ID: <519E6952.1020406@linux.intel.com>
Date: Thu, 23 May 2013 12:09:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1369281778-8031-1-git-send-email-net147@gmail.com>
In-Reply-To: <1369281778-8031-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] resolvconf: remove /var/volatile/run/resolvconf/interface from package
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
X-List-Received-Date: Thu, 23 May 2013 19:09:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2013 09:02 PM, Jonathan Liu wrote:
> resolvconf uses /etc/resolvconf/run/interface instead of
> /var/volatile/run/resolvconf/interface.
>
resolvconf uses /etc/resolvconf/run, but it really should be a link to 
/run/resolvconf/, with the interfaces created there.

I don't thing keeping it in /etc/resolvconf will work for read-only FS


Sau!

> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
> index d342a6e..5bbe0b5 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
> @@ -23,7 +23,7 @@ do_compile () {
>   }
>
>   do_install () {
> -	install -d ${D}${sysconfdir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
> +	install -d ${D}${sysconfdir} ${D}${base_sbindir}
>   	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
>   	cp -pPR etc/* ${D}${sysconfdir}/
>   	chown -R root:root ${D}${sysconfdir}/
>

