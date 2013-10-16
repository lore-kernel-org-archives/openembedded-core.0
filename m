Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BE41E6CBAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 13:58:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9GDwe36000657; Wed, 16 Oct 2013 14:58:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Dxkuouy5oX9C; Wed, 16 Oct 2013 14:58:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9GDwbXG000647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 16 Oct 2013 14:58:38 +0100
Message-ID: <1381931913.29912.466.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 16 Oct 2013 14:58:33 +0100
In-Reply-To: <2444253.vL4HTbpqxr@helios>
References: <2444253.vL4HTbpqxr@helios>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: Using formfactor data in other recipes
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
X-List-Received-Date: Wed, 16 Oct 2013 13:58:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-10-16 at 14:50 +0100, Paul Eggleton wrote:
> Hi all,
> 
> Andrea has been doing some cleanup on meta-handheld, and he and I have come 
> across what seems to be a bit of a shortcoming with formfactor over the 
> variable-based alternative that was used in OE-Classic (MACHINE_GUI_CLASS, 
> MACHINE_DISPLAY_WIDTH_PIXELS, MACHINE_DISPLAY_HEIGHT_PIXELS etc.). In 
> meta-opie, the latter variables are still being used in a machine-specific 
> packagegroup recipe to select the appropriate set of pixmaps to be installed 
> for each machine based on the screen resolution, so you don't have to have 
> pixmaps installed that you're never going to use (which would waste storage 
> space).
> 
> formfactor is the current method supported in OE-Core for representing 
> differences in machine display/input characteristics, however it seems only 
> queryable at runtime since its files are not written into the sysroot. We could 
> change it to stage to the sysroot, and therefore the data could be queried at 
> least at packaging time in other recipes that depend on formfactor. Does this 
> sound like a reasonable solution for this kind of problem, or is there a 
> better solution?

Seems reasonable. We tend not to install some things to the sysroot as
they're pointless (e.g. man pages or a lot of etc data) but in this case
it would make sense to override the defaults as its information we can
use.

Cheers,

Richard


