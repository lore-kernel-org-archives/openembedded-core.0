Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2A2601B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 08:26:07 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0C8Q7d1023741; Tue, 12 Jan 2016 02:26:07 -0600
Received: from ionel-workpc.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016011202260696-1925728 ;
	Tue, 12 Jan 2016 02:26:06 -0600 
Date: Tue, 12 Jan 2016 10:26:02 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160112102602.13095fdf@ionel-workpc.emea.corp.natinst.com>
In-Reply-To: <4152432.VEWvmsyppU@peggleto-mobl.ger.corp.intel.com>
References: <1450172969-11076-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LbnFsAVPv6r_vh8EX9m7Kir-WW-zq+24FJS1Cr4-vVKZA@mail.gmail.com>
	<20151223120303.7a2bb7df@adi-pc-linux>
	<4152432.VEWvmsyppU@peggleto-mobl.ger.corp.intel.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/12/2016 02:26:07 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/12/2016 02:26:07 AM,
	Serialize complete at 01/12/2016 02:26:07 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-12_03:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 12 Jan 2016 08:26:08 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Jan 2016 15:52:50 +1300
Paul Eggleton <paul.eggleton@linux.intel.com> wrote:

> On Wed, 23 Dec 2015 12:03:03 Ioan-Adrian Ratiu wrote:
> > On Tue, 22 Dec 2015 17:34:12 +0000
> > 
> > "Burton, Ross" <ross.burton@intel.com> wrote:  
> > > On 15 December 2015 at 09:49, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>   
> wrote:
> > > > Split runuser into its own package (previously provided by util-linux).
> > > > Since runuser is compiled only when DISTRO_FEATURES includes pam,
> > > > the creation of util-linux-runuser is also constrained by this.  
> > > 
> > > What's the rationale for pulling this out into a separate package?  
> > 
> > I need runuser on a busybox image and can't install the entire util-linux
> > package.  
> > > >  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount',
> > > > 
> > > > 'util-linux-pylibmount', '', d)}"
> > > > +PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> > > > 'util-linux-runuser', '', d)}"  
> > > 
> > > No need for conditionals: empty packages are not created.  
> > 
> > Thank you for this tip, I've modified and sent v4.  
> 
> Unfortunately this wasn't right - the package being excluded from PACKAGES was 
> serving to avoid the libpam dependency when pam was not in DISTRO_FEATURES; as 
> of this patch we are now building it unconditionally leading to a warning.
> 
> Ioan-Adrian, could you please send a patch that changes it back to how you had 
> it in v3?

Yes, I'll send v5 which will revert the change from v4.

> 
> Thanks,
> Paul
> 


