Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 9605A605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 13:41:13 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 885AD68A019; Wed,  8 Mar 2017 13:41:13 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 2330968A019;
	Wed,  8 Mar 2017 13:41:11 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id B6BAA6740361;
	Wed,  8 Mar 2017 14:41:10 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
	<20170308105729.GA22401@linux.intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
Date: Wed, 8 Mar 2017 14:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170308105729.GA22401@linux.intel.com>
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Wed, 08 Mar 2017 13:41:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-08 11:57, Ed Bartosh wrote:
> On Wed, Mar 08, 2017 at 10:44:21AM +0100, Daniel Schultz wrote:
>> Hi,
>>
>> I created two kickstart files (am335x-sdimage.wks, am335x-emmc.wks)
>> and added them to the local.conf.
>>
>> When I build the image only the first wks in WKS_FILES will be used
>> by WIC and the second will be ignored. Is it possible to build two
>> images in one build?
>>
>
> I don't think it's possible to build more than one image for the same
> type. wic is not an exception here.
>
>> Includes of the wks files in local.conf:
>> WKS_FILES_ti33x = "am335x-sdimage.wks am335x-emmc.wks "
>
> WKS_FILES variable is to provide possible wks files to use. First one found will
> be used to produce an image.

Would it work to add/define this variable in the corresponding *image*.bb recipe
rather than local.conf?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

