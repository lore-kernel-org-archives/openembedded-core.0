Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB69G-0005gz-SP for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:11:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NF2UeN028675
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:02:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28271-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:02:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NF2NUM028668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:02:24 GMT
Message-ID: <1332514947.9740.422.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 15:02:27 +0000
In-Reply-To: <4F6C8437.8020808@mlbassoc.com>
References: <4F6C7DF6.2060805@mlbassoc.com> <1332511592.9740.419.camel@ted>
	<4F6C8437.8020808@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Python recipe
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
X-List-Received-Date: Fri, 23 Mar 2012 15:11:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 08:09 -0600, Gary Thomas wrote:
> On 2012-03-23 08:06, Richard Purdie wrote:
> > On Fri, 2012-03-23 at 07:43 -0600, Gary Thomas wrote:
> >> Just curious, what is this line doing in .../recipes-devtools/python/python_2.7.2.bb
> >>     DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
> >>
> >> n.b. I know what it does, I just don't know why it's there in
> >> a "core" recipe.
> >
> > Is the sharprom distro still active? I doubt it uses OE-Core? I think
> > that can be removed.
> 
> Even if it is still active, this should go in a .bbappend, don't you think?

Yes.

> I have another change to this recipe - should I send them as two separate patches?

Separate please.

Cheers,

Richard




