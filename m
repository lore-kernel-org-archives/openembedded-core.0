Return-Path: <lsorense@csclub.uwaterloo.ca>
X-Greylist: delayed 365 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Oct 2017 19:09:20 UTC
Received: from caffeine.csclub.uwaterloo.ca (caffeine.csclub.uwaterloo.ca
	[129.97.134.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6649E71A92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 19:09:20 +0000 (UTC)
Received: by caffeine.csclub.uwaterloo.ca (Postfix, from userid 20367)
	id 0BCDDC1754; Wed, 11 Oct 2017 15:03:13 -0400 (EDT)
Date: Wed, 11 Oct 2017 15:03:13 -0400
To: openembedded-core@lists.openembedded.org
Message-ID: <20171011190313.ptqnubjcszlo23ns@csclub.uwaterloo.ca>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Subject: Why is dnrd blacklisted?
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
X-List-Received-Date: Wed, 11 Oct 2017 19:09:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There is a blacklist entry in the recipe for dnrd claiming there are QA
issues in the package.

However when the blacklist is removed and the package is built, there
are no QA warnings at all from the package and it seems to be working
perfectly fine.

Could this blacklist be removed since it makes it harder to build than
it has to be and there is apparently nothing wrong with the recipe in
the first place.

-- 
Len Sorensen

