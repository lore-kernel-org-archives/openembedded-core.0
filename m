Return-Path: <bmouring@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 58D496012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:25:40 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0MNPeOU015264; Fri, 22 Jan 2016 17:25:40 -0600
Received: from zardoz.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016012217253947-214061 ;
	Fri, 22 Jan 2016 17:25:39 -0600 
Received: by zardoz.amer.corp.natinst.com (sSMTP sendmail emulation);
	Fri, 22 Jan 2016 17:25:39 -0600
From: bmouring@ni.com
Date: Fri, 22 Jan 2016 17:25:39 -0600
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160122232539.GA28611@zardoz.amer.corp.natinst.com>
References: <1453486432-24073-1-git-send-email-brad.mouring@ni.com>
	<CAJTo0La_+cYqBCVy384W4cXTGk322TRj7c+zJGHw9kBH+msPoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La_+cYqBCVy384W4cXTGk322TRj7c+zJGHw9kBH+msPoQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/22/2016 05:25:40 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/22/2016 05:25:40 PM,
	Serialize complete at 01/22/2016 05:25:40 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-22_07:, , signatures=0
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
X-List-Received-Date: Fri, 22 Jan 2016 23:25:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 22, 2016 at 11:08:06PM +0000, Burton, Ross wrote:
> On 22 January 2016 at 18:13, <bmouring@ni.com> wrote:
> 
> > +SRC_URI_append = " \
> > +
> > file://0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch \
> > +    "
> > +
> >  DEPENDS += "intltool-native"
> >
> 
> Can you add this to the SRC_URI assignment in avahi.inc please.

I did this initially, but considering that the next version of avahi will
include this change, I didn't think that was the best approach. I'm fine
with including it there, but it didn't seem right to me. Convince me
that it's the correct place to put the change.

> > --- /dev/null
> > +++
> > b/meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch
> > @@ -0,0 +1,151 @@
> > +From de7cde877e4daa5d9d4fb5b1a349299eaa94969d Mon Sep 17 00:00:00 2001
> > +From: Trent Lloyd <trent@lloyd.id.au>
> > +Date: Sat, 10 Oct 2015 06:20:46 +0800
> > +Subject: [PATCH] Don't log warnings about invalid packets (Fixes
> > + lathiat/avahi#10)
> >
> 
> This patch is missing Upstream-Status and Signed-off-by (by you,
> presumably) tags.

Will correct, keep an eye out for v2 (I'll wait for feedback on the
other point first before unleashing v2)

> Ross

-- 
Brad Mouring
Senior Software Engineer
National Instruments
512-683-6610 / bmouring@ni.com

