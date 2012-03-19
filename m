Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S9kAr-00042a-Uy for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 22:31:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2JLMcPK001722
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 21:22:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01114-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 21:22:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2JLMS59001716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 21:22:30 GMT
Message-ID: <1332192150.9740.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2012 21:22:30 +0000
In-Reply-To: <COL120-W391CDA1CEF0C6CE16540C8DD420@phx.gbl>
References: <COL120-W391CDA1CEF0C6CE16540C8DD420@phx.gbl>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Linking two recipes
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
X-List-Received-Date: Mon, 19 Mar 2012 21:31:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-19 at 13:59 -0700, simran singh wrote:
> Hello,
> I have recipes for two applications Recipe A and Recipe B. Recipe B
> requires a lib.so file and init.h file which are installed by Recipe
> A.
> How do I acknowledge this dependency in Recipe B. I tried doing
> do_stage() function in recipe A with no success. Please advice.
> I am attaching the two recipes.
> Thank you for any help.

recipe B needs to do:

DEPENDS += "recipeA"

Cheers,

Richard




