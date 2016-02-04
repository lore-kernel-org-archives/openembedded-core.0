Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB58734B8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:05:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 04 Feb 2016 12:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="42599524"
Received: from ranerica-desk01.sc.intel.com (HELO [10.3.52.148])
	([10.3.52.148])
	by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2016 12:05:13 -0800
Message-ID: <1454616269.22677.170.camel@ranerica-desk01>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 04 Feb 2016 12:04:29 -0800
In-Reply-To: <CAJTo0LbXnGobVdN6G_2JHx4gm2KCQCuAwFmFHhqKJYC+YCXpVQ@mail.gmail.com>
References: <1454526437-31265-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<CAJTo0LbXnGobVdN6G_2JHx4gm2KCQCuAwFmFHhqKJYC+YCXpVQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: add runtime dependencies for udev-cache
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
X-List-Received-Date: Thu, 04 Feb 2016 20:05:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-02-03 at 20:37 +0000, Burton, Ross wrote:
>         +RDEPENDS_${PN} += "gzip findutils"
>         
> 
> 
> The dependencies should be on the udev-cache package, surely.

Right. I will submit a new version applying the dependencies to
udev-cache only.

Thanks and BR,
Ricardo



