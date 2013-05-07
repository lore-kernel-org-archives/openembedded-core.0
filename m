Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UZmAR-0007cZ-1N
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:59:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r47Hf8cM013661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 May 2013 10:41:09 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 7 May 2013 10:41:08 -0700
Message-ID: <51893CB4.9070304@windriver.com>
Date: Tue, 7 May 2013 12:41:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <51892728.3090609@farnsworthtech.com>
	<51892D8A.5030806@windriver.com>
	<51893B46.3090205@farnsworthtech.com>
In-Reply-To: <51893B46.3090205@farnsworthtech.com>
Subject: Re: SDK meta-toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 17:59:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/13 12:35 PM, Kyle Farnsworth wrote:
> On 05/07/2013 11:36 AM, Mark Hatle wrote:
>> On 5/7/13 11:09 AM, Kyle Farnsworth wrote:
>>> I'm a bit confused about what exactly meta-toolchain is building?  It
>>> seems to be bitbaking gcc and creating a toolchain with the prefix
>>> x86_64-oesdk-linux- (default SDK_PREFIX) but I'm not sure what it is.
>>> Is it a cross-compile for my target MACHINE or a compiler for my build
>>> machine?  Based on the prefix name I am assuming the latter.
>>
>> There are two ways to generate an SDK.
>>
>> * targeted SDK -- This is a meta-toolchain* recipe that lists
>> -exactly- what is going to be in the SDK.  This is great if you want
>> to limit your SDK to specific libraries for your application developers.
>>
>> * implied / image based SDK -- This type of SDK bases off of what is
>> in the image to generate an SDK that contains all of the libraries
>> that are runnable inside of the image.  This is a very simple way to
>> generate an SDK for application developers that -will- match the
>> run-time image.
>>
>> Both of the above have their place, depending on the level of command
>> and control people want.
>>
>> The basic meta-toolchain is just the cross compile toolchain and I
>> believe the libc.  meta-toolchain-gmae is an example Gnome Mobile
>> Application Environment.
> Thanks. This a good info.  I need to do the targeted SDK.  But why is it
> re-creating the cross-compile toolchain with the new prefix and a libc?
> I also have cases where I want to deliver an external toolchain within
> the SDK.

There are three types of packages in oe-core.

- Target -- runs on the target

- native -- runs on the host (variant called 'cross')

- nativesdk -- runs on the 'sdkhost' (variant called 'crosssdk')

The SDK allows you to build SDK software for a host that is different then your 
build host.  Also the nativesdk is 'glibc' independent, while the native version 
is specific to your host.  This allows the SDK to be shared with other developers.

--Mark

>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



