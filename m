Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/LZnI9AuLxvgjftIwfu+TdY7WU1ynFTBY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoT7x-0005D9-5G
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 06:32:17 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p734RrX3020798;
	Tue, 2 Aug 2011 23:27:54 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <2d1ae02303006bff6cf73d17fec01ef267f3d5ac.1311150183.git.sgw@linux.intel.com>
Date: Tue, 2 Aug 2011 23:27:54 -0500
Message-Id: <12EA2EE6-CF99-4ACC-95E4-B521113CDB00@kernel.crashing.org>
References: <cover.1311150183.git.sgw@linux.intel.com>
	<2d1ae02303006bff6cf73d17fec01ef267f3d5ac.1311150183.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 07/50] xcb-proto: add multilib support.
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
X-List-Received-Date: Wed, 03 Aug 2011 04:32:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 20, 2011, at 3:27 AM, Saul Wold wrote:

> From: Dongxiao Xu <dongxiao.xu@intel.com>
>=20
> There is hardcode of /usr/lib dir for some python files.
> Fix it to support multilib.
>=20
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
> .../xcb/xcb-proto-1.6/aclocal.patch                |   22 =
++++++++++++++++++++
> meta/recipes-graphics/xcb/xcb-proto.inc            |    3 +-
> meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
> meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
> 4 files changed, 26 insertions(+), 3 deletions(-)
> create mode 100644 =
meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch

I'm seeing aclocal.m4 get re-generated in the configure step so the fix =
this patch implements ends up getting blown away.

- k=


