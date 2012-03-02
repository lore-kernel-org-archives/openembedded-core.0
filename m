Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3URt-0003XZ-03 for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 16:31:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22FMfdB002110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 15:22:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01088-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 15:22:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22FMWrF002104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 15:22:34 GMT
Message-ID: <1330701756.309.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 15:22:36 +0000
In-Reply-To: <1330478026-3871-1-git-send-email-james@digitalmatter.com.au>
References: <1330478026-3871-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] initscripts: Create the volatiles cache atomically.
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
X-List-Received-Date: Fri, 02 Mar 2012 15:31:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-29 at 09:13 +0800, James Limbouris wrote:
> If a machine loses power while building the volatiles cache, it will
> continue to operate with an incomplete set of volatiles. Fix this by
> updating atomically.
> 
> Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> ---
>  .../initscripts-1.0/populate-volatile.sh           |   10 ++++++----
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
>  2 files changed, 7 insertions(+), 5 deletions(-)

Merged to master, thanks.

Richard



