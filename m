Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QljB1-0006nV-Ff
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 17:04:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QExrfk019331
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 07:59:53 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 26 Jul 2011 07:59:53 -0700
Message-ID: <4E2ED668.3060301@windriver.com>
Date: Tue, 26 Jul 2011 09:59:52 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
In-Reply-To: <1311688752.2344.238.camel@rex>
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Tue, 26 Jul 2011 15:04:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/26/11 8:59 AM, Richard Purdie wrote:
> On Tue, 2011-07-26 at 08:47 -0500, Kumar Gala wrote:
>> On Jul 26, 2011, at 7:44 AM, Richard Purdie wrote:
>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>> meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 +++++++++++++++++++-
>>> meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
>>> meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
>>> meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
>>> meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
>>> meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
>>> 6 files changed, 88 insertions(+), 18 deletions(-)
>>
>> One thing I'm wondering about as we do this is the ability to pass
>> --with-cpu to gcc & [e]glibc configure to pickup proper optimized cfgs
>> & libs for a given target.
> 
> As far as I can tell, gcc 4.x has no --with-cpu option. We pass the
> correct march and mtune options to the compiler at runtime through
> CFLAGS and friends.
> 
> You're already found the way to pass configuration to *libc using values
> in TARGET_FPU to pickup the right configuration.
> 
> Is there a use case we're missing?

glibc is capable of some processor specific optimizations.  So you can say I
want e500 or ppc603e or... as it's base configuration.  This is useful on MIPS
as well.

My suggestion would be to use the TUNE_FEATURES in eglibc to figure out what
option(s) we want to pass to glibc.  (We could also use the tune name, but I'd
be afraid that the names could change arbitrarily over time..  the tune_features
I would expect to have a longer life span.)

--Mark

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



