Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QrCZW-0002aO-8v for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 19:28:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7AHNV9S023315
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 18:23:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22941-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 18:23:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7AHNLBt023309
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 18:23:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <E0030AC3-67DD-4AC7-ADB1-B83C423F7ECF@kernel.crashing.org>
References: <032728F4-C51D-4298-B50C-B1C2C7050E22@kernel.crashing.org>
	<1312898286.14274.298.camel@rex>
	<2C6C8741-1012-47BC-BDA9-2A02A08C5027@kernel.crashing.org>
	<822AACC4-810B-4113-A214-EE283679EA06@kernel.crashing.org>
	<4E429966.3030607@gmail.com>
	<E0030AC3-67DD-4AC7-ADB1-B83C423F7ECF@kernel.crashing.org>
Date: Wed, 10 Aug 2011 18:22:46 +0100
Message-ID: <1312996966.14274.388.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: python automake dirs (was meta-toolchain-sdk failure)
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
X-List-Received-Date: Wed, 10 Aug 2011 17:28:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 11:51 -0500, Kumar Gala wrote:
> On Aug 10, 2011, at 9:44 AM, Khem Raj wrote:
> 
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > 
> >> So the root of this seems to stem from the following in automake's
> >> python.m4:
> >> 
> >> am_cv_python_pythondir=$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages
> >> 
> >> 
> > am_cv_python_pyexecdir=$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages
> >> 
> >> So the question at hand is how to fix this?
> >> 
> >> Do we patch automake to respect libdir setting for these?
> >> 
> > 
> > yes seems sane to me
> 
> posted some patches in which I do this via python-dir.bbclass which I think is better

I think I'm in favour of changing the m4 files in this case now I better
understand the problem...

Cheers,

Richard



