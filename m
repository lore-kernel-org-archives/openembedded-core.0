Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 31A4E7504C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 22:45:16 +0000 (UTC)
Received: from ted ([192.168.3.30]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w51Mj4gG012529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 1 Jun 2018 23:45:15 +0100
Message-ID: <1527893104.19847.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 01 Jun 2018 23:45:04 +0100
In-Reply-To: <CAJ86T=Wu5v1VnjfJZWd5wgAEieqfPUJCEHd3KavZ47kUkR4-Gg@mail.gmail.com>
References: <1527808243-20215-1-git-send-email-armccurdy@gmail.com>
	<aa9dd5c5-57b3-ca5f-19c7-a6288ca4fc40@windriver.com>
	<CAJ86T=Wu5v1VnjfJZWd5wgAEieqfPUJCEHd3KavZ47kUkR4-Gg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-i586-nlp.inc: drop tuning file for Intel Quark/X1000 CPU
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
X-List-Received-Date: Fri, 01 Jun 2018 22:45:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-06-01 at 10:21 -0700, Andre McCurdy wrote:
> On Fri, Jun 1, 2018 at 7:58 AM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> > 
> > On 5/31/18 6:10 PM, Andre McCurdy wrote:
> > > 
> > > The Quark machine was EOL'ed at the end of 2017 and all support
> > > for
> > > it has now been removed from meta-intel. Drop the associated
> > > tuning
> > > file from oe-core.
> > I would rather this remain.  There are still a lot of people using
> > the quark
> > based boards as hobbyists... there is little effort to maintain it
> > for now.
> > 
> > (we still have support for ARMv4 for instance, which hasn't really
> > been used in
> > new designs in a while..)
> Is there ever a case when we would drop old tuning files? Or should
> they live on forever?
> 
> We dropped GPLv2 recipes from oe-core on the grounds that they are
> old, unmaintained and untested. ARMv4 CPU tuning files meet those
> criteria too.

We removed the GPLv2 recipes as they created a false sense of security
for people and a message needed to be sent out about them. They were a
maintenance problem.

These tune files aren't really causing a problem right now, from a
maintenance or security perspective.

Yes, we should remove things which are stale/obsolete and not useful
but I think people are using this file and its not causing a problem.

Cheers,

Richard

