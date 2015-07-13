Return-Path: <amarnath.valluri@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EBD98607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 11:46:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jul 2015 04:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,462,1432623600"; d="scan'208";a="727884400"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2015 04:46:42 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.72]) by
	IRSMSX109.ger.corp.intel.com ([169.254.13.200]) with mapi id
	14.03.0224.002; Mon, 13 Jul 2015 12:46:40 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [meta-oe][PATCH] mc: Upgrade to release 4.8.14
Thread-Index: AQHQuwsXYelX8QyU90q1F0atANFtIp3VJw6AgAQk7fM=
Date: Mon, 13 Jul 2015 11:46:39 +0000
Message-ID: <D3C33C4430ACA6488F343D1125FCCECC37FC2614@irsmsx110.ger.corp.intel.com>
References: <1436530992-13161-1-git-send-email-amarnath.valluri@intel.com>,
	<1436563533.3310.17.camel@linuxfoundation.org>
In-Reply-To: <1436563533.3310.17.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mc: Upgrade to release 4.8.14
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
X-List-Received-Date: Mon, 13 Jul 2015 11:46:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for this. Yes, its still been used by the non-gplv3 recipe. I will re=
submit the patch with this fix.

Thanks,
Amarnath
________________________________________
From: Richard Purdie [richard.purdie@linuxfoundation.org]
Sent: Saturday, July 11, 2015 12:25 AM
To: Valluri, Amarnath
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH] mc: Upgrade to release 4.8.14

On Fri, 2015-07-10 at 15:23 +0300, Amarnath Valluri wrote:
> Dropped mc-CTRL.patch, as it was merged to upstream.
> Upstream commit-id: e78b636eba9d23e9f5f066b022bd5640c85409be.

mc-CTRL.patch is still used by the non-gplv3 recipe?

https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/=
391/steps/BuildImages/logs/stdio

Cheers,

Richard

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


