Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 5F5E87017C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 13:34:44 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0JDYivB006944; Tue, 19 Jan 2016 07:34:44 -0600
Received: from ionel-workpc.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016011907344412-69445 ;
	Tue, 19 Jan 2016 07:34:44 -0600 
Date: Tue, 19 Jan 2016 15:34:29 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160119153429.6e2d37f8@ionel-workpc.emea.corp.natinst.com>
In-Reply-To: <CAJTo0LYyJGHLyrHd7eZ9KR9WfDknoWpgKQ5uHiFm8dhOwSJdQw@mail.gmail.com>
References: <1453206311-26625-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LYyJGHLyrHd7eZ9KR9WfDknoWpgKQ5uHiFm8dhOwSJdQw@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/19/2016 07:34:44 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/19/2016 07:34:44 AM,
	Serialize complete at 01/19/2016 07:34:44 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-19_06:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-runtime.inc: provide libquadmath
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
X-List-Received-Date: Tue, 19 Jan 2016 13:34:46 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Jan 2016 13:14:21 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 19 January 2016 at 12:25, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> 
> > +RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic libquadmath"
> >
> 
> If libquadmath is only needed when fortran is enabled, shouldn't this
> respect the FORTRAN variable as well?  Or are there users beyond the
> fortran support?

AFAIK only fortran. I'll make it depend on the presence of fortran in LANGUAGES.

Thanks,
Adrian

> 
> Ross


