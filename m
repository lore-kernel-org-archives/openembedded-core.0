Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id EB48675D4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 14:50:02 +0000 (UTC)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <cb2620f5-4640-a704-d8a5-71fd751c5710@embed.me.uk>
Date: Mon, 12 Sep 2016 15:50:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Subject: gnutls 3.5.3 & linux 3.10
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
X-List-Received-Date: Mon, 12 Sep 2016 14:50:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

is anybody else seeing issues building gnutls with a 3.10 kernel on the 
target and failing at SYS_getrandom? I believe the breakage was 
introduced here

** libgnutls: Use getrandom where available via the syscall interface.
This works around an issue of not-using getrandom even if it exists
since glibc doesn't declare such function.

but AFAIU if the getrandom syscall isn't available it should fallback to 
using /dev/urandom but instead my compile step is just failing. Anyone 
else hitting this problem?

Cheers,
Jack.

