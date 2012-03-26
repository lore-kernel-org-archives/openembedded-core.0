Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC7hz-00015L-Iv for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:03:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QAsXdG024457
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 11:54:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20450-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 11:54:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QAsN6u024451
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 11:54:24 +0100
Message-ID: <1332759263.28414.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 11:54:23 +0100
In-Reply-To: <4665123dfd2c3d3011c628f4fec1b5a2118bf579.1332744516.git.liezhi.yang@windriver.com>
References: <cover.1332744516.git.liezhi.yang@windriver.com>
	<4665123dfd2c3d3011c628f4fec1b5a2118bf579.1332744516.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] qemu: add fedora pkg names when build failed
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
X-List-Received-Date: Mon, 26 Mar 2012 11:03:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-26 at 14:49 +0800, Robert Yang wrote:
> When qemu build failed, we can see such messages:
> 
> You need libGL.so and libGLU.so to exist in your library path and the
> development headers for SDL installed to build qemu-native.
> 
> Ubuntu package names are: libgl1-mesa-dev, libglu1-mesa-dev and
> libsdl1.2-dev
> 
> These pkgs have different names on Fedora distributions, and Fedora is
> one the
> main linux distributions, so add Fedora package names.
> 
> The following Fedora versions have these pkgs:
> 	Fedora 9 64bit
> 	Fedora 13 32bit
> 	Fedora 13 64bit
> 	Fedora 16 64bit
> 
> [YOCTO #2174]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc |    3 ++-
>  scripts/runqemu                     |    3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



