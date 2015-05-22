Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2D3D73501
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:54:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 22 May 2015 05:54:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="497032504"
Received: from cestaunt-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.15.40])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 05:54:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>,
	Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 22 May 2015 13:54:09 +0100
Message-ID: <1689615.oKpcRujCob@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <555F0396.9050301@topic.nl>
References: <555ED05A.6050102@topic.nl>
	<1755674.4xNgi4jax3@peggleto-mobl.ger.corp.intel.com>
	<555F0396.9050301@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: "packagegroup-core-qt4e" broken?
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
X-List-Received-Date: Fri, 22 May 2015 12:54:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 22 May 2015 12:23:18 Mike Looijmans wrote:
> On 22-05-15 10:38, Paul Eggleton wrote:
> > Hi Mike,
> > 
> > On Friday 22 May 2015 08:44:42 Mike Looijmans wrote:
> >> When building (just for having something on my display)
> >> "qt4e-demo-image",
> >> 
> >> it bailed out with the following error:
> >>    * satisfy_dependencies_for: Cannot satisfy the following dependencies
> >>    for
> >> 
> >> packagegroup-core-qt4e:
> >>    * 	qt4-embedded-plugin-phonon-backend-gstreamer *
> >>    * opkg_install_cmd: Cannot install package packagegroup-core-qt4e.
> >> 
> >> I guess this is related to all the gstreamer changes lately?
> > 
> > I've just sent a fix for this, thanks for the report.
> > 
> > Cheers,
> > Paul
> 
> Strange thing was, after just manually removing that package line from the
> packagegroup-core-qt4e recipe, do_rootfs kept failing with a checksum
> mismatch on that package. I tried cleansstate and manually removing all
> traces of the recipe, but that didn't help, it would rebuild the ipk and
> then still fail on the checksum. Only removing 'tmp' finally got rid of
> this failure.

To be honest I don't understand this issue but it seems to be going wrong for 
some people lately. Paul is this something you know about?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

