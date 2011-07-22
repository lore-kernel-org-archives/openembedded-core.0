Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkDSi-0005RI-Jq for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 13:00:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MAtwqb027633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:55:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26947-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:55:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MAtqc5027627
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:55:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311326223-10708-1-git-send-email-galak@kernel.crashing.org>
References: <1311326223-10708-1-git-send-email-galak@kernel.crashing.org>
Date: Fri, 22 Jul 2011 11:55:49 +0100
Message-ID: <1311332149.2344.131.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Fri, 22 Jul 2011 11:00:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-22 at 04:17 -0500, Kumar Gala wrote:
> Pulled common options that are needed for powerpc64-linux to build
> out of powerpc32-linux and put them into powerpc-linux.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
>  meta/site/powerpc-linux   |   24 ++++++++++++++++++++++++
>  meta/site/powerpc32-linux |   19 -------------------
>  2 files changed, 24 insertions(+), 19 deletions(-)

Merged to master, thanks.

Richard



