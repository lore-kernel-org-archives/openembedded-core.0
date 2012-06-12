Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SeR57-0007U1-Ly for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 15:24:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CDDmrB010629
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:13:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10276-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:13:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CDDeBp010623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:13:41 +0100
Message-ID: <1339506820.8065.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2012 14:13:40 +0100
In-Reply-To: <CAP9ODKo415ewPTCpy5_dmziRRZgqesjof6zBKmjgHgDFO_XrcA@mail.gmail.com>
References: <cover.1338658338.git.otavio@ossystems.com.br>
	<1339151624.27075.0.camel@ted>
	<CAP9ODKo415ewPTCpy5_dmziRRZgqesjof6zBKmjgHgDFO_XrcA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Fix build failure of openjade using newer host
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
X-List-Received-Date: Tue, 12 Jun 2012 13:24:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-08 at 08:52 -0300, Otavio Salvador wrote:
> On Fri, Jun 8, 2012 at 7:33 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         Why can't we run autoreconf instead of having the huge patch?
>         This might
>         be the right answer but I'd like to understand the problem
>         here a bit
>         more...
>
> The configure scripts are inside config dir and to proper configure it
> you need to call it with some params; too hackish! I ended getting
> this change from Debian package to not waste time mangling with
> options for autoreconf and like.

I really want to run reautoconf like we do with the rest of the system
for consistency. Its less important as long as this is a native recipe
but if we started building it for the target it would become a problem.

I appreciate you don't want to get distracted with something like that
and I can't really ask you to do it so I've done it myself put out an
alternative patch for review.

Cheers,

Richard




