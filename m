Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFB572523
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 14:13:40 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 3220BF811ED; Mon, 15 Dec 2014 07:13:41 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 57D1DF811DF;
	Mon, 15 Dec 2014 07:13:40 -0700 (MST)
Message-ID: <548EEC94.4020601@mlbassoc.com>
Date: Mon, 15 Dec 2014 07:13:40 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1418500650-2156-1-git-send-email-mgloff@emacinc.com>
	<1418500650-2156-2-git-send-email-mgloff@emacinc.com>
In-Reply-To: <1418500650-2156-2-git-send-email-mgloff@emacinc.com>
Subject: Re: [PATCH V2 2/2] volatiles: Create /var/run/resolv.conf before linking to it
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
X-List-Received-Date: Mon, 15 Dec 2014 14:13:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

No commit log?

Also, the order for a symbolic link should not matter, so why make this change?

On 2014-12-13 12:57, Michael Gloff wrote:
> Signed-off-by: Michael Gloff <mgloff@emacinc.com>
> ---
>   meta/recipes-core/initscripts/initscripts-1.0/volatiles | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index 1fc5816..e6f0695 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -32,7 +32,7 @@ l root root 1777 /tmp /var/tmp
>   d root root 0755 /var/lock/subsys none
>   f root root 0664 /var/log/wtmp none
>   f root root 0664 /var/run/utmp none
> -l root root 0644 /etc/resolv.conf /var/run/resolv.conf
>   f root root 0644 /var/run/resolv.conf none
> +l root root 0644 /etc/resolv.conf /var/run/resolv.conf
>   d root root 1777 /run/media none
>   l root root 1777 /media /run/media
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

