Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdQ0i-0008NP-2X for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 18:31:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLHOIh5011888
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:24:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11590-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:24:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLHOBvt011882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:24:12 GMT
Message-ID: <1324488253.19860.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 17:24:13 +0000
In-Reply-To: <4EF0C808.8060609@gmail.com>
References: <4EF0C808.8060609@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] patch.bbclass: abstract out logic that determines patches to apply
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
X-List-Received-Date: Wed, 21 Dec 2011 17:31:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-20 at 10:38 -0700, Christopher Larson wrote:
> This is needed by the copyleft_compliance class, so it can emit series files
> for the patches, which greatly increases their usefulness to a user 
> trying to
> reconstruct the sources outside of OE.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   meta/classes/patch.bbclass |  196 
> +++++++++++++++++++++++--------------------
>   1 files changed, 105 insertions(+), 91 deletions(-)

I have no objection to the change but the patch seems to be mangled
somehow. Could you resend it or point me at a git tree please?

Cheers,

Richard



