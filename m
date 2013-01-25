Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TytK4-0001gR-Pu for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 01:08:40 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PNvHr8007222; Fri, 25 Jan 2013 23:57:17 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hqE2RS7o01Vc; Fri, 25 Jan 2013 23:57:17 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PNvBEj007212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 25 Jan 2013 23:57:13 GMT
Message-ID: <1359157968.13917.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Fri, 25 Jan 2013 23:52:48 +0000
In-Reply-To: <CALbNGRRKxi-DBkBxc2jhdiAEvcZk0YsTs=bk-0mSuKER87P3Bw@mail.gmail.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
	<16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
	<20130125202657.GF16904@jama.palm1.palmone.com>
	<CALbNGRRKxi-DBkBxc2jhdiAEvcZk0YsTs=bk-0mSuKER87P3Bw@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r0PNvHr8007222
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Sat, 26 Jan 2013 00:08:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-01-25 at 22:09 +0100, Andreas M=C3=BCller wrote:
> Please let's remember how it started: avoiding a single warning for
> missing display-manager.service on console images...

Don't be too quick to trivialise this. You start with accepting one
warning at boot. Another appears, well its only one more and there was a
warning anyway, you can't remember which was always there and is safe to
ignore. Before long you have lots of warnings at boot and its ok, we had
warnings anyway, right?

Warnings show how much we care about the thing we're producing. Whist
this is annoying, lets fix it once and for all, properly.

Cheers,

Richard







