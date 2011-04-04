Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6iSJ-0000s9-P1 for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:00:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BwOq9015647
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:58:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15532-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 12:58:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BwGqm015641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:58:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <617974af705728499138fd7114ace5bbb3a256a3.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<617974af705728499138fd7114ace5bbb3a256a3.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 12:58:13 +0100
Message-ID: <1301918293.24596.342.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 19/46] libpam_1.1.3.bb: Fix compilation on uclibc when innetgr is absent
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
X-List-Received-Date: Mon, 04 Apr 2011 12:00:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:29 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../pam/libpam/pam-no-innetgr.patch                |   92 ++++++++++++++++++++
>  meta/recipes-extended/pam/libpam_1.1.3.bb          |    2 +
>  2 files changed, 94 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-extended/pam/libpam/pam-no-innetgr.patch

I merged patches 16-19, thanks.

Richard



