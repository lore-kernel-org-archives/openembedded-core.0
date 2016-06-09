Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 885F96FF5B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 09:36:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 09 Jun 2016 02:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,444,1459839600"; d="scan'208";a="994178369"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2016 02:36:54 -0700
To: openembedded-core@lists.openembedded.org
References: <1465390138-26600-1-git-send-email-maxin.john@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <940de7d5-ba9f-cdd1-476c-9b1235b8e4b2@linux.intel.com>
Date: Thu, 9 Jun 2016 12:37:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465390138-26600-1-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH] libjpeg-turbo: update to 1.5.0
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
X-List-Received-Date: Thu, 09 Jun 2016 09:36:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2016 03:48 PM, Maxin B. John wrote:
> 1. LIC_FILES_CHKSUM updates only involves changes in Copyright holders.
>    LICENSE remains the same.
>
> 2. libjpeg-turbo don't have non-floating point ABI support in MIPS.
>    Provide a work around for that.
>
> [YOCTO #9606]
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  ...{libjpeg-turbo_8d+1.4.2.bb => libjpeg-turbo_8d+1.5.0.bb} | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>  rename meta/recipes-graphics/jpeg/{libjpeg-turbo_8d+1.4.2.bb => libjpeg-turbo_8d+1.5.0.bb} (71%)

Adding a '8d+' prefix to the version means that upstream check cannot be 
automatically performed. Can we get rid of it somehow?

Alex


