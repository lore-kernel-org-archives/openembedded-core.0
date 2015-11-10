Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EE42875EE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 08:31:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tAA8VJwn002182 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 02:31:19 -0600
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015111002311924-1887246 ;
	Tue, 10 Nov 2015 02:31:19 -0600 
Date: Tue, 10 Nov 2015 10:31:14 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Message-ID: <20151110103114.44b2e812@adi-pc-linux>
In-Reply-To: <87h9ku6fhx.fsf@weregild.amer.corp.natinst.com>
References: <1447077707-31620-1-git-send-email-adrian.ratiu@ni.com>
	<87h9ku6fhx.fsf@weregild.amer.corp.natinst.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 11/10/2015 02:31:19 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 11/10/2015 02:31:19 AM,
	Serialize complete at 11/10/2015 02:31:19 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-11-10_06:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: create util-linux-runuser package
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
X-List-Received-Date: Tue, 10 Nov 2015 08:31:20 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Nov 2015 15:15:54 -0600
Richard Tollerton <rich.tollerton@ni.com> wrote:

> Ioan-Adrian Ratiu <adrian.ratiu@ni.com> writes:
> 
> >  RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin"
> >  RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
> 
> Should we add util-linux-runuser to either RDEPENDS or RRECOMMENDS?

Yes, definitely to RDEPENDS since users of util-linux might expect
runuser as it was provided by default. Thanks for spotting this.

I also missed the commit message typo, fixed in v2.

