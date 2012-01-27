Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rqic0-0004zb-Tm for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 11:00:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0R9qwJo006604;
	Fri, 27 Jan 2012 09:52:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05921-08; Fri, 27 Jan 2012 09:52:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0R9qo01006598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Jan 2012 09:52:51 GMT
Message-ID: <1327657972.19643.441.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jan 2012 09:52:52 +0000
In-Reply-To: <1327652489-9574-1-git-send-email-koen@dominion.thruhere.net>
References: <1327652489-9574-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] libtool 2.4.2: fix missing quote in FILES_libtldtl
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
X-List-Received-Date: Fri, 27 Jan 2012 10:00:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-27 at 09:21 +0100, Koen Kooi wrote:
> The missing quote prohibits OE from packaging it correctly, leading to:
> 
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome:
> |  *    libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *
> 
> for incremental builds and binary feeds.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-devtools/libtool/libtool-2.4.2.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



