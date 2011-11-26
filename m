Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RUFP9-0004vN-6r for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 11:22:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAQAG9sI012337
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2011 10:16:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08413-10 for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2011 10:16:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAQAG1qF012331
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2011 10:16:03 GMT
Message-ID: <1322302567.25382.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 26 Nov 2011 10:16:07 +0000
In-Reply-To: <CAMKF1sqynERGyJ_1AGVkqjvEwswoC1w6BuEVJyuKiX=HMmMzhA@mail.gmail.com>
References: <1322233577.22654.0.camel@ted>
	<CAMKF1sqynERGyJ_1AGVkqjvEwswoC1w6BuEVJyuKiX=HMmMzhA@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] ghostscript-native: Ensure the sys/time/h fix is applied for native builds
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
X-List-Received-Date: Sat, 26 Nov 2011 10:22:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-25 at 18:39 -0800, Khem Raj wrote:
> On Fri, Nov 25, 2011 at 7:06 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On my system, the sys/time.h header is in a subdir off /usr/include
> > which causes a build failure. Apply the target CFLAGS fix to native
> > builds as well to address this.
> 
> hmmm I thought CFLAGS would be automtically translated with
> BBCLASSEXTEND = "native"

For native recipes, CFLAGS is replaced by BUILD_CFLAGS...

Cheers,

Richard



