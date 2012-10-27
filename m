Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TS24H-0004sz-A9 for openembedded-core@lists.openembedded.org;
	Sat, 27 Oct 2012 10:48:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9R8YxDe005768;
	Sat, 27 Oct 2012 09:34:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04807-01; Sat, 27 Oct 2012 09:34:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9R8Ypx8005762
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 27 Oct 2012 09:34:53 +0100
Message-ID: <1351326891.22340.214.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Sat, 27 Oct 2012 09:34:51 +0100
In-Reply-To: <cover.1351268391.git.sgw@linux.intel.com>
References: <cover.1351268391.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Consolidated Pull 00/13] SDK and misc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Oct 2012 08:48:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-10-26 at 09:22 -0700, Saul Wold wrote:
> Richard,
> 
> Built and reviewed.
> 
> Sau!
> 
> 
> The following changes since commit 88b4ec0b8c7c75b8570fc201c705937b459bb43e:
> 
>   zeroconf: remove (2012-10-26 14:11:55 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Mark Hatle (4):
>   multilib: Add support for cross-canadian multilib packages
>   multilib - crosssdk: Stop building multilib for crosssdk packages
>   populate_sdk_base: Update extraction script for multilibs
>   populate_sdk_base: Ensure that the multilib cross-canadian tools are
>     used
> 
> Peter Seebach (1):
>   insane.bbclass and friends: Fix sanity checks and multlib headers for
>     n32
> 
> Ross Burton (4):
>   pulseaudio: add GConf dependency
>   pulseaudio: move helper binaries into the relevant module packages
>   pulseaudio: fix library packaging
>   pulseaudio: remove libpulse-browse, removed upstream in 2011
> 
> Saul Wold (3):
>   gst-meta-base: include ximagesink plugin when x11 is a feature
>   sstate: add manifest info for shared file matches
>   ltp: add perl to RDEPENDS
> 
> Thomas Kristensen (1):
>   populate_sdk_base.bbclass: Make it possible to overrise the
>     create_shar method of populate_sdk_base.

I've merged these but this last patch had the wrong header on it, it
should be "SDK: allow SDK path of various level". I found the correct
version and applied that instead.

Cheers,

Richard




