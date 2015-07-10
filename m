Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id B3C5565C60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:19:45 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1ZDZ9N-0005Ch-K1 for openembedded-core@lists.openembedded.org;
	Fri, 10 Jul 2015 16:19:37 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 16:19:37 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 16:19:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 10 Jul 2015 16:19:17 +0200
Message-ID: <mnok95$fuc$1@ger.gmane.org>
References: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
In-Reply-To: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Fri, 10 Jul 2015 14:19:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Eggleton schreef op 09-07-15 om 12:24:
> Hi all,
> 
> A few years ago we made the switch from ffmpeg to libav (a mostly drop-in
>  compatible fork), with fairly good justification at the time. However,
> it looks like Debian has just made the switch back to ffmpeg, citing a
> number of reasons - most notably more responsive security issue patching
> in recent history. Here's a page with their full reasoning:
> 
> https://wiki.debian.org/Debate/libav-provider/ffmpeg
> 
> Gstreamer (gst-libav, specifically) has also just recently made the
> switch back for its internal copy:
> 
> https://bugzilla.gnome.org/show_bug.cgi?id=751607
> 
> What do people think? Should we be looking to make the switch back in OE
> as well?

As much as I like the libav guys, ffmpeg seems to win the popular vote which
makes it easier to use. Kodi/xbmc has been named, opencv is another.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVn9RlMkyGM64RGpERAqwwAJ9SXkQ8WFLRlweCx2CenlK3L1F34ACfZo+R
pQzjY9o32AwZTC+OCqpNLXE=
=HCXC
-----END PGP SIGNATURE-----


