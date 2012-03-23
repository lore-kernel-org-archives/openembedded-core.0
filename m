Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB3MV-0000UM-Ay for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:12:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NC40FQ026297
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:04:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25941-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:03:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NC3qHt026291
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:03:53 GMT
Message-ID: <1332504235.9740.392.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 12:03:55 +0000
In-Reply-To: <cover.1332474081.git.lianhao.lu@intel.com>
References: <cover.1332474081.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] Fixed packaging warnings
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
X-List-Received-Date: Fri, 23 Mar 2012 12:12:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 12:31 +0800, Lianhao Lu wrote:
> This patch set fixed misc packaging warnings.
> 
> The following changes since commit b92aaf764e6de94fb9fdee610e8f6643ccf74894:
>   Richard Purdie (1):
>         gst-plugins-bluetooth: Don't install headers, man pages or .pc files
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib llu/warningfix2
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/warningfix2
> 
> Lianhao Lu (5):
>   pseudo: package the var/pseudo directory.
>   gdb-cross-canadian: not shipping libiberty.
>   ncurses: ship clear/reset in package.
>   nativesdk/misc: set PKGSUFFIX for correct variable name expansion.
>   libgcc: corrected -nativesdk package namings.

Merged to master, thanks!

Richard



