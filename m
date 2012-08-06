Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyOLT-00016p-AD for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 16:31:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76EK2tX028492
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 15:20:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27818-04 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2012 15:19:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76EJsJl028480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 15:19:55 +0100
Message-ID: <1344262797.9756.165.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 15:19:57 +0100
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V3 00/11] Mesa upgrade/improvements
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
X-List-Received-Date: Mon, 06 Aug 2012 14:31:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-02 at 17:48 +0100, Ross Burton wrote:
> Re-arranged and fixed up some problems.
> 
> The following changes since commit 62d42fe3cfa575cb97b484ccf7b2e9a25cc50770:
> 
>   tiny-init: Setup /dev/ptmx in init (2012-08-01 23:11:18 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib ross/mesa
> 
> for you to fetch changes up to 5de29e150a720ccb8749362cfe5fb56f234fb385:
> 
>   mesa: enable EGL, with DRM and X11 platforms (2012-08-02 17:43:18 +0100)
> 
> ----------------------------------------------------------------
> Damien Lespiau (2):
>       mesa: Update to 8.0.4 (latest stable version)
>       mesa: Use 'require' instead of 'include'
> 
> Ross Burton (9):
>       mesa: no need to depend on python-native, the class does that
>       mesa: format the packages list nicely
>       mesa: move glu.pc to libglu-dev
>       mesa: add --enable-shared-glapi, and package it in libglapi
>       mesa: enable the Graphic Buffer Manager library

I've merged the above since I don't think these are the contentious
part.

>       mesa: enable GLES v1 and v2
>       mesa-demos: fix GLES2 build
>       mesa: respect x11 DISTRO_FEATURE
>       mesa: enable EGL, with DRM and X11 platforms

I've left these for now for more discussion.

Cheers,

Richard




