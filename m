Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE0F7702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 19:40:01 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t82Jdv1X010859; Wed, 2 Sep 2015 14:39:59 -0500
Received: from [10.2.33.36] ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015090214395857-1122405 ;
	Wed, 2 Sep 2015 14:39:58 -0500 
Message-ID: <55E7508D.3050101@ni.com>
Date: Wed, 02 Sep 2015 14:39:57 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1441117073-23911-1-git-send-email-alejandro.delcastillo@ni.com>
	<1441176900.24871.25.camel@linuxfoundation.org>
In-Reply-To: <1441176900.24871.25.camel@linuxfoundation.org>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/02/2015 02:39:58 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/02/2015 02:39:59 PM,
	Serialize complete at 09/02/2015 02:39:59 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-02_08:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg: upgrade to v0.3.0
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
X-List-Received-Date: Wed, 02 Sep 2015 19:40:03 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8



On 09/02/2015 01:55 AM, Richard Purdie wrote:
> On Tue, 2015-09-01 at 09:17 -0500, Alejandro del Castillo wrote:
>> Changes required:
>> - Rename opkg-cl to opkg
>> - Add libarchive dependency
>> - Drop backport patches
>> - Drop obsolete directory options
>> - Add patch to handle empty index files
>>
>> Based on initial work by Paul Barker.
>>
>> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>> CC: Paul Barker <paul@paulbarker.me.uk>
> 
> The autobuilder shows these errors for a build containing this patch:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/468/steps/BuildImages/logs/stdio
> 
> Not sure why...

running populate-volatile seems to cause the permission problem. If I remove the
commit below (master-next), I can build fine:

0e59378 image.bbclass: Always try to run populate-volatile.sh at rootfs time

Regarding the opkg upgrade patch, I sent to the same thread a follow up patch
that fixes the adt-installer. Both changes are related to the opkg upgrade, so
they can be squashed. Let me know if you want me to send you a v2 patch with the
adt-installer changes included.

-- 
Cheers,

Alejandro

