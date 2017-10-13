Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23F2677E87
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 14:56:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9DEuM5S026003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 07:56:23 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 13 Oct 2017 07:56:22 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20171013141832.24325-1-alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <077b5862-bb57-8447-4cca-5301740ff945@windriver.com>
Date: Fri, 13 Oct 2017 09:56:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171013141832.24325-1-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] prelink: fix upstream version check
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
X-List-Received-Date: Fri, 13 Oct 2017 14:56:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/13/17 9:18 AM, Alexander Kanavin wrote:
> Instead of reporting that we can update to a bogus version
> report that upstream version is not known.

You do know that there are release branches for prelink right?

http://git.yoctoproject.org/cgit/cgit.cgi/prelink-cross/refs/heads

cross_prelink and master are both 'release' quality branches.

Anything put there is a new version.


There is nothing for us to 'tag', since there are no formal versions.


Should be easy enough for the system to compare the SRCREV to the top of
cross_prelink.  If they don't match, an upgrade is needed.

--Mark

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-devtools/prelink/prelink_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
> index a137a864921..570ef36a3cc 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -32,6 +32,8 @@ SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink \
>             file://prelink.cron.daily \
>             file://prelink.default \
>  	   file://macros.prelink"
> +UPSTREAM_CHECK_GITTAGREGEX = "upstream has no usable tags"
> +UPSTREAM_VERSION_UNKNOWN = "1"
>  
>  TARGET_OS_ORIG := "${TARGET_OS}"
>  OVERRIDES_append = ":${TARGET_OS_ORIG}"
> 


