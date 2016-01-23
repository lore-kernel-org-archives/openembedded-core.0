Return-Path: <bmouring@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 849216FF01
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 18:36:17 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0NIaH5l031270; Sat, 23 Jan 2016 12:36:17 -0600
Received: from zardoz.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016012312361604-224103 ;
	Sat, 23 Jan 2016 12:36:16 -0600 
Received: by zardoz.amer.corp.natinst.com (sSMTP sendmail emulation);
	Sat, 23 Jan 2016 12:36:15 -0600
From: bmouring@ni.com
Date: Sat, 23 Jan 2016 12:36:15 -0600
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160123183615.GA32740@zardoz.amer.corp.natinst.com>
References: <1453486432-24073-1-git-send-email-brad.mouring@ni.com>
	<CAJTo0La_+cYqBCVy384W4cXTGk322TRj7c+zJGHw9kBH+msPoQ@mail.gmail.com>
	<20160122232539.GA28611@zardoz.amer.corp.natinst.com>
	<CAJTo0LYZ8qx_f8n2MfFprP6YKSSY8D=bAbdoAuShWkXtE4kVdQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYZ8qx_f8n2MfFprP6YKSSY8D=bAbdoAuShWkXtE4kVdQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/23/2016 12:36:17 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/23/2016 12:36:17 PM,
	Serialize complete at 01/23/2016 12:36:17 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-23_09:, , signatures=0
Cc: bmouring@ni.com, Brad Mouring <brad.mouring@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: Add patch to fix Win10 mDNS issues
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
X-List-Received-Date: Sat, 23 Jan 2016 18:36:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 22, 2016 at 11:36:44PM +0000, Burton, Ross wrote:
> On 22 January 2016 at 23:25, <bmouring@ni.com> wrote:
> 
> > > Can you add this to the SRC_URI assignment in avahi.inc please.
> >
> > I did this initially, but considering that the next version of avahi will
> > include this change, I didn't think that was the best approach. I'm fine
> > with including it there, but it didn't seem right to me. Convince me
> > that it's the correct place to put the change.
> 
> 
> Mainly for consistency: all the other patches are listed in the SRC_URI in
> avahi.inc.
> 
> Another good reason is that it ensures that both avahi and avahi-ui get
> built with the same source.

Good enough reasoning for me. As I noted, I was on the fence anyway. Comment
to that effect in the recipe, simply leave it to the commit message, or
some exotic ${bb shell} conditional include?

I'll submit v2 on Monday. Thanks for the feedback.

> Ross

-- 
Brad Mouring
Senior Software Engineer
National Instruments
512-683-6610 / bmouring@ni.com

