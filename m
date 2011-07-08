Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfD3e-0001jx-2a for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:33:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FTgEd021308
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:29:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20388-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 16:29:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FTbc6021302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:29:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4ed38d13d68e132c90e0c41cb9584c414334e01c.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<4ed38d13d68e132c90e0c41cb9584c414334e01c.1310132765.git.otavio@ossystems.com.br>
Date: Fri, 08 Jul 2011 16:28:59 +0100
Message-ID: <1310138939.20015.883.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 6/8] cmake: add nativesdk and target versions
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
X-List-Received-Date: Fri, 08 Jul 2011 15:33:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 13:47 +0000, Otavio Salvador wrote:
> Adds a recipe that provides the nativesdk and target versions of
> CMake.
> 
> This recipe is based on code from OpenEmbeeded (rev
> b1f2e1501c19540617a829b37415c0616101c7ad).
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
[...]

> +# FIXME: Hack due gcc-crosssdk not being able to detect those automatically
> +CXXFLAGS_virtclass-nativesdk += " \
> +   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++ \
> +   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++/${TARGET_SYS} \
> +   "

I get worried when I see things like this :(

Has anyone attempted to work out why gcc-crosssdk can't locate c++
include files?

Cheers,

Richard



