Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgYil-0003qc-Vh for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 11:30:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6AFv8a027599;
	Thu, 6 Dec 2012 10:15:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24618-06; Thu,  6 Dec 2012 10:15:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6AFmlt027593
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 6 Dec 2012 10:15:49 GMT
Message-ID: <1354788938.25268.167.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 06 Dec 2012 10:15:38 +0000
In-Reply-To: <CA+chaQdgmi9r9H4_JKUbD+ASUba_x5L=yAikkR78dQ5v_xv4kQ@mail.gmail.com>
References: <1354716839.25268.105.camel@ted>
	<20121205144539.GA3396@jama.jama.net> <1354720793.25268.115.camel@ted>
	<20121205152442.GC3396@jama.jama.net> <1354721845.25268.118.camel@ted>
	<CA+chaQdgmi9r9H4_JKUbD+ASUba_x5L=yAikkR78dQ5v_xv4kQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Switch to PR server model for PR bumps - 1 week
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 10:30:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-12-06 at 05:20 +0100, Martin Jansa wrote:
> Ah and one more:
> 6) what about export of LOCALCOUNT from bb persistent cache to import
> it as initial values of AUTOINC for git recipes?

Constantin has posted two patches (one bitbake, one OE) which change the
fetcher to use the PR server for this data. It adds functionality so the
import/export works and it becomes a standard part of the PR service.

Once we switch to the PR service, we can merge those and this problem
becomes resolved.

Cheers,

Richard



