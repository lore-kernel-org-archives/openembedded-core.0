Return-Path: <prvs=2551ecdd1=Richard.Leitner@skidata.com>
X-Greylist: delayed 642 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 04 Jul 2014 09:27:19 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 4E27B60850
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 09:27:18 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqAEAPhvtlOsEApK/2dsb2JhbABag19avmuIYnWECwI3ZxQ0GTWIWgjJfRMEjz+ELQWYCoJrhzmQGWqBRA
X-IPAS-Result: AqAEAPhvtlOsEApK/2dsb2JhbABag19avmuIYnWECwI3ZxQ0GTWIWgjJfRMEjz+ELQWYCoJrhzmQGWqBRA
Date: Fri, 4 Jul 2014 11:16:35 +0200
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20140704111635.489b97b2@lxbuild.skidata.net>
Organization: SKIDATA AG
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Subject: nscd: missing configuration and initscript
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
X-List-Received-Date: Fri, 04 Jul 2014 09:27:23 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi folks,
I've a question regarding the nscd package in the eglibc recipes (which I already posted on the yocto ml [1]):

Is there a reason why there's only the nscd executeable but no config or initscript included?
If so, what would be the proper way to add such a config & initscript file without touching the original recipe?
If not, should I provide a patch for adding these two files?

I'd appreciate any answers!

thanks & regards,
richard

[1] https://lists.yoctoproject.org/pipermail/yocto/2014-July/020406.html

