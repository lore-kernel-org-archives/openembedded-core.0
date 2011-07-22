Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19RUR4G61jJFOfnCqe78j+fXV/ap0IRB14=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkGCD-0000gX-QO
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 15:55:18 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6MDp6ev013290;
	Fri, 22 Jul 2011 08:51:07 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1311332149.2344.131.camel@rex>
Date: Fri, 22 Jul 2011 08:51:06 -0500
Message-Id: <5021E937-F4E5-48D4-9649-1DF5FB7CA3EE@kernel.crashing.org>
References: <1311326223-10708-1-git-send-email-galak@kernel.crashing.org>
	<1311332149.2344.131.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: Tom Rini <Tom_Rini@mentor.com>
Subject: Re: [PATCH] site/powerpc*-linux: refactor needed options that are common
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
X-List-Received-Date: Fri, 22 Jul 2011 13:55:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 22, 2011, at 5:55 AM, Richard Purdie wrote:

> On Fri, 2011-07-22 at 04:17 -0500, Kumar Gala wrote:
>> Pulled common options that are needed for powerpc64-linux to build
>> out of powerpc32-linux and put them into powerpc-linux.
>>=20
>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>> ---
>> meta/site/powerpc-linux   |   24 ++++++++++++++++++++++++
>> meta/site/powerpc32-linux |   19 -------------------
>> 2 files changed, 24 insertions(+), 19 deletions(-)
>=20
> Merged to master, thanks.
>=20
> Richard

I posted this more for Tom, but I'm sure he can refactor this where it =
really needs to go.

- k=


