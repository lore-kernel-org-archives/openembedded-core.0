Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 30AE865E69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 12:45:41 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1WekwC-0004vk-1c for openembedded-core@lists.openembedded.org;
	Mon, 28 Apr 2014 14:45:36 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 14:45:36 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 14:45:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 28 Apr 2014 14:45:26 +0200
Message-ID: <ljlih4$rvg$1@ger.gmane.org>
References: <1874660.NNkBdmWv1O@peggleto-mobl5.ger.corp.intel.com>	<0D39BCEC-9039-4A3F-9E65-85965061E698@dominion.thruhere.net>
	<3327056.Df3VZKvVg7@peggleto-mobl5.ger.corp.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <3327056.Df3VZKvVg7@peggleto-mobl5.ger.corp.intel.com>
X-Enigmail-Version: 1.6
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: OE Github repositories
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
X-List-Received-Date: Mon, 28 Apr 2014 12:45:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Eggleton schreef op 28-04-14 13:08:
> On Monday 28 April 2014 12:43:58 Koen Kooi wrote:
>> Op 28 apr. 2014, om 12:10 heeft Paul Eggleton
> <paul.eggleton@linux.intel.com> het volgende
> geschreven:
>>> Hi folks,
>>> 
>>> Could whoever has admin access for the OpenEmbedded repositories on
>>> github please do two things:
>>> 
>>> 1) Stop having both "oe-core" and "openembedded-core" repositories -
>>> the latter is four months out-of-date. I'd suggest if we want to be
>>> consistent with our openembedded.org repos we should keep the
>>> "openembedded-core" repository and make it so it is kept up-to-date.
>>> 
>>> 2) Rename the "meta-oe" repository to "meta-openembedded", since
>>> meta-oe the layer is distinct from meta-openembedded the repository,
>>> and again this would be consistent with the primary repository
>>> naming.
>> 
>> Keep in mind that renaming/removing 'oe-core' and 'meta-oe' will
>> breaks things which use those repos to pull from by default. Which the
>> oe.org git server has improved a lot, it still can't beat githubs CDN.
> 
> OK then, how about this instead:
> 
> 1) Ensure the "openembedded-core" repository is kept up-to-date
> 
> 2) Add a "meta-openembedded" repository and ensure it is kept up-to-date
> 
> 3) Add a warning to the description for the contracted name repositories
> that the fully-named repositories should be used instead, so we can
> eventually drop them
> 
> 4) Change documentation / scripts to match #3

Sounds like a good plan to me!

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTXk1mMkyGM64RGpERAn8NAJ49r8TimCZIouIBM45jseXqA3xUCACdGPsh
jb5olKQRlsskP9x4vlmEIms=
=FqlW
-----END PGP SIGNATURE-----


