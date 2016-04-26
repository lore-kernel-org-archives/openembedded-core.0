Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4855465CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 14:02:33 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O68002A4V08S360@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2016 09:02:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=K6Cbrq60AAAA:8
	a=XOoXpaz7-Et7ixaJjEoA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 30eeb001; Tue, 26 Apr 2016 14:02:33 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 657D2161FC7; Tue,
	26 Apr 2016 10:02:32 -0400 (EDT)
Date: Tue, 26 Apr 2016 10:02:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20160426140232.GC31113@denix.org>
References: <20160422000519.GR16135@denix.org>
	<CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
	<CAJTo0LaE9PTEG6zsasGc_H6ngw4Oq=BFZBTZQ4ynszdtUTV3QQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LaE9PTEG6zsasGc_H6ngw4Oq=BFZBTZQ4ynszdtUTV3QQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 26 Apr 2016 14:02:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 26, 2016 at 12:36:10PM +0100, Burton, Ross wrote:
> On 22 April 2016 at 01:27, Christopher Larson <clarson@kergoth.com> wrote:
> 
> > 1. Change weston recipe in oe-core to depend on libgbm instead of
> >> virtual/mesa
> >> assuming that it is provided by mesa recipe and it works for other
> >> platforms.
> >>
> >
> > I'd say this, either libgbm or virtual/libgbm.
> >
> 
> We used virtual/mesa to mean "the Mesa APIs and so on" so libgbm is covered
> by this.  Of course at the time there was only one implementation in mesa.
> Now that there are genuine alternative reimplementations of libgdm then I
> agree that a virtual/libgbm is a good move, and replacing all of the
> virtual/mesa instances that are actually just for libgdm.

Thanks, Ross, that makes sense.

-- 
Denys

