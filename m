Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFD7360167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 19:06:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8QJ6sqW007437
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Sep 2014 12:06:54 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 26 Sep 2014 12:06:54 -0700
Message-ID: <5425B94B.5070707@windriver.com>
Date: Fri, 26 Sep 2014 15:06:51 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <6575549ca9a37610b0832055c8cac3c234bd906e.1411758271.git.dvhart@linux.intel.com>
In-Reply-To: <6575549ca9a37610b0832055c8cac3c234bd906e.1411758271.git.dvhart@linux.intel.com>
Subject: Re: [PATCH] kernel-yocto.bbclass: Fixup shell condition test syntax error
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
X-List-Received-Date: Fri, 26 Sep 2014 19:06:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-09-26 03:04 PM, Darren Hart wrote:
> A warning is issued when run about an unexpected operator due to a
> syntax error with an extra if empedded in the shell conditional. Remove
> the extra if.

ouch. How on earth did that survive ?

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta/classes/kernel-yocto.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 929d64a..7718f9a 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -296,7 +296,7 @@ do_validate_branches() {
>   		force_srcrev="${SRCREV}"
>   	else
>   		git cat-file -t ${machine_srcrev} > /dev/null
> -		if [ if $? -ne 0 ]; then
> +		if [ $? -ne 0 ]; then
>   			bberror "${machine_srcrev} is not a valid commit ID."
>   			bbfatal "The kernel source tree may be out of sync"
>   		fi
>


