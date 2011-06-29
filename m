Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbvaU-0006u9-JK for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:17:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TDwuuc004812
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:58:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04529-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:58:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TDwnra004806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:58:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309345686.2551.13.camel@phil-desktop>
References: <044DC375-E0BA-44D9-A063-9BB8E11F7742@dominion.thruhere.net>
	<1309341325.15156.232.camel@phil-desktop>
	<1309344835.20015.355.camel@rex>
	<1309345686.2551.13.camel@phil-desktop>
Date: Wed, 29 Jun 2011 14:58:32 +0100
Message-ID: <1309355912.20015.388.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Gstreamer packaging
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
X-List-Received-Date: Wed, 29 Jun 2011 14:17:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 12:08 +0100, Phil Blundell wrote:
> On Wed, 2011-06-29 at 11:53 +0100, Richard Purdie wrote:
> > Obviously you can make the recipe depend on good+bad+ugly but its less
> > than ideal for build time reasons (esp. when considering dependencies)
> > but also the reason that good/bad/ugly exist in the first place which is
> > licensing. If the recipe always has to depend on good+bad+ugly, it
> > becomes rather tricky to disable ugly and work out whether the resulting
> > configuration can build. Companies interested in license compliance do
> > have a strong need to be able to do this.
> 
> Incidentally, there isn't actually (as far as I can tell) anything in
> the current -ugly recipe which would indicate to an ENTERPRISE_DISTRO
> that this recipe is potentially problematic.  Its LICENSE field just
> reads "GPLv2+ & LGPLv2.1+ & LGPLv2+", which might or might not be
> accurate, and it doesn't appear to have the self-skipping behaviour
> which the corresponding recipe in oe.dev does.

See conf/distro/include/default-distrovars.inc:

# This is a list of packages that require a commercial license to ship
# product. If shipped as part of an image these packages may have 
# implications so they are disabled by default
COMMERCIAL_LICENSE ?= "lame gst-fluendo-mp3 libmad mpeg2dec ffmpeg qmmp"
COMMERCIAL_AUDIO_PLUGINS ?= ""
# COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
COMMERCIAL_VIDEO_PLUGINS ?= ""
# COMMERCIAL_VIDEO_PLUGINS ?= "gst-plugins-ugly-mpeg2dec gst-plugins-ugly-mpegstream gst-plugins-bad-mpegvideoparse"
COMMERCIAL_QT ?= ""
# COMMERCIAL_QT ?= "qmmp"

I agree we should like have this kind of information indicated at the
recipe level though.

Cheers,

Richard



