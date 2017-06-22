Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id F14676025F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 04:29:12 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id C6DD168A01C; Thu, 22 Jun 2017 05:29:12 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=ALL_TRUSTED,BAYES_05,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 3F6F068A019;
	Thu, 22 Jun 2017 05:29:10 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id BD43C674031A;
	Thu, 22 Jun 2017 06:29:09 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1495098555-17751-1-git-send-email-gary@mlbassoc.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <a89393d7-0779-47bf-cedf-c235db1a89fc@mlbassoc.com>
Date: Thu, 22 Jun 2017 06:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1495098555-17751-1-git-send-email-gary@mlbassoc.com>
Subject: Re: [PATCH] openssh: Remove deprecated sshd option
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
X-List-Received-Date: Thu, 22 Jun 2017 04:29:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-05-18 11:09, Gary Thomas wrote:
> The UsePrivilegeSeparation is no longer supported (recent SSHD always runs
> with previlege separation), so remove this option from the default config
> file to avoid this warning:
>    /etc/ssh/sshd_config line 110: Deprecated option UsePrivilegeSeparation
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>   meta/recipes-connectivity/openssh/openssh/sshd_config | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
> index d48bd2b..31fe5d9 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshd_config
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
> @@ -107,7 +107,6 @@ ChallengeResponseAuthentication no
>   #PrintLastLog yes
>   #TCPKeepAlive yes
>   #UseLogin no
> -UsePrivilegeSeparation sandbox # Default for new installations.
>   #PermitUserEnvironment no
>   Compression no
>   ClientAliveInterval 15
> 

Ping?  (It's been more than a month!)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

