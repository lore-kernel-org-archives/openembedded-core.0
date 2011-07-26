Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/p7du3rwm25OvZ9XAJys/AHZyFZsTseWI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QlqfY-0001lz-Hb
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 01:04:08 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6QM2bsg017743
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 17:03:20 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1311697113.2344.268.camel@rex>
Date: Tue, 26 Jul 2011 17:03:24 -0500
Message-Id: <7C3E3CE4-B2F1-4B53-9245-FC13D2DA6EEC@kernel.crashing.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
	<1311697113.2344.268.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
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
X-List-Received-Date: Tue, 26 Jul 2011 23:04:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 26, 2011, at 11:18 AM, Richard Purdie wrote:

> On Tue, 2011-07-26 at 10:22 -0500, Kumar Gala wrote:
>> On Jul 26, 2011, at 8:59 AM, Richard Purdie wrote:
>>=20
>>> On Tue, 2011-07-26 at 08:47 -0500, Kumar Gala wrote:
>>>> On Jul 26, 2011, at 7:44 AM, Richard Purdie wrote:
>>>>=20
>>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>> ---
>>>>> meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 =
+++++++++++++++++++-
>>>>> meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
>>>>> meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
>>>>> meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
>>>>> meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
>>>>> meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
>>>>> 6 files changed, 88 insertions(+), 18 deletions(-)
>>>>=20
>>>> One thing I'm wondering about as we do this is the ability to pass
>>>> --with-cpu to gcc & [e]glibc configure to pickup proper optimized =
cfgs
>>>> & libs for a given target.
>>>=20
>>> As far as I can tell, gcc 4.x has no --with-cpu option. We pass the
>>> correct march and mtune options to the compiler at runtime through
>>> CFLAGS and friends.
>>=20
>> Hmm, gcc still supports this:
>>=20
>> http://gcc.gnu.org/install/configure.html
>>=20
>> --with-cpu=3Dcpu
>> --with-cpu-32=3Dcpu
>> --with-cpu-64=3Dcpu
>> Specify which cpu variant the compiler should generate code for by =
default. cpu will be used as the default value of the -mcpu=3D switch. =
This option is only supported on some targets, including ARM, i386, =
M68k, PowerPC, and SPARC. The --with-cpu-32 and --with-cpu-64 options =
specify separate default CPUs for 32-bit and 64-bit modes; these options =
are only supported for i386, x86-64 and PowerPC.=20
>>=20
>> http://gcc.gnu.org/install/specific.html
>>=20
>> powerpc-*-*
>> You can specify a default version for the -mcpu=3Dcpu_type switch by =
using the configure option --with-cpu-cpu_type.
>=20
> I couldn't find that looking at the configure script :/.
>=20
> Anyhow, according to that page, its to "Specify which cpu variant the
> compiler should generate code for by default. cpu will be used as the
> default value of the -mcpu=3D switch". Since we always specify -mcpu =
when
> needed, I don't believe this is an issue for us as far as the build
> system goes.
>=20
> If you're talking about the gcc we build for the target, we should
> really encode all the cpu/tune options in there, not just part of the
> config so again, I don't think its appropriate to the way we use gcc.

What about tool chains produced as part of a ADT, wouldn't it be useful =
for such as case?

Seems like having ability to pass '--with-cpu' ends up being useful to =
set default for things like 32 vs 64-bit on multiple.

- k=


