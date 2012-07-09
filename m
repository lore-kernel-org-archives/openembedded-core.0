Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoHVC-0005sM-Un for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:12:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69H0skN009145
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 18:00:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08270-09 for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 18:00:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69H0ln4009139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 18:00:48 +0100
Message-ID: <1341853247.8066.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jul 2012 18:00:47 +0100
In-Reply-To: <CAK18fxGjWFXQ4C40QgmCnk5G3PucaN4JzDAsDhMb4m6+pxNxzg@mail.gmail.com>
References: <alpine.DEB.2.02.1207070649530.18262@oneiric>
	<CAK18fxGjWFXQ4C40QgmCnk5G3PucaN4JzDAsDhMb4m6+pxNxzg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: tcf-agent, matchbox-wm-2: Correct "proto=git" to "protocol=git".
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
X-List-Received-Date: Mon, 09 Jul 2012 17:12:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 12:27 +0300, Andrei Gherzan wrote:
> On Sat, Jul 7, 2012 at 1:54 PM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
>
>         "proto=git" is not a valid parameter for the git fetcher.
>
> NOTE: package matchbox-wm-2-0.1+git1
> +01fa5465743c9ee43d040350f4405d35293e4869-r1: task do_fetch:
> Succeeded 
>
> Anyway, in the git.py, code is searching for "protocol" parameter:
> ud.proto = ud.parm['protocol']
>
> ... so your change seems legit. 
>
> On another hand, svn.py is using:
>  proto = ud.parm.get('proto', 'svn')
>
> A good think would be to use the same parameter names for all
> protocols. 
> 
I agree but how do we do this without breaking the world? We probably
should try and standardise it, probably to "protocol".

Cheers,

Richard







