Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RWE7I-0007FY-Lw for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 22:24:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1LHcGX020292;
	Thu, 1 Dec 2011 21:17:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19509-06; Thu,  1 Dec 2011 21:17:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1LHUnJ020286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Dec 2011 21:17:31 GMT
Message-ID: <1322774259.14052.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 21:17:39 +0000
In-Reply-To: <20111201173429.GC4447@mail.familie-heinold.de>
References: <4EC24711.2010805@eukrea.com>
	<CAOd_LFzLRF3VvbQqrGekjtLSvfyXHQHeKyd=QcnAUFQpaGg8uA@mail.gmail.com>
	<1322743693.17484.120.camel@ted>
	<CAOd_LFwOiy9hR0M9FjRE5xRdN-HLwQUpMsWqiNKppr6QjvjzKw@mail.gmail.com>
	<4ED7A46E.2030603@emagii.com>
	<20111201173429.GC4447@mail.familie-heinold.de>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
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
X-List-Received-Date: Thu, 01 Dec 2011 21:24:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 18:34 +0100, Henning Heinold wrote:
> > #	source='libcg_ba.cpp' object='libcg_ba.o' libtool=no 
> > arm-angstrom-linux-gnueabi-g++  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fvisibility-inlines-hidden -c -o libcg_ba.o libcg_ba.cpp
> > libcg_ba.cpp:18:18: fatal error: string: No such file or directory
> > compilation terminated.
> that does not look like the BB_THREAD bug.  It is more the wrong c++ include dir bug, when --sysroot is not used.
> 
> Problem is in gcc-cross-configure.inc:
> 
> EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR_TARGET}${target_exec_prefix} \
>                       --with-gxx-include-dir=${target_includedir}/c++ \
> 
> which results in c++ defaultheadersearchdir "...../usr/bin/usr/include/c++" and so the the string c++ header is not found.

but in the above, --sysroot is clearly being specified?

I don't understand why it sometimes fails and sometimes does not :/

Cheers,

Richard




