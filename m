Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyVkN-0002Zz-7C for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 23:21:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ULGXgG001852
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:16:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01344-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:16:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ULGQmj001839
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:16:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAOd_LFxZDULXe0bsiGk5NsH+YoGFddvvhFg7OgNKx_MRLj_RfQ@mail.gmail.com>
References: <CAOd_LFxZDULXe0bsiGk5NsH+YoGFddvvhFg7OgNKx_MRLj_RfQ@mail.gmail.com>
Date: Tue, 30 Aug 2011 22:16:15 +0100
Message-ID: <1314738975.5939.430.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: how to use AUTOREV for a SVN repo in oe-core?
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
X-List-Received-Date: Tue, 30 Aug 2011 21:21:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-25 at 22:56 -0400, Cliff Brake wrote:
> Hello,
> 
> I'm trying to figure out how AUTOREV is supposed to work these days
> with oe-core.  In the past, I would do something like:
> 
> SRCREV = "${AUTOREV}"
> PV = "1.0+svnr${SRCREV}"
> 
> in my custom application recipes to always build the head of a SVN repo.

You need to do:

PV = "1.0+svnr${SRCPV}"

which should make all the difference!

Cheers,

Richard





