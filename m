Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXhR4-0005Ct-Fv for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 23:54:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB5MmCPZ027135
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2011 22:48:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26585-05 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2011 22:48:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB5Mm3JN027129
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2011 22:48:04 GMT
Message-ID: <1323125294.25960.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 05 Dec 2011 22:48:14 +0000
In-Reply-To: <8651be5fb600a2d20acaf3c7b6848f7855bd2b75.1323109431.git.paul.eggleton@linux.intel.com>
References: <cover.1323109431.git.paul.eggleton@linux.intel.com>
	<8651be5fb600a2d20acaf3c7b6848f7855bd2b75.1323109431.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] classes/buildhistory: do not save old packagehistory files by default
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
X-List-Received-Date: Mon, 05 Dec 2011 22:54:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-05 at 18:28 +0000, Paul Eggleton wrote:
> Disable storing package history as version named files unless
> BUILDHISTORY_KEEP_VERSIONS is set to 1; otherwise the adds of these
> files that duplicate what is already in git anyway is just noise in the
> git log.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/buildhistory.bbclass |    9 +++++++--
>  1 files changed, 7 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



