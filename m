Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C6D8E60896
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:21:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MAW5SI031116; Thu, 22 Aug 2013 11:32:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eHsJaIML7vx2; Thu, 22 Aug 2013 11:32:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MAWkXn031162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 22 Aug 2013 11:32:48 +0100
Message-ID: <1377166846.428.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 22 Aug 2013 11:20:46 +0100
In-Reply-To: <6560539.TdGG90GaLI@helios>
References: <cover.1377150822.git.sgw@linux.intel.com>
	<6560539.TdGG90GaLI@helios>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2013 10:21:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-22 at 10:07 +0100, Paul Eggleton wrote:
> On Wednesday 21 August 2013 22:58:55 Saul Wold wrote:
> > Marko Lindqvist (3):
> >   texinfo: correct dont-depend-on-help2man.patch
> >   SDL2: add recipe
> >   boost: fix build when PARALLEL_MAKE is not set
> > 
> > Otavio Salvador (1):
> >   distro_features_check.bbclass: Allow checking of required/conflicting
> >     features
> 
> I should have asked this earlier - why does this need to be a separate 
> bbclass? The code doesn't do anything if the variables aren't set, so it can't 
> be because it could have an impact on existing setups that don't set them.

FWIW I do have a worry about the shear weight of the core these days as
we're building up piles of anonymous python for example. In many ways I
therefore like the idea of having more classes which get included when
they're needed.

Cheers,

Richard


