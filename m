Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qjwkj-0002rO-1W
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 19:09:37 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qjwgj-0005Wk-Qb from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:05:29 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 21 Jul 2011 10:03:11 -0700
Received: from [172.30.80.89] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 21 Jul 2011 10:05:29 -0700
Message-ID: <4E285C54.5000308@mentor.com>
Date: Thu, 21 Jul 2011 10:05:24 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <BBB3C9E0-A02C-4375-8075-5DD2C6588AB4@kernel.crashing.org>
	<CAMKF1srHzFH9PpmKcSMFhSRUstGnt6Pf-z6pirXQFWTpci0vWg@mail.gmail.com>
In-Reply-To: <CAMKF1srHzFH9PpmKcSMFhSRUstGnt6Pf-z6pirXQFWTpci0vWg@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 21 Jul 2011 17:03:11.0093 (UTC)
	FILETIME=[122DE250:01CC47C8]
Subject: Re: siteinfo split between powerpc-common & powerpc-linux
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
X-List-Received-Date: Thu, 21 Jul 2011 17:09:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 07/21/2011 09:48 AM, Khem Raj wrote:
> On Thu, Jul 21, 2011 at 5:17 AM, Kumar Gala <galak@kernel.crashing.org> wrote:
>> Why do we have a split between powerpc-common & powerpc-linux?
>>
>> I assume powerpc-linux is used and picked up for powerpc-linux-uclibc in addition to normal powerpc-linux.
>>
>> I'm looking at adding powerpc64 support and powerpc-common is all kinda of broken for it.  I'd like to just merge powerpc-common & powerpc-linux (as powerpc-linux 32-bit) for now and start a new powerpc-common that refactors 32/64 commonalities.
>>
>> Unless someone says otherwise about the meaning of these files.
> 
> powerpc-common is shared between uclibc and eglibc at present and may
> be shared with other OSes that may build with OE in future.
> traditionally powerpc-common implicitly implied 32bit so I am not
> surprised if its broken for ppc64. You could add powerpc64-common
> and leave 32bit alone. See how its done for mips64 in oe.dev
> 
> http://git.openembedded.org/cgit.cgi/openembedded/tree/site

I'd argue that what we do for mips today is also wrong and I'm going to
try and fix it as soon as I can.  In these cases we should have:
common, common-linux, common-$libc, mips-common, mips-linux,
mips64-linux and if needed mips64-linux-libc.

But I suspect some of the above won't exist, and that's OK.

-- 
Tom Rini
Mentor Graphics Corporation


