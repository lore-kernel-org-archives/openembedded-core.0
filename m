Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN1YU-0005YL-ER for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 13:38:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JBZF6a007453
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 12:35:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07401-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 12:35:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JBZ95a007447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 12:35:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTimrb+YjVGP_eh_i8nDunvye0vApJA@mail.gmail.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
	<BANLkTimrb+YjVGP_eh_i8nDunvye0vApJA@mail.gmail.com>
Date: Thu, 19 May 2011 12:35:06 +0100
Message-ID: <1305804906.3424.480.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] network based PR service
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
X-List-Received-Date: Thu, 19 May 2011 11:38:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 13:01 +0200, Frans Meulenbroeks wrote:
> What should I do to either disable this for some recipes, or use a
> different (private) server?
> We do not wish to rely on an external server for proprietary recipes (or for
> recipes for which we made a local change in an overlay).
> How is this case handled?

This could be handled by doing things like setting:

PRSERV_HOST_pn-myprivaterecipe = "somelocalhost"

or

PRSERV_HOST_pn-myprivaterecipe = ""

to disable it.

One thing we lack is a good way to apply changes like this, only if code
is within a given layer. Even in that case, it should be possible with
anonymous python to look at the location of the current .bb file and
then conditionally set these variables as appropriate to the right
server.

Certainly this needs to be thought about and documented but I think
there are ways to do it.

Cheers,

Richard





