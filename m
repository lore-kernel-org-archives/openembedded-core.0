Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QNSPF-00027P-VG
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 18:18:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 44822314BD7A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 18:06:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OKUwqIT8c0Ib
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 18:06:06 +0200 (CEST)
Received: from [172.22.22.61] (drms-590ede24.pool.mediaWays.net [89.14.222.36])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 73179314A986
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 18:06:06 +0200 (CEST)
Message-ID: <4DD69167.1010703@opendreambox.org>
Date: Fri, 20 May 2011 18:05:59 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1305839225.git.raj.khem@gmail.com>	<836208067c345a911ddb3a266ac398b435054798.1305839225.git.raj.khem@gmail.com>	<1305873952.18415.249.camel@lenovo.internal.reciva.com>
	<1305903707.2525.29.camel@phil-desktop>
In-Reply-To: <1305903707.2525.29.camel@phil-desktop>
Subject: Re: [PATCH 2/2] opkg-utils: Allow uppercase lettlers in package names
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
X-List-Received-Date: Fri, 20 May 2011 16:18:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/20/2011 05:01 PM, Phil Blundell wrote:
> On Fri, 2011-05-20 at 07:45 +0100, Phil Blundell wrote:
>> On Thu, 2011-05-19 at 14:09 -0700, Khem Raj wrote:
>>> Some packages have uppercase letters in their names e.g.
>>> efikamx kernel. We allow uppercase character with
>>> uppercase-letters.patch
>>
>> This is not a good idea.  Uppercase characters have never been permitted
>> in .deb/.ipk. 
>>
>> Isn't legitimize_package_name() crunching them to lower case for you?
>> If not then I think it should be made to do that.
> 
> I just checked the code and it certainly looks like it should be doing
> that:
> 
> 	# Remaining package name validity fixes
> 	return s.lower().replace('_', '-').replace('@', '+').replace(',', '+').replace('/', '-')
> 
> So if that isn't working for you then I think it needs a bit of
> debugging.

http://patches.openembedded.org/patch/2255/ should solve the problem. I
was waiting for a second ack.

Khem, if this fixes the problem for you, please send an ack or push this
patch.

Regards,
Andreas


