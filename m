Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 566AA73F5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 08:40:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 12 May 2015 01:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,413,1427785200"; d="scan'208";a="693532392"
Received: from dpassaue-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.14.139])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2015 01:40:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 12 May 2015 09:40:25 +0100
Message-ID: <2300208.Wa25vWO7Bf@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <CAJ86T=VeT9qXjvPJo0Gb+HefkMZhaD7C6PQxUBoZoZbBy6NUmw@mail.gmail.com>
References: <cover.1424877305.git.cristian.iorga@intel.com>
	<84f2bc2ad049dd54b4bc62f8810de014ff223f6b.1424877305.git.cristian.iorga@intel.com>
	<CAJ86T=VeT9qXjvPJo0Gb+HefkMZhaD7C6PQxUBoZoZbBy6NUmw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] meta/lib/oe/utils.py: properly implement both_contain()
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
X-List-Received-Date: Tue, 12 May 2015 08:40:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre,

On Monday 11 May 2015 17:34:45 Andre McCurdy wrote:
> On Wed, Feb 25, 2015 at 7:15 AM, Cristian Iorga
> 
> <cristian.iorga@intel.com> wrote:
> > oe.utils.both_contain() just does a find() on the value
> > rather than splitting the value and then looking in the
> > list of split items. The result is that if you add a
> > feature to MACHINE_FEATURES that itself has a substring
> > that matches one of the values looked for when building
> > COMBINED_FEATURES, you end up with an incomprehensible
> > error (here with "ext2i" in MACHINE_FEATURES):
> > 
> > ERROR: Nothing RPROVIDES 'packagegroup-base-ext2'
> > (but /home/balister/src/oe-core/oe-core/meta/recipes-core/
> > /packagegroups/packagegroup-base.bb RDEPENDS on or otherwise requires it)
> 
> This change seems to break COMBINED_FEATURES.
> 
> $ bitbake -e packagegroup-base | grep '^COMBINED_FEATURES='
> 
> dizzy:
>   COMBINED_FEATURES="alsa         "
> 
> fido:
>   COMBINED_FEATURES="set(['alsa'])         "

Yes it did, unfortunately. There was a follow-up fix in master:

  http://cgit.openembedded.org/openembedded-core/commit/?id=c4ca9dbd4191fcff08e75035e3d276490ed80b05

This is included in Joshua's pending backport changeset for fido.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

