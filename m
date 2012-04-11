Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHw8y-0008FP-8N for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 13:55:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BBk5Ao007688
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:46:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07435-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:46:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BBjv82007682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:45:58 +0100
Message-ID: <1334144757.10826.169.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2012 12:45:57 +0100
In-Reply-To: <CABcZANnG6rExfpe9=gp--i1BW-0tAT2T9XCb1xfhvd4HFu1GTQ@mail.gmail.com>
References: <4F843878.2060705@opendreambox.org>
	<CABcZANnG6rExfpe9=gp--i1BW-0tAT2T9XCb1xfhvd4HFu1GTQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: libpython2
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
X-List-Received-Date: Wed, 11 Apr 2012 11:55:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 06:56 -0700, Chris Larson wrote:
> On Tue, Apr 10, 2012 at 6:41 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
> > "NOTE: multiple providers are available for runtime libpython2 (python,
> > python-nativesdk)
> > NOTE: consider defining a PREFERRED_PROVIDER entry to match libpython2"
> >
> > That's because I'm building a recipe for a binary that RDEPENDS_${PN} on
> > libpython2. So I added PREFERRED_PROVIDER_libpython2 = "python" to my
> > disto.conf, but the warning cited above persists.
> >
> > python_2.7.2.bb contains:
> >
> > PACKAGES =+ "lib${BPN}2"
> > ...
> > BBCLASSEXTEND = "nativesdk"
> >
> > Shouldn't it rather create libpython2 and libpython2-nativesdk or
> > something similar?
> >
> > What could be the reason for the warning to persist?
> 
> Because PREFERRED_PROVIDER_<some runtime provide> = "some recipe" is
> invalid. PREFERRED_PROVIDER_ only ever operates against build time
> dependencies. The runtime are worked out based on that. If you were to
> set something like PREFERRED_PROVIDER_python = "python", it would
> probably shut the warning up, as it would see that a preference exists
> on a recipe that provides one of the runtime packages, and would
> therefore know which to use. Having to rely on this sort of implicit
> behavior rather than having a means of explicitly specifying runtime
> preferences is a flaw in bitbake, in my opinion.

python-nativesdk should simply not be providing libpython2...

Cheers,

Richard



