Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZmDf-00062Y-OM for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:57:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGlfjx023545;
	Wed, 30 May 2012 17:47:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23236-05; Wed, 30 May 2012 17:47:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGlYDj023538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 May 2012 17:47:35 +0100
Message-ID: <1338396454.20169.163.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 30 May 2012 17:47:34 +0100
In-Reply-To: <lyy5o9zm89.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1338391023-31189-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1338392680.20169.148.camel@ted>
	<lyy5o9zm89.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtasn: fixed cross build issue
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
X-List-Received-Date: Wed, 30 May 2012 16:58:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-30 at 18:07 +0200, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> >> | /bin/sh ../libtasn1-2.12-r1/libtasn1-2.12/build-aux/missing --run help2man --info-page libtasn1 \
> >> |       --name="ASN.1 DER encoder" \
> >> |       --output=asn1Coding.1 ../src/asn1Coding
> >> | help2man: can't get `--help' info from ../src/asn1Coding
> >> | Try `--no-discard-stderr' if option outputs to stderr
> >> | make[3]: *** [asn1Coding.1] Error 1
> >> 
> >> which was caused by touching configure.ac which is a dependency of the
> >> generated man pages.
> >> 
> >> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> >> ---
> >>  meta/recipes-support/gnutls/libtasn1_2.12.bb |   10 +++++++++-
> >>  1 files changed, 9 insertions(+), 1 deletions(-)
> >
> > This is just a workaround, I thought we'd found a better way to handle
> > this.
> 
> setting HELP2MAN environment to 'true' for cross-builds might be a
> general solution.... But this does not seem to be implemented...

Right, I remember looking into this and its hard to disable. I've pushed
a PATH change to address this problem...

Cheers,

Richard



