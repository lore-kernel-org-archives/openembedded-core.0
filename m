Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RYjUX-0005Rv-UH
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 20:18:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB8JBwEV022555
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 11:11:58 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 8 Dec 2011 11:11:57 -0800
Message-ID: <4EE10BFD.9000405@windriver.com>
Date: Thu, 8 Dec 2011 13:11:57 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4EDF12D3.4060306@gmail.com>
	<CA+M6bXk22TQ8jowRyjTyyJzRhUbE7fhvcf1YH_AS9EYn=sX+WA@mail.gmail.com>
	<79A60C08-1C6C-48A6-8CAF-F40C6562B755@gmail.com>
In-Reply-To: <79A60C08-1C6C-48A6-8CAF-F40C6562B755@gmail.com>
Subject: Re: GCC fails when SDK is not extracted to /usr/local
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 19:18:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/8/11 1:04 PM, Tasslehoff Kjappfot wrote:
>
> On Dec 8, 2011, at 3:56 PM, Tom Rini wrote:
>
>> On Wed, Dec 7, 2011 at 12:16 AM, Tasslehoff Kjappfot
>> <tasskjapp@gmail.com>  wrote:
>>> gcc fails when I extract my SDK to another place than /usr/local.
>>>
>>> Output when it fails:
>>>
>>> $ ./arm-angstrom-linux-gnueabi-gcc
>>> bash: ./arm-angstrom-linux-gnueabi-gcc: No such file or directory
>>>
>>> Readelf output:
>>>
>>> $ readelf -d arm-angstrom-linux-gnueabi-gcc
>>>
>>> Dynamic section at offset 0x34394 contains 21 entries:
>>>   Tag        Type                         Name/Value
>>>   0x00000001 (NEEDED)                     Shared library: [libc.so.6]
>>>   0x0000000f (RPATH)                      Library rpath:
>>> [/usr/local/angstrom-eglibc-i686-armv7a/sysroots/i686-angstromsdk-linux/usr/lib/armv7a-angstrom-linux-gnueabi:/usr/local/angstrom-eglibc-i686-armv7a/sysroots/i686-angstromsdk-linux/lib]
>>>
>>> Is it the RPATH here that's making trouble for me?
>>
>> Not exactly.  And RPATH is needed to find some of the shared libraries
>> that are needed.  I thought we had been running chrpath over these to
>> make them relocatable, however.
>>
>> --
>> Tom
>>
>
> Does this RPATH indicate that its not relocatable? Anything else I can check?

It should be using RUN_PATH  $ORIGIN to relocate itself based on the initial 
run-time location.

It sounds like something is not being run as it should for the SDK component(s).

--Mark

> - Tasslehoff
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



