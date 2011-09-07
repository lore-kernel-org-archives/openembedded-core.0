Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1Qog-0002Nf-T3 for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 00:41:59 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87MgrEu030405 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:42:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vzQ478BdQADC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 23:42:53 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87Mgog7030400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:42:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
Date: Wed, 07 Sep 2011 23:36:48 +0100
Message-ID: <1315435008.13021.51.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [CONSOLIDATED PULL 0/5] Collection of patches
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
X-List-Received-Date: Wed, 07 Sep 2011 22:41:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-06 at 10:26 -0700, Saul Wold wrote:
> Richard,
> 
> This is a collection of patches that have been sitting around,
> and unless I missed some comments should be good to go.
> 
> I bumped gettext's PR in this request.
> 
> Sau!
> 
> 
> The following changes since commit 41b7c955cfdc7b4d5c667c8a8742237d5edaca4f:
> 
>   icu-3.6: fix building with big make -j (2011-09-05 20:38:50 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Denis Carikli (1):
>   mtd-utils: update to version to 1.4.6
> 
> Kumar Gala (1):
>   scripts/oe-buildenv-internal: Add SOCKS5_{USER, PASSWD} to
>     BB_ENV_EXTRAWHITE
> 
> Phil Blundell (1):
>   pango: use qemu to generate pango.modules during rootfs construction
> 
> Saul Wold (2):
>   gettext: use included libxml and libcroco
>   web: Update SRCREV to address ccs_parser_parse_stylesheet arg
>     mismatch

Merged to master with the exception of Kumar's change which I've
followed up with in the original thread.

Cheers,

Richard



