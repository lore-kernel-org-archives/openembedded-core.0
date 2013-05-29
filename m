Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id D38956A44D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:00:02 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6DC714B01CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 09:59:58 +0200 (CEST)
Date: Wed, 29 May 2013 09:59:56 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130529095956.3cd5dbd8@e6520eb>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.18; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: update_icon_cache host access
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
X-List-Received-Date: Wed, 29 May 2013 08:00:04 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

while building an image I got :

Running intercept scripts:
> Executing update_font_cache
> Executing update_icon_cache
Failed to create file
'/usr/lib/i386-linux-gnu/gdk-2.0/2.10.0/loaders.cache.K0FPXW':
Permission denied

apt-get remove libgdk-pixbuf2.0-0
workaround the problem in the present case but it seems that if
gdk-pixbuf is present on the host, it will be used instead of the one
built by OE.

Build Configuration:
BB_VERSION        = "1.18.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "arm-oe-linux-gnueabi"
DISTRO            = "defaultsetup"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"

Eric

