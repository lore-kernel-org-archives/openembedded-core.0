Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Px1tZ-00086I-Oh for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 19:44:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p28IgxPg023071
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Mar 2011 18:42:59 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22511-09 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2011 18:42:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p28IgjlQ023065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Mar 2011 18:42:50 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4D742B3C.9070601@mentor.com>
References: <cover.1299431945.git.sgw@linux.intel.com>
	<c6b0c5720fa0fc2ba7a6792b7f52faad38dd47dc.1299431945.git.sgw@linux.intel.com>
	<EC897C7E-B45E-415F-A788-9F160A0A60E8@dominion.thruhere.net>
	<4D742B3C.9070601@mentor.com>
Date: Tue, 08 Mar 2011 10:42:42 -0800
Message-ID: <1299609762.602.85.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [poky] [PATCH 1/2] gst-plugins: Added hal to DEPENDS
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
X-List-Received-Date: Tue, 08 Mar 2011 18:44:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-03-06 at 17:47 -0700, Tom Rini wrote:
> On 03/06/2011 11:34 AM, Koen Kooi wrote:
> >
> > Op 6 mrt 2011, om 18:19 heeft Saul Wold het volgende geschreven:
> >
> >> From: Saul Wold<sgw@linux.intel.com>
> >>
> >> Fixes [YOCTO #810]
> >>
> >> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> >> ---
> >> meta/recipes-multimedia/gstreamer/gst-plugins.inc |    2 +-
> >> 1 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> >> index 4edca95..d1abd36 100644
> >> --- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> >> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> >> @@ -3,7 +3,7 @@ HOMEPAGE = "http://gstreamer.freedesktop.org/"
> >> BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
> >> SECTION = "multimedia"
> >> PRIORITY = "optional"
> >> -DEPENDS = "gstreamer"
> >> +DEPENDS = "gstreamer hal"
> >
> > Since hal is being deprecated in favour of udev, do we really want to introduce it as a dependency instead of disabled it?
> 
> ... and making sure the new set of magic works right.

I'm going to merge Saul's patch. I'd take a patch to remove the
dependency if someone can write one and confirm it works though.

Cheers,

Richard



