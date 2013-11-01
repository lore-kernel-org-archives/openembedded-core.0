Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B46AF6D224
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 19:35:22 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Nov 2013 12:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="315862183"
Received: from unknown (HELO [10.255.15.12]) ([10.255.15.12])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Nov 2013 12:35:23 -0700
Message-ID: <5274027B.5060106@linux.intel.com>
Date: Fri, 01 Nov 2013 12:35:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Trevor Woerner <trevor.woerner@linaro.org>, 
	openembedded-core@lists.openembedded.org
References: <1383237932-13177-1-git-send-email-trevor.woerner@linaro.org>
In-Reply-To: <1383237932-13177-1-git-send-email-trevor.woerner@linaro.org>
Subject: Re: [PATCH] runtime package management: ipk/opk
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
X-List-Received-Date: Fri, 01 Nov 2013 19:35:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2013 09:45 AM, Trevor Woerner wrote:
> Place the on-target feed configuration into the "base-feeds.conf" file instead
> of the "opkg.conf" file.
>
This says what you are doing, but the question is why is the change 
needed?  It might be obvious to you, but not to others.  The 
base-feeds.conf file is provided via the a distro configuration, so it's 
not guarenteed to be there for every distro, so I am not sure this 
change is correct.

Also for future referece the commit message should follow the commit 
guidelines:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks

Sau!

> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>   meta/classes/rootfs_ipk.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index b0805dc..1537af4 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -159,7 +159,7 @@ ipk_insert_feed_uris () {
>   		echo "Added $feed_name feed with URL $feed_uri"
>
>   		# insert new feed-sources
> -		echo "src/gz $feed_name $feed_uri" >> ${IPKGCONF_TARGET}
> +		echo "src/gz $feed_name $feed_uri" >> ${IMAGE_ROOTFS}/${sysconfdir}/opkg/base-feeds.conf
>   	done
>
>   	# Allow to use package deploy directory contents as quick devel-testing
>

