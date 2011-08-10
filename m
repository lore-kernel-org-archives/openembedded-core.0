Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Qr9DD-0002Hj-Ak
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 15:52:47 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id C7C9C16604DB; Wed, 10 Aug 2011 07:48:16 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5BFA51660440;
	Wed, 10 Aug 2011 07:48:16 -0600 (MDT)
Message-ID: <4E428C20.5030809@mlbassoc.com>
Date: Wed, 10 Aug 2011 07:48:16 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15 Thunderbird/3.1.10
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1312912632.14274.312.camel@rex>	
	<C10D3FB0CD45994C8A51FEC1227CE22F2FA76750B1@shsmsx502.ccr.corp.intel.com>	
	<27DA7A3C-0FE9-43CA-963C-F6217A1D2C9F@kernel.crashing.org>	
	<1312981676.14274.376.camel@rex> <1312982631.14274.379.camel@rex>	
	<4E4288F0.2010904@mlbassoc.com> <1312983621.14274.383.camel@rex>
In-Reply-To: <1312983621.14274.383.camel@rex>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH
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
X-List-Received-Date: Wed, 10 Aug 2011 13:52:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-08-10 07:40, Richard Purdie wrote:
> On Wed, 2011-08-10 at 07:34 -0600, Gary Thomas wrote:
>> On a related thought to these changes - how does this play if
>> you use multiple SDKs for different, but somewhat related, architectures?
>> I'd like to create a simple SDK (just toolchain mostly) using 'meta-toolchain'
>> for both armv5te and armv7a and install them simultaneously on the same
>> host.  My previous attempts at this fell flat as there were a number of
>> files marked as "arm" (i.e. not armv5te or arvm7a) that were common between
>> the two SDK packages, but they didn't seem to be identical.
>
> This is supposed to work but wouldn't due to the issue and the patch
> I've proposed. Whether that is the only issue I don't know.

I'll be glad to test this once you've worked it out.

>
> Can you remember which files we're talking about here?

Not right off - there were just a ton of directories with only arm in the
path that seemed to be architecture dependent.  I think it's all related to
TARGET_SYS vs MULTIMACH_TARGET_SYS and how/where they are used.

>
>> With these changes, will it be possible to support such sets of multiple
>> toolchains?  (No, ADT is not the answer - I just want the toolchains)
>
> ADT uses meta-toolchain-* so its all related.

Fair enough, I just don't want to have to use ADT just to install a toolchain.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


