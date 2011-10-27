Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJKhu-0000NF-9z for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 09:48:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9R7gtM8029107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 08:42:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28767-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 08:42:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9R7gmbQ029101
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 08:42:49 +0100
Message-ID: <1319701366.15601.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 27 Oct 2011 08:42:46 +0100
In-Reply-To: <1319684612-24265-1-git-send-email-msm@freescale.com>
References: <1319684612-24265-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] Add readline as dependecy for gdb-cross-canadian
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
X-List-Received-Date: Thu, 27 Oct 2011 07:48:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-26 at 22:03 -0500, Matthew McClintock wrote:
> Got errors that we were unable to find -lreadline, this fixed the
> issue
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    2 +-
>  .../gdb/gdb-cross-canadian_7.3a.bb                 |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This patch didn't apply as it wasn't against master. I have manually
fixed it up but please send patches against master in future! :)

Cheers,

Richard





