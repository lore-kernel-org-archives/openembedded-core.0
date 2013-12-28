Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id C719960CF1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 15:28:39 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Vwvob-0005Dn-5X for openembedded-core@lists.openembedded.org;
	Sat, 28 Dec 2013 16:28:37 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 16:28:37 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 16:28:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 28 Dec 2013 16:28:35 +0100
Message-ID: <l9mqmg$oia$1@ger.gmane.org>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>	<l9c5ar$2mb$1@ger.gmane.org>
	<1801103.RjHpRo2rCi@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1801103.RjHpRo2rCi@helios>
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
X-List-Received-Date: Sat, 28 Dec 2013 15:28:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Eggleton schreef op 28-12-13 12:48:
> Hi Koen,
> 
> On Tuesday 24 December 2013 15:22:32 Koen Kooi wrote:
>> Burton, Ross schreef op 23-12-13 19:01:
>>> We'd like to integrate Piglit (an OpenGL test suite) into Poky so
>>> that we can run automated QA on the GL stack.  Piglit is currently
>>> residing in meta-oe, but as Poky is a self-contained project we can't
>>> just add meta-oe to it:  apart from the size of meta-oe, we can't
>>> ensure stability if meta-oe makes incompatible changes that affect
>>> Poky.
>>> 
>>> Piglit isn't a stand-alone package, there are the dependencies of
>>> waffle, python-mako and python-numpy to consider too.  There are two 
>>> possibilities I can see:
>>> 
>>> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
>>> and pushes the boundaries of "core platform".  In a sense this is a
>>> repeat of the discussion we had with Midori...  does oe-core contain
>>> everything needed to sufficiently exercise the core components it
>>> ships or not?
>>> 
>>> 2) Add piglit and deps to meta-yocto.  Probably a new layer called 
>>> meta-yocto-qa (or similar) because the Yocto Compatible guidelines
>>> forbid mixing distribution policy and recipes.
>> 
>> Speaking of layers, can you *please* rename meta-yocto to meta-poky?
>> It's what it's actually is and would remove a lot of confusion when
>> trying to explain that yocto is not a distro, even if the distro layer
>> is called 'meta-yocto'.
> 
> This is a tangent, but a couple of points:
> 
> 1) This rename would not come for free. We'd need to update people's
> existing bblayers.conf files on the fly, as we did when meta-yocto-bsp
> was split out of meta-yocto, and thus bump LCONF_VERSION; however, doing
> this only in poky has resulted in annoying problems when users remove
> poky from their configurations (since LCONF_VERSION is out-of-step
> between Poky and OE-Core, leading to confusing errors in this situation).
> Thus I think we'd want to solve this once and for all by bumping the
> value in OE-Core as well as Poky.
> 
> 2) If you propose this rename, perhaps you will also consider renaming 
> meta-oe, since that name within a similarly named meta-openembedded
> repository leads to a similar level of confusion...?

I have no problems with renaming that layer since I get confused by this a
few times a week myself :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSvu4jMkyGM64RGpERAqnnAJ9+ASZITy/zGdjAC9PypPkWVsKO/ACdFF00
0Mfkmf+s20DWkHs6NwxkZYM=
=YCAe
-----END PGP SIGNATURE-----


