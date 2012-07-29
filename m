Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SvQ3r-0002QR-Vn for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 11:45:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9XkTG027043
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:33:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26918-05 for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:33:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9XTlJ027037
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:33:35 +0100
Message-ID: <1343554409.16998.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 29 Jul 2012 10:33:29 +0100
In-Reply-To: <cover.1343256969.git.paul.eggleton@linux.intel.com>
References: <cover.1343256969.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] rootfs generation improvements v4
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
X-List-Received-Date: Sun, 29 Jul 2012 09:45:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 00:03 +0100, Paul Eggleton wrote:
> Fix up handling of "complementary" package installation (dev, dbg, doc,
> etc.) and introduce a staticdev-pkgs IMAGE_FEATURES feature.
> 
> Changes since the brown paper bag patchset that was v3:
> 
> * Remove bogus clearing of IMAGE_FEATURES in core-image-minimal
> * Fix broken fix for errors with the ipk and deb backends if no
>   complementary packages need to be installed that prevented it from
>   actually installing anything (!)
> 
> 
> The following changes since commit 4148bc80c008d25c8a536c7c7dfdeac1669a6662:
> 
>   libgcc: Add missing dependency on libc:do_package (2012-07-24 10:12:08 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib paule/rootfs2
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rootfs2
> 
> Andrei Gherzan (1):
>   package.bbclass: Create symlinks for packages with different packaged
>     name
> 
> Paul Eggleton (5):
>   classes/rootfs_rpm: improve speed of RPM rootfs construction
>   classes/package_deb: add PackageArch field
>   Rework installation of dev, dbg, doc, and locale packages
>   classes/image: add staticdev-pkgs IMAGE_FEATURES feature
>   buildhistory: improve performance of image info collection

Merged to master, thanks.

Richard



