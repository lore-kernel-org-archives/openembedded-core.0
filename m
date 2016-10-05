Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4DD71A05
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 14:41:22 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u95EfMY0032754; Wed, 5 Oct 2016 09:41:22 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016100509412212-608686 ;
	Wed, 5 Oct 2016 09:41:22 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZcE63=JYaK1sTVh4wiSyktb4XLRkOx=XbMc4jRtJ-JqA@mail.gmail.com>
References: <20160908095633.26651-1-adrian.ratiu@ni.com>
	<CAJTo0LaDjgTd20i-BQ5QQrWrKms3rfq-vNCiqVB7yz6f8VAmpg@mail.gmail.com>
	<878tv2znhb.fsf@ni.com>
	<CAJTo0LY_6wg10ft-RNRrYH7xa93=aWB9LuH=gxEpgf19vC446Q@mail.gmail.com>
	<871t0tzads.fsf@ni.com>
	<CAJTo0LZtsxhz=5=XdBWDQVMZpXyXqi11h2OS5XY5HOrUXkMmnA@mail.gmail.com>
	<87bmyzdqfp.fsf@ni.com>
	<878tu3gg6m.fsf@adi-pc-linux.i-did-not-set--mail-host-address--so-tickle-me>
	<CAJTo0LZcE63=JYaK1sTVh4wiSyktb4XLRkOx=XbMc4jRtJ-JqA@mail.gmail.com>
Date: Wed, 05 Oct 2016 17:39:50 +0300
Message-ID: <8760p6hnbd.fsf@ni.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/05/2016 09:41:22 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/05/2016 09:41:22 AM,
	Serialize complete at 10/05/2016 09:41:22 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-10-05_05:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: add libpcre to DEPENDS
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
X-List-Received-Date: Wed, 05 Oct 2016 14:41:23 -0000
Content-Type: text/plain

On Wed, 05 Oct 2016, "Burton, Ross" <ross.burton@intel.com> wrote:
> On 5 October 2016 at 12:59, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>
>> I think libpcre_%.bbappend in meta-selinux is just missing the following
>> line:
>>
>> ln -sf ${relpath}/${realsofile} ${D}${libdir}/libpcre.so.1
>>
>> after creating this symlink the build works without problems (previously
>> only libpcre.so symlink was created).
>>
>> Is this a proper solution?
>>
>
> As meta-selinux is messing around with library locations, yes.

This may be a stupid question (sorry) but here goes: Why can't ldconfig
be made to search also in /lib, beside /usr/lib? That way it could find
the moved libraries, right?

>
> Ross

