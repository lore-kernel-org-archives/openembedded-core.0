Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R3VfO-0001Zw-4f for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 18:16:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8DGHqW3028459 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:17:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2QXxuxgp79XZ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:17:52 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8DGHkJv028439
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:17:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 17:11:36 +0100
In-Reply-To: <372fffc4e289f88388de55665b1c5d766b956b37.1315920580.git.dexuan.cui@intel.com>
References: <cover.1315920580.git.dexuan.cui@intel.com>
	<372fffc4e289f88388de55665b1c5d766b956b37.1315920580.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1315930304.13526.2.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] dpkg: fix pkg_postinst_dpkg, don't supply {bindir}/update-alternatives
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
X-List-Received-Date: Tue, 13 Sep 2011 16:16:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 21:30 +0800, Dexuan Cui wrote:
> [YOCTO #1070].
> 
> The pkg_postinst_dpkg seems buggy, e.g., for dpkg-native,
> ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d doesn't exist.
> I think OE's version(do_install_prepend) at
> http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/dpkg/dpkg.inc
> is correct, so let's change to OE's version.
> 
> And, bth dpkg and update-alternatives-cworth supply
> /usr/bin/update-alternatives and this causes conflict. e.g., bug 1070.
> We can resolve the issue by ask dpkg not to supply the binary.
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  meta/recipes-devtools/dpkg/dpkg.inc         |   19 ++++++++-----------
>  meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb |    2 +-
>  2 files changed, 9 insertions(+), 12 deletions(-)

Merged to master, thanks.

Richard



