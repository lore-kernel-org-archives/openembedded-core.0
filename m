Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 12F2F6C390
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 14:10:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAKEAiCR003210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 20 Nov 2018 14:10:45 GMT
Message-ID: <a27dd970c17106dbda9b6e9fb1729ab1d4d790b0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>, changqing.li@windriver.com
Date: Tue, 20 Nov 2018 14:10:44 +0000
In-Reply-To: <CANwerB2J_darmy4oh=EQAC0kMmhkVfH_RBAMH8Cm7UH3dyS4Hw@mail.gmail.com>
References: <1541042117-20190-1-git-send-email-changqing.li@windriver.com>
	<CANwerB2J_darmy4oh=EQAC0kMmhkVfH_RBAMH8Cm7UH3dyS4Hw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apt: update SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Nov 2018 14:10:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-11-19 at 21:54 +1100, Jonathan Liu wrote:
> -SRC_URI = "
> > http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz
> >  \
> > +SRC_URI = "
> > https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/apt/1.2.24/${BPN}_${PV}.tar.xz
> >  \
> 
> Why don't you replace apt with ${BPN} and 1.2.24 with ${PV} in
> SRC_URI?

I tweaked this since it was easier than trying to remember to track
this :)

Cheers,

Richard


