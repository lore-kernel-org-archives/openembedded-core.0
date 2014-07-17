Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1A37063F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 15:00:27 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6HF0BRF002427; Thu, 17 Jul 2014 10:00:11 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071710001089-492446 ;
	Thu, 17 Jul 2014 10:00:10 -0500 
Date: Thu, 17 Jul 2014 10:00:08 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20140717150008.GA2352@bshelton-desktop>
References: <cover.1405542432.git.ben.shelton@ni.com>
	<0ae4bf831ba9b0ffce4eeb6403da183a5e71a445.1405542432.git.ben.shelton@ni.com>
	<53C6F735.2060208@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <53C6F735.2060208@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 10:00:11 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 10:00:11 AM,
	Serialize complete at 07/17/2014 10:00:11 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-17_04:2014-07-17, 2014-07-17,
	1970-01-01 signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] initscripts: save /etc/timestamp with seconds accuracy
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
X-List-Received-Date: Thu, 17 Jul 2014 15:00:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/16, Saul Wold wrote:
> On 07/16/2014 01:59 PM, Ben Shelton wrote:
> >From: Blair Elliott <blair.elliott@ni.com>
> >
> >Currently, /etc/timestamp is saved with minutes accuracy.  To increase
> >the accuracy, modify the save-rtc.sh and bootmisc.sh scripts to save and
> >read /etc/timestamp respectively with seconds accuracy.
> >
> 
> We also initialize it in the image.bbclass, you may want to tweak that one.
> 
> Since we deal with readonly it's possible it won't get updated after
> the image creation.
> 
> Sau!
> 

Good catch -- I'll make the fix and resubmit the patchset.

Thanks,
Ben


