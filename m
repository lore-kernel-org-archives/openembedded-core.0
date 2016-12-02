Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE0C71BD8;
	Fri,  2 Dec 2016 15:54:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 02 Dec 2016 07:54:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,287,1477983600"; d="scan'208";a="793506923"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.68.21])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2016 07:54:21 -0800
Message-ID: <1480694061.30023.78.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Dec 2016 07:54:21 -0800
In-Reply-To: <CAMKF1spw8bvo8guTWkhYeQcn+Vs0kU-2X5D-03etwOj3dGroaw@mail.gmail.com>
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
	<o1jct4$pvp$1@blaine.gmane.org>
	<CAJTo0LYLgFFR+6d3SDkso6X28N00tVAnUGuJg4sPG-msMKWU6A@mail.gmail.com>
	<8632C69E-1C6B-482D-AF15-965F55F0AF88@gmail.com>
	<CAJTo0LYTYa4A42+FA9Ou=bVA6ddH8gzVBpJZJvNfa9Jyb9QQfA@mail.gmail.com>
	<CAMKF1spw8bvo8guTWkhYeQcn+Vs0kU-2X5D-03etwOj3dGroaw@mail.gmail.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [oe] [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Fri, 02 Dec 2016 15:54:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-12-01 at 11:58 -0800, Khem Raj wrote:
> On Thu, Dec 1, 2016 at 9:19 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > 
> > On 1 December 2016 at 03:42, Khem Raj <raj.khem@gmail.com> wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > If libva goes in, can we get libva-intel-driver in as well?
> > > > > Those go
> > > > > hand-in-glove currently.
> > > > > 
> > > > 
> > > > Khem, does the AMD BSP use that?  I'd have thought that bit was
> > > > actually
> > > > meta-intel specific.
> > > 
> > > its intel BSPs specific
> > 
> > 
> > So I'd endorse libva for oe-core, and the intel-driver remains in
> > meta-intel.
> 
> I am fine with proposal. This is time for someone to raise
> objections.
> 
As meta-intel maintainer I am OK with this, makes more sense than going
into meta-oe. Please be sure to include meta-intel@yoctoproject.org for
this.

I'm wondering if we should also move the gstreamer-vaapi-1.0 recipe to
oe-core to be with it's brethren?

Sau!

> > 
> > 
> > Ross
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

