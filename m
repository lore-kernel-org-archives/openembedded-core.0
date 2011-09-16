Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4WP5-0000Jw-Sg for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 13:16:20 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GBHBvf012396 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 12:17:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6pLDVN8insAN
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 12:17:11 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GBH5dI012389
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 12:17:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 12:10:52 +0100
In-Reply-To: <cover.1316139554.git.sgw@linux.intel.com>
References: <cover.1316139554.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316171461.25993.73.camel@ted>
Mime-Version: 1.0
Subject: Re: [RC2 FIXES 0/6] Some fixes for RC2
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
X-List-Received-Date: Fri, 16 Sep 2011 11:16:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-15 at 19:20 -0700, Saul Wold wrote:
> Richard,
> 
> This request has some fixes from the team for issues found
> today, alone with a distro-tracking update.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit f7f129b60d33e2758a3a9cc66a98251e1325664d:
> 
>   liboil-0.3.17: add upstream Fix-enable-vfp-flag patch (2011-09-15 23:09:26 +0100)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib sgw/oe-rc2
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-rc2
> 
> Dexuan Cui (1):
>   distro-tracking: Update package alias
> 
> Saul Wold (1):
>   web: Fix SRVREV due to lost commit in web-sato
> 
> Tom Zanussi (4):
>   liberation-fonts_1.04: add PN to RDEPENDS
>   liberation-fonts_1.06: add PN to RDEPENDS
>   ttf-bitstream-vera_1.10: add PN to RDEPENDS
>   grub_1.99: add PN to RDEPENDS

Merged to master with the fixes Koen mentioned were needed made.

Cheers,

Richard



