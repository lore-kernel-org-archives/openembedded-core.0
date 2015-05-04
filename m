Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8B127169F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 04:36:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t444aUOL024658
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 May 2015 21:36:30 -0700 (PDT)
Received: from server.local (128.224.23.5) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 3 May 2015 21:36:30 -0700
Message-ID: <5546F74D.2000200@windriver.com>
Date: Mon, 4 May 2015 00:36:29 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430688616.18360.101.camel@linuxfoundation.org>
In-Reply-To: <1430688616.18360.101.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 04 May 2015 04:36:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-03 5:30 PM, Richard Purdie wrote:
> On Thu, 2015-04-30 at 21:34 -0400, Bruce Ashfield wrote:
>> Here is the latest consolidated pull request for the supported linux-yocto
>> kernels.
>>
>>   - We have a refresh of the 3.14-rt support
>>   - bluetooh configuration changes for common-pc/qemux86
>>   - braswell BSP features and fixes
>>   - Introduction of the 4.1-rc1 -dev kernel (and associated perf fix).
>>
>> I've built and booted these on my local machines and qemu, and
>> everything was sane.
>>
>> The -dev kernel obviously isn't something for deployment yet, but
>> it builds, and forms the base for follow up config changes, features
>> and development work. I built and booted core-image-kernel dev with
>> the 4.1 changes in place.
>
> There was also a problem with poky-lsb. The idea (as far as I remember)
> is that it should be using LTSI rather than the default main kernel so
> we could split the testing. Unfortunately it was pointing at 3.10 which
> doesn't exist any longer so was using 3.17. I think LTSI is 3.14 so I
> updated the PREFERRED_VERSION to that.

Correct on all counts. We did want it to use LTSI, and that is 3.14
at the moment.

>
> This resulted in this failure on the autobuilder:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/builds/281/steps/BuildImages/logs/stdio
>
> Basically with qemumips and 3.14. Hopefully not a hard one to fix. If

Doesn't look to bad. I'll address this one along with the x32 build
failure on Monday (assuming I get it fixed in the day).

Bruce

> I've mixed the versions up, let me know which one poky-lsb should be
> using.
>
> Cheers,
>
> Richard
>


