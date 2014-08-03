Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B2E3C6084E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 16:17:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s73GH5N4018406; Sun, 3 Aug 2014 17:17:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QgbV5ddBnW36; Sun,  3 Aug 2014 17:17:05 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s73GGvZd017997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 3 Aug 2014 17:16:59 +0100
Message-ID: <1407082617.6981.44.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Date: Sun, 03 Aug 2014 17:16:57 +0100
In-Reply-To: <53DE3E5C.5020303@dynamicdevices.co.uk>
References: <53DE3841.2000305@topic.nl> <53DE3E5C.5020303@dynamicdevices.co.uk>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: mike.looijmans@topic.nl, OE <openembedded-core@lists.openembedded.org>
Subject: Re: What does "QA Issue: ... rdepends on .. but its not a build dependency?" mean
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
X-List-Received-Date: Sun, 03 Aug 2014 16:17:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-08-03 at 14:51 +0100, Alex J Lennon wrote:
> On 03/08/2014 14:25, Mike Looijmans wrote:
> > I'm getting lots of warnings like this:
> >
> > """
> > WARNING: QA Issue: enigma2-plugin-systemplugins-wirelesslan rdepends
> > on wireless-tools but its not a build dependency? [build-deps]
> > """
> >
> > What does it actually mean? What does it want me to provide here?
> >
> > The message in itself is correct. The package only has a runtime
> > dependency. It does not require the wireless-tools package to be built
> > or otherwise present on the build system. But what is the QA issue
> > here and how do I get rid of the message?
> >
> 
> Surely if package B has a non-optional runtime dependency on package A
> then package A must be built and present on the target ?

Its the "built" part that is the issue, bitbake can't see the
dependency, hence the warning.

> > Apart from that, there's a spelling error in there (its -> it's)
> > because it's "it's" when it's "it is" and it's "its" when it's its
> > property.
> >
> 
> It is a spelling error in a superficial sense perhaps, but at a deeper
> level I suspect it is more accurately characterised as a grammatical error.
> 
> Perhaps somebody was having trouble with string terminations and decided
> to avoid trouble?

Somebody was concentrating on the correctness of the code generating the
warning rather than the grammar. The latter is easily fixed, patches
welcome.

Cheers,

Richard




