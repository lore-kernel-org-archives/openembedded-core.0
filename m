Received: from smarthost.mvista.com ([206.112.117.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QFW1q-0007D6-UQ
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 20:33:41 +0200
Received: from scratch-1.sh.mvista.com (scratch-1.sh.mvista.com [10.40.0.72])
	by smarthost.mvista.com (Postfix) with ESMTP id 3F09C9804E;
	Thu, 28 Apr 2011 11:10:10 -0700 (PDT)
Received: from jpuhlman by scratch-1.sh.mvista.com with local (Exim 4.63)
	(envelope-from <jpuhlman@scratch-1.sh.mvista.com>)
	id 1QFVfG-00005B-6p; Thu, 28 Apr 2011 11:10:10 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2011 11:09:38 -0700
Message-Id: <1304014179-32612-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <RFC: Layer tooling brainstorming>
References: <RFC: Layer tooling brainstorming>
Cc: chris_larson@mentor.com
Subject: [PATCH] Add support for remote layering.
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
X-List-Received-Date: Thu, 28 Apr 2011 18:33:41 -0000


> * Maybe need to split into "bootstrap" steps (e.g where pseduo is
   established, layers downloaded etc)

 So for the most part, the last product we shipped was largely arranged
in this manner. We were using collections, but in many cases layers is
just a reimplementation at a lower level(which is definitely goodness).
During ELC I had a number of discussions primarily around remote layer
fetch and most of the responses were meh, or that they wanted to make
the tool external to bitbake. So after the conference was over I went
ahead and worked out a version of the implementation  that could be done
either in a include or in the bitbake code itself. The version in the
git repo below is obviously just the bitbake implementation.

I have a rough implementation largely based off of collection.inc + some
enhancements we made internally for remote collection fetching. Some of
it is messy(setting up the early fetching vars with out using another
config), but for the ones I list in the patch header it appears to work
well.

I do not believe that this is complete, but it is probably a reasonable
starting point.

Pull URL: git://gitorious.org/jpwork/bb.git
Branch: remote-layering
Browse: https://gitorious.org/jpwork/bb/trees/remote-layering




