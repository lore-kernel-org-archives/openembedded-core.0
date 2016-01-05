Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id A18CC73175
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 08:46:25 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u058kPO7005300; Tue, 5 Jan 2016 02:46:25 -0600
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016010502462486-1689575 ;
	Tue, 5 Jan 2016 02:46:24 -0600 
Date: Tue, 5 Jan 2016 10:46:20 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160105104620.1367caef@adi-pc-linux>
In-Reply-To: <20151211170921.5def47d6@adi-pc-linux>
References: <1449137834-20165-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LYjcHpM20DUiu2CzR8hw-wH0zCya+nUzGjBC1FkMRmzPw@mail.gmail.com>
	<20151211170921.5def47d6@adi-pc-linux>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/05/2016 02:46:25 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/05/2016 02:46:25 AM,
	Serialize complete at 01/05/2016 02:46:25 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-05_02:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] x11vnc: move recipe to meta-oe
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
X-List-Received-Date: Tue, 05 Jan 2016 08:46:26 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Dec 2015 17:09:21 +0200
Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> On Thu, 3 Dec 2015 14:18:53 +0000
> "Burton, Ross" <ross.burton@intel.com> wrote:
> 
> > On 3 December 2015 at 10:17, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> > 
> > > x11vnc can be configured with --use-system-libvncserver to use an
> > > external libvncserver which will be added to meta-oe. Since oe-core
> > > should not depend on meta-oe, we move x11vnc there.
> > >
> > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > >
> > 
> > Obviously we shouldn't remove it from oe-core until it's been merged into
> > meta-oe, so please ping when that's happened.
> > 
> > Ross
> 
> Hello
> 
> x11vnc has just been accepted into meta-oe on master-next an hour ago.
> 
> Thank you,
> Adrian

ping? anyone? The x11vnc recipe is in meta-oe master since 18 dec

