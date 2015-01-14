Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5944471633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 17:01:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2015 08:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="440521094"
Received: from dvhart-mac02.jf.intel.com (HELO dvhart-mac02.local)
	([10.24.0.215])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jan 2015 08:48:20 -0800
Message-ID: <54B6A0DB.70706@linux.intel.com>
Date: Wed, 14 Jan 2015 09:01:15 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: =?UTF-8?B?VmluY2VudCBHw6luaWV1eA==?= <vincent2014@startigen.fr>, 
	openembedded-core@lists.openembedded.org
References: <1421100601-30956-1-git-send-email-vincent2014@startigen.fr>
In-Reply-To: <1421100601-30956-1-git-send-email-vincent2014@startigen.fr>
Subject: Re: fix '[[: not found' error message using dash
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
X-List-Received-Date: Wed, 14 Jan 2015 17:01:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Vincent,

On 1/12/15 2:10 PM, Vincent Génieux wrote:
> This is a fix for https://bugzilla.yoctoproject.org/show_bug.cgi?id=7112
> bash specific syntax '[[ test ]]' replaced with '[ test ]'.
> 

Please use the tag:

Fixes [YOCTO 7112]

In the message body, on it's own line.

> Signed-off-by: Vincent Génieux <vincent2014@startigen.fr>

Here it is customary to list the people you have been working with:

Cc: Darren Hart <dvhart@linux.intel.com>
Cc: Bruce Ashfield...
etc.

Also, ensure your mailer does actually Cc those people (git send-email
can do this automatically).

> ---
>  meta/classes/kernel.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 70ed95b..2a6ec34 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -403,7 +403,7 @@ do_strip() {
>  			  gawk '{print $1}'`
>  
>  		for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
> -			if [[ "$headers" != *"$str"* ]]; then
> +			if [ "$headers" != *"$str"* ]; then
>  				bbwarn "Section not found: $str";
>  			fi
>  
> 

Content is correct. I presume this passes your testing with the dash shell?

Acked-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center

