Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q4WQf-0008Uu-Nv for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 12:45:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2TAhieK018683;
	Tue, 29 Mar 2011 11:43:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18643-01; Tue, 29 Mar 2011 11:43:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2TAhZvb018677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Mar 2011 11:43:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <c9789f2d0873c6b8ff2ae3a7b338b72527cfbf02.1301388474.git.dexuan.cui@intel.com>
References: <cover.1301388474.git.dexuan.cui@intel.com>
	<c9789f2d0873c6b8ff2ae3a7b338b72527cfbf02.1301388474.git.dexuan.cui@intel.com>
Date: Tue, 29 Mar 2011 11:43:30 +0100
Message-ID: <1301395410.24596.22.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 1/1] qt4: remove the option -feliminate-dwarf2-dups to fix the build
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
X-List-Received-Date: Tue, 29 Mar 2011 10:45:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-29 at 16:52 +0800, Dexuan Cui wrote:
> From: Dexuan Cui <dexuan.cui@intel.com>
> 
> [YOCTO #932]
> 
> After commit 5ea06dc295b657383fd97545c15255b294cf1a79(bitbake.conf: Prune
> global OPTIMIZATION flags) that adds an option -feliminate-dwarf2-dups,
> gcc 4.5 reports such an internal compiler error when building Qt4 if the
> option is used:
> 
> | graphicsview/qgridlayoutengine.cpp:1553:1: internal compiler error: in build_abbrev_table, at dwarf2out.c:9806
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> | See <http://gcc.gnu.org/bugs.html> for instructions.
> 
> This is a gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47361
> 
> At present we can remove the option as a workaround.
> 
> Thanks Robert Berger for reporting the bug and his investigation in gcc
> bugzilla and thanks Khem Raj for the quick suggestion about removing
> the option.

How about we add the patch for this issue:

http://gcc.gnu.org/ml/gcc-patches/2011-01/msg01647.html

?

Cheers,

Richard



