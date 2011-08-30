Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyVuY-0002pv-SK for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 23:31:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ULR5wU002581
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:27:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01531-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:27:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ULQvo7002567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:26:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314162530-4606-1-git-send-email-galak@kernel.crashing.org>
References: <1314162530-4606-1-git-send-email-galak@kernel.crashing.org>
Date: Tue, 30 Aug 2011 22:26:46 +0100
Message-ID: <1314739606.5939.437.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] gcc-4.6: Drop gcc-poison-parameters.patch as its not need
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
X-List-Received-Date: Tue, 30 Aug 2011 21:31:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-24 at 00:08 -0500, Kumar Gala wrote:
> The gcc-poison-parameters was added specifically to deal with an issue
> on ppc targets and a bug when we build with -Os -frename-registers.
> 
> This bug below reports the issue and is fixed in gcc-4.6.x:
> 
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44618
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> * v2: add changse to recipe (forgot to git-add them ;)
> 
>  meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
>  .../gcc/gcc-4.6/gcc-poison-parameters.patch        |   76 --------------------
>  2 files changed, 1 insertions(+), 78 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-parameters.patch

Merged to master, thanks.

Richard



