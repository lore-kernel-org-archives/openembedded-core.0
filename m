Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/p7du3rwm25OvZ9XAJys/AHZyFZsTseWI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QlqfV-0001lz-Fg
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 01:04:05 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6QLuPED014782
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 16:56:25 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1311697113.2344.268.camel@rex>
Date: Tue, 26 Jul 2011 16:56:29 -0500
Message-Id: <652729C0-AF36-48F5-B639-F4A79DF17366@kernel.crashing.org>
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
X-List-Received-Date: Tue, 26 Jul 2011 23:04:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 26, 2011, at 11:18 AM, Richard Purdie wrote:

>>>=20
>>> You're already found the way to pass configuration to *libc using =
values
>>> in TARGET_FPU to pickup the right configuration.
>>>=20
>>> Is there a use case we're missing?
>>=20
>> Yes, for [e]glibc we have optimized libc functions for a given /
>> specific PPC processor.  So we need someway to tell configure this.
>=20
> I'd do this by looking for flags in TUNE_FEATURES as Mark has also
> mentioned.

Are we thinking something like the following in e[glibc] recipes:

EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", =
"-with-cpu=3De500mc", "", d)}"

- k=


