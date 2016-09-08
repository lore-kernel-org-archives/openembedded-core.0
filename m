Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id E28E5731D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 10:38:48 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u88AclRM005515; Thu, 8 Sep 2016 05:38:47 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016090805384758-618622 ;
	Thu, 8 Sep 2016 05:38:47 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LaDjgTd20i-BQ5QQrWrKms3rfq-vNCiqVB7yz6f8VAmpg@mail.gmail.com>
References: <20160908095633.26651-1-adrian.ratiu@ni.com>
	<CAJTo0LaDjgTd20i-BQ5QQrWrKms3rfq-vNCiqVB7yz6f8VAmpg@mail.gmail.com>
User-Agent: Notmuch/0.22.1 (https://notmuchmail.org) Emacs/25.1.50.1
	(x86_64-unknown-linux-gnu)
Date: Thu, 08 Sep 2016 13:37:20 +0300
Message-ID: <878tv2znhb.fsf@ni.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/08/2016 05:38:47 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/08/2016 05:38:47 AM,
	Serialize complete at 09/08/2016 05:38:47 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-09-08_06:, , signatures=0
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
X-List-Received-Date: Thu, 08 Sep 2016 10:38:49 -0000
Content-Type: text/plain

On Thu, 08 Sep 2016, "Burton, Ross" <ross.burton@intel.com> wrote:
> On 8 September 2016 at 10:56, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>
>> | ./gen-all-unicode > all-unicode.txt
>> | ./gen-all-unicode: error while loading shared libraries: libpcre.so.1:
>> cannot open shared object file: No such file or directory
>>
>
> Can you replicate this on demand?  For gen-all-unicode to have been built
> the library must have been in the sysroot, and removed by the time it was
> executed.  However, pcre is a dependency of glib which is a dependency of
> pango, so I'm not sure how this happened.

No. It fails sporadically on the jenkins build machine when it's under
load. Somehow adding the pcre dependency directly to pango fixes the
build machine which is really weird. I can't replicate this on my dev
machine.

>
> Ross

