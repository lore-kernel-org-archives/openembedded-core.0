Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 43EEC62132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 09:32:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jun 2016 02:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="975240699"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2016 02:31:29 -0700
Date: Tue, 14 Jun 2016 07:38:43 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20160614043843.GA22248@mbabyjoh-desk.ger.corp.intel.com>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
	<c7d3b5b5d732304a31a843147fd123eda27a4794.1465697985.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c7d3b5b5d732304a31a843147fd123eda27a4794.1465697985.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] gzip: upgrade to 1.8
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
X-List-Received-Date: Tue, 14 Jun 2016 09:32:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Jun 12, 2016 at 10:21:02AM +0800, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-extended/gzip/{gzip_1.6.bb => gzip_1.8.bb} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-extended/gzip/{gzip_1.6.bb => gzip_1.8.bb} (100%)
> 
> diff --git a/meta/recipes-extended/gzip/gzip_1.6.bb b/meta/recipes-extended/gzip/gzip_1.8.bb
> similarity index 100%
> rename from meta/recipes-extended/gzip/gzip_1.6.bb
> rename to meta/recipes-extended/gzip/gzip_1.8.bb
> -- 
> 1.9.1

gzip-1.8 build failed on qemux86 - musl:
http://errors.yoctoproject.org/Errors/Details/69401/

Best Regards,
Maxin

