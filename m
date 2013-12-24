Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id A5BDF6AFB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 14:22:43 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1VvSsa-00054p-Sj for openembedded-core@lists.openembedded.org;
	Tue, 24 Dec 2013 15:22:40 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 15:22:40 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 15:22:40 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 24 Dec 2013 15:22:32 +0100
Message-ID: <l9c5ar$2mb$1@ger.gmane.org>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
X-Enigmail-Version: 1.6
Cc: poky@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: Piglit in Poky
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
X-List-Received-Date: Tue, 24 Dec 2013 14:22:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Burton, Ross schreef op 23-12-13 19:01:
> Hi,
> 
> We'd like to integrate Piglit (an OpenGL test suite) into Poky so that we
> can run automated QA on the GL stack.  Piglit is currently residing in
> meta-oe, but as Poky is a self-contained project we can't just add 
> meta-oe to it:  apart from the size of meta-oe, we can't ensure stability
> if meta-oe makes incompatible changes that affect Poky.
> 
> Piglit isn't a stand-alone package, there are the dependencies of waffle,
> python-mako and python-numpy to consider too.  There are two 
> possibilities I can see:
> 
> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only and
> pushes the boundaries of "core platform".  In a sense this is a repeat of
> the discussion we had with Midori...  does oe-core contain everything
> needed to sufficiently exercise the core components it ships or not?
> 
> 2) Add piglit and deps to meta-yocto.  Probably a new layer called 
> meta-yocto-qa (or similar) because the Yocto Compatible guidelines forbid
> mixing distribution policy and recipes.

Speaking of layers, can you *please* rename meta-yocto to meta-poky? It's
what it's actually is and would remove a lot of confusion when trying to
explain that yocto is not a distro, even if the distro layer is called
'meta-yocto'.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSuZioMkyGM64RGpERAgglAKCHbnivOF3g/ZVMGYadm4pDDzfKVQCdGqlY
YdzFCCkRyP8WWMuNJRlR6x4=
=4M6P
-----END PGP SIGNATURE-----


