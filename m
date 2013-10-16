Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8830F6BF46
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 18:33:22 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Oct 2013 11:33:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,508,1378882800"; d="scan'208";a="308693354"
Received: from unknown (HELO [10.255.15.253]) ([10.255.15.253])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Oct 2013 11:33:19 -0700
Message-ID: <525EDBEF.6060108@linux.intel.com>
Date: Wed, 16 Oct 2013 11:33:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Ming Liu <ming.liu@windriver.com>
References: <1381917496-28055-1-git-send-email-ming.liu@windriver.com>
	<1381917496-28055-2-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1381917496-28055-2-git-send-email-ming.liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] screen: add pkg_postinst to register entry to /etc/shells
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
X-List-Received-Date: Wed, 16 Oct 2013 18:33:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/2013 02:58 AM, Ming Liu wrote:
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/recipes-extended/screen/screen_4.0.3.bb | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
> index 1a7eb20..456f970 100644
> --- a/meta/recipes-extended/screen/screen_4.0.3.bb
> +++ b/meta/recipes-extended/screen/screen_4.0.3.bb
> @@ -41,3 +41,8 @@ do_install_append () {
>   		fi
>   	done
>   }
> +
> +pkg_postinst_${PN} () {
> +        touch $D${sysconfdir}/shells
> +        grep -q "usr/bin/screen" $D${sysconfdir}/shells || echo /usr/bin/screen >> $D${sysconfdir}/shells
> +}
>
should you be using ${bindir} here instead of usr/bin? since it's 
possible to have different ${prefix}.

Sau!


