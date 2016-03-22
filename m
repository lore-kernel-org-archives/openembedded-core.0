Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7B62B6067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 21:56:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 22 Mar 2016 14:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="916743623"
Received: from cmdeoliv-mobl4.amr.corp.intel.com ([10.254.120.177])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2016 14:56:30 -0700
Message-ID: <1458683790.18406.33.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Mar 2016 14:56:30 -0700
In-Reply-To: <CAJTo0LYn1aCCqk5=QV1iug+Zqz1s-=c2iF=mhZSaU6EOPAeR4A@mail.gmail.com>
References: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
	<1458670391-26915-5-git-send-email-sgw@linux.intel.com>
	<CAJTo0LYn1aCCqk5=QV1iug+Zqz1s-=c2iF=mhZSaU6EOPAeR4A@mail.gmail.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] linux-firmware: Break out some additional firmware
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
X-List-Received-Date: Tue, 22 Mar 2016 21:56:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-03-22 at 21:27 +0000, Burton, Ross wrote:
> 
> On 22 March 2016 at 18:13, Saul Wold <sgw@linux.intel.com> wrote:
> > +             ${PN}-iwlwifi-7265D ${PN}-iwlwifi-8000C ${PN}-
> > iwlwifi-8265 \
> > 
> opkg doesn't like this one bit:
> 
> | linux-firmware-iwlwifi-7265D
> | *** Error: Package name  contains illegal characters, (other than
> [a-z0-9.+-])
> 
Gah, no CAPS?  Sorry I did not do the full package specturm tests.

> Also, what Otavio said about splitting out - is C vs D a model thing
> or a version thing?
> 
I could merge them, I chose not to because it seems like it was more of
a model difference vs a version difference, since there were
overlapping version numbers.  The difference is the Dual band version,
I think.

Sau!

> Ross

