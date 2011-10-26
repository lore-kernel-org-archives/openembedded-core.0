Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJA84-0004RM-Ex for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:31:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9QKPCUF020876;
	Wed, 26 Oct 2011 21:25:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20379-05; Wed, 26 Oct 2011 21:25:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9QKP4rR020854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 26 Oct 2011 21:25:04 +0100
Message-ID: <1319660702.9583.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 26 Oct 2011 21:25:02 +0100
In-Reply-To: <0ec24ded3f71c54e544d953de65d142717f48022.1319652972.git.bruce.ashfield@windriver.com>
References: <cover.1319652972.git.bruce.ashfield@windriver.com>
	<0ec24ded3f71c54e544d953de65d142717f48022.1319652972.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] linux-libc-headers: provide 3.0.x and 3.1 headers
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
X-List-Received-Date: Wed, 26 Oct 2011 20:31:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-26 at 14:25 -0400, Bruce Ashfield wrote:
> This changes makes two different 3.x headers available to the
> toolchain. The latest 3.0.x and 3.1 tarballs. Compatibility is
> maintained with older 2.6 headers by creating a new variable
> that changes the SRC_URI based on the major version number of
> the kernel.
> 
> Tested with 2.6.37.2, 3.0.8 and 3.1 builds and boots.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  .../linux-libc-headers/linux-libc-headers.inc      |   15 +++++-
>  .../linux-libc-headers/linux-libc-headers_3.0.8.bb |   53 ++++++++++++++++++++
>  .../linux-libc-headers/linux-libc-headers_3.1.bb   |   53 ++++++++++++++++++++
>  4 files changed, 120 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb

Can someone please explain to me why we don't move some of the bits in
the .bb file into the .inc rather than duplicating it each time?

Cheers,

Richard



