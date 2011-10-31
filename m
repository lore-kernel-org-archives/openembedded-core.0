Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RKpWw-0007kP-0O for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 11:55:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VAnj2u015451
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:49:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15079-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:49:41 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VAna7U015445
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:49:38 GMT
Message-ID: <1320058176.21800.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2011 10:49:36 +0000
In-Reply-To: <cover.1319844419.git.josh@linux.intel.com>
References: <cover.1319844419.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Misc patches
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
X-List-Received-Date: Mon, 31 Oct 2011 10:55:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-28 at 16:41 -0700, Joshua Lock wrote:
> A series of minor tweaks from my disk. The XFCE support in oe.terminal has
> only been tested on a Fedora machine so I would appreciate testing from XFCE
> users on other distros.
> 
> Regards,
> 
> Joshua
> 
> The following changes since commit ddc9a58b8553599d2328ac1c4449b41681ae45d1:
> 
>   Add readline as dependecy for gdb-cross-canadian (2011-10-27 08:37:53 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/work
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work
> 
> Joshua Lock (4):
>   lib/oe/terminal: add support for XFCE's terminal emulator
>   libxslt: Fix packaging of xsltConf.sh
>   libcanberra: add new package for unpackaged files
>   clutter-gtk: add LIC_FILES_CHKSUM to include file

I've merged these last three, Chris had some good feedback on the first
one.

Cheers,

Richard



