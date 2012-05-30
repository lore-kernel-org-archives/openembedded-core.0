Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZm76-0005pq-Ud for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:51:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGes6A023485
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:40:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23393-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:40:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGejPe023479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:40:46 +0100
Message-ID: <1338396045.20169.162.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 17:40:45 +0100
In-Reply-To: <2255c64e0eb4a2b5b7f063dbc5ff421e606458c8.1338368508.git.edwin.zhai@intel.com>
References: <cover.1338368508.git.edwin.zhai@intel.com>
	<2255c64e0eb4a2b5b7f063dbc5ff421e606458c8.1338368508.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] webkit-gtk: Use glib as unicode backend to avoid browser crash
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
X-List-Received-Date: Wed, 30 May 2012 16:51:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-30 at 17:08 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> webkit-gtk depends on ICU for the unicode, but ICU is not safe when build and
> target system owns different endian. ICU's community is not responsive to make
> a patch for this, so glib is used as work around here.
> 
> [YOCTO #1570] got fixed
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  meta/recipes-sato/webkit/webkit-gtk_svn.bb |   10 +++++++++-
>  1 files changed, 9 insertions(+), 1 deletions(-)

I've merged this however I'm not 100% happy with this as the final fix.
I'd ask that:

a) The bug remains open (re-prioritised appropriately) about the
remaining issues that still exist in ICU
b) We add something to the ICU recipe which stops it building when the
endianess isn't correct (host matches target) so nobody can built it and
have it not work.

Cheers,

Richard



