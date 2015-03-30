Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 128B6736B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 22:12:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2UMCo5w006724
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 15:12:50 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Mon, 30 Mar 2015 15:12:50 -0700
Message-ID: <5519CA61.7080405@windriver.com>
Date: Mon, 30 Mar 2015 17:12:49 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1427753433-171445-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1427753433-171445-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH] prelink_git.bb: Update to latest cross-prelink version
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
X-List-Received-Date: Mon, 30 Mar 2015 22:12:52 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

This is sent to be queued for 1.9, and for a post 1.8 update.

Sorry everyone who was looking for this, I thought I sent it back in February
but I dropped the ball.

--Mark

On 3/30/15 5:10 PM, Mark Hatle wrote:
> [YOCTO #7056]
> 
> Adds support for armhf dynamic linker
> Update prelink-rtld to glibc 2.20 base
> Fix testsuite to work with latest autotools
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/prelink/prelink_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
> index 56781a4..6ff6917 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -8,7 +8,7 @@ and executables, so that far fewer relocations need to be resolved at \
>  runtime and thus programs come up faster."
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
> -SRCREV = "faa069deec99bf61418d0bab831c83d7c1b797ca"
> +SRCREV = "40327fb99654e96db6ef15e2f2d5ef140ac3e998"
>  PV = "1.0+git${SRCPV}"
>  
>  #
> 


