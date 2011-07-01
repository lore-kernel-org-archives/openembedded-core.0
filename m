Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QccK6-0003bW-KT
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 13:55:50 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Fri, 1 Jul 2011
	13:52:05 +0200
From: Anders Darander <anders@chargestorm.se>
Organization: ChargeStorm AB
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 13:52:08 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.39-2-amd64; KDE/4.6.4; x86_64; ; )
References: <cover.1309503939.git.anders@chargestorm.se>
	<cf740fbc1c5f26487e14e8959cfc13f085ff95ff.1309503939.git.anders@chargestorm.se>
	<D041C15B-428E-432D-996B-EF7356B38E29@dominion.thruhere.net>
In-Reply-To: <D041C15B-428E-432D-996B-EF7356B38E29@dominion.thruhere.net>
MIME-Version: 1.0
Message-ID: <201107011352.08558.anders@chargestorm.se>
Subject: Re: [PATCH v4 7/8] task-base: remove modutils reference.
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
X-List-Received-Date: Fri, 01 Jul 2011 11:55:50 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit


* Koen Kooi Koen Kooi <koen@dominion.thruhere.net> [07/01/11 09:20 AM]:
> Op 1 jul 2011, om 09:06 heeft Anders Darander het volgende geschreven:
> > Also remove the other kernel24 references.
> > Make everything dependent on kernel26 default.
> 
> Since there will be only one of each, can we just completely scrap there
> variables and put the items directly in the tasks?

Sure, we could do that.

One question though, how should I treat 

RRECOMMENDS_task-base-kernel26 = "\
    kernel-module-nls-utf8 \
    kernel-module-input \
    kernel-module-uinput \
    kernel-module-rtc-dev \
    kernel-module-rtc-proc \
    kernel-module-rtc-sysfs \
    kernel-module-rtc-sa1100 \
    kernel-module-unix"

from task-base.bb? Should that part just be new, general
RRECOMMENDS = "\
    kernel-module-nls-utf8 \
    kernel-module-input \
    kernel-module-uinput \
    kernel-module-rtc-dev \
    kernel-module-rtc-proc \
    kernel-module-rtc-sysfs \
    kernel-module-rtc-sa1100 \
    kernel-module-unix"?

I guess that's the right thing, and I'll create a new pull request with that 
merged into the last patch.

Regards,
Anders

-- 
Anders Darander
ChargeStorm AB		T




