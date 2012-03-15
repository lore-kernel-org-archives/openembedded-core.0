Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8B2z-0004jx-Rk for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 14:48:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2FDe87g022215
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 13:40:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21190-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 13:40:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2FDduKq022178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 13:39:59 GMT
Message-ID: <1331818796.18586.85.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 13:39:56 +0000
In-Reply-To: <CAGDS+n=KnzzUvUfv_T5X9yHPtOzQ7cgORh-ZbOJZDbFis9F69Q@mail.gmail.com>
References: <CAGDS+n=KnzzUvUfv_T5X9yHPtOzQ7cgORh-ZbOJZDbFis9F69Q@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: boost breaks on rebuild
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
X-List-Received-Date: Thu, 15 Mar 2012 13:48:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 15:28 -0700, Steve Sakoman wrote:
> NOTE: package boost-1.49.0-r2.0: task do_compile: Failed
> 
> I don't have a fix for this but wanted to document the failure.
> 
> As with all the other failures of this type, a -c cleansstate and
> rebuild is the workaround.
> 
> It feels to me like there are quite a few recipes that don't handle
> rebuilds -- I seem to run into a few after every pull.

Agreed, there is a problem here. I've filed the bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2123

since I think we systematically need to work through these and eradicate
them.

An alternative to fix some of the compile cases would be to run a "make
clean" before the make. I suspect this would annoy people and its a
shame to do that because of a few broken recipes though...

Cheers,

Richard





