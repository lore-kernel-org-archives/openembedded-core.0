Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 0571660667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 14:52:15 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u05EqEZl007627; Tue, 5 Jan 2016 08:52:14 -0600
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016010508521453-1707270 ;
	Tue, 5 Jan 2016 08:52:14 -0600 
Date: Tue, 5 Jan 2016 16:52:11 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160105165211.4a7efa0a@adi-pc-linux>
In-Reply-To: <CAJTo0LZE2vzpyaw4KLNRxPJjaVHYCTRtiA0qim25Y8zPAhQ45Q@mail.gmail.com>
References: <3ec94ad0d014bd99c4444523c2744e05c7120a89.1451996491.git.adrian.ratiu@ni.com>
	<3182226859c3a37e168480aa8c2d93514de68895.1451996491.git.adrian.ratiu@ni.com>
	<20160105134150.GA2574@jama> <20160105162239.21706269@adi-pc-linux>
	<CAJTo0LZE2vzpyaw4KLNRxPJjaVHYCTRtiA0qim25Y8zPAhQ45Q@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/05/2016 08:52:14 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/05/2016 08:52:14 AM,
	Serialize complete at 01/05/2016 08:52:14 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-05_06:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] x11vnc: remove all references to moved package
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
X-List-Received-Date: Tue, 05 Jan 2016 14:52:16 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Jan 2016 14:31:19 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 5 January 2016 at 14:22, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> 
> > Yes and also if there are no x11 dependencies in this packagegroup,
> > then it should be renamed to packagegroup-core-sato.
> >
> > I'll resubmit. Thank you.
> >
> 
> Don't - sato is explicitly X11 based.

I'm thinking that all recipes included in the sato image define
REQUIRED_DISTRO_FEATURES = "x11" themselves, like matchbox-desktop does,
so there's no need to define it again in the packagegroup recipe, since no
package actually requires it there.

I thought the same rationale also applies to the packagegroup names. However
now I understand the need to propagate the indirect x11 dependency in the names.

So I'll just remove the features check as per Martin's suggestion and leave the name as it is.

> 
> Ross


