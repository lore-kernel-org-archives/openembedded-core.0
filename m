Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RpkbG-0000Zp-Nx for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:56:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OHmLJj031323
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:48:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31074-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:48:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OHmEov031317
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:48:15 GMT
Message-ID: <1327427295.19643.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2012 17:48:15 +0000
In-Reply-To: <CAGiJk9dnE5PNX68AO8gXH+VseMS4LFG=1Bq+cQMekSgrVo1aXw@mail.gmail.com>
References: <CAGiJk9dnE5PNX68AO8gXH+VseMS4LFG=1Bq+cQMekSgrVo1aXw@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: CMake error? CMAKE_AR-NOTFOUND
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
X-List-Received-Date: Tue, 24 Jan 2012 17:56:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-24 at 14:30 +0100, Samuel Stirtzel wrote:
> Hi,
> currently I try to build a native software that needs CMake, it is a
> required tool to cross compile another software.
> An it seems that CMAKE_AR is set to an invalid value (CMAKE_AR-NOTFOUND).
> The cmake.bbclass has no entry about this.
> 
> By searching the web, the only information found was that it can be
> set to ${GCC_PATH}/dld.
> As I am usually not working with CMake where can I find the native
> "ar" or "dld" executable in OpenEmbedded?
> 
> Using the archiver from my hosts /usr/bin/ar seems to be wrong since
> in cmake.bbclass "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )"
> prohibits it.

In the same way the class figures out OECMAKE_C_COMPILER from ${CC}, you
probably need to figure out ar from ${AR} and pass it to the cmake
configuration.

Note I know very little about cmake so I'm of less help with that
piece ;-).

Cheers,

Richard



