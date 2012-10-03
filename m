Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TJQSN-0007f6-A9
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 17:01:51 +0200
Received: from [192.168.1.111] (host86-143-222-9.range86-143.btcentralplus.com
	[86.143.222.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B5B60D22B7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2012 16:48:54 +0200 (CEST)
Message-ID: <506C5050.6030304@linaro.org>
Date: Wed, 03 Oct 2012 15:48:48 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<506C4D7A.2010300@windriver.com>
In-Reply-To: <506C4D7A.2010300@windriver.com>
Subject: Re: Merging AArch64 support
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
X-List-Received-Date: Wed, 03 Oct 2012 15:01:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

W dniu 03.10.2012 15:36, Mark Hatle pisze:
> On 10/3/12 4:51 AM, Marcin Juszkiewicz wrote:

>> Now, when AArch64 is buildable from public sources it came a time
>> to work on merging all changes I had to do to get it working with
>> current OE-Core.

> I was recently told that the glibc components were not yet
> available, but the other toolchain items are.

First version of public glibc patches were released on Monday.

> Has the glibc stuff (and other toolchain items) been submitted to
> oe-core yet?  I didn't see them in any of your commits.

They are not sent yet cause I am working on many different things at
same time this week due to ARMv8 sprint in Cambridge. I will send
patches to OE-Core during next 2 weeks to add it. The compiler for
example is still not final version.

In meantime you can use
http://git.linaro.org/gitweb?p=openembedded/meta-aarch64.git layer on
top of meta-linaro + meta-oe + oe-core setup (scripts/init.sh fetches
all needed layers and does configuration).


