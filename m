Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3DFA60673
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 17:26:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB1HQK6m007034
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 1 Dec 2014 09:26:20 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Dec 2014 09:26:20 -0800
Message-ID: <547CA499.2050506@windriver.com>
Date: Mon, 1 Dec 2014 12:25:45 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1417454430-27930-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1417454430-27930-1-git-send-email-paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] kernel-yocto.bbclass: fix shell syntax error
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
X-List-Received-Date: Mon, 01 Dec 2014 17:26:24 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-12-01 12:20 PM, Paul Eggleton wrote:
> Spaces aren't valid around = in an assignment statement (not even with
> bash).
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/classes/kernel-yocto.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index e672a0e..c3e2494 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -212,7 +212,7 @@ do_kernel_checkout() {
>   	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
>   	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
>   	if [ $? -eq 0 ]; then
> -		machine_branch = "master"
> +		machine_branch="master"

Clearly not running very often :)

Looks good to me.

Bruce

>   	fi
>
>   	# checkout and clobber any unimportant files
>


