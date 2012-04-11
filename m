Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHwPb-0000iV-MX for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 14:12:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BC3Ipq007888
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 13:03:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07435-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 13:03:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BC3CWI007882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 13:03:13 +0100
Message-ID: <1334145791.10826.173.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2012 13:03:11 +0100
In-Reply-To: <1334144991-2630-1-git-send-email-noor_ahsan@mentor.com>
References: <1334144991-2630-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2] utility-tasks.bbclass: Add distclean task for removing sources
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
X-List-Received-Date: Wed, 11 Apr 2012 12:12:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-11 at 16:49 +0500, Noor, Ahsan wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
> 
> * Bring distclean task from openembedded classic.
> 
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  meta/classes/utility-tasks.bbclass |   30 ++++++++++++++++++++++++++++++
>  1 files changed, 30 insertions(+), 0 deletions(-)

No thanks, I don't see the need for this. Please use the "cleanall" task
instead which correctly calls into the fetchers and removes the right
pieces rather than the random files distclean used to remove.

Cheers,

Richard



