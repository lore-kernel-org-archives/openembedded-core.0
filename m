Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 60F9C7201A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:43:10 +0000 (UTC)
Received: from [70.30.87.145] (port=49569 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Y8rpC-00067D-62 for openembedded-core@lists.openembedded.org;
	Wed, 07 Jan 2015 09:43:06 -0500
Date: Wed, 7 Jan 2015 09:43:04 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1501070930210.16973@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: making a list of the *fundamental* variables used by image.bbclass
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
X-List-Received-Date: Wed, 07 Jan 2015 14:43:12 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  for class purposes, i want to make a *short* list of the really
fundamental variables used to define the final content of an image as
used by image.bbclass, and i want to know if there's anything i've
missed from this list.

  first, the obvious ones:

  * IMAGE_FEATURES (image features, processed by image.bbclass)
  * IMAGE_INSTALL (names of individual packages)

as i read it, those two variables pretty much define the final content
of the image. i *don't* include things like EXTRA_IMAGE_FEATURES as
that variable is already processed by bitbake.conf before image
processing starts; that is, image.bbclass makes no reference to that
variable, so it's not relevant here.

  other variables that make a smaller difference but still processed
by image.bbclass:

  * ROOTFS_PKGMANAGE
  * SPLASH

  there are also all those *_PROCESS_COMMAND variables (preprocess,
postprocess), but i haven't checked yet which of those are simply
processed within image.bbclass based on the contents of
IMAGE_FEATURES, or possibly something else.

  ah, here's another one:

  * DISTRO_FEATURES

which is tested for processing of systemd/sysvinit. (for similar
reasons, MACHINE_FEATURES is not listed here as all of its processing
is done outside the file.)

  i'm still perusing the file but are there any variables i've
overlooked that are treated as *input* to image.bbclass that control
the final image content? (i'm also ignoring things like fstype-related
variables, not interested in the *format* of the final image, just the
content.)

  so what have i missed?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

