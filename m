Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6aoM-0004hM-6t for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 06:22:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M4NrDd020782 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:23:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v+WpDnvWATd9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:23:53 +0100 (BST)
Received: from [10.251.10.153] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M4Ni27020778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:23:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 05:17:23 +0100
In-Reply-To: <cover.1316655855.git.mark.hatle@windriver.com>
References: <cover.1316655855.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316665056.13622.9.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/6] Fix core-image-lsb dependencies
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
X-List-Received-Date: Thu, 22 Sep 2011 04:22:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-21 at 20:46 -0500, Mark Hatle wrote:
> Fix additional dependencies found while building core-image-lsb.  Most of
> the issues are related to simple errors in the recipes or PAM integration
> problems.
> 
> The following changes since commit 40b52d9ed9b7b39bc86b3c87ae60fa6359cac265:
> 
>   distro tracking: Update Distro Aliases (2011-09-22 01:30:00 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/rpm
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm
> 
> Mark Hatle (6):
>   python: Fix cgi.py runtime issue
>   usbutils: Move the pkgconfig file(s) to the -dev package
>   foomatic-filters: Disable filter checking
>   perl: Fix a few perl binaries to use target interpreter paths
>   sudo: Fix PAM dependencies
>   task-core-lsb: Remove perl-dev

Merged to master except for the foomatic one which needs some tweaks.

Cheers,

Richard



