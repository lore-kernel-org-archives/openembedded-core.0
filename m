Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1S2fQW-0008HP-DN
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 10:02:24 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id E5B811D36195; Wed, 29 Feb 2012 09:45:44 +0100 (CET)
Date: Wed, 29 Feb 2012 09:45:44 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120229084544.GH21882@ibawizard.net>
References: <CAGDS+nmNeyC3P+x+mk0g-qOKhkJ5pMNhX-ckBXr4F273poq2yw@mail.gmail.com>
	<4F4DB40B.6000300@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4F4DB40B.6000300@windriver.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: psuedo-native strangeness on 64 bit build machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 29 Feb 2012 09:02:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Mark Hatle <mark.hatle@windriver.com> [2012-02-28 23:13:47]:

> On 2/28/12 10:35 PM, Steve Sakoman wrote:
>> I did a clean build on an Ubuntu 64 bit build machine a couple of days
>> ago with no issues.

I can confirm same situation here.

>> After a pull of today I did an image build for an OMAP3 machine and
>> encountered an issue with psuedo-native.

Just pseudo? What's your setup, I mean layers etc. Are you using Angstrom's
setup-scripts?

>> Has anyone else been successful building on 64 bit machines?

What version of Ubuntu is that? I'm on 12.04.

> I'm building pseudo on 64-bit machines right now, no problem.

I think, that it's some problem with parallel make. If I clean the stamps and
tmp dir of pseudo-native manually (-c cleanall doesn't work actually, because
pseudo-native is missing, chicken-egg problem? :)) and set PARALLEL_MAKE=1
NUM_THREADS=-j1, then it builds just fine.

There must have been something introduced in the bitbake or the layers
recently, since I was able to build Angstrom/systemd-image/beagleboard from
scratch 3 weeks ago with the same settings (PARALLEL_MAKE=4 NUM_THREADS=-j4").
Now it's impossible to finish the build, the most noticeable failure is gcc,
which fails for me in patching task due to the parallel build settings.
Changing the parallel settings back to 1 helps here also.

-- ynezz


