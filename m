Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ULLkm-0003YU-QY for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 23:57:19 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2SMnkkw019318; Thu, 28 Mar 2013 22:49:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rtbgpp5mTi9U; Thu, 28 Mar 2013 22:49:46 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2SMnf6d019311
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 28 Mar 2013 22:49:44 GMT
Message-ID: <1364510372.28471.175.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Mar 2013 22:39:32 +0000
In-Reply-To: <CADkTA4Ozv+O+tfvSfbBCq7qzRQWNgVGH4r24W6U=nSLQgb-Pcw@mail.gmail.com>
References: <007BD92917A2324FA403BCF9A464CF8436F7FAD6@ALA-MBB.corp.ad.wrs.com>
	<CADkTA4Ozv+O+tfvSfbBCq7qzRQWNgVGH4r24W6U=nSLQgb-Pcw@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: QEMU_UI_OPTIONS
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
X-List-Received-Date: Thu, 28 Mar 2013 22:57:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-28 at 16:53 -0400, Bruce Ashfield wrote:
> On Thu, Mar 28, 2013 at 4:29 PM, Slater, Joseph
> <joe.slater@windriver.com> wrote:
> > I notice that, by default, we pretend we have a touchscreen instead of a
> >
> > mouse (-usbdevice wacom-tablet option) for the qemu bsp's.  Is there
> >
> > some reason for this?
> 
> Avoiding screen grab is the best reason (and all that I need) to use
> the tablet options.

Exactly. A mouse only gives relative position data so it has to grab,
the touchscreen can do absolute position and hence doesn't need a grab.

Cheers,

Richard



