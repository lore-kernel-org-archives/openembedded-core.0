Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGnU2-0000Rf-4o for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 11:00:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8Q8lpO9016691;
	Wed, 26 Sep 2012 09:47:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16144-01; Wed, 26 Sep 2012 09:47:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8Q8leks016685
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 26 Sep 2012 09:47:42 +0100
Message-ID: <1348649261.8662.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <jslater@windriver.com>
Date: Wed, 26 Sep 2012 09:47:41 +0100
In-Reply-To: <1348609047-4118-1-git-send-email-jslater@windriver.com>
References: <1348609047-4118-1-git-send-email-jslater@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake.bbclass: modify construction of compiler flags
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 09:00:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-25 at 14:37 -0700, Joe Slater wrote:
> Use CFLAGS instead of CPPFLAGS for C_FLAGS variants.
> Also remove duplicate flags from _RELEASE variants.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> 
> *** Note - this can break things that have never really
> ***        been compiled with -O2 optimization

This change says what you're doing but not really why. How are things
broken and why is this an improvement?

Cheers,

Richard

> ---
>  meta/classes/cmake.bbclass |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index dcd974a..ac5c048 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -19,10 +19,10 @@ OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
>  OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
>  
>  # Compiler flags
> -OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS}"
> +OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
>  OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} -fpermissive"
> -OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CPPFLAGS} -DNDEBUG"
> -OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CXXFLAGS} -DNDEBUG"
> +OECMAKE_C_FLAGS_RELEASE ?= "${CFLAGS} -DNDEBUG"
> +OECMAKE_CXX_FLAGS_RELEASE ?= "${CXXFLAGS} -DNDEBUG"
>  
>  OECMAKE_RPATH ?= ""
>  OECMAKE_PERLNATIVE_DIR ??= ""




