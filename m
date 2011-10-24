Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RILOs-0001cY-PV for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 16:21:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9OEFE4B029622
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 15:15:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29045-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 15:15:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9OEF7Sv029608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 15:15:08 +0100
Message-ID: <1319465707.25011.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 24 Oct 2011 15:15:07 +0100
In-Reply-To: <91421698-3BCA-4B52-8C7C-AD842A2E62FB@dominion.thruhere.net>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<6038b7e0961ca4aec70cc6de8adbc79567500e2b.1319394187.git.sgw@linux.intel.com>
	<1319462157.25011.1.camel@ted>
	<91421698-3BCA-4B52-8C7C-AD842A2E62FB@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 11/27] pulseaudio-0.9.23: inherit perlnative to work around build on host without XML/Parser.pm
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
X-List-Received-Date: Mon, 24 Oct 2011 14:21:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-24 at 15:19 +0200, Koen Kooi wrote:
> Op 24 okt. 2011, om 15:15 heeft Richard Purdie het volgende geschreven:
> 
> > On Sun, 2011-10-23 at 11:26 -0700, Saul Wold wrote:
> >> From: Martin Jansa <Martin.Jansa@gmail.com>
> >> 
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >> .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
> >> 1 files changed, 1 insertions(+), 1 deletions(-)
> >> 
> >> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> >> index 33f5e15..4ac2418 100644
> >> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> >> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> >> @@ -4,7 +4,7 @@ PR = "r5"
> >> 
> >> DEPENDS += "gdbm speex"
> >> 
> >> -inherit gettext
> >> +inherit gettext perlnative
> > 
> > This doesn't look right. If we need xmlparser, we should state that in
> > DEPENDS. If that is added to DEPENDS, I'm not sure we still need the
> > inherit of perlnative?
> 
> If you need xmlparser during the build you almost always need the
> perlnative wrapper as well :(

I was under the impression that we'd fixed most of those issues :/. It
could well be a valid dependency in this case so I'll take the patch
with the added DEPENDS.

Cheers,

Richard





