Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7A3609B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 21:40:46 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74Lelnj005308; Mon, 4 Aug 2014 16:40:48 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080416404776-628820 ;
	Mon, 4 Aug 2014 16:40:47 -0500 
Date: Mon, 4 Aug 2014 16:40:28 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140804214028.GB10174@bshelton-desktop>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<8823f277843a307b6ddd3c46b4b57c9efc54bf64.1407177403.git.ben.shelton@ni.com>
	<CAP9ODKqdVF5_PJVbxGmn472y+meMdQi6y7H1uMUSfnq7oYrXEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqdVF5_PJVbxGmn472y+meMdQi6y7H1uMUSfnq7oYrXEQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 04:40:47 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 04:40:47 PM,
	Serialize complete at 08/04/2014 04:40:47 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_04:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/20] udev-cache: parametrize tar options
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
X-List-Received-Date: Mon, 04 Aug 2014 21:40:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08/04, Otavio Salvador wrote:
> On Mon, Aug 4, 2014 at 3:41 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> > From: Richard Tollerton <rich.tollerton@ni.com>
> >
> > The options to pass to `tar` for cache create/extract are likely to
> > change due to system configuration circumstances (e.g. using busybox tar
> > instead of GNU tar). So move the more detailed options into
> > the defaults file to allow for easier overrides.
> >
> > Natinst-Rally-ID: TA44427
> > Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> > Natinst-ReviewBoard-ID: 58620
> > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> 
> Same comment as 10/20.
> 

In this one, I'm OK with setting the default in the scripts themselves,
since each environment variable is only used in one of the scripts.

Ben

> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

