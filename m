Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+DVNAP1NP8Cb3aJVVQVwrKOP90h80w/u4=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qli36-0004mJ-Kn
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 15:51:53 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6QDldwa028859
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 08:47:39 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
Date: Tue, 26 Jul 2011 08:47:40 -0500
Message-Id: <969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Tue, 26 Jul 2011 13:51:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 26, 2011, at 7:44 AM, Richard Purdie wrote:

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 =
+++++++++++++++++++-
> meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
> meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
> meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
> meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
> meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
> 6 files changed, 88 insertions(+), 18 deletions(-)

One thing I'm wondering about as we do this is the ability to pass =
--with-cpu to gcc & [e]glibc configure to pickup proper optimized cfgs & =
libs for a given target.

- k=


