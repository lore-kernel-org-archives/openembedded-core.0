Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 65A68731A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 11:28:10 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u05BSALi021839; Tue, 5 Jan 2016 05:28:10 -0600
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016010505281036-1699917 ;
	Tue, 5 Jan 2016 05:28:10 -0600 
Date: Tue, 5 Jan 2016 13:28:07 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160105132807.19625c49@adi-pc-linux>
In-Reply-To: <CAJTo0LbShuO99dzkc4n89OYm_4Q2Pv=tcGt_+O_ZOm+R8XrLYg@mail.gmail.com>
References: <1449137834-20165-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LYjcHpM20DUiu2CzR8hw-wH0zCya+nUzGjBC1FkMRmzPw@mail.gmail.com>
	<20151211170921.5def47d6@adi-pc-linux>
	<20160105104620.1367caef@adi-pc-linux>
	<CAJTo0LbShuO99dzkc4n89OYm_4Q2Pv=tcGt_+O_ZOm+R8XrLYg@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/05/2016 05:28:10 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/05/2016 05:28:10 AM,
	Serialize complete at 01/05/2016 05:28:10 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-05_03:, , signatures=0
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
X-List-Received-Date: Tue, 05 Jan 2016 11:28:13 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Jan 2016 11:16:06 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> Hi,
> 
> On 5 January 2016 at 08:46, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> 
> > ping? anyone? The x11vnc recipe is in meta-oe master since 18 dec
> >
> 
> Can you rebase to master and actually remove all the other references to
> x11vnc?  For example, packagegroup-core-x11-sato still depends on x11vnc.

Yes, of course. I'll resend with these changes.

> 
> Ross


