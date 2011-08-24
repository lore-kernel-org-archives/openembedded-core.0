Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19/MEAtMehLW2o82UH9oH3jxe79n+tc2Mc=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qw4kR-0005OG-0x
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 06:07:27 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7O42b0o000742;
	Tue, 23 Aug 2011 23:02:37 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1314150303.5939.70.camel@rex>
Date: Tue, 23 Aug 2011 23:02:37 -0500
Message-Id: <7D14B031-9782-4012-B31C-A46BE077672F@kernel.crashing.org>
References: <A182C128-8E5F-48F0-B72B-39DA62E6E1F4@kernel.crashing.org>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D724C903@shsmsx501.ccr.corp.intel.com>
	<0597F428-97F2-461F-804B-FE793E911BD4@kernel.crashing.org>
	<1314150303.5939.70.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: why do we poison -Os?
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
X-List-Received-Date: Wed, 24 Aug 2011 04:07:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 23, 2011, at 8:45 PM, Richard Purdie wrote:

> On Tue, 2011-08-23 at 20:32 -0500, Kumar Gala wrote:
>> If tinylogin is the only issue why modify/patch gcc?  I see we have
>> meta/recipes-core/tinylogin/tinylogin-1.4/use_O2_option.patch to deal
>> with this?
>>=20
>> Not allowing -Os at all, which is our current situation on PPC is
>> problematic.  So trying to see if this issue is really limited to gcc
>> 4.5 or not.  How can I reproduce it with current poky.git?
>=20
> We were seeing problems when makefiles were putting -Os into compiler
> flags without our knowledge. In some cases -Os was silently corrupting
> binaries. We therefore ended up adding the poison so if anything was
> using the option we knew to generate buggy code, we'd know about it.

So, I'm trying to figure out if it was just tinylogin or more that had =
issues.

> If we know gcc to be safe using that option we can drop the patch and
> users can enable it where it makes sense to them. I still don't like
> makefiles changing compiler optimisations from under us though. Last I
> heard, -Os was still very badly supported and not recommended by the =
gcc
> community.

That's a different issue altogether.  I think its bad that we dont allow =
-Os at all which is what I'm trying address and the fact that its pretty =
necessary to build u-boot because it has size limitations.

- k=


