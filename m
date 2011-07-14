Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhMX7-0005VX-GN for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 16:04:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EE0swv008039
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:00:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07232-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:00:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EE0lqW008033
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:00:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310583292.git.tom_rini@mentor.com>
References: <cover.1310583292.git.tom_rini@mentor.com>
Date: Thu, 14 Jul 2011 15:00:43 +0100
Message-ID: <1310652043.20015.1150.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Misc updates
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
X-List-Received-Date: Thu, 14 Jul 2011 14:04:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 12:05 -0700, Tom Rini wrote:
> Hey all,
> 
> This is the first of two pull requests.  As part of updating siteinfo.bbclass
> I did a world build (qemux86) before and after the changes and diff'd the
> config.log files.  That showed two classes of problems, both fixed in this
> series.  The first is a checksum mismatch and an invalid SRC_URI.  The second
> is some implicit DEPENDS in recipes.
> 
> The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
>   Saul Wold (1):
>         libx11: ensure nativesdk uses correct DEPENDS and XCB flags
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib trini/misc
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/misc
> 
> Tom Rini (4):
>   libsamplerate0: Update checksums
>   hicolor-icon-theme: Use ${BPN}-${PV} not ${P} to unbreak nativesdk
>   groff: Disable x11 support
>   libpcre: Add bzip2, zlib and readline to DEPENDS

I merged the last three and ignored the first as discussed.

Cheers,

Richard



