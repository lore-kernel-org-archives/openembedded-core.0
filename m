Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mail.openembedded.org (Postfix) with ESMTP id C305C7317C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 14:27:22 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6800NNHW530Y10@vms173007.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2016 09:27:04 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=QyXUC8HyAAAA:8
	a=xWB0KWXArKKFzLZs9yAA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 53342f85; Tue, 26 Apr 2016 14:27:04 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A0239161FC7; Tue,
	26 Apr 2016 10:27:03 -0400 (EDT)
Date: Tue, 26 Apr 2016 10:27:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20160426142703.GE31113@denix.org>
References: <20160422000519.GR16135@denix.org>
	<CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
	<20160425165011.GV16135@denix.org>
	<CAJTo0LZCgoyt8GyvbkhvsK4_Q8v5MgU3O+0FFXGaajyyiDS0Zg@mail.gmail.com>
	<CAJTo0Lb3pwi-BewA3kyU+QhgP2_s5uXd=vXH0fXRA8wM-9fMgg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0Lb3pwi-BewA3kyU+QhgP2_s5uXd=vXH0fXRA8wM-9fMgg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Christopher Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: mesa, libgbm and weston
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
X-List-Received-Date: Tue, 26 Apr 2016 14:27:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 26, 2016 at 03:00:59PM +0100, Burton, Ross wrote:
> On 26 April 2016 at 12:59, Burton, Ross <ross.burton@intel.com> wrote:
> 
> > I added a PACKAGECONFIG for libgbm to mesa.inc, enabled it for mesa and
> > disabled it for mesa-gl, and mesa-gl still build fine but didn't ship a
> > libgbm.
> >
> > I've forgotten the details about all of this: does mesa-gl shipping libgbm
> > make sense at all?  Or in the real world will BSPs either use mesa or their
> > own GLES driver + their own libgbm + mesa-gl if required?
> >
> 
> I've just sent a couple of mesa patches, can you see if these help?

Thanks, making few builds now to test those.

What about virtual/libgbm package and updating mesa's PROVIDES list?

-- 
Denys

