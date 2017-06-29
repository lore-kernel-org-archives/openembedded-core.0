Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A30C3780C3;
	Thu, 29 Jun 2017 22:08:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5TM8hFT022766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 29 Jun 2017 23:08:45 +0100
Message-ID: <1498774123.9571.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Murray <scott.murray@konsulko.com>
Date: Thu, 29 Jun 2017 23:08:43 +0100
In-Reply-To: <alpine.LFD.2.20.1706281335150.8288@godzilla.spiteful.org>
References: <1497868738.24449.41.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1706281335150.8288@godzilla.spiteful.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 29 Jun 2017 23:08:45 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Thu, 29 Jun 2017 22:08:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-28 at 13:38 -0400, Scott Murray wrote:
> On Mon, 19 Jun 2017, Richard Purdie wrote:
> 
> > 
> > I suspect this has been missed by some people so I want to spell it
> > out. We have our first CVE in OE-Core itself.
> > 
> > The issue is limited to binary ipks potentially exposing sensitive
> > information through the "Source:" field which contained the full
> > SRC_URI. Those urls could potentially contain sensitive information
> > about servers and credentials.
> > 
> > After discussion, I ended up changing the field to contain the
> > recipe
> > filename (no path). There was talk of filtering the urls however if
> > you
> > try, it becomes clear that sensitive elements can remain and no
> > solution is likely 100% effective. The other package backends don't
> > do
> > this at all so this brings ipk more into line with them. Simply
> > clearing the field doesn't work with the current opkg-utils. It can
> > be
> > changed but the change becomes more invasive.
> > 
> > This fix has been merged to master.
> > 
> > I also did take the decision to backport this change back to
> > pyro/morty/krogoth too. I appreciate this can cause some disruption
> > to
> > people who rely on SRC_URI being in the Source: field however I
> > couldn't see any other realistic way forward.
> I noticed that this wasn't CC'ed to the yocto-security mailing list.
> Was that just an oversight, or should that mailing list be considered
> defunct at this point?

Sorry, it was oversight...

Cheers,

Richard

