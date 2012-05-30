Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZhjM-0003u7-AO for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:10:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC06Xh021761;
	Wed, 30 May 2012 13:00:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21338-03; Wed, 30 May 2012 13:00:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UBxw0O021740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 May 2012 12:59:59 +0100
Message-ID: <1338379197.20169.130.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 12:59:57 +0100
In-Reply-To: <cover.1338302685.git.liezhi.yang@windriver.com>
References: <cover.1338302685.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/4] replace os.system/popen with subprocess module
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
X-List-Received-Date: Wed, 30 May 2012 12:10:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-29 at 22:53 +0800, Robert Yang wrote:
> These patches are based on oe-core.
> 
> * Testinfo
>   1) $ bitbake core-image-sato core-image-sato-sdk metatoolchain-sdk with
>         MACHINE=qemuarm, PACKAGE_CLASSES = "package_rpm"
> 
>   2) $ bitbake core-image-sato core-image-sato-sdk metatoolchain-sdk with
>         MACHINE=qemuarm, PACKAGE_CLASSES = "package_ipk"
> 
>   3) $ bitbake core-image-sato with MACHINE=qemux86, PACKAGE_CLASSES = "package_deb"
> 
>   4) $ bitbake world with MACHINE=qemux86
> 
> // Robert
> 
> The following changes since commit a7532d6b2870a51079c39366def9ae55faeba626:
> 
>   rootfs_rpm.bbclass: save rpmlib rather than remove it (2012-05-29 22:36:39 +0800)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib robert/meta_subprocess
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/meta_subprocess
> 
> Robert Yang (4):
>   meta: replace os.system with subprocess.call
>   scripts: replace os.system with subprocess.call
>   meta: replace os.popen with subprocess.Popen

I took the first three of these, thanks.

>   scripts: replace os.popen with subprocess.Popen

As Chris says, we may as well use an unlink call for this case.

Cheers,

Richard



