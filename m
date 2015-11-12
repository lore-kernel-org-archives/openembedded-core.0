Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 97AF177193
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:42:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Nov 2015 00:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,281,1444719600"; d="scan'208";a="849267260"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2015 00:42:29 -0800
Date: Thu, 12 Nov 2015 10:43:17 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <20151112084316.GA22724@mbabyjoh-mobl.fi.intel.com>
References: <563C5648.5050009@jp.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <563C5648.5050009@jp.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant: upgrade to 2.5
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
X-List-Received-Date: Thu, 12 Nov 2015 08:42:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Nov 06, 2015 at 04:27:04PM +0900, Fan Xin wrote:
> wpa-supplicant: upgrade to 2.5
> 
> 1. upgrade to 2.5
> 2. remove eight patches since they have been modified in 2.5
> 
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  ...integer-underflow-in-WMM-Action-frame-par.patch | 45 -------------

In addition to what Ross mentioned, http://hostap.epitest.fi redirects
to http://w1.fi

So, it will be nice to update the SRC_URI, HOMEPAGE and BUGTRACKER to use
w1.fi instead.

Best Regards,
Maxin

