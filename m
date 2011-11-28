Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1RV8Kl-0000A4-Ei
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 22:01:52 +0100
Received: by bkbzs2 with SMTP id zs2so8335427bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 12:55:13 -0800 (PST)
Received: by 10.204.152.87 with SMTP id f23mr47415560bkw.18.1322513713242;
	Mon, 28 Nov 2011 12:55:13 -0800 (PST)
Received: from [10.0.0.118]
	(HSI-KBW-46-223-241-47.hsi.kabel-badenwuerttemberg.de.
	[46.223.241.47])
	by mx.google.com with ESMTPS id h7sm32198012bkw.12.2011.11.28.12.55.11
	(version=SSLv3 cipher=OTHER); Mon, 28 Nov 2011 12:55:11 -0800 (PST)
Message-ID: <4ED3F52E.4000804@linaro.org>
Date: Mon, 28 Nov 2011 21:55:10 +0100
From: Ken Werner <ken.werner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ECBE307.1080600@linaro.org> <4ECE77F9.5090703@balister.org>
In-Reply-To: <4ECE77F9.5090703@balister.org>
Subject: Re: Getting started on creating a layer for OE-Core
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
X-List-Received-Date: Mon, 28 Nov 2011 21:01:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/2011 05:59 PM, Philip Balister wrote:
> On 11/22/2011 12:59 PM, Ken Werner wrote:
>> Hi,
>>
>> I'm currently reading the OpenEmbedded User Manual and wondering what's
>> the best way to add a layer for the Linaro toolchain components (Linaro
>> GCC, Linaro GDB). This is my first time with OE. I just setup the
>> environment and started to build an image that targets qemuarm (bitbake
>> is still building). Any suggestions or general help is much appreciated.
>
> Can you comment on what you expect to get out of the Linaro toolchain layer?

There are two goals. One is to use OE-core as a testsuite for a 
pre-built binary gcc-linaro. The other is to provide a meta layer that 
always has the latest released gcc-linaro and, in the future, also gdb, 
qemu etc..

Regards
Ken


