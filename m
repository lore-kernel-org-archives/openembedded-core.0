Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9674877238
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 08:43:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 08 Sep 2016 01:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,298,1470726000"; d="scan'208";a="1047216236"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 08 Sep 2016 01:43:55 -0700
Date: Thu, 8 Sep 2016 11:43:52 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Message-ID: <20160908084351.GA9057@mbabyjoh-desk.ger.corp.intel.com>
References: <1473284559-187471-1-git-send-email-jianxun.zhang@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1473284559-187471-1-git-send-email-jianxun.zhang@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2][PROPOSED] libcap fix and update
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
X-List-Received-Date: Thu, 08 Sep 2016 08:43:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Sep 07, 2016 at 02:42:37PM -0700, Jianxun Zhang wrote:
> Need some experts to review this patch series. I am not really
> sure for if what I fixed is a valid case or if fix is the best
> answer. The validation before submission is very limited too.
> 
> I ran into the compiling issue when build an application and
> found this recipe cannot be built without specifying anything.
> I don't feel the existing options are passed to make with test,
> and guess EXTRA_CONF won't work with this makefile-based project.
> 
> The second patch is a following-up when I saw there is another
> option in the similar situation and seems to be obsolete now.
> 
> Jianxun Zhang (2):
>   libcap: fix compiling issue when not having libpam
>   libcap: remove dependency on attr

I think the libcap build fix is already in master branch now:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=b4f2c760aa4e9a92d5ce829136b60ab0ebed186c

Please use the latest master branch and see if you hit this error again.

>  meta/recipes-support/libcap/libcap_2.25.bb | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Best Regards,
Maxin

