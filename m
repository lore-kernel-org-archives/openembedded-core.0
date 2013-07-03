Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 290A06AD4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 14:15:09 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2013 07:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,988,1363158000"; d="scan'208";a="326306936"
Received: from unknown (HELO [10.255.13.183]) ([10.255.13.183])
	by azsmga001.ch.intel.com with ESMTP; 03 Jul 2013 07:15:09 -0700
Message-ID: <51D431ED.1080901@linux.intel.com>
Date: Wed, 03 Jul 2013 07:15:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Francesco Del Degan <f.deldegan@endian.com>
References: <87r4ffenwf.fsf@endian.com>
In-Reply-To: <87r4ffenwf.fsf@endian.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: fix init.d restart function
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
X-List-Received-Date: Wed, 03 Jul 2013 14:15:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2013 07:09 AM, Francesco Del Degan wrote:
>
> Adds a missing dash in the oknodo option function.
>
This was recently submitted by Marc Frerland also and is now in master.

Sau!

> Signed-off-by: Francesco Del Degan <f.deldegan@endian.com>
> ---
>   meta/recipes-connectivity/openssh/openssh-6.1p1/init | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh-6.1p1/init
> b/meta/recipes-connectivity/openssh/openssh-6.1p1/init
> index cde52ef..6beec84 100644
> --- a/meta/recipes-connectivity/openssh/openssh-6.1p1/init
> +++ b/meta/recipes-connectivity/openssh/openssh-6.1p1/init
> @@ -76,7 +76,7 @@ case "$1" in
>           check_keys
>           check_config
>           echo -n "Restarting OpenBSD Secure Shell server: sshd"
> -        start-stop-daemon -K -oknodo -x /usr/sbin/sshd
> +        start-stop-daemon -K --oknodo -x /usr/sbin/sshd
>           check_for_no_start
>           check_privsep_dir
>           sleep 2
>

