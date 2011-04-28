Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QFNA4-00074O-2A for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 11:05:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S92k1R016101;
	Thu, 28 Apr 2011 10:02:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15864-05; Thu, 28 Apr 2011 10:02:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S92fq1016095
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 28 Apr 2011 10:02:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <ee54f2998bde83872fa1f48c4b1f55f7dfc5774b.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<ee54f2998bde83872fa1f48c4b1f55f7dfc5774b.1303889119.git.sgw@linux.intel.com>
Date: Thu, 28 Apr 2011 10:02:10 +0100
Message-ID: <1303981330.21461.40.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>,
	Antonio Ospite <ospite@studenti.unina.it>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH 38/52] insane.bbclass: Checking for NLS too when checking gettext dependency
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
X-List-Received-Date: Thu, 28 Apr 2011 09:05:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-27 at 00:29 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Checking for gettext is not needed when --disable-nls is used
> 
> Let user know what variant of gettext is missing e.g. gettext-native,
> gettext-nativesdk etc, reveals a bit more for user
> 
> Check for virtual/gettext
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/insane.bbclass |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)

This depends on the gettext.bbclass changes so I didn't take this
either.

Cheers,

Richard



