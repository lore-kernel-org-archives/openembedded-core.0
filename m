Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EF44774DEC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 17:05:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w35H55D3021917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Apr 2018 18:05:06 +0100
Message-ID: <1522947905.11431.438.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Apr 2018 18:05:05 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: master branch and stabilisation
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
X-List-Received-Date: Thu, 05 Apr 2018 17:05:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We're trying to focus on getting a good 2.5 release. We've had around
80 upgrades to recipes on the list after the freeze and basically the
maintainers like Ross and myself are damned if we do and damned if we
don't.

I usually try and ignore them at this point in a release. This then
upsets people as they don't get feedback and makes my life horrible
when I eventually try and round them up.

Instead I've tried pulling them into master-next. So far so good but I
thought I'd better see how much of a mess the branch is in. Conclusion
is at least 3 different failures, some of which I can't even easily
figure out the patch causing it.

So I now get to spend my time trying to figure out which patch broke
what so I can report back on it and make the branch build again by
dropping the broken patches.

This means I'm trying to do full on day to day development as usual as
well as trying to sort release issues like the imminent fedora28 issue
I should be paying attention to instead.

So, a question, what do people want me to do?

Cheers,

Richard


