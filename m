Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsdMA-0006ws-0q for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 18:52:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r08HbglT023404;
	Tue, 8 Jan 2013 17:37:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04131-10; Tue,  8 Jan 2013 17:37:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r08HbZY7023398
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 8 Jan 2013 17:37:36 GMT
Message-ID: <1357666658.13022.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Tue, 08 Jan 2013 17:37:38 +0000
In-Reply-To: <CAOHjBZuDiLmweStxyu3ghH-WMz6S-TO+R7qDurnrvXHw9x4qvg@mail.gmail.com>
References: <CAOHjBZuDiLmweStxyu3ghH-WMz6S-TO+R7qDurnrvXHw9x4qvg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain build for uclibc, possible issue?
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
X-List-Received-Date: Tue, 08 Jan 2013 17:53:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-01-08 at 16:12 +0100, Giuseppe Condorelli wrote:
> Hi All,
>  
> gcc-runtime nativesdk is failing due to the lack of libm.
> I want to build meta-toolchain for uclibc, I mean obtaining the cross
> compiler for these flavour, so libm should be
> provided by the uclibc. But repository doesn't build any uclibc for
> nativesdk, (it builds eglibc by default).
> I'm in trouble to understand this, where is the answer I'm not
> understanding?
>  
> Please can you help me?

What are you trying to build *exactly*?

Do you want a toolchain that contains a compiler and uclibc for the
target you're cross compiling for?

or do you want the toolchain itself to use uclibc instead of glibc as
well as whatever the target uses?

The options would be:

a) Uclibc based toolchain, glibc target system
b) Uclibc based toolchain, uclibc target system
c) glibc based toolchain, uclibc target system
d) glibc based toolchain, glibc target system

We only support c/d and only those combinations are known to work.

Its important to differentiate between the C library the cross compiler
links against compared to the C library the ultimate target system uses.

Cheers,

Richard





