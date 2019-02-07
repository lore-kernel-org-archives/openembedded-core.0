Return-Path: <preid@electromag.com.au>
X-Greylist: delayed 404 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Feb 2019 02:39:14 UTC
Received: from anchovy1.45ru.net.au (anchovy1.45ru.net.au [203.30.46.145])
	by mail.openembedded.org (Postfix) with ESMTP id F19E16BD08
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 02:39:14 +0000 (UTC)
Received: (qmail 23130 invoked by uid 5089); 7 Feb 2019 02:32:30 -0000
Received: by simscan 1.2.0 ppid: 23071, pid: 23074, t: 0.0573s
	scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.122?)
	(preid@electromag.com.au@203.59.235.95)
	by anchovy1.45ru.net.au with ESMTPA; 7 Feb 2019 02:32:30 -0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Andrej Valek <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
	<20181207120605.11344-2-richard.purdie@linuxfoundation.org>
	<fae0fb29acedc0c26cf9d5860e053d1427316cb8.camel@linuxfoundation.org>
	<857809ce-49de-16c2-f26d-805acc3601c2@siemens.com>
	<31abffa69bca5ee313a7d6c30dd7fc06011a14e5.camel@linuxfoundation.org>
	<8ac88775-35f9-e3f6-a0c6-f218aa697e70@siemens.com>
	<81618ab958486def551d22764d960944fb09b73d.camel@linuxfoundation.org>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <b269e78b-ebc9-751a-1253-dacf881f0a36@electromag.com.au>
Date: Thu, 7 Feb 2019 10:32:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <81618ab958486def551d22764d960944fb09b73d.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Thu, 07 Feb 2019 02:39:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit

On 3/01/2019 9:59 pm, Richard Purdie wrote:
> On Mon, 2018-12-31 at 20:56 +0100, Andrej Valek wrote:
>> Your previous solution is working for me, so I was not working on
>> fixing
>> this. I thought, that You will just add missing packages, and that
>> is.
>> I don't have setup for failing machine.
>>
>> Is there any simple way to get all missing perl packages?
> 
> I reworked the patch a bit, tested and just merged a working version of
> it:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d4e27863f3874fb7dc543eed8dcf6a8c4d146fb5
> 
> Cheers,
> 
> Richard
> 

This patch seems to trigger the following new warning for me during populate_sdk

Collected errors:
  * Solver encountered 1 problem(s):
  * Problem 1/1:
  *   - package busybox-dev-1.29.2-r0.4.cortexa9t2hf-neon requires busybox = 1.29.2-r0.4, but none of the providers can be installed
  *
  * Solution 1:
  *   - allow deinstallation of target-sdk-provides-dummy-1.0-r0.9.sdk-provides-dummy-target

  *   - do not ask to install a package providing target-sdk-provides-dummy-dev

  * Solution 2:
  *   - do not ask to install a package providing busybox-dev


Not sure what is request busybox-dev to be istalled in the sdk.
Any thoughts?



-- 
Regards
Phil Reid

