Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN1yi-0000uc-0T for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 14:05:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JC2LJv007664
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 13:02:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07401-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 13:02:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JC2DuB007658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 13:02:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1305800693.git.lianhao.lu@intel.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
Date: Thu, 19 May 2011 13:02:11 +0100
Message-ID: <1305806531.3424.501.camel@rex>
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
X-List-Received-Date: Thu, 19 May 2011 12:05:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch series looks really good to me in general. I know I've given
feedback about some pieces that need tweaking but overall its good and
I'm pleased with this. There are a few corner cases people have raised
and some tweaks we need to make but nothing that can't be built from
this foundation! :)

On Thu, 2011-05-19 at 18:29 +0800, Lianhao Lu wrote:
> To start the network based PR service daemon, run the following command after 
> "sourcing" the environment file oe-init-build-env:
> 
>   bitbake-prserv --start

The one other area I'm going to worry about is the "build out the box"
use case. Nowhere in the quickstart guide do we mention to the user that
they need to run this. I'd also argue that we shouldn't require the user
to run this at all either and we should be able to autolaunch and use it
in the localhost usecase. Most users shouldn't care, it should just
work. Those who need to use it can either preconfigure it for their
users, or will know how to setup and start the server themselves.

A case in point is an autobuilder running 4 different builds. Ideally,
in the default case, each automated build would setup and just use its
own server on a non-conflicting free port on localhost.

I'm not 100% sure how we make this happen and I can give it some thought
but it is the final piece of this puzzle we need to solve.

Cheers,

Richard



