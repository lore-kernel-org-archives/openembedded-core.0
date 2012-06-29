Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SkZbV-0003Pd-DX for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 13:43:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TBWH3P001782
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 12:32:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00996-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 12:32:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TBW7Ve001776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 12:32:08 +0100
Message-ID: <1340969529.23146.143.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 12:32:09 +0100
In-Reply-To: <4FED7714.5000309@windriver.com>
References: <4FED7714.5000309@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: The native perl's path is not in PATH
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
X-List-Received-Date: Fri, 29 Jun 2012 11:43:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-29 at 17:36 +0800, Robert Yang wrote:
> The native perl is installed to:
> 
> ${STAGING_BINDIR_NATIVE}/perl-native/perl
> 
> But this isn't in the PATH, so we can use the native perl
> by the command "perl" or "#!/usr/bin/env perl".
> 
> I wonder why we install the perl to ${STAGING_BINDIR_NATIVE}/perl-native,
> but not to ${STAGING_BINDIR_NATIVE}.
> 
> It would be good if we can add ${STAGING_BINDIR_NATIVE}/perl-native to the path
> or install the native perl to ${STAGING_BINDIR_NATIVE}, I will send a patch
> for it if you are ok with it.

No, this is very deliberately not in PATH by default. Please see the
mailing list archives and the original patches that implemented this to
understand why.

Such a patch will not be accepted.

What problem are you trying to fix?

Cheers,

Richard




