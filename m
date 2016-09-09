Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 11A0065CBA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 09:34:00 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u899XxMQ025197; Fri, 9 Sep 2016 04:33:59 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016090904335990-658984 ;
	Fri, 9 Sep 2016 04:33:59 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LY_6wg10ft-RNRrYH7xa93=aWB9LuH=gxEpgf19vC446Q@mail.gmail.com>
References: <20160908095633.26651-1-adrian.ratiu@ni.com>
	<CAJTo0LaDjgTd20i-BQ5QQrWrKms3rfq-vNCiqVB7yz6f8VAmpg@mail.gmail.com>
	<878tv2znhb.fsf@ni.com>
	<CAJTo0LY_6wg10ft-RNRrYH7xa93=aWB9LuH=gxEpgf19vC446Q@mail.gmail.com>
User-Agent: Notmuch/0.22.1 (https://notmuchmail.org) Emacs/25.1.50.1
	(x86_64-unknown-linux-gnu)
Date: Fri, 09 Sep 2016 12:32:31 +0300
Message-ID: <871t0tzads.fsf@ni.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/09/2016 04:34:00 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/09/2016 04:34:00 AM,
	Serialize complete at 09/09/2016 04:34:00 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-09-09_05:, , signatures=0
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
X-List-Received-Date: Fri, 09 Sep 2016 09:34:01 -0000
Content-Type: text/plain

On Thu, 08 Sep 2016, "Burton, Ross" <ross.burton@intel.com> wrote:
> On 8 September 2016 at 11:37, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>
>> No. It fails sporadically on the jenkins build machine when it's under
>> load. Somehow adding the pcre dependency directly to pango fixes the
>> build machine which is really weird. I can't replicate this on my dev
>> machine.
>>
>
> Can you get access to the build directory when it fails?  It would be
> interesting to see what ldd says the gen-all-unicode is linking to.

I cleared the build directory and sstate cache, started with a clean
rebuild and I can't reproduce the error anymore. gen-all-unicode is
built as expected and at runtime it links with libpcre as expected
and the build succeeds. This is really weird, I didn't touch these
packages at all, they just sporadically failed out of the blue and now
they work.

>
> Ross

