Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9FF5719C5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 11:59:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u95BxkcQ017356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Oct 2016 04:59:46 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Oct 2016 04:59:46 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1475574085-4340-1-git-send-email-ross.burton@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6037b2ed-251c-6c1c-aed1-b5edc8f584c0@windriver.com>
Date: Wed, 5 Oct 2016 07:59:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475574085-4340-1-git-send-email-ross.burton@intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH] Revert "attr: Added ncurses to depends"
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
X-List-Received-Date: Wed, 05 Oct 2016 11:59:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-04 05:41 AM, Ross Burton wrote:
> There doesn't appear to be any reason to keep this dependency on ncurses in
> attr, so remove it.
>
> This reverts commit 7c474dc3d65bb3f71b375d36d81959cb405be80a.

Might be a a poky commit id?
The right one is:

commit 21f294d9600a369fff5eafb0c7358694d9ff0221
Author: Saul Wold <sgw@linux.intel.com>
Date:   Sun Mar 6 09:12:04 2011 -0800

     attr: Added ncurses to depends

     Signed-off-by: Saul Wold <sgw@linux.intel.com>


at least the log summary was right! :)

../Randy
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/attr/attr.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
> index a1b0829..e8b5d05 100644
> --- a/meta/recipes-support/attr/attr.inc
> +++ b/meta/recipes-support/attr/attr.inc
> @@ -2,7 +2,7 @@ SUMMARY = "Utilities for manipulating filesystem extended attributes"
>  HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
>  SECTION = "libs"
>
> -DEPENDS = "ncurses virtual/libintl"
> +DEPENDS = "virtual/libintl"
>
>  LICENSE = "LGPLv2.1+ & GPLv2+"
>  LICENSE_${PN} = "GPLv2+"
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

