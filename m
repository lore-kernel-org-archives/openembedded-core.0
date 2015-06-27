Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B25DF72277
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jun 2015 01:50:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5R1o63u026537
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jun 2015 18:50:06 -0700 (PDT)
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Jun 2015 18:50:06 -0700
Message-ID: <558E0148.10705@windriver.com>
Date: Fri, 26 Jun 2015 21:50:00 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1435350471-17216-1-git-send-email-Randy.MacLeod@windriver.com>	
	<558DB73D.6050708@windriver.com>
	<1435359038.10583.38.camel@linuxfoundation.org>
In-Reply-To: <1435359038.10583.38.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.10]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tiff: Update to 4.0.4
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
X-List-Received-Date: Sat, 27 Jun 2015 01:50:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-06-26 06:50 PM, Richard Purdie wrote:
> On Fri, 2015-06-26 at 16:34 -0400, Randy MacLeod wrote:
>> On 2015-06-26 04:27 PM, Randy MacLeod wrote:
>>> Update tiff to latest version. None of the local CVE patches
>>> are needed based on reviewing the ChangeLog so remove them.
>>
>> I didn't want to clutter the long log but I also built for
>> all qemu arches. On qemux86-64, core-image-sato, I installed
>> the libtiff-util rpms and ran:
>>
>> # tiffinfo /tmp/gmarbles.tif
>> TIFF Directory at offset 0x8 (8)
>>     Subfile Type: (0 = 0x0)
>>     Image Width: 1419 Image Length: 1001
>>     Resolution: 300, 300 pixels/inch
>>     Bits/Sample: 8
>>     Compression Scheme: LZW
>>     Photometric Interpretation: min-is-black
>>     Samples/Pixel: 1
>>     Rows/Strip: 5
>>     Planar Configuration: single image plane
>>     Photoshop Data: <present>, 272 bytes
>>     Predictor: horizontal differencing 2 (0x2)
>>
>> I could do more testing but this appears to be bug fixes only.
>
> It would be lovely to have this as an automated ptest or other form of
> sanity test...

I can do that but I'd like to keep it separate from the upgrade.

The package has a "make check" target with ~ 70 tests so
I'll make that build for ptest and try it on some qemu targets.

Ptests are useful but I wonder if anyone has a way to
monitor regressions...

../Randy

>
> Cheers,
>
> Richard
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

