Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 305BD73335
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 15:27:31 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1KFRTWY010592; Fri, 20 Feb 2015 09:27:30 -0600
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015022009273028-233982 ;
	Fri, 20 Feb 2015 09:27:30 -0600 
Date: Fri, 20 Feb 2015 09:27:18 -0600
From: Ben Shelton <ben.shelton@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20150220152718.GA27210@bshelton-desktop>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150128134042.GI2477@jama>
	<87k306djs4.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<3296846.qcxKKmWIPr@peggleto-mobl5.ger.corp.intel.com>
	<87oapbdctd.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<CAJTo0La=KuSp2anpGk3=6GPaq_ksWHY1NmOBi9VQ31K=uVjSVQ@mail.gmail.com>
	<20150220124501.GB2322@jama>
	<1424436603.11836.42.camel@linuxfoundation.org>
	<20150220143657.GI2322@jama>
MIME-Version: 1.0
In-Reply-To: <20150220143657.GI2322@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/20/2015 09:27:30 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/20/2015 09:27:30 AM,
	Serialize complete at 02/20/2015 09:27:30 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-20_08:, , signatures=0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Fri, 20 Feb 2015 15:27:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> 
> Can you please revert:
>   commit 89a29a3ad0742cd713e739d3d460be7711966679
>   Author: Richard Tollerton <rich.tollerton@ni.com>
>   Date:   Fri Dec 12 13:34:00 2014 -0600
> 
>     font-util: Fix incorrect PKG_CONFIG_PATH
> 
> ?
> 
> It doesn't do anything useful as Richard confirmed by withdrawing it and
> all font recipes are broken since it was merged.
> 
> Regards,
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

Hi all,

Is there any chance I could get you to wait until the end of the day to
do any reverts?  Rich is out right now, but I'm going to take a look at
the issue pointed out in the v3 patches and see if I can get it worked
out.

Thanks,
Ben

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


