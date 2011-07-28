Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19NDjIRoJulnqs/Xv2jseOWaHxoZn1vAq4=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmSqZ-0004k1-QV
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 17:50:06 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SFj7UH008153
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 10:45:49 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E317D08.1020400@mentor.com>
Date: Thu, 28 Jul 2011 10:45:49 -0500
Message-Id: <23E88267-9D4E-4174-9BBF-2B80F050FCB3@kernel.crashing.org>
References: <A64E29D1-A803-4CC3-B7D7-C82C915869D0@kernel.crashing.org>
	<1311862667.30326.443.camel@phil-desktop>
	<4E317D08.1020400@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: lib vs lib64?
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
X-List-Received-Date: Thu, 28 Jul 2011 15:50:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 28, 2011, at 10:15 AM, Tom Rini wrote:

> On 07/28/2011 07:17 AM, Phil Blundell wrote:
>> On Thu, 2011-07-28 at 09:15 -0500, Kumar Gala wrote:
>>> With recent multilib changes for a pure 64-bit target (no multilib) =
should things be in /lib or /lib64?
>>=20
>> They should be in ${base_libdir}.  Whether that's /lib or /lib64 is a
>> DISTRO choice I suppose.
>=20
> Assuming the libc has been patched for that arch.  Or do we no longer
> need that change?  I know there was a patch for mips64 to look at /lib
> not /lib64 for ld.so, etc, etc.

Yeah, the issue I'm running into seems related to:

commit 6c936b4b1a2fb1bdf1f3f91482af7e33e71b5c10
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Wed Jul 27 10:19:30 2011 +0100

    gcc: Drop part of the 64bithack patch which is no longer used
   =20
    Since we now handle GLIBC_DYNAMIC_LINKER in =
gcc-configure-common.inc:
   =20
    's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'

And it not doing what is expected.

- k=


