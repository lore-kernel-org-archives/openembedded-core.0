Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/ZzbrSwLK65jnGQjCI5fv+yh4vJcbzWog=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjZ7q-0004G1-OO
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 17:55:55 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6KFplQw025089
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 10:51:47 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E26F215.2020100@mentor.com>
Date: Wed, 20 Jul 2011 10:51:47 -0500
Message-Id: <74B078A2-57CD-444E-AC66-A5286827E6D5@kernel.crashing.org>
References: <5A3CA715-DE17-48DC-A7DC-8063B44942E9@freescale.com>
	<1311165760.30326.66.camel@phil-desktop>
	<4E26F215.2020100@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: sudo build failure
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
X-List-Received-Date: Wed, 20 Jul 2011 15:55:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 20, 2011, at 10:19 AM, Tom Rini wrote:

> On 07/20/2011 05:42 AM, Phil Blundell wrote:
>> On Wed, 2011-07-20 at 07:16 -0500, Kumar Gala wrote:
>>> Trying to build a powerpc64 target rootfs and I'm getting the =
following build failures on sudo.  Wondering if anyone has seen anything =
similar:
>>>=20
>>> http://pastebin.com/MeqPn46Q
>>=20
>> There was a bug like that a few months ago which was caused by broken
>> siteinfo files.  Presumably your tree is fairly up to date, but it
>> sounds like you have a similar kind of issue.  You'll need to
>> investigate why configure thinks you don't need -ldl.
>=20
> And part of the problem, I suspect, is that we're still re-syncing
> siteinfo stuff from oe.dev (where your file is based on) into oe-core
> and oe.dev has a lot more stuff in common files (which I'm working on
> bringing to oe-core right now).

Yeah, this I was able to fix the powerpc64-linux siteinfo file I was =
using that had:

ac_cv_func_dlopen=3D${ac_cv_func_dlopen=3Dyes}

Caused us not to have -ldl

- k=


