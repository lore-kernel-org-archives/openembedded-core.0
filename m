Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 25C9E6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 10:03:08 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tBNA38Bh014985; Wed, 23 Dec 2015 04:03:08 -0600
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015122304030796-1447893 ;
	Wed, 23 Dec 2015 04:03:07 -0600 
Date: Wed, 23 Dec 2015 12:03:03 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20151223120303.7a2bb7df@adi-pc-linux>
In-Reply-To: <CAJTo0LbnFsAVPv6r_vh8EX9m7Kir-WW-zq+24FJS1Cr4-vVKZA@mail.gmail.com>
References: <1450172969-11076-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LbnFsAVPv6r_vh8EX9m7Kir-WW-zq+24FJS1Cr4-vVKZA@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/23/2015 04:03:08 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/23/2015 04:03:08 AM,
	Serialize complete at 12/23/2015 04:03:08 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-23_08:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH v3] util-linux: create util-linux-runuser package
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
X-List-Received-Date: Wed, 23 Dec 2015 10:03:09 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Dec 2015 17:34:12 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 15 December 2015 at 09:49, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> 
> > Split runuser into its own package (previously provided by util-linux).
> > Since runuser is compiled only when DISTRO_FEATURES includes pam,
> > the creation of util-linux-runuser is also constrained by this.
> >
> 
> What's the rationale for pulling this out into a separate package?

I need runuser on a busybox image and can't install the entire util-linux package.

> 
> 
> >  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount',
> > 'util-linux-pylibmount', '', d)}"
> > +PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> > 'util-linux-runuser', '', d)}"
> >
> 
> No need for conditionals: empty packages are not created.

Thank you for this tip, I've modified and sent v4.

> 
> Ross


