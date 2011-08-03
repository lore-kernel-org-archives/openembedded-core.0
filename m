Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoehK-0002Y8-5A for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 18:53:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73GnC66027667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 17:49:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27367-05 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 17:49:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73Gn7VR027661
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 17:49:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312320056-4613-1-git-send-email-galak@kernel.crashing.org>
References: <1312320056-4613-1-git-send-email-galak@kernel.crashing.org>
Date: Wed, 03 Aug 2011 17:48:48 +0100
Message-ID: <1312390128.2344.701.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v3] automake: Fix issue with tar configure failing with large UID/GIDs
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
X-List-Received-Date: Wed, 03 Aug 2011 16:53:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 16:20 -0500, Kumar Gala wrote:
> Add a fixup for trying to create ustar archives when the users
> UID or GID is larger than the format allows.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> * Removed patch=1
> * Fixed a few whitespace issues
> 
>  meta/recipes-devtools/automake/automake.inc        |    2 +-
>  .../prefer-cpio-over-pax-for-ustar-archives.patch  |   41 ++++++++++++++++++++
>  meta/recipes-devtools/automake/automake_1.11.1.bb  |    3 +-
>  3 files changed, 44 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch

Merged to master, thanks.

Richard



